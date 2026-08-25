#!/usr/bin/env python3
"""Audit closed ST2-EXP-011 lifecycle across later Stage-Two cycles."""
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
EXPECTED_OPERATIONS = ["zero", "one", "neg", "add", "mul"]
EXPECTED_COORDINATES = [
    "coord",
    "coordinateGeneration",
    "coordinateUnique",
    "coordinateZero",
    "coordinateOne",
    "coordinateReal",
    "coordinateImag",
    "coordinateNeg",
    "coordinateAdd",
    "coordinateMul",
]

PRECLOSURE_NEXT_ACT = "ST2-EXP-011 LEARNING-TO-CONSTRUCTION INTEGRATION"
POSTINTEGRATION_NEXT_ACT = (
    "POST-INTEGRATION MAIN SYNCHRONIZATION / RE-READ BEFORE ST2-EXP-004 FROZEN PLAN"
)
ST2_EXP_004_NEXT_ACT = "ST2-EXP-004 GATE A — EXACT F-04 DEPENDENCY MAP"
INTEGRATED_STATUS = (
    "INTEGRATED / BOMA-ST2-LEARNING-INTEGRATION-002 / ACCEPTED SOURCES UNCHANGED"
)

ST2_EXP_004 = "ST2-EXP-004"
ST2_EXP_004_PLAN = "LAB/PDSA/PDSA-ST2-EXP-004_R_TOTAL_ORDER_LOGICAL_REGIME.md"
ST2_EXP_004_PLAN_COMMIT = "89c9dc9154e7ca469e5c94c177be223205ee9dbd"
ST2_EXP_004_BASELINE = "50f3031b8d2657cbe0710e73e5935d997d40e49b"


def read(root: Path, rel: str) -> str:
    path = root / rel
    if not path.is_file():
        raise ValueError(f"missing required file: {rel}")
    return path.read_text(encoding="utf-8")


