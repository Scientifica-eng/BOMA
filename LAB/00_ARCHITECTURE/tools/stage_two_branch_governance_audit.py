#!/usr/bin/env python3
"""Route Stage-Two governance checks according to the current lifecycle state.

The original active-frontier auditor is preserved byte-for-byte in
stage_two_branch_governance_audit_legacy.py.  Once all registered Stage-Two
experiments are CLOSED, this entry point delegates to the explicit lifecycle
closure auditor instead of forcing the historical single-active-experiment
invariant onto a closed frontier.
"""
from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
LEDGER = ROOT / "LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json"
LEGACY = Path(__file__).with_name("stage_two_branch_governance_audit_legacy.py")
CLOSED = Path(__file__).with_name("stage_two_lifecycle_closure_audit.py")


def main() -> int:
    ledger = json.loads(LEDGER.read_text(encoding="utf-8"))
    records = [item for item in ledger.get("records", []) if isinstance(item, dict)]
    statuses = [str(item.get("status", "")) for item in records]
    active = [status for status in statuses if status.startswith("ACTIVE")]
    closed_frontier = bool(records) and not active and all(status.startswith("CLOSED") for status in statuses)

    target = CLOSED if closed_frontier else LEGACY
    if not target.is_file():
        raise SystemExit(f"missing delegated governance auditor: {target.relative_to(ROOT)}")
    proc = subprocess.run([sys.executable, str(target), *sys.argv[1:]], cwd=ROOT)
    return proc.returncode


if __name__ == "__main__":
    raise SystemExit(main())
