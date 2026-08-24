#!/usr/bin/env python3
"""Audit the closed ST2-EXP-011 lifecycle without promoting research code."""
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

EXPECTED_HEAD = "ef116405c08475ec8702d9177a5106d7d0bfe525"
EXPECTED_RUN = 32753140129
EXPECTED_ARTIFACT = 9529812715
EXPECTED_DIGEST = "f7ec7a6d1fb88a8c59dbcc8ce04bd8d6c389a3b3d77bb6ed3c1f22dc629dd9b1"
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

        if ledger.get("active_experiment") is not None:
            add(residuals, "active_experiment_not_released", actual=ledger.get("active_experiment"))
        if ledger.get("required_next_act") != "ST2-EXP-011 LEARNING-TO-CONSTRUCTION INTEGRATION":
            add(residuals, "required_next_act_drift", actual=ledger.get("required_next_act"))
        next_slot = str(ledger.get("next_experiment_slot", ""))
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
            "verified_head": EXPECTED_HEAD,
            "verified_run": EXPECTED_RUN,
            "verified_artifact_id": EXPECTED_ARTIFACT,
            "verified_artifact_sha256": EXPECTED_DIGEST,
            "native_h5_dedekind_dependency": False,
            "relation_function_firewall_preserved": True,
            "global_selector_added": False,
            "new_block_created": False,
            "new_decision_point_created": False,
            "new_junction_created": False,
            "durable_architecture_knowledge": True,
            "canonical_refactor_status": "CANDIDATE ONLY / NOT PERFORMED",
            "architecture_integration_status": "REQUIRED / SEPARATE POST-CLOSURE ACT / NOT YET INTEGRATED",
        }
        for field, expected in expected_scalars.items():
            if record.get(field) != expected:
                add(residuals, "st2_exp_011_field_drift", field=field, expected=expected, actual=record.get(field))

        if not str(record.get("status", "")).startswith("CLOSED / PASS"):
            add(residuals, "st2_exp_011_status_not_closed_pass", actual=record.get("status"))
        if not str(record.get("lifecycle_disposition", "")).startswith("CLOSED / OWNER AUTHORIZED 2026-08-24"):
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
            EXPECTED_HEAD,
            str(EXPECTED_RUN),
            str(EXPECTED_ARTIFACT),
            EXPECTED_DIGEST,
            "ACTIVE STAGE-TWO EXPERIMENT:                  NONE",
        ):
            if marker not in closure:
                add(residuals, "closure_record_marker_missing", marker=marker)
        for rel, text in ((STATUS, status), (REGISTER, register)):
            for marker in ("ST2-EXP-011", "CLOSED", "PASS", "ST2-EXP-004", "NOT ACTIVE"):
                if marker not in text:
                    add(residuals, "current_state_marker_missing", document=rel, marker=marker)

    except (OSError, ValueError, json.JSONDecodeError) as exc:
        add(residuals, "closure_audit_execution_error", error=str(exc))

    result = {
        "schema": "BOMA-ST2-EXP-011-LIFECYCLE-CLOSURE-AUDIT-001",
        "status": "ST2_EXP_011_LIFECYCLE_CLOSED_PASS" if not residuals else "ST2_EXP_011_LIFECYCLE_CLOSED_FAIL",
        "verified_preclosure_head": EXPECTED_HEAD,
        "verified_run": EXPECTED_RUN,
        "verified_artifact": EXPECTED_ARTIFACT,
        "verified_digest": EXPECTED_DIGEST,
        "active_experiment": None,
        "required_next_act": "ST2-EXP-011 LEARNING-TO-CONSTRUCTION INTEGRATION",
        "next_experiment": "ST2-EXP-004 / NOT ACTIVE",
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
