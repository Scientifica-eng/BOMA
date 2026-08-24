#!/usr/bin/env python3
"""Audit the owner-authorized closed Stage-Two frontier after ST2-EXP-003."""
from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any

LEDGER = "LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json"
LEDGER_MD = "LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.md"
REGISTER = "LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md"
STATUS = "LAB/PDSA/STATUS.md"
CLOSURE = "LAB/PDSA/experiments/ST2-EXP-003_LIFECYCLE_CLOSURE_001.md"
FROZEN_PLAN = "LAB/PDSA/PDSA-ST2-EXP-003_INDEPENDENT_CAUCHY_REAL_ROUTE.md"
JUNCTION_RECORD = "LAB/PDSA/experiments/ST2-EXP-003_DEDEKIND_CAUCHY_R_JUNCTION_001.md"

FRONTIER_FILES = (
    "LAB/00_ARCHITECTURE/R_DAG.md",
    "LAB/00_ARCHITECTURE/C_DAG.md",
    "LAB/00_ARCHITECTURE/GRAPH.md",
    "LAB/00_ARCHITECTURE/REGISTRY.md",
    "LAB/00_ARCHITECTURE/JUNCTION_LEDGER.md",
    REGISTER,
    STATUS,
    "README.md",
    "AGENTS.md",
)

EXPECTED_EXPERIMENTS = {"ST2-EXP-001", "ST2-EXP-002", "ST2-EXP-003"}
EXPECTED_FINAL_HEAD = "3d4ed58e5d88b2a0bd84b3958cac2c8572385152"
EXPECTED_MERGE = "5431ac81e7327f5bf4b06b3ab7fdb2bcb5b69efd"
EXPECTED_MERGE_TREE = "d515a2812e621af68406c30866ac9ece5460b1f9"
EXPECTED_CLOSURE_RUN = 32727267183
EXPECTED_JUNCTION = "ST2-EXP-003-R-J-001"
EXPECTED_CRITICAL = {
    "independent": {
        "run": 32727267231,
        "artifact": 9520001887,
        "sha256": "e7c8e9959445e182eab133a11f7352fbf4a9a6ae270d7b81037b2008b663de8c",
    },
    "h5": {
        "run": 32727267177,
        "artifact": 9520005288,
        "sha256": "3ecf85142656442bad312ace22e62266a15de534fd228c106075247367cdbf34",
    },
    "h6": {
        "run": 32727267183,
        "artifact": 9520002118,
        "sha256": "72475d7c6bc489bf532480f5075699f91304c4128b52e446275855e6a31555fa",
    },
}


def read_text(root: Path, relative: str) -> str:
    path = root / relative
    if not path.is_file():
        raise ValueError(f"missing required repository file: {relative}")
    return path.read_text(encoding="utf-8")


