#!/usr/bin/env python3
from __future__ import annotations
import argparse, json, os, re, sys, tempfile
from collections import Counter, deque
from pathlib import Path
import lean_dependency_audit as lda

TARGETS = Path("LAB/20_FORMALIZATION/R_STAGE/ST2_EXP_004_GATE_A_TARGETS.tsv")
R_MANIFEST = Path("LAB/20_FORMALIZATION/R_STAGE/R_INTEGRATION_002_INPUTS.txt")
C_MANIFEST = Path("LAB/20_FORMALIZATION/C_STAGE/C_ACCEPTED_INPUTS.txt")
NARROW = "LAB/payloads/lean/CStage/ST2Exp001NarrowRInterface.lean"
GENERIC = "LAB/payloads/lean/CStage/ST2Exp011GenericQuadraticComparison.lean"
CUT = "BOMA.R.DedekindOrderClassical001.cutComparability_classical"
TOTAL = "BOMA.R.DedekindOrderClassical001.rLE_total_classical"
F04 = {CUT, TOTAL}
POSNEG = "BOMA.R.DedekindPositiveDecomposition001.rPosNeg_decomposition"
NARROW_ROOT = "BOMA.C.StageTwo.NarrowRInterface001.narrowRFromAcceptedProducers"
GENERIC_ROOT = "BOMA.C.StageTwo.ComparisonInterface011.quadraticComparison"

def load_targets(root):
    rows = []
    lines = (root / TARGETS).read_text(encoding="utf-8").splitlines()
    if not lines or lines[0] != "group\tclaim_id\ttarget\trole":
        raise ValueError("bad Gate-A target manifest header")
    for raw in lines[1:]:
        if not raw.strip():
            continue
        fields = raw.split("\t")
        if len(fields) != 4:
            raise ValueError(f"bad Gate-A target row: {raw}")
        rows.append(dict(zip(("group","claim_id","target","role"), fields)))
    return rows

def entries_for(root, group):
    if group == "R_ACCEPTED":
        return lda.load_manifest(root, str(R_MANIFEST))
    if group == "C_ACCEPTED":
        return lda.load_manifest(root, str(C_MANIFEST))
    if group == "ST2_EXP_001_NARROW_R":
        return lda.load_manifest(root, str(R_MANIFEST)) + [NARROW]
    if group == "ST2_EXP_011_GENERIC_COMPARISON":
        return [GENERIC]
    raise ValueError(f"unknown Gate-A group: {group}")

def split_blocks(text):
    out, target = {}, None
    for line in text.splitlines():
        if line.startswith("BOMA_AUDIT\tTARGET\t"):
            target = line.split("\t", 2)[2]
            if target in out:
                raise ValueError(f"duplicate target block: {target}")
            out[target] = [line]
        elif target is not None:
            out[target].append(line)
    return {k: "\n".join(v) + "\n" for k, v in out.items()}

def path_to(edges, start):
    if start in F04:
        return [start]
    adj = {}
    for e in edges:
        adj.setdefault(e.consumer, []).append(e.dependency)
    q, seen = deque([(start,[start])]), {start}
    while q:
        node, path = q.popleft()
        for nxt in adj.get(node, []):
            if nxt in F04:
                return path + [nxt]
            if nxt not in seen:
                seen.add(nxt); q.append((nxt, path + [nxt]))
    return []

def compile_group(root, group, rows):
    entries = entries_for(root, group)
    targets = list(dict.fromkeys(r["target"] for r in rows))
    module = lda.legal_module_name("ST2Exp004" + re.sub(r"[^A-Za-z0-9]","",group))
    with tempfile.TemporaryDirectory(prefix=".boma-st2-exp-004-", dir=root) as td0:
        td = Path(td0)
        asm, olean = td/f"{module}.lean", td/f"{module}.olean"
        ranges = lda.build_assembly(root, entries, asm)
        lda.run(["lake","env","lean","-o",str(olean),str(asm)], cwd=root)
        runner = td/"GateA.lean"
        cmds = "\n".join(f"#boma_dependency_closure {t}" for t in targets)
        runner.write_text(f"import Lean\nimport {module}\n\n" + lda.extractor_body(root) + "\n" + cmds + "\n", encoding="utf-8")
        env = os.environ.copy()
        env["LEAN_PATH"] = str(td) + (os.pathsep + env["LEAN_PATH"] if env.get("LEAN_PATH") else "")
        proc = lda.run(["lake","env","lean",str(runner)], cwd=root, env=env)
    blocks = split_blocks(proc.stdout)
    if set(blocks) != set(targets):
        raise ValueError(f"{group} target mismatch")
    return blocks, ranges

