#!/usr/bin/env python3
"""Fail-closed audit for the lifecycle-closed ST2-EXP-004 research state."""
from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any

LEDGER = "LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json"
STATUS = "LAB/PDSA/STATUS.md"
REGISTER = "LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md"
PLAN = "LAB/PDSA/PDSA-ST2-EXP-004_R_TOTAL_ORDER_LOGICAL_REGIME.md"
STUDY = "LAB/PDSA/experiments/ST2-EXP-004_FINAL_STUDY_ACT_001.md"
CLOSURE = "LAB/PDSA/experiments/ST2-EXP-004_LIFECYCLE_CLOSURE_001.md"
EXPECTED_IDS = {"ST2-EXP-001", "ST2-EXP-002", "ST2-EXP-003", "ST2-EXP-011", "ST2-EXP-004"}
EXPECTED_PLAN_COMMIT = "89c9dc9154e7ca469e5c94c177be223205ee9dbd"
EXPECTED_BASELINE = "50f3031b8d2657cbe0710e73e5935d997d40e49b"
EXPECTED_STUDY_COMMIT = "6779d028c49f73757ea838c163d3968a982559fe"
EXPECTED_PRECLOSURE_RUN = 32835963092
EXPECTED_PRECLOSURE_ARTIFACT = 9558667579
EXPECTED_PRECLOSURE_DIGEST = "e0920004e18db1e516b952ed49b7466f7939e72b0ccf0e682757d4b23856e245"
EXPECTED_NEXT = "ST2-EXP-004 LEARNING-TO-CONSTRUCTION INTEGRATION THEN STOP / NO NEW EXPERIMENT"
EXPECTED_ARCH = "REQUIRED / SEPARATE POST-CLOSURE ACT / NOT YET INTEGRATED"
FAILURES = [
    f"LAB/PDSA/experiments/ST2-EXP-004_FAILURE_{i:03d}_" for i in range(1, 7)
]


def read(root: Path, rel: str) -> str:
    p = root / rel
    if not p.is_file():
        raise ValueError(f"missing required file: {rel}")
    return p.read_text(encoding="utf-8")


