#!/usr/bin/env python3
"""Audit immutable ST2-EXP-011 closure across later Stage-Two lifecycle states."""
from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any

LEDGER = "LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json"
STATUS = "LAB/PDSA/STATUS.md"
REGISTER = "LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md"
PLAN = "LAB/PDSA/PDSA-ST2-EXP-011_C_COMPARISON_INTERFACE_GENERALIZATION.md"
STUDY = "LAB/PDSA/experiments/ST2-EXP-011_FINAL_STUDY_ACT_001.md"
CLOSURE = "LAB/PDSA/experiments/ST2-EXP-011_LIFECYCLE_CLOSURE_001.md"
FAILURE_001 = "LAB/PDSA/experiments/ST2-EXP-011_FAILURE_001_SOURCE_BOUNDARY_COMMENT_FALSE_POSITIVE.md"
FAILURE_002 = "LAB/PDSA/experiments/ST2-EXP-011_FAILURE_002_HISTORICAL_LIFECYCLE_CI_SCOPE.md"
INTEGRATION = "LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_002.md"

EXPECTED_PRECLOSURE_HEAD = "ef116405c08475ec8702d9177a5106d7d0bfe525"
EXPECTED_PRECLOSURE_RUN = 32753140129
EXPECTED_PRECLOSURE_ARTIFACT = 9529812715
EXPECTED_PRECLOSURE_DIGEST = "f7ec7a6d1fb88a8c59dbcc8ce04bd8d6c389a3b3d77bb6ed3c1f22dc629dd9b1"
EXPECTED_FINAL_HEAD = "632a7134f26daf9dd781e3546804941f429a4246"
EXPECTED_FINAL_RUN = 32754345656
EXPECTED_FINAL_ARTIFACT = 9530261359
EXPECTED_FINAL_DIGEST = "d93c6f1ec34858f6cbc1556e92b86a241f6399e6a3cf894204608a51d63de2e5"
EXPECTED_MERGE_COMMIT = "72394878854aa69e865d17567959bec1daa70e6d"
EXPECTED_MERGE_TREE = "168fc1267313810e622c2206fa8a91f24decb4b7"
EXPECTED_PLAN_COMMIT = "5cc05ef1bea8e88787041c3bc30dd0aecf5412d4"
EXPECTED_BASELINE = "b49826e58261a71634cd12756e8afda28920088f"
INTEGRATED_STATUS = "INTEGRATED / BOMA-ST2-LEARNING-INTEGRATION-002 / ACCEPTED SOURCES UNCHANGED"

ST2_EXP_004 = "ST2-EXP-004"
ST2_EXP_004_PLAN = "LAB/PDSA/PDSA-ST2-EXP-004_R_TOTAL_ORDER_LOGICAL_REGIME.md"
ST2_EXP_004_PLAN_COMMIT = "89c9dc9154e7ca469e5c94c177be223205ee9dbd"
ST2_EXP_004_BASELINE = "50f3031b8d2657cbe0710e73e5935d997d40e49b"
ST2_EXP_004_STUDY = "LAB/PDSA/experiments/ST2-EXP-004_FINAL_STUDY_ACT_001.md"
ST2_EXP_004_STUDY_COMMIT = "6779d028c49f73757ea838c163d3968a982559fe"
ST2_EXP_004_CLOSURE = "LAB/PDSA/experiments/ST2-EXP-004_LIFECYCLE_CLOSURE_001.md"
ST2_EXP_004_INTEGRATION_PENDING = "REQUIRED / SEPARATE POST-CLOSURE ACT / NOT YET INTEGRATED"
ST2_EXP_004_INTEGRATED_PREFIX = "INTEGRATED / BOMA-ST2-LEARNING-INTEGRATION-003"

POST_011_NEXT = "POST-INTEGRATION MAIN SYNCHRONIZATION / RE-READ BEFORE ST2-EXP-004 FROZEN PLAN"
ACTIVE_004_NEXT = "ST2-EXP-004 GATE A — EXACT F-04 DEPENDENCY MAP"
CLOSED_004_NEXT = "ST2-EXP-004 LEARNING-TO-CONSTRUCTION INTEGRATION THEN STOP / NO NEW EXPERIMENT"
FINAL_STOP_NEXT = "NO ACTIVE EXPERIMENT / STOP BEFORE NEW EXPERIMENT / OWNER AUTHORIZATION REQUIRED"