def classify(row, block, ranges):
    raw_i, ext, unr, edges, meta = lda.parse_output(block, ranges)
    internal = lda.dedupe_internal(lda.infer_generated_sources(lda.dedupe_internal(raw_i)))
    ext = lda.dedupe_external(ext)
    names = {d.name for d in internal} | {d.name for d in ext}
    direct = {e.dependency for e in edges if e.consumer == row["target"]}
    has_cut, has_total = CUT in names, TOTAL in names
    has_f04 = has_cut or has_total or row["target"] in F04
    direct_f04 = row["target"] in F04 or bool(direct & F04)
    classical = sorted(n for n in names if n.startswith("Classical."))
    axioms = sorted(d.name for d in internal if d.kind == "axiom")
    if direct_f04: cls = "F04_DIRECT"
    elif has_f04: cls = "F04_TRANSITIVE"
    elif classical: cls = "OTHER_CLASSICAL_ONLY"
    else: cls = "F04_FREE"
    return {
        **row,
        "contains_cutComparability_classical": has_cut,
        "contains_rLE_total_classical": has_total,
        "other_classical_declarations": classical,
        "internal_axioms": axioms,
        "formal_boundary": sorted({d.module for d in ext}),
        "classification": cls,
        "f04_path": path_to(edges, row["target"]),
        "unresolved": sorted(set(unr)),
        "counts": {"internal":len(internal),"external_boundary":len(ext),"dependency_edges":len(edges),"unresolved":len(set(unr))},
        "assembly_module": meta.get("MODULE"),
    }

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--root", type=Path, default=Path.cwd())
    ap.add_argument("--json-out", type=Path, required=True)
    a = ap.parse_args(); root = a.root.resolve()
    try:
        targets = load_targets(root)
        grouped = {}
        for row in targets: grouped.setdefault(row["group"], []).append(row)
        results = []
        for group, rows in grouped.items():
            blocks, ranges = compile_group(root, group, rows)
            results.extend(classify(r, blocks[r["target"]], ranges) for r in rows)
        unresolved = [r["target"] for r in results if r["unresolved"]]
        axioms = [r["target"] for r in results if r["internal_axioms"]]
        sanity = {
            "accepted_total_order": any(r["target"]==TOTAL and r["classification"]=="F04_DIRECT" for r in results),
            "positive_decomposition": any(r["target"]==POSNEG and r["classification"]=="F04_DIRECT" for r in results),
            "narrow_r_interface": any(r["target"]==NARROW_ROOT and r["classification"]=="F04_DIRECT" for r in results),
            "generic_011_negative_control": any(r["target"]==GENERIC_ROOT and r["classification"]=="F04_FREE" for r in results),
        }
        counts = Counter(r["classification"] for r in results)
        status = "GATE_A_PASS" if not unresolved and not axioms and all(sanity.values()) else "GATE_A_FAIL"
        data = {
            "schema":"BOMA-ST2-EXP-004-GATE-A-DEPENDENCY-MATRIX-001",
            "status":status,
            "f04_roots":sorted(F04),
            "allowed_classifications":["F04_DIRECT","F04_TRANSITIVE","F04_FREE","OTHER_CLASSICAL_ONLY"],
            "counts":{"rows":len(results),"unique_targets":len({r["target"] for r in results}),"unresolved_rows":len(unresolved),"internal_axiom_rows":len(axioms)},
            "classification_counts":dict(sorted(counts.items())),
            "required_sanity":sanity,
            "unresolved_targets":unresolved,
            "internal_axiom_targets":axioms,
            "rows":results,
        }
        rendered = json.dumps(data, indent=2, ensure_ascii=False) + "\n"
        out = a.json_out if a.json_out.is_absolute() else root/a.json_out
        out.parent.mkdir(parents=True, exist_ok=True); out.write_text(rendered, encoding="utf-8")
        print(rendered, end="")
        return 0 if status=="GATE_A_PASS" else 1
    except (OSError, RuntimeError, ValueError, json.JSONDecodeError) as e:
        print(f"ST2-EXP-004 Gate-A audit error: {e}", file=sys.stderr); return 2

if __name__ == "__main__":
    raise SystemExit(main())
