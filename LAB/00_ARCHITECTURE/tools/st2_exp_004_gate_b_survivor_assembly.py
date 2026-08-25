#!/usr/bin/env python3
"""ST2-EXP-004 Gate B: whole-source no-F-04 survivor assembly.

Gate A measured theorem declaration closures. Gate B asks the stricter source
question: which unchanged accepted R source files and measured roots still
elaborate when the selected F-04 witness source is physically absent?
"""

from __future__ import annotations

import argparse
import csv
import json
import os
import re
import subprocess
import sys
import tempfile
from collections import Counter
from pathlib import Path

import lean_dependency_audit as lda

TARGETS = Path("LAB/20_FORMALIZATION/R_STAGE/ST2_EXP_004_GATE_A_TARGETS.tsv")
R_MANIFEST = Path("LAB/20_FORMALIZATION/R_STAGE/R_INTEGRATION_002_INPUTS.txt")
WITNESS_SOURCE = "LAB/payloads/lean/RStage/RDedekindOrderClassicalWitness.lean"
CUT = "BOMA.R.DedekindOrderClassical001.cutComparability_classical"
TOTAL = "BOMA.R.DedekindOrderClassical001.rLE_total_classical"
F04 = {CUT, TOTAL}
F04_SHORT = {"cutComparability_classical", "rLE_total_classical"}


def load_r_targets(root: Path) -> list[dict[str, str]]:
    with (root / TARGETS).open(encoding="utf-8") as f:
        rows = list(csv.DictReader(f, delimiter="\t"))
    rows = [r for r in rows if r["group"] == "R_ACCEPTED"]
    if not rows:
        raise ValueError("Gate-B found no R targets")
    return rows


def split_blocks(text: str) -> dict[str, str]:
    out: dict[str, list[str]] = {}
    target: str | None = None
    for line in text.splitlines():
        if line.startswith("BOMA_AUDIT\tTARGET\t"):
            target = line.split("\t", 2)[2]
            if target in out:
                raise ValueError(f"duplicate target block: {target}")
            out[target] = [line]
        elif target is not None:
            out[target].append(line)
    return {k: "\n".join(v) + "\n" for k, v in out.items()}


def compile_and_extract(
    root: Path,
    entries: list[str],
    targets: list[str],
    label: str,
) -> tuple[dict[str, str], list[lda.SourceRange]]:
    module = lda.legal_module_name("ST2Exp004GateB" + re.sub(r"[^A-Za-z0-9]", "", label))
    with tempfile.TemporaryDirectory(prefix=".boma-st2-exp-004-gateb-", dir=root) as td0:
        td = Path(td0)
        asm = td / f"{module}.lean"
        olean = td / f"{module}.olean"
        ranges = lda.build_assembly(root, entries, asm)
        lda.run(["lake", "env", "lean", "-o", str(olean), str(asm)], cwd=root)

        runner = td / "GateBExtract.lean"
        commands = "\n".join(f"#boma_dependency_closure {t}" for t in targets)
        runner.write_text(
            f"import Lean\nimport {module}\n\n"
            + lda.extractor_body(root)
            + "\n"
            + commands
            + "\n",
            encoding="utf-8",
        )
        env = os.environ.copy()
        env["LEAN_PATH"] = str(td) + (os.pathsep + env["LEAN_PATH"] if env.get("LEAN_PATH") else "")
        proc = lda.run(["lake", "env", "lean", str(runner)], cwd=root, env=env)

    blocks = split_blocks(proc.stdout)
    if set(blocks) != set(targets):
        raise ValueError(
            f"{label} target mismatch missing={sorted(set(targets)-set(blocks))} "
            f"extra={sorted(set(blocks)-set(targets))}"
        )
    return blocks, ranges


def inspect_target(target: str, block: str, ranges: list[lda.SourceRange]) -> dict:
    raw_i, ext, unr, edges, meta = lda.parse_output(block, ranges)
    internal = lda.dedupe_internal(lda.infer_generated_sources(lda.dedupe_internal(raw_i)))
    ext = lda.dedupe_external(ext)
    names = {d.name for d in internal} | {d.name for d in ext}
    direct = {e.dependency for e in edges if e.consumer == target}
    has_f04 = target in F04 or bool(names & F04)
    direct_f04 = target in F04 or bool(direct & F04)
    classical = sorted(n for n in names if n.startswith("Classical."))
    if direct_f04:
        classification = "F04_DIRECT"
    elif has_f04:
        classification = "F04_TRANSITIVE"
    elif classical:
        classification = "OTHER_CLASSICAL_ONLY"
    else:
        classification = "F04_FREE"

    target_sources = sorted({d.source for d in internal if d.name == target and d.source})
    if len(target_sources) != 1:
        raise ValueError(f"expected one source for {target}, got {target_sources}")

    return {
        "target": target,
        "classification": classification,
        "target_source": target_sources[0],
        "other_classical_declarations": classical,
        "unresolved": sorted(set(unr)),
        "internal_axioms": sorted(d.name for d in internal if d.kind == "axiom"),
        "assembly_module": meta.get("MODULE"),
    }