def add(residuals: list[dict[str, Any]], kind: str, **ctx: Any) -> None:
    residuals.append({"type": kind, **ctx})


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--root", type=Path, default=Path.cwd())
    ap.add_argument("--json-out", type=Path)
    args = ap.parse_args()
    root = args.root.resolve()
    residuals: list[dict[str, Any]] = []

    try:
        ledger = json.loads(read(root, LEDGER))
        records = {
            r.get("experiment_id"): r for r in ledger.get("records", [])
            if isinstance(r, dict) and isinstance(r.get("experiment_id"), str)
        }
        if set(records) != EXPECTED_IDS:
            add(residuals, "experiment_record_set_drift", expected=sorted(EXPECTED_IDS), actual=sorted(records))
        if ledger.get("active_experiment") is not None:
            add(residuals, "active_experiment_not_null", actual=ledger.get("active_experiment"))
        if ledger.get("required_next_act") != EXPECTED_NEXT:
            add(residuals, "required_next_act_drift", expected=EXPECTED_NEXT, actual=ledger.get("required_next_act"))
        next_slot = str(ledger.get("next_experiment_slot", ""))
        for marker in ("NO ACTIVE EXPERIMENT", "ST2-EXP-004 CLOSED", "ARCHITECTURE INTEGRATION NEXT", "STOP BEFORE NEW EXPERIMENT"):
            if marker not in next_slot:
                add(residuals, "next_slot_marker_missing", marker=marker, actual=next_slot)

        for eid in EXPECTED_IDS:
            if not str(records.get(eid, {}).get("status", "")).startswith("CLOSED"):
                add(residuals, "experiment_not_closed", experiment=eid, actual=records.get(eid, {}).get("status"))

        r = records.get("ST2-EXP-004", {})
        expected = {
            "origin_kind": "DECISION_POINT",
            "origin_id": "R-DP-003",
            "frozen_reference_commit": EXPECTED_BASELINE,
            "frozen_plan_commit": EXPECTED_PLAN_COMMIT,
            "frozen_plan": PLAN,
            "mathematical_result": "PASS",
            "same_carrier_totality_recovery": "NOT_RECOVERED_WITH_CURRENT_CUT_INTERFACE",
            "final_study_act": STUDY,
            "final_study_act_commit": EXPECTED_STUDY_COMMIT,
            "lifecycle_closure_record": CLOSURE,
            "verified_head": EXPECTED_STUDY_COMMIT,
            "verified_run": EXPECTED_PRECLOSURE_RUN,
            "verified_artifact_id": EXPECTED_PRECLOSURE_ARTIFACT,
            "verified_artifact_sha256": EXPECTED_PRECLOSURE_DIGEST,
            "architecture_integration_status": EXPECTED_ARCH,
            "accepted_reference_changed": False,
            "canonical_acceptance_change": False,
            "new_block_created": False,
            "new_decision_point_created": False,
            "new_junction_created": False,
        }
        for field, value in expected.items():
            if r.get(field) != value:
                add(residuals, "st2_exp_004_field_drift", field=field, expected=value, actual=r.get(field))
        if not str(r.get("status", "")).startswith("CLOSED / PASS / EXACT F-04 IMPACT CLASSIFIED"):
            add(residuals, "st2_exp_004_status_drift", actual=r.get("status"))
        if "NO NEXT EXPERIMENT AUTHORIZED" not in str(r.get("lifecycle_disposition", "")):
            add(residuals, "closure_authority_marker_missing", actual=r.get("lifecycle_disposition"))

        accepted = ledger.get("accepted_reference", {})
        expected_accepted = {
            "selected_route": "C-ROUTE-P",
            "selected_producer_unit": "C-BLOCK-001",
            "accepted_export_unit": "C-BLOCK-002",
            "acceptance": "CA-20 ACCEPT",
            "upstream_accepted_unit": "R-BLOCK-001",
            "dependency_contract": "BOMA-C-R-DEP-001",
        }
        if accepted != expected_accepted:
            add(residuals, "accepted_reference_drift", expected=expected_accepted, actual=accepted)

        plan = read(root, PLAN)
        for marker in ("# PLAN — FROZEN", "ST2-EXP-004", "R-DP-003", EXPECTED_BASELINE, "DO NOT EDIT THIS FILE"):
            if marker not in plan:
                add(residuals, "frozen_plan_marker_missing", marker=marker)
        study = read(root, STUDY)
        for marker in ("PASS / EXACT F-04 IMPACT CLASSIFIED", "NOT RECOVERED", "RETAIN R-DP-003", "NO NEXT EXPERIMENT"):
            if marker not in study:
                add(residuals, "study_marker_missing", marker=marker)
        closure = read(root, CLOSURE)
        for marker in ("CLOSED / PASS / OWNER AUTHORIZED", EXPECTED_STUDY_COMMIT, str(EXPECTED_PRECLOSURE_RUN), str(EXPECTED_PRECLOSURE_ARTIFACT), EXPECTED_PRECLOSURE_DIGEST, "NO NEW EXPERIMENT"):
            if marker not in closure:
                add(residuals, "closure_marker_missing", marker=marker)

        for prefix in FAILURES:
            matches = list(root.glob(prefix + "*.md"))
            if len(matches) != 1:
                add(residuals, "failure_record_missing_or_ambiguous", prefix=prefix, count=len(matches))

        for rel in (STATUS, REGISTER):
            text = read(root, rel)
            for marker in ("ST2-EXP-004", "CLOSED", "PASS", "ACTIVE", "NONE", "NO_ACTIVE_PROGRAM", "INTEGRATION"):
                if marker not in text:
                    add(residuals, "current_state_marker_missing", document=rel, marker=marker)
            if "GATE B NEXT" in text or "ST2-EXP-004 ACTIVE / PLAN FROZEN" in text:
                add(residuals, "stale_active_004_marker", document=rel)

    except (OSError, ValueError, json.JSONDecodeError) as exc:
        add(residuals, "closure_audit_execution_error", error=str(exc))

    result = {
        "schema": "BOMA-ST2-EXP-004-LIFECYCLE-CLOSURE-AUDIT-001",
        "status": "ST2_EXP_004_LIFECYCLE_CLOSED_PASS" if not residuals else "ST2_EXP_004_LIFECYCLE_CLOSED_FAIL",
        "active_experiment": None,
        "frozen_reference": EXPECTED_BASELINE,
        "frozen_plan_commit": EXPECTED_PLAN_COMMIT,
        "final_study_act_commit": EXPECTED_STUDY_COMMIT,
        "preclosure_verified_run": EXPECTED_PRECLOSURE_RUN,
        "preclosure_verified_artifact": EXPECTED_PRECLOSURE_ARTIFACT,
        "architecture_integration_status": EXPECTED_ARCH,
        "next_act": EXPECTED_NEXT,
        "residuals": residuals,
    }
    rendered = json.dumps(result, indent=2, ensure_ascii=False) + "\n"
    if args.json_out:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0 if not residuals else 1


if __name__ == "__main__":
    raise SystemExit(main())