def add(residuals: list[dict[str, Any]], kind: str, **ctx: Any) -> None:
    residuals.append({"type": kind, **ctx})


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=Path.cwd())
    parser.add_argument("--json-out", type=Path)
    args = parser.parse_args()
    root = args.root.resolve()
    residuals: list[dict[str, Any]] = []
    mode = "UNKNOWN"
    declared_active: str | None = None

    try:
        ledger = json.loads(read(root, LEDGER))
        records = {
            item.get("experiment_id"): item
            for item in ledger.get("records", [])
            if isinstance(item, dict) and isinstance(item.get("experiment_id"), str)
        }
        record = records.get("ST2-EXP-011")
        if record is None:
            add(residuals, "st2_exp_011_record_missing")
            record = {}

        for old in ("ST2-EXP-001", "ST2-EXP-002", "ST2-EXP-003"):
            old_record = records.get(old, {})
            if not str(old_record.get("status", "")).startswith("CLOSED"):
                add(residuals, "historical_experiment_not_closed", experiment=old)

        declared_active = ledger.get("active_experiment")
        nonclosed = sorted(
            key
            for key, item in records.items()
            if not str(item.get("status", "")).startswith("CLOSED")
        )
        if len(nonclosed) > 1:
            add(residuals, "multiple_nonclosed_experiments", experiments=nonclosed)
        if declared_active is not None and declared_active not in records:
            add(
                residuals,
                "declared_active_experiment_record_missing",
                experiment=declared_active,
            )
        if nonclosed and declared_active != nonclosed[0]:
            add(
                residuals,
                "active_pointer_drift",
                expected=nonclosed[0],
                actual=declared_active,
            )
        if declared_active is not None and declared_active != ST2_EXP_004:
            add(
                residuals,
                "unexpected_later_active_experiment",
                expected=[None, ST2_EXP_004],
                actual=declared_active,
            )

        integration_status = str(record.get("architecture_integration_status", ""))
        if integration_status == INTEGRATED_STATUS:
            if declared_active == ST2_EXP_004:
                mode = "LATER_ACTIVE_ST2_EXP_004"
                expected_next_act = ST2_EXP_004_NEXT_ACT
            else:
                mode = "POST_INTEGRATION"
                expected_next_act = POSTINTEGRATION_NEXT_ACT
        else:
            mode = "PRECLOSURE_INTEGRATION_PENDING"
            expected_next_act = PRECLOSURE_NEXT_ACT

        if ledger.get("required_next_act") != expected_next_act:
            add(
                residuals,
                "required_next_act_drift",
                mode=mode,
                expected=expected_next_act,
                actual=ledger.get("required_next_act"),
            )

        next_slot = str(ledger.get("next_experiment_slot", ""))
        if declared_active == ST2_EXP_004:
            for marker in ("ST2-EXP-004", "ACTIVE", "FROZEN PLAN", "GATE A"):
                if marker not in next_slot:
                    add(residuals, "active_004_marker_missing", marker=marker, actual=next_slot)
        else:
            for marker in ("ST2-EXP-004", "NOT ACTIVE", "NO FROZEN PLAN"):
                if marker not in next_slot:
                    add(residuals, "next_sequence_marker_missing", marker=marker, actual=next_slot)

        expected_scalars = {
            "origin_kind": "BLOCK",
            "origin_id": "C-COMPARE-BLOCK-001",
            "source_unit_id": "R-BLOCK-001",
            "target_unit_id": "C-COMPARE-BLOCK-001",
            "baseline_producer_unit_id": "C-COMPARE-BLOCK-001",
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
            "native_h5_dedekind_dependency": False,
            "relation_function_firewall_preserved": True,
            "global_selector_added": False,
            "new_block_created": False,
            "new_decision_point_created": False,
            "new_junction_created": False,
            "durable_architecture_knowledge": True,
            "canonical_refactor_status": "CANDIDATE ONLY / NOT PERFORMED",
        }
        for field, expected in expected_scalars.items():
            if record.get(field) != expected:
                add(
                    residuals,
                    "st2_exp_011_field_drift",
                    field=field,
                    expected=expected,
                    actual=record.get(field),
                )

        if not str(record.get("status", "")).startswith("CLOSED / PASS"):
            add(residuals, "st2_exp_011_status_not_closed_pass", actual=record.get("status"))
        if not str(record.get("lifecycle_disposition", "")).startswith(
            "CLOSED / OWNER AUTHORIZED 2026-08-24"
        ):
            add(residuals, "lifecycle_disposition_not_closed", actual=record.get("lifecycle_disposition"))
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

        if integration_status == INTEGRATED_STATUS:
            expected_integrated = {
                "final_closed_verified_head": EXPECTED_FINAL_HEAD,
                "final_closed_verified_run": EXPECTED_FINAL_RUN,
                "final_closed_verified_artifact_id": EXPECTED_FINAL_ARTIFACT,
                "final_closed_verified_artifact_sha256": EXPECTED_FINAL_DIGEST,
                "main_merge_commit": EXPECTED_MERGE_COMMIT,
                "main_merge_tree": EXPECTED_MERGE_TREE,
                "architecture_integration_record": INTEGRATION,
                "architecture_integration_status": INTEGRATED_STATUS,
            }
            for field, expected in expected_integrated.items():
                if record.get(field) != expected:
                    add(
                        residuals,
                        "st2_exp_011_integrated_field_drift",
                        field=field,
                        expected=expected,
                        actual=record.get(field),
                    )
            integration = read(root, INTEGRATION)
            for marker in (
                "BOMA-ST2-LEARNING-INTEGRATION-002",
                EXPECTED_FINAL_HEAD,
                str(EXPECTED_FINAL_RUN),
                str(EXPECTED_FINAL_ARTIFACT),
                EXPECTED_FINAL_DIGEST,
                EXPECTED_MERGE_COMMIT,
                "NEW BLOCK / DECISION POINT / JUNCTION",
            ):
                if marker not in integration.upper() and marker not in integration:
                    add(residuals, "integration_record_marker_missing", marker=marker)
        else:
            expected_pending = "REQUIRED / SEPARATE POST-CLOSURE ACT / NOT YET INTEGRATED"
            if integration_status != expected_pending:
                add(
                    residuals,
                    "architecture_integration_state_unrecognized",
                    expected=[expected_pending, INTEGRATED_STATUS],
                    actual=integration_status,
                )

        if declared_active == ST2_EXP_004:
            fourth = records.get(ST2_EXP_004, {})
            expected_fourth = {
                "origin_kind": "DECISION_POINT",
                "origin_id": "R-DP-003",
                "frozen_reference_commit": ST2_EXP_004_BASELINE,
                "frozen_plan_commit": ST2_EXP_004_PLAN_COMMIT,
                "frozen_plan": ST2_EXP_004_PLAN,
            }
            for field, expected in expected_fourth.items():
                if fourth.get(field) != expected:
                    add(
                        residuals,
                        "st2_exp_004_activation_field_drift",
                        field=field,
                        expected=expected,
                        actual=fourth.get(field),
                    )
            if not str(fourth.get("status", "")).startswith("ACTIVE / PLAN FROZEN"):
                add(
                    residuals,
                    "st2_exp_004_not_active_frozen",
                    actual=fourth.get("status"),
                )
            frozen_004 = read(root, ST2_EXP_004_PLAN)
            for marker in (
                "# PLAN — FROZEN",
                ST2_EXP_004,
                "R-DP-003",
                ST2_EXP_004_BASELINE,
                "DO NOT EDIT THIS FILE",
            ):
                if marker not in frozen_004:
                    add(residuals, "st2_exp_004_frozen_plan_marker_missing", marker=marker)

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
        study = read(root, STUDY)
        closure = read(root, CLOSURE)
        status = read(root, STATUS)
        register = read(root, REGISTER)
        read(root, FAILURE_001)
        read(root, FAILURE_002)

        for marker in ("# PLAN — FROZEN", "ST2-EXP-011", "C-COMPARE-BLOCK-001"):
            if marker not in plan:
                add(residuals, "frozen_plan_marker_missing", marker=marker)
        for marker in ("MATHEMATICAL RESULT", "PASS", "C-COMPARE-BLOCK-001"):
            if marker not in study:
                add(residuals, "study_act_marker_missing", marker=marker)
        for marker in (
            "CLOSED / PASS / OWNER AUTHORIZED",
            EXPECTED_PRECLOSURE_HEAD,
            str(EXPECTED_PRECLOSURE_RUN),
            str(EXPECTED_PRECLOSURE_ARTIFACT),
            EXPECTED_PRECLOSURE_DIGEST,
            "ACTIVE STAGE-TWO EXPERIMENT:                  NONE",
        ):
            if marker not in closure:
                add(residuals, "closure_record_marker_missing", marker=marker)

        for rel, text in ((STATUS, status), (REGISTER, register)):
            for marker in ("ST2-EXP-011", "CLOSED", "PASS", "INTEGRATED"):
                if marker not in text:
                    add(residuals, "current_state_marker_missing", document=rel, marker=marker)
            if declared_active == ST2_EXP_004:
                for marker in ("ST2-EXP-004", "ACTIVE", "PLAN FROZEN"):
                    if marker not in text:
                        add(
                            residuals,
                            "active_004_current_state_marker_missing",
                            document=rel,
                            marker=marker,
                        )

    except (OSError, ValueError, json.JSONDecodeError) as exc:
        add(residuals, "closure_audit_execution_error", error=str(exc))

    result = {
        "schema": "BOMA-ST2-EXP-011-LIFECYCLE-CLOSURE-AUDIT-001",
        "status": "ST2_EXP_011_LIFECYCLE_CLOSED_PASS" if not residuals else "ST2_EXP_011_LIFECYCLE_CLOSED_FAIL",
        "mode": mode,
        "verified_preclosure_head": EXPECTED_PRECLOSURE_HEAD,
        "verified_preclosure_run": EXPECTED_PRECLOSURE_RUN,
        "final_closed_head": EXPECTED_FINAL_HEAD if mode != "PRECLOSURE_INTEGRATION_PENDING" else None,
        "final_closed_run": EXPECTED_FINAL_RUN if mode != "PRECLOSURE_INTEGRATION_PENDING" else None,
        "main_merge_commit": EXPECTED_MERGE_COMMIT if mode != "PRECLOSURE_INTEGRATION_PENDING" else None,
        "active_experiment": declared_active,
        "required_next_act": (
            ST2_EXP_004_NEXT_ACT
            if declared_active == ST2_EXP_004
            else POSTINTEGRATION_NEXT_ACT
            if mode == "POST_INTEGRATION"
            else PRECLOSURE_NEXT_ACT
        ),
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
