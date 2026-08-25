#!/usr/bin/env python3
"""Read-only historical sentinel for lifecycle-closed ST2-EXP-004 Gates A-F."""
from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import tempfile
from pathlib import Path
from typing import Any

BASELINE = "50f3031b8d2657cbe0710e73e5935d997d40e49b"
FROZEN_PLAN_COMMIT = "89c9dc9154e7ca469e5c94c177be223205ee9dbd"
PLAN = "LAB/PDSA/PDSA-ST2-EXP-004_R_TOTAL_ORDER_LOGICAL_REGIME.md"
LEDGER = "LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json"
RDP003 = "LAB/10_CONSTRUCTION/decisions/R-DP-003/UNIT.md"
INTEGRATION = "LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_003.md"
CLOSURE_AUDIT = "LAB/00_ARCHITECTURE/tools/st2_exp_004_lifecycle_closure_audit.py"
RENDERER = ".github/workflows/boma-st2-exp-004-provenance-repair-renderer.yml"
MANIFESTS = (
    "LAB/20_FORMALIZATION/Q_STAGE/Q_ACCEPTED_INPUTS.txt",
    "LAB/20_FORMALIZATION/R_STAGE/R_INTEGRATION_002_INPUTS.txt",
    "LAB/20_FORMALIZATION/C_STAGE/C_ACCEPTED_INPUTS.txt",
)
GATES: dict[str, dict[str, Any]] = {
    "A": {"record": "LAB/PDSA/experiments/ST2-EXP-004_GATE_A_DEPENDENCY_MAP_001.md", "blob": "589c4c3a65d47b7cb05fc2037f85be459c7426db", "run": 32835962936},
    "B": {"record": "LAB/PDSA/experiments/ST2-EXP-004_GATE_B_NO_F04_SURVIVOR_ASSEMBLY_001.md", "blob": "d40daf3730e01f4aaff15cadbd24c654636a7de5", "run": 32835962804},
    "C": {"record": "LAB/PDSA/experiments/ST2-EXP-004_GATE_C_CONDITIONAL_COMPARABILITY_001.md", "blob": "60e0fbc90aaa3edba8f416a9a03cd45a6f16f4e9", "run": 32835963151},
    "D": {"record": "LAB/PDSA/experiments/ST2-EXP-004_GATE_D_SAME_CARRIER_TOTALITY_001.md", "blob": "5643319bbdf749da36a6bef97d9c70e287ea7af7", "run": 32835962907},
    "E": {"record": "LAB/PDSA/experiments/ST2-EXP-004_GATE_E_C_SENSITIVITY_001.md", "blob": "63d70f4c440940abea6158a0b3ea2430796dbcc9", "run": 32835962908},
    "F": {"record": "LAB/PDSA/experiments/ST2-EXP-004_GATE_F_LOGICAL_COST_001.md", "blob": "c83a13a0702822bc204adb50737a7bc023e6c586", "run": 32835963092},
}


def run(*args: str, capture: bool = False) -> str:
    cp = subprocess.run(args, check=True, text=True, capture_output=capture)
    return cp.stdout.strip() if capture else ""


