#!/usr/bin/env python3
"""Verify that the closed ST2-EXP-001..003 lifecycle remains valid after later Stage-Two work begins."""
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

CURRENT_STATE_FILES = (
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

HISTORICAL_EXPERIMENTS = {"ST2-EXP-001", "ST2-EXP-002", "ST2-EXP-003"}
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
EXPECTED_ACCEPTED = {
    "selected_route": "C-ROUTE-P",
    "selected_producer_unit": "C-BLOCK-001",
    "accepted_export_unit": "C-BLOCK-002",
    "acceptance": "CA-20 ACCEPT",
    "upstream_accepted_unit": "R-BLOCK-001",
    "dependency_contract": "BOMA-C-R-DEP-001",
}


def read_text(root: Path, relative: str) -> str:
    path = root / relative
    if not path.is_file():
        raise ValueError(f"missing required repository file: {relative}")
    return path.read_text(encoding="utf-8")


def add_error(residuals: list[dict[str, Any]], kind: str, **ctx: Any) -> None:
    residuals.append({"type": kind, **ctx})


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=Path.cwd())
    parser.add_argument("--json-out", type=Path)
    args = parser.parse_args()
    root = args.root.resolve()
    residuals: list[dict[str, Any]] = []
    ledger: dict[str, Any] = {}
    records: dict[str, dict[str, Any]] = {}

    try:
        ledger = json.loads(read_text(root, LEDGER))
        records = {
            item.get("experiment_id"): item
            for item in ledger.get("records", [])
            if isinstance(item, dict) and isinstance(item.get("experiment_id"), str)
        }

        missing = HISTORICAL_EXPERIMENTS - set(records)
        if missing:
            add_error(residuals, "historical_experiment_missing", experiments=sorted(missing))

        for experiment in sorted(HISTORICAL_EXPERIMENTS):
            item = records.get(experiment, {})
            if not str(item.get("status", "")).startswith("CLOSED"):
                add_error(
                    residuals,
                    "historical_experiment_not_closed",
                    experiment=experiment,
                    actual=item.get("status"),
                )
            if not isinstance(item.get("verified_run"), int):
                add_error(
                    residuals,
                    "historical_verified_run_missing",
                    experiment=experiment,
                )

        later = {
            key: item for key, item in records.items() if key not in HISTORICAL_EXPERIMENTS
        }
        nonclosed_later = sorted(
            key for key, item in later.items()
            if not str(item.get("status", "")).startswith("CLOSED")
        )
        if len(nonclosed_later) > 1:
            add_error(
                residuals,
                "multiple_later_nonclosed_experiments",
                experiments=nonclosed_later,
            )
        declared_active = ledger.get("active_experiment")
        if declared_active in HISTORICAL_EXPERIMENTS:
            add_error(
                residuals,
                "historical_experiment_reactivated",
                experiment=declared_active,
            )
        if declared_active is not None and declared_active not in records:
            add_error(
                residuals,
                "declared_active_experiment_record_missing",
                experiment=declared_active,
            )
        if nonclosed_later and declared_active not in (None, nonclosed_later[0]):
            add_error(
                residuals,
                "later_active_pointer_drift",
                expected=nonclosed_later[0],
                actual=declared_active,
            )

        accepted = ledger.get("accepted_reference", {})
        for field, expected in EXPECTED_ACCEPTED.items():
            if accepted.get(field) != expected:
                add_error(
                    residuals,
                    "accepted_reference_drift",
                    field=field,
                    expected=expected,
                    actual=accepted.get(field),
                )

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
                add_error(
                    residuals,
                    "st2_exp_003_closure_identity_drift",
                    field=field,
                    expected=expected,
                    actual=third.get(field),
                )

        if not str(third.get("lifecycle_disposition", "")).startswith("CLOSED"):
            add_error(
                residuals,
                "st2_exp_003_lifecycle_not_closed",
                actual=third.get("lifecycle_disposition"),
            )
        product = str(third.get("experimental_product_status", ""))
        if "NOT AN ACCEPTED REAL EXPORT" not in product or "H6 C NOT AN ACCEPTED EXPORT" not in product:
            add_error(residuals, "research_acceptance_boundary_missing", actual=product)
        if "NOT A CANONICAL ACCEPTANCE JUNCTION" not in str(third.get("junction_status", "")):
            add_error(residuals, "research_junction_acceptance_boundary_missing")

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
                add_error(
                    residuals,
                    "final_exact_head_evidence_drift",
                    family=name,
                    expected=expected,
                    actual=actual,
                )

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
                add_error(residuals, "closure_record_marker_missing", marker=marker)

        junction_record = read_text(root, JUNCTION_RECORD)
        if EXPECTED_JUNCTION not in junction_record or "ST2-EXP-003" not in junction_record:
            add_error(residuals, "research_junction_record_identity_missing")

        frozen = read_text(root, FROZEN_PLAN)
        for marker in ("# PLAN — FROZEN", "ST2-EXP-003", "R-DP-001", "Q-BLOCK-002", "R-BLOCK-001"):
            if marker not in frozen:
                add_error(residuals, "frozen_plan_identity_missing", marker=marker)

        for relative in (LEDGER_MD, REGISTER, STATUS):
            text = read_text(root, relative)
            if "ST2-EXP-003" not in text or "CLOSED" not in text or "PASS" not in text:
                add_error(
                    residuals,
                    "historical_closure_marker_missing",
                    document=relative,
                )

        for relative in CURRENT_STATE_FILES:
            text = read_text(root, relative)
            if "OWNER DISPOSITION PENDING" in text:
                add_error(
                    residuals,
                    "historical_owner_disposition_stale",
                    document=relative,
                )

    except (OSError, ValueError, json.JSONDecodeError) as exc:
        add_error(residuals, "historical_closure_audit_execution_error", error=str(exc))

    later_records = sorted(set(records) - HISTORICAL_EXPERIMENTS)
    result = {
        "schema": "BOMA-STAGE-TWO-HISTORICAL-CLOSURE-AUDIT-001",
        "status": (
            "ST2_EXP_001_003_HISTORICAL_CLOSURE_PASS"
            if not residuals
            else "ST2_EXP_001_003_HISTORICAL_CLOSURE_FAIL"
        ),
        "historically_closed_experiments": sorted(HISTORICAL_EXPERIMENTS),
        "later_experiment_records": later_records,
        "current_active_experiment": ledger.get("active_experiment"),
        "current_next_experiment_slot": ledger.get("next_experiment_slot"),
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