EXPECTED_OPERATIONS = ["zero", "one", "neg", "add", "mul"]
EXPECTED_COORDINATES = [
    "coord", "coordinateGeneration", "coordinateUnique", "coordinateZero",
    "coordinateOne", "coordinateReal", "coordinateImag", "coordinateNeg",
    "coordinateAdd", "coordinateMul",
]


def read(root: Path, rel: str) -> str:
    p = root / rel
    if not p.is_file():
        raise ValueError(f"missing required file: {rel}")
    return p.read_text(encoding="utf-8")


def add(residuals: list[dict[str, Any]], kind: str, **ctx: Any) -> None:
    residuals.append({"type": kind, **ctx})


def expect_fields(residuals: list[dict[str, Any]], record: dict[str, Any], expected: dict[str, Any], prefix: str) -> None:
    for field, value in expected.items():
        if record.get(field) != value:
            add(residuals, prefix, field=field, expected=value, actual=record.get(field))


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--root", type=Path, default=Path.cwd())
    ap.add_argument("--json-out", type=Path)
    args = ap.parse_args()
    root = args.root.resolve()
    residuals: list[dict[str, Any]] = []
    mode = "UNKNOWN"
    declared_active: str | None = None
    expected_next = POST_011_NEXT

    try:
        ledger = json.loads(read(root, LEDGER))
        records = {
            x.get("experiment_id"): x for x in ledger.get("records", [])
            if isinstance(x, dict) and isinstance(x.get("experiment_id"), str)
        }
        for eid in ("ST2-EXP-001", "ST2-EXP-002", "ST2-EXP-003", "ST2-EXP-011"):
            if not str(records.get(eid, {}).get("status", "")).startswith("CLOSED"):
                add(residuals, "historical_experiment_not_closed", experiment=eid)

        record = records.get("ST2-EXP-011", {})
        declared_active = ledger.get("active_experiment")
        nonclosed = sorted(eid for eid, r in records.items() if not str(r.get("status", "")).startswith("CLOSED"))
        if len(nonclosed) > 1:
            add(residuals, "multiple_nonclosed_experiments", experiments=nonclosed)
        if declared_active is not None and declared_active not in records:
            add(residuals, "declared_active_experiment_record_missing", experiment=declared_active)
        if nonclosed and declared_active != nonclosed[0]:
            add(residuals, "active_pointer_drift", expected=nonclosed[0], actual=declared_active)
        if declared_active not in (None, ST2_EXP_004):
            add(residuals, "unexpected_later_active_experiment", expected=[None, ST2_EXP_004], actual=declared_active)

        integration_status = str(record.get("architecture_integration_status", ""))
        if integration_status != INTEGRATED_STATUS:
            add(residuals, "st2_exp_011_architecture_integration_drift", expected=INTEGRATED_STATUS, actual=integration_status)

        expect_fields(residuals, record, {
            "origin_kind": "BLOCK",
            "origin_id": "C-COMPARE-BLOCK-001",
            "source_unit_id": "R-BLOCK-001",
            "target_unit_id": "C-COMPARE-BLOCK-001",
            "baseline_producer_unit_id": "C-BLOCK-001",
            "accepted_export_unit_id": "C-BLOCK-002",
            "selected_baseline_route": "C-ROUTE-P",
            "frozen_reference_commit": EXPECTED_BASELINE,
            "frozen_plan_commit": EXPECTED_PLAN_COMMIT,
            "frozen_plan": PLAN,
            "final_study_act": STUDY,
            "lifecycle_closure_record": CLOSURE,
            "mathematical_result": "PASS",
            "closure_authorized_date": "2026-08-24",
            "verified_head": EXPECTED_PRECLOSURE_HEAD,
            "verified_run": EXPECTED_PRECLOSURE_RUN,
            "verified_artifact_id": EXPECTED_PRECLOSURE_ARTIFACT,
            "verified_artifact_sha256": EXPECTED_PRECLOSURE_DIGEST,
            "final_closed_verified_head": EXPECTED_FINAL_HEAD,
            "final_closed_verified_run": EXPECTED_FINAL_RUN,
            "final_closed_verified_artifact_id": EXPECTED_FINAL_ARTIFACT,
            "final_closed_verified_artifact_sha256": EXPECTED_FINAL_DIGEST,
            "main_merge_commit": EXPECTED_MERGE_COMMIT,
            "main_merge_tree": EXPECTED_MERGE_TREE,
            "architecture_integration_record": INTEGRATION,
            "architecture_integration_status": INTEGRATED_STATUS,
            "native_h5_dedekind_dependency": False,
            "relation_function_firewall_preserved": True,
            "global_selector_added": False,
            "new_block_created": False,
            "new_decision_point_created": False,
            "new_junction_created": False,
            "durable_architecture_knowledge": True,
            "canonical_refactor_status": "CANDIDATE ONLY / NOT PERFORMED",
        }, "st2_exp_011_field_drift")
        if record.get("comparison_scalar_operations") != EXPECTED_OPERATIONS:
            add(residuals, "comparison_scalar_surface_drift", actual=record.get("comparison_scalar_operations"))
        if record.get("comparison_coordinate_requirements") != EXPECTED_COORDINATES:
            add(residuals, "comparison_coordinate_surface_drift", actual=record.get("comparison_coordinate_requirements"))
        if record.get("direct_affected_claims") != ["C-CL-COMPARE-001"]:
            add(residuals, "direct_claim_cone_drift", actual=record.get("direct_affected_claims"))
        if record.get("secondary_audit_claims") != ["C-CL-INTEGRATION-001"]:
            add(residuals, "secondary_claim_cone_drift", actual=record.get("secondary_audit_claims"))
        if record.get("failure_records") != [FAILURE_001, FAILURE_002]:
            add(residuals, "failure_record_set_drift", actual=record.get("failure_records"))

        fourth = records.get(ST2_EXP_004)
        if fourth is None:
            mode = "POST_INTEGRATION_PRE_004"
            expected_next = POST_011_NEXT
        else:
            expect_fields(residuals, fourth, {
                "origin_kind": "DECISION_POINT",
                "origin_id": "R-DP-003",
                "frozen_reference_commit": ST2_EXP_004_BASELINE,
                "frozen_plan_commit": ST2_EXP_004_PLAN_COMMIT,
                "frozen_plan": ST2_EXP_004_PLAN,
            }, "st2_exp_004_identity_drift")
            frozen = read(root, ST2_EXP_004_PLAN)
            for marker in ("# PLAN — FROZEN", ST2_EXP_004, "R-DP-003", ST2_EXP_004_BASELINE, "DO NOT EDIT THIS FILE"):
                if marker not in frozen:
                    add(residuals, "st2_exp_004_frozen_plan_marker_missing", marker=marker)

            status004 = str(fourth.get("status", ""))
            arch004 = str(fourth.get("architecture_integration_status", ""))
            if declared_active == ST2_EXP_004:
                mode = "LATER_ACTIVE_ST2_EXP_004"
                expected_next = ACTIVE_004_NEXT
                if not status004.startswith("ACTIVE / PLAN FROZEN"):
                    add(residuals, "st2_exp_004_not_active_frozen", actual=status004)
            elif status004.startswith("CLOSED / PASS") and arch004 == ST2_EXP_004_INTEGRATION_PENDING:
                mode = "ST2_EXP_004_CLOSED_INTEGRATION_PENDING"
                expected_next = CLOSED_004_NEXT
                expect_fields(residuals, fourth, {
                    "mathematical_result": "PASS",
                    "same_carrier_totality_recovery": "NOT_RECOVERED_WITH_CURRENT_CUT_INTERFACE",
                    "final_study_act": ST2_EXP_004_STUDY,
                    "final_study_act_commit": ST2_EXP_004_STUDY_COMMIT,
                    "lifecycle_closure_record": ST2_EXP_004_CLOSURE,
                    "accepted_reference_changed": False,
                    "new_block_created": False,
                    "new_decision_point_created": False,
                    "new_junction_created": False,
                }, "st2_exp_004_closed_field_drift")
                read(root, ST2_EXP_004_STUDY)
                read(root, ST2_EXP_004_CLOSURE)
            elif status004.startswith("CLOSED / PASS") and arch004.startswith(ST2_EXP_004_INTEGRATED_PREFIX):
                mode = "ST2_EXP_004_CLOSED_INTEGRATED_FINAL_STOP"
                expected_next = FINAL_STOP_NEXT
            else:
                mode = "ST2_EXP_004_STATE_UNRECOGNIZED"
                add(residuals, "st2_exp_004_state_unrecognized", status=status004, architecture_integration_status=arch004)

        if ledger.get("required_next_act") != expected_next:
            add(residuals, "required_next_act_drift", mode=mode, expected=expected_next, actual=ledger.get("required_next_act"))

        next_slot = str(ledger.get("next_experiment_slot", ""))
        if mode == "LATER_ACTIVE_ST2_EXP_004":
            for marker in ("ST2-EXP-004", "ACTIVE", "FROZEN PLAN"):
                if marker not in next_slot:
                    add(residuals, "active_004_marker_missing", marker=marker, actual=next_slot)
        elif mode == "ST2_EXP_004_CLOSED_INTEGRATION_PENDING":
            for marker in ("NO ACTIVE EXPERIMENT", "ST2-EXP-004 CLOSED", "ARCHITECTURE INTEGRATION NEXT", "STOP BEFORE NEW EXPERIMENT"):
                if marker not in next_slot:
                    add(residuals, "closed_004_marker_missing", marker=marker, actual=next_slot)
        elif mode == "ST2_EXP_004_CLOSED_INTEGRATED_FINAL_STOP":
            for marker in ("NO ACTIVE EXPERIMENT", "STOP BEFORE NEW EXPERIMENT"):
                if marker not in next_slot:
                    add(residuals, "final_stop_marker_missing", marker=marker, actual=next_slot)

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

        for rel, markers in (
            (PLAN, ("# PLAN — FROZEN", "ST2-EXP-011", "C-COMPARE-BLOCK-001")),
            (STUDY, ("MATHEMATICAL RESULT", "PASS", "C-COMPARE-BLOCK-001")),
            (CLOSURE, ("CLOSED / PASS / OWNER AUTHORIZED", EXPECTED_PRECLOSURE_HEAD, str(EXPECTED_PRECLOSURE_RUN), str(EXPECTED_PRECLOSURE_ARTIFACT), EXPECTED_PRECLOSURE_DIGEST)),
            (INTEGRATION, ("BOMA-ST2-LEARNING-INTEGRATION-002", EXPECTED_FINAL_HEAD, str(EXPECTED_FINAL_RUN), EXPECTED_MERGE_COMMIT)),
        ):
            text = read(root, rel)
            for marker in markers:
                if marker not in text:
                    add(residuals, "historical_record_marker_missing", document=rel, marker=marker)
        read(root, FAILURE_001)
        read(root, FAILURE_002)

        for rel in (STATUS, REGISTER):
            text = read(root, rel)
            for marker in ("ST2-EXP-011", "CLOSED", "PASS", "INTEGRATED"):
                if marker not in text:
                    add(residuals, "current_state_marker_missing", document=rel, marker=marker)

    except (OSError, ValueError, json.JSONDecodeError) as exc:
        add(residuals, "closure_audit_execution_error", error=str(exc))

    result = {
        "schema": "BOMA-ST2-EXP-011-LIFECYCLE-CLOSURE-AUDIT-001",
        "status": "ST2_EXP_011_LIFECYCLE_CLOSED_PASS" if not residuals else "ST2_EXP_011_LIFECYCLE_CLOSED_FAIL",
        "mode": mode,
        "verified_preclosure_head": EXPECTED_PRECLOSURE_HEAD,
        "verified_preclosure_run": EXPECTED_PRECLOSURE_RUN,
        "final_closed_head": EXPECTED_FINAL_HEAD,
        "final_closed_run": EXPECTED_FINAL_RUN,
        "main_merge_commit": EXPECTED_MERGE_COMMIT,
        "active_experiment": declared_active,
        "required_next_act": expected_next,
        "st2_exp_011_historical_closure_is_monotone": True,
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
