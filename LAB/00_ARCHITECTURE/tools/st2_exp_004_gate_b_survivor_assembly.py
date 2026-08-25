#!/usr/bin/env python3
"""ST2-EXP-004 Gate B: source-level no-F-04 survivor assembly.

Gate A measured theorem declaration closures. Gate B asks a stricter question:
can the F-04-free R roots be assembled from the unchanged accepted sources when
`RDedekindOrderClassicalWitness.lean` is physically absent?
"""

from __future__ import annotations

import argparse
import csv
import json
import os
import re
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

    target_sources = sorted({
        d.source_path for d in internal
        if d.name == target and d.source_path
    })
    if len(target_sources) != 1:
        raise ValueError(f"expected one source for {target}, got {target_sources}")

    closure_sources = sorted({d.source_path for d in internal if d.source_path})
    return {
        "target": target,
        "classification": classification,
        "target_source": target_sources[0],
        "closure_sources": closure_sources,
        "other_classical_declarations": classical,
        "unresolved": sorted(set(unr)),
        "internal_axioms": sorted(d.name for d in internal if d.kind == "axiom"),
        "assembly_module": meta.get("MODULE"),
    }


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
        survivor_infos = [
            info for info in inspected.values()
            if info["classification"] in {"F04_FREE", "OTHER_CLASSICAL_ONLY"}
        ]
        needed_sources = {
            src for info in survivor_infos for src in info["closure_sources"]
        }

        survivor_entries = [
            entry for entry in accepted_entries
            if entry in needed_sources
            and entry != WITNESS_SOURCE
            and entry not in sensitive_sources
        ]
        if not survivor_entries:
            raise ValueError("generated no-F-04 survivor manifest is empty")
        if WITNESS_SOURCE in survivor_entries:
            raise ValueError("F-04 witness source leaked into survivor manifest")

        # Fail closed on direct lexical references to the selected F-04 declarations.
        lexical_leaks: dict[str, list[str]] = {}
        for entry in survivor_entries:
            text = (root / entry).read_text(encoding="utf-8")
            hits = [name for name in F04 if name.split(".")[-1] in text]
            if hits:
                lexical_leaks[entry] = sorted(hits)
        if lexical_leaks:
            raise ValueError(f"selected F-04 reference leaked into survivor sources: {lexical_leaks}")

        manifest_path = args.manifest_out if args.manifest_out.is_absolute() else root / args.manifest_out
        manifest_path.parent.mkdir(parents=True, exist_ok=True)
        manifest_path.write_text("\n".join(survivor_entries) + "\n", encoding="utf-8")

        testable = [
            t for t, info in inspected.items()
            if info["classification"] in {"F04_FREE", "OTHER_CLASSICAL_ONLY"}
            and info["target_source"] in survivor_entries
            and all(src in survivor_entries for src in info["closure_sources"])
        ]

        # This compile is the Gate-B source-level test: no accepted F-04 witness file exists
        # in the assembly at all.
        nof04_blocks, nof04_ranges = compile_and_extract(
            root, survivor_entries, testable, "NoF04Survivors"
        )

        nof04_inspected = {
            t: inspect_target(t, nof04_blocks[t], nof04_ranges)
            for t in testable
        }

        output_rows = []
        for row in rows:
            t = row["target"]
            base = inspected[t]
            base_class = base["classification"]
            if base_class in {"F04_DIRECT", "F04_TRANSITIVE"}:
                status = "DOES_NOT_SURVIVE_NO_F04"
                reason = "formal declaration closure depends on selected F-04"
            elif t not in testable:
                status = "DOES_NOT_SURVIVE_NO_F04"
                missing = sorted(set(base["closure_sources"]) - set(survivor_entries))
                reason = "current accepted source packaging requires excluded F-04-coupled source(s): " + ", ".join(missing)
            else:
                check = nof04_inspected[t]
                if check["unresolved"]:
                    raise ValueError(f"no-F-04 unresolved declarations for {t}: {check['unresolved']}")
                if check["internal_axioms"]:
                    raise ValueError(f"no-F-04 internal axioms for {t}: {check['internal_axioms']}")
                if check["classification"] in {"F04_DIRECT", "F04_TRANSITIVE"}:
                    raise ValueError(f"F-04 leaked into claimed survivor closure: {t}")
                status = "SURVIVES_NO_F04"
                reason = "kernel-checked in source assembly with F-04 witness file absent"

            output_rows.append({
                "claim_id": row["claim_id"],
                "target": t,
                "gate_a_classification": base_class,
                "gate_b_status": status,
                "reason": reason,
                "target_source": base["target_source"],
                "other_classical_declarations": base["other_classical_declarations"],
            })

        status_counts = Counter(r["gate_b_status"] for r in output_rows)
        claim_counts: dict[str, Counter[str]] = {}
        for r in output_rows:
            claim_counts.setdefault(r["claim_id"], Counter())[r["gate_b_status"]] += 1

        result = {
            "schema": "BOMA-ST2-EXP-004-GATE-B-NO-F04-SURVIVOR-ASSEMBLY-001",
            "status": "GATE_B_PASS",
            "f04_witness_source": WITNESS_SOURCE,
            "f04_roots": sorted(F04),
            "accepted_manifest_entries": len(accepted_entries),
            "survivor_manifest_entries": len(survivor_entries),
            "sensitive_target_sources_excluded": sorted(sensitive_sources),
            "lexical_f04_leaks": lexical_leaks,
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