def git_blob_sha(path: Path) -> str:
    data = path.read_bytes()
    return hashlib.sha1(f"blob {len(data)}\0".encode() + data).hexdigest()


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--gate", required=True, choices=sorted(GATES))
    ap.add_argument("--expected-head", required=True)
    ap.add_argument("--json-out", type=Path)
    args = ap.parse_args()
    gate = GATES[args.gate]
    root = Path.cwd()

    actual_head = run("git", "rev-parse", "HEAD", capture=True)
    if actual_head != args.expected_head:
        raise SystemExit(f"exact-head mismatch: expected={args.expected_head} actual={actual_head}")

    run("git", "merge-base", "--is-ancestor", BASELINE, "HEAD")
    run("git", "merge-base", "--is-ancestor", FROZEN_PLAN_COMMIT, "HEAD")
    run("git", "diff", "--exit-code", FROZEN_PLAN_COMMIT, "HEAD", "--", PLAN)

    # Mathematical accepted controls remain byte-identical to the frozen reference.
    for manifest in MANIFESTS:
        p = root / manifest
        if not p.is_file():
            raise SystemExit(f"missing accepted manifest: {manifest}")
        run("git", "diff", "--exit-code", BASELINE, "HEAD", "--", manifest)
        for raw in p.read_text(encoding="utf-8").splitlines():
            src = raw.strip()
            if not src:
                continue
            if not (root / src).is_file():
                raise SystemExit(f"missing accepted source: {src}")
            run("git", "diff", "--exit-code", BASELINE, "HEAD", "--", src)

    # R-DP-003 is allowed to gain owner-authorized learning text after closure,
    # so protect its selected semantics rather than freezing the document bytes.
    decision = (root / RDP003).read_text(encoding="utf-8")
    for marker in (
        "RESOLVED — LOCALIZED CLASSICAL COMPARABILITY SELECTED FOR STAGE I",
        "localized classical witness of CutComparability",
        "RTotality ↔ CutComparability",
        "BOMA-ST2-LEARNING-INTEGRATION-003",
    ):
        if marker not in decision:
            raise SystemExit(f"R-DP-003 selected/integrated semantic marker missing: {marker}")

    integration = (root / INTEGRATION).read_text(encoding="utf-8")
    for marker in (
        "BOMA-ST2-LEARNING-INTEGRATION-003",
        "RTotality ↔ CutComparability",
        "NO F-04 dependency ≠ fully constructive R",
        "F-05",
        "F-06",
        "F-07",
        "NO NEW EXPERIMENT",
    ):
        if marker not in integration:
            raise SystemExit(f"integration marker missing: {marker}")

    record = root / gate["record"]
    if git_blob_sha(record) != gate["blob"]:
        raise SystemExit(f"immutable Gate-{args.gate} record drift: expected_blob={gate['blob']} actual={git_blob_sha(record)}")

    ledger = json.loads((root / LEDGER).read_text(encoding="utf-8"))
    if ledger.get("active_experiment") is not None:
        raise SystemExit(f"closed-state active_experiment drift: {ledger.get('active_experiment')!r}")
    if ledger.get("required_next_act") != "STOP BEFORE NEW EXPERIMENT / OWNER AUTHORIZATION REQUIRED":
        raise SystemExit(f"post-integration next-act drift: {ledger.get('required_next_act')!r}")
    records = [r for r in ledger.get("records", []) if r.get("experiment_id") == "ST2-EXP-004"]
    if len(records) != 1:
        raise SystemExit(f"expected one ST2-EXP-004 ledger record, got {len(records)}")
    rec = records[0]
    if not str(rec.get("status", "")).startswith("CLOSED / PASS / EXACT F-04 IMPACT CLASSIFIED"):
        raise SystemExit(f"ST2-EXP-004 is not canonical CLOSED/PASS: {rec.get('status')!r}")
    if rec.get("architecture_integration_status") != "INTEGRATED / BOMA-ST2-LEARNING-INTEGRATION-003 / ACCEPTED SOURCES UNCHANGED":
        raise SystemExit(f"ST2-EXP-004 architecture integration drift: {rec.get('architecture_integration_status')!r}")
    key = f"gate_{args.gate.lower()}"
    if rec.get("final_gate_runs", {}).get(key) != gate["run"]:
        raise SystemExit(f"Gate-{args.gate} final-run drift: expected={gate['run']} actual={rec.get('final_gate_runs', {}).get(key)!r}")

    if (root / RENDERER).exists():
        raise SystemExit("temporary provenance-repair renderer still present")

    workflow_dir = root / ".github/workflows"
    forbidden: list[dict[str, str]] = []
    for wf in sorted(workflow_dir.glob("boma-st2-exp-004-*.yml")):
        text = wf.read_text(encoding="utf-8")
        for marker in ("contents: write", "git push", "git commit"):
            if marker in text:
                forbidden.append({"workflow": str(wf), "marker": marker})
    if forbidden:
        raise SystemExit(f"write-capable ST2-EXP-004 CI remains: {forbidden}")

    with tempfile.TemporaryDirectory(prefix="st2-exp-004-closed-") as td:
        closure_json = Path(td) / "closure.json"
        run("python3", CLOSURE_AUDIT, "--json-out", str(closure_json))
        closure = json.loads(closure_json.read_text(encoding="utf-8"))
    if closure.get("status") != "ST2_EXP_004_LIFECYCLE_CLOSED_PASS":
        raise SystemExit(f"closed-state audit failed: {closure}")

    result = {
        "schema": "BOMA-ST2-EXP-004-HISTORICAL-GATE-SENTINEL-001",
        "status": "PASS",
        "mode": "READ_ONLY_HISTORICAL_SENTINEL",
        "gate": args.gate,
        "verified_head": actual_head,
        "frozen_reference": BASELINE,
        "frozen_plan_commit": FROZEN_PLAN_COMMIT,
        "gate_record": gate["record"],
        "gate_record_blob": gate["blob"],
        "historical_final_gate_run": gate["run"],
        "active_experiment": None,
        "scientific_reexecution": False,
        "accepted_mathematical_controls_unchanged": True,
        "rdp003_selected_semantics_unchanged": True,
        "architecture_lesson_integrated": True,
        "temporary_writer_present": False,
    }
    rendered = json.dumps(result, indent=2, ensure_ascii=False) + "\n"
    if args.json_out:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