def error(residuals: list[dict[str, Any]], kind: str, **ctx: Any) -> None:
    residuals.append({"type": kind, **ctx})


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=Path.cwd())
    parser.add_argument("--json-out", type=Path)
    args = parser.parse_args()
    root = args.root.resolve()
    residuals: list[dict[str, Any]] = []

    try:
        ledger = json.loads(read_text(root, LEDGER))
        records = {
            item.get("experiment_id"): item
            for item in ledger.get("records", [])
            if isinstance(item, dict) and isinstance(item.get("experiment_id"), str)
        }

        if set(records) != EXPECTED_EXPERIMENTS:
            error(residuals, "experiment_set_drift", actual=sorted(records))

        active = sorted(
            key for key, item in records.items()
            if str(item.get("status", "")).startswith("ACTIVE")
        )
        if active:
            error(residuals, "closed_frontier_has_active_experiment", actual=active)
        if ledger.get("active_experiment") is not None:
            error(residuals, "active_experiment_slot_not_released", actual=ledger.get("active_experiment"))
        if ledger.get("next_experiment_slot") != "OPEN / OWNER SELECTION REQUIRED":
            error(residuals, "next_experiment_slot_boundary_drift", actual=ledger.get("next_experiment_slot"))
        if "NO ACTIVE EXPERIMENT" not in str(ledger.get("status", "")):
            error(residuals, "closed_frontier_status_missing", actual=ledger.get("status"))

        accepted = ledger.get("accepted_reference", {})
        expected_accepted = {
            "selected_route": "C-ROUTE-P",
            "selected_producer_unit": "C-BLOCK-001",
            "accepted_export_unit": "C-BLOCK-002",
            "acceptance": "CA-20 ACCEPT",
            "upstream_accepted_unit": "R-BLOCK-001",
            "dependency_contract": "BOMA-C-R-DEP-001",
        }
        for field, expected in expected_accepted.items():
            if accepted.get(field) != expected:
                error(residuals, "accepted_reference_drift", field=field, actual=accepted.get(field))

        for experiment in sorted(EXPECTED_EXPERIMENTS):
            item = records.get(experiment, {})
            if not str(item.get("status", "")).startswith("CLOSED"):
                error(residuals, "experiment_not_closed", experiment=experiment, actual=item.get("status"))
            if not isinstance(item.get("verified_run"), int):
                error(residuals, "closed_experiment_verified_run_missing", experiment=experiment)

        third = records.get("ST2-EXP-003", {})
        exact_scalars = {
            "origin_kind": "DECISION_POINT",
            "origin_id": "R-DP-001",
            "source_unit_id": "Q-BLOCK-002",
            "target_unit_id": "R-BLOCK-001",
            "baseline_producer_unit_id": "R-BLOCK-001",
            "accepted_export_unit_id": "R-BLOCK-001",
            "selected_real_baseline_route": "R-ROUTE-D / DEDEKIND",
            "alternative_route": "R-ROUTE-C / CAUCHY",
            "mathematical_result": "PASS",
            "verified_run": EXPECTED_CLOSURE_RUN,
            "verified_head": EXPECTED_FINAL_HEAD,
            "current_exact_head": EXPECTED_FINAL_HEAD,
            "main_merge_commit": EXPECTED_MERGE,
            "main_merge_tree": EXPECTED_MERGE_TREE,
            "closure_authorized_date": "2026-08-24",
            "reconvergence_junction_id": EXPECTED_JUNCTION,
            "junction_record": JUNCTION_RECORD,
            "lifecycle_closure_record": CLOSURE,
        }
        for field, expected in exact_scalars.items():
            if third.get(field) != expected:
                error(residuals, "st2_exp_003_closure_identity_drift", field=field, expected=expected, actual=third.get(field))

        if not str(third.get("lifecycle_disposition", "")).startswith("CLOSED"):
            error(residuals, "st2_exp_003_lifecycle_not_closed", actual=third.get("lifecycle_disposition"))
        product = str(third.get("experimental_product_status", ""))
        if "NOT AN ACCEPTED REAL EXPORT" not in product or "H6 C NOT AN ACCEPTED EXPORT" not in product:
            error(residuals, "research_acceptance_boundary_missing", actual=product)
        if "NOT A CANONICAL ACCEPTANCE JUNCTION" not in str(third.get("junction_status", "")):
            error(residuals, "research_junction_acceptance_boundary_missing")

        critical_fields = {
            "independent": (
                "current_exact_independent_cauchy_run",
                "current_exact_independent_cauchy_artifact_id",
                "current_exact_independent_cauchy_artifact_sha256",
            ),
            "h5": (
                "current_exact_h5_junction_run",
                "current_exact_h5_junction_artifact_id",
                "current_exact_h5_junction_artifact_sha256",
            ),
            "h6": (
                "current_exact_h6_run",
                "current_exact_h6_artifact_id",
                "current_exact_h6_artifact_sha256",
            ),
        }
        for name, fields in critical_fields.items():
            expected = EXPECTED_CRITICAL[name]
            actual = {
                "run": third.get(fields[0]),
                "artifact": third.get(fields[1]),
                "sha256": third.get(fields[2]),
            }
            if actual != expected:
                error(residuals, "final_exact_head_evidence_drift", family=name, expected=expected, actual=actual)

        closure = read_text(root, CLOSURE)
        for marker in (
            "CLOSED / PASS / OWNER AUTHORIZED",
            EXPECTED_FINAL_HEAD,
            EXPECTED_MERGE,
            EXPECTED_JUNCTION,
            str(EXPECTED_CRITICAL["independent"]["run"]),
            str(EXPECTED_CRITICAL["h5"]["run"]),
            str(EXPECTED_CRITICAL["h6"]["run"]),
            "ACTIVE STAGE-TWO EXPERIMENT:            NONE",
            "NEXT EXPERIMENT SLOT:                   OPEN / OWNER SELECTION REQUIRED",
            "PROMOTE CAUCHY R TO ACCEPTED EXPORT:    NO",
            "PROMOTE H6 C TO ACCEPTED EXPORT:        NO",
        ):
            if marker not in closure:
                error(residuals, "closure_record_marker_missing", marker=marker)

        junction_record = read_text(root, JUNCTION_RECORD)
        if EXPECTED_JUNCTION not in junction_record or "ST2-EXP-003" not in junction_record:
            error(residuals, "research_junction_record_identity_missing")

        frozen = read_text(root, FROZEN_PLAN)
        for marker in ("# PLAN — FROZEN", "ST2-EXP-003", "R-DP-001", "Q-BLOCK-002", "R-BLOCK-001"):
            if marker not in frozen:
                error(residuals, "frozen_plan_identity_missing", marker=marker)

        ledger_md = read_text(root, LEDGER_MD)
        if "ST2-EXP-003" not in ledger_md or "CLOSED / PASS" not in ledger_md or "NO ACTIVE EXPERIMENT" not in ledger_md:
            error(residuals, "human_ledger_not_closed")

        register = read_text(root, REGISTER)
        if "ST2-EXP-003" not in register or "CLOSED / PASS" not in register or "NO ACTIVE EXPERIMENT" not in register:
            error(residuals, "experiment_register_not_closed")

        status = read_text(root, STATUS)
        if "ST2-EXP-003" not in status or "CLOSED / PASS" not in status or "NO ACTIVE EXPERIMENT" not in status:
            error(residuals, "status_not_closed")

        for relative in FRONTIER_FILES:
            text = read_text(root, relative)
            if "NO ACTIVE EXPERIMENT" not in text:
                error(residuals, "frontier_no_active_marker_missing", document=relative)
            if "OWNER DISPOSITION PENDING" in text:
                error(residuals, "frontier_owner_disposition_stale", document=relative)

    except (OSError, ValueError, json.JSONDecodeError) as exc:
        error(residuals, "closure_audit_execution_error", error=str(exc))

    result = {
        "schema": "BOMA-STAGE-TWO-LIFECYCLE-CLOSURE-AUDIT-001",
        "status": "STAGE_TWO_CLOSED_FRONTIER_PASS" if not residuals else "STAGE_TWO_CLOSED_FRONTIER_FAIL",
        "closed_experiments": sorted(EXPECTED_EXPERIMENTS),
        "active_experiment": None,
        "next_experiment_slot": "OPEN / OWNER SELECTION REQUIRED",
        "st2_exp_003_final_head": EXPECTED_FINAL_HEAD,
        "st2_exp_003_merge_commit": EXPECTED_MERGE,
        "st2_exp_003_research_junction": EXPECTED_JUNCTION,
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