def source_for_line(ranges: list[lda.SourceRange], line: int) -> str | None:
    for r in ranges:
        if r.start_line <= line <= r.end_line:
            return r.path
    return None


def compile_source_set_once(root: Path, entries: list[str], attempt: int) -> tuple[bool, list[lda.SourceRange], str]:
    module = lda.legal_module_name(f"ST2Exp004GateBSourceAttempt{attempt}")
    with tempfile.TemporaryDirectory(prefix=".boma-st2-exp-004-gateb-source-", dir=root) as td0:
        td = Path(td0)
        asm = td / f"{module}.lean"
        olean = td / f"{module}.olean"
        ranges = lda.build_assembly(root, entries, asm)
        proc = subprocess.run(
            ["lake", "env", "lean", "-o", str(olean), str(asm)],
            cwd=root,
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
        )
        return proc.returncode == 0, ranges, proc.stdout


def first_error_source(ranges: list[lda.SourceRange], output: str) -> tuple[str | None, str]:
    diagnostics = []
    for line in output.splitlines():
        if "error" not in line.lower():
            continue
        diagnostics.append(line)
        m = re.search(r"\.lean:(\d+):\d+:.*error", line, re.IGNORECASE)
        if not m:
            continue
        src = source_for_line(ranges, int(m.group(1)))
        if src is not None:
            return src, "\n".join(diagnostics[-8:])
    return None, "\n".join(diagnostics[-20:])


def prune_to_compilable_source_set(
    root: Path,
    accepted_entries: list[str],
    initially_blocked: set[str],
) -> tuple[list[str], list[dict[str, str]]]:
    entries = [e for e in accepted_entries if e not in initially_blocked]
    pruned: list[dict[str, str]] = []
    attempt = 1
    while True:
        if not entries:
            raise ValueError("no-F-04 source pruning removed every accepted source")
        ok, ranges, output = compile_source_set_once(root, entries, attempt)
        if ok:
            return entries, pruned
        bad_source, diagnostic = first_error_source(ranges, output)
        if bad_source is None:
            raise RuntimeError(
                "whole-source assembly failed but no source-mapped Lean error was found:\n" + output[-8000:]
            )
        if bad_source not in entries:
            raise RuntimeError(f"mapped failing source is not in candidate entries: {bad_source}")
        pruned.append({
            "source": bad_source,
            "reason": "whole-source elaboration failed after selected F-04 / dependent source exclusion",
            "diagnostic": diagnostic,
            "attempt": str(attempt),
        })
        entries = [e for e in entries if e != bad_source]
        attempt += 1
        if attempt > len(accepted_entries) + 1:
            raise RuntimeError("source pruning exceeded accepted-manifest size")


def strip_lean_comments_and_strings(text: str) -> str:
    out: list[str] = []
    i = 0
    block = 0
    string = False
    escaped = False
    while i < len(text):
        if block:
            if text.startswith("/-", i):
                block += 1; out.extend("  "); i += 2; continue
            if text.startswith("-/", i):
                block -= 1; out.extend("  "); i += 2; continue
            out.append("\n" if text[i] == "\n" else " "); i += 1; continue
        if string:
            ch = text[i]
            out.append("\n" if ch == "\n" else " ")
            if escaped:
                escaped = False
            elif ch == "\\":
                escaped = True
            elif ch == '"':
                string = False
            i += 1; continue
        if text.startswith("--", i):
            while i < len(text) and text[i] != "\n":
                out.append(" "); i += 1
            continue
        if text.startswith("/-", i):
            block = 1; out.extend("  "); i += 2; continue
        if text[i] == '"':
            string = True; out.append(" "); i += 1; continue
        out.append(text[i]); i += 1
    return "".join(out)


