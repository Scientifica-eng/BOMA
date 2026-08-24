#!/usr/bin/env python3
"""Route Stage-Two governance checks according to lifecycle history.

The original active-frontier auditor is preserved byte-for-byte in
stage_two_branch_governance_audit_legacy.py. Once ST2-EXP-001..003 are all
CLOSED, later experiments must not reactivate the old single-active-ST2-EXP-003
assumption. In that state this entry point delegates to the historical closure
preservation auditor, which verifies that the closed 001..003 evidence and
acceptance boundaries remain intact while permitting a later current cycle.
"""
from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
LEDGER = ROOT / "LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json"
LEGACY = Path(__file__).with_name("stage_two_branch_governance_audit_legacy.py")
HISTORICAL = Path(__file__).with_name("stage_two_historical_closure_audit.py")
HISTORICAL_EXPERIMENTS = {"ST2-EXP-001", "ST2-EXP-002", "ST2-EXP-003"}


def main() -> int:
    ledger = json.loads(LEDGER.read_text(encoding="utf-8"))
    records = {
        item.get("experiment_id"): item
        for item in ledger.get("records", [])
        if isinstance(item, dict) and isinstance(item.get("experiment_id"), str)
    }
    historical_closed = HISTORICAL_EXPERIMENTS.issubset(records) and all(
        str(records[experiment].get("status", "")).startswith("CLOSED")
        for experiment in HISTORICAL_EXPERIMENTS
    )

    target = HISTORICAL if historical_closed else LEGACY
    if not target.is_file():
        raise SystemExit(f"missing delegated governance auditor: {target.relative_to(ROOT)}")
    proc = subprocess.run([sys.executable, str(target), *sys.argv[1:]], cwd=ROOT)
    return proc.returncode


if __name__ == "__main__":
    raise SystemExit(main())