def executable_f04_mentions(root: Path, entries: list[str]) -> dict[str, list[str]]:
    leaks: dict[str, list[str]] = {}
    for entry in entries:
        code = strip_lean_comments_and_strings((root / entry).read_text(encoding="utf-8"))
        hits = sorted(name for name in F04_SHORT if re.search(rf"\b{re.escape(name)}\b", code))
        if hits:
            leaks[entry] = hits
    return leaks


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--root", type=Path, default=Path.cwd())
    ap.add_argument("--manifest-out", type=Path, required=True)
    ap.add_argument("--json-out", type=Path, required=True)
    args = ap.parse_args()
    root = args.root.resolve()

    try:
        rows = load_r_targets(root)
        unique_targets = list(dict.fromkeys(r["target"] for r in rows))
        accepted_entries = lda.load_manifest(root, str(R_MANIFEST))
        if WITNESS_SOURCE not in accepted_entries:
            raise ValueError("accepted R manifest unexpectedly lacks the F-04 witness source")

        baseline_blocks, baseline_ranges = compile_and_extract(
            root, accepted_entries, unique_targets, "AcceptedInspection"
        )
        inspected = {
            t: inspect_target(t, baseline_blocks[t], baseline_ranges)
            for t in unique_targets
        }
        for t, info in inspected.items():
            if info["unresolved"]:
                raise ValueError(f"baseline unresolved declarations for {t}: {info['unresolved']}")
            if info["internal_axioms"]:
                raise ValueError(f"baseline internal axioms for {t}: {info['internal_axioms']}")

        sensitive_sources = {
            info["target_source"] for info in inspected.values()
            if info["classification"] in {"F04_DIRECT", "F04_TRANSITIVE"}
        }
        initially_blocked = set(sensitive_sources) | {WITNESS_SOURCE}

        survivor_entries, pruned_sources = prune_to_compilable_source_set(
            root, accepted_entries, initially_blocked
        )
        if WITNESS_SOURCE in survivor_entries:
            raise ValueError("F-04 witness source leaked into survivor manifest")

        lexical_leaks = executable_f04_mentions(root, survivor_entries)
        if lexical_leaks:
            raise ValueError(f"selected F-04 executable reference leaked into survivor sources: {lexical_leaks}")

        manifest_path = args.manifest_out if args.manifest_out.is_absolute() else root / args.manifest_out
        manifest_path.parent.mkdir(parents=True, exist_ok=True)
        manifest_path.write_text("\n".join(survivor_entries) + "\n", encoding="utf-8")

        testable = [
            t for t, info in inspected.items()
            if info["classification"] in {"F04_FREE", "OTHER_CLASSICAL_ONLY"}
            and info["target_source"] in survivor_entries
        ]
        if not testable:
            raise ValueError("no measured F-04-free roots survived source pruning")

        nof04_blocks, nof04_ranges = compile_and_extract(
            root, survivor_entries, testable, "NoF04Survivors"
        )
        nof04_inspected = {
            t: inspect_target(t, nof04_blocks[t], nof04_ranges)
            for t in testable
        }

        pruned_by_source = {p["source"]: p for p in pruned_sources}
        output_rows = []
        for row in rows:
            t = row["target"]
            base = inspected[t]
            base_class = base["classification"]
            source = base["target_source"]
            if base_class in {"F04_DIRECT", "F04_TRANSITIVE"}:
                status = "DOES_NOT_SURVIVE_NO_F04"
                reason = "formal declaration closure depends on selected F-04"
            elif t not in testable:
                status = "DOES_NOT_SURVIVE_NO_F04"
                if source in initially_blocked:
                    reason = "whole source also contains a measured F-04-dependent target"
                elif source in pruned_by_source:
                    reason = "whole source failed elaboration after F-04-dependent source exclusion"
                else:
                    reason = "target source absent from final no-F-04 source assembly"
            else:
                check = nof04_inspected[t]
                if check["unresolved"]:
                    raise ValueError(f"no-F-04 unresolved declarations for {t}: {check['unresolved']}")
                if check["internal_axioms"]:
                    raise ValueError(f"no-F-04 internal axioms for {t}: {check['internal_axioms']}")
                if check["classification"] in {"F04_DIRECT", "F04_TRANSITIVE"}:
                    raise ValueError(f"F-04 leaked into claimed survivor closure: {t}")
                status = "SURVIVES_NO_F04"
                reason = "kernel-checked in whole-source assembly with selected F-04 witness absent"

            output_rows.append({
                "claim_id": row["claim_id"],
                "target": t,
                "gate_a_classification": base_class,
                "gate_b_status": status,
                "reason": reason,
                "target_source": source,
                "other_classical_declarations": base["other_classical_declarations"],
            })

        status_counts = Counter(r["gate_b_status"] for r in output_rows)
        claim_counts: dict[str, Counter[str]] = {}
        for r in output_rows:
            claim_counts.setdefault(r["claim_id"], Counter())[r["gate_b_status"]] += 1

        result = {
            "schema": "BOMA-ST2-EXP-004-GATE-B-NO-F04-SURVIVOR-ASSEMBLY-001",
            "status": "GATE_B_PASS",
            "method": "whole-source accepted-manifest pruning followed by per-target kernel closure audit",
            "f04_witness_source": WITNESS_SOURCE,
            "f04_roots": sorted(F04),
            "accepted_manifest_entries": len(accepted_entries),
            "initially_blocked_sources": sorted(initially_blocked),
            "pruned_sources": pruned_sources,
            "survivor_manifest_entries": len(survivor_entries),
            "executable_f04_leaks": lexical_leaks,
            "status_counts": dict(sorted(status_counts.items())),
            "claim_status_counts": {
                claim: dict(sorted(counts.items()))
                for claim, counts in sorted(claim_counts.items())
            },
            "rows": output_rows,
        }

        out = args.json_out if args.json_out.is_absolute() else root / args.json_out
        out.parent.mkdir(parents=True, exist_ok=True)
        rendered = json.dumps(result, indent=2, ensure_ascii=False) + "\n"
        out.write_text(rendered, encoding="utf-8")
        print(rendered, end="")
        return 0

    except (OSError, RuntimeError, ValueError, json.JSONDecodeError) as exc:
        print(f"ST2-EXP-004 Gate-B audit error: {exc}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
