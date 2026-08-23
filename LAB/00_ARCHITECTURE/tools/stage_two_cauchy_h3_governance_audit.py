#!/usr/bin/env python3
"""Audit ST2-EXP-003 H3 completeness evidence without weakening base governance."""
from __future__ import annotations

import argparse
import json
import re
from pathlib import Path
from typing import Any

LEDGER = "LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json"
LESSONS = "LAB/PDSA/STAGE_TWO_WORK_ERRORS_AND_PREVENTION_001.md"
EXPECTED_RUN = 32641010707
EXPECTED_SOURCE = "26565faa7b609f285615d86bc3a6bc0260a40041"
EXPECTED_EVIDENCE = (
    "LAB/20_FORMALIZATION/R_STAGE/"
    "ST2_EXP_003_CAUCHY_COMPLETION_VERIFIED_EVIDENCE_RUN_32641010707.json"
)
EXPECTED_TARGET = "BOMA.R.StageTwo.CauchyCompletion003.cauchyCompletionCertificate"
EXPECTED_DECLARATIONS = 574
EXPECTED_FAILURES = {
    32630769132, 32631916749, 32631997598, 32632080736,
    32632711528, 32633098730, 32633963578, 32637335056,
    32637512588, 32638074040, 32640562655, 32640838804,
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

    try:
        ledger = json.loads(read_text(root, LEDGER))
        records = {
            item.get("experiment_id"): item
            for item in ledger.get("records", [])
            if isinstance(item, dict)
        }
        record = records.get("ST2-EXP-003")
        if not isinstance(record, dict):
            raise ValueError("missing ST2-EXP-003 ledger record")

        if record.get("verified_run") is not None:
            add_error(residuals, "active_experiment_top_level_verification_must_remain_null")
        if record.get("verified_cauchy_completion_run") != EXPECTED_RUN:
            add_error(
                residuals,
                "cauchy_completion_run_drift",
                actual=record.get("verified_cauchy_completion_run"),
            )
        if record.get("verified_cauchy_completion_source_commit") != EXPECTED_SOURCE:
            add_error(
                residuals,
                "cauchy_completion_source_drift",
                actual=record.get("verified_cauchy_completion_source_commit"),
            )
        if record.get("cauchy_completion_evidence") != EXPECTED_EVIDENCE:
            add_error(
                residuals,
                "cauchy_completion_evidence_path_drift",
                actual=record.get("cauchy_completion_evidence"),
            )
        status = str(record.get("status", ""))
        product = str(record.get("experimental_product_status", ""))
        if not (
            "SEQUENTIALLY COMPLETE" in status
            or "DEDEKIND-LUB CONTRACT PASS" in status
        ):
            add_error(residuals, "h3_or_stronger_status_boundary_missing", actual=status)
        if "NOT AN ACCEPTED REAL EXPORT" not in product:
            add_error(residuals, "h3_acceptance_boundary_missing", actual=product)
        if record.get("reconvergence_junction_id"):
            add_error(residuals, "premature_h3_reconvergence_junction")

        failures = set(record.get("preserved_failure_runs", []))
        if not EXPECTED_FAILURES.issubset(failures):
            add_error(
                residuals,
                "h3_failure_lineage_lost",
                expected_subset=sorted(EXPECTED_FAILURES),
                actual=sorted(failures),
            )
        lessons = read_text(root, LESSONS)
        for number in range(1, 33):
            error_id = f"ERR-ST2-{number:03d}"
            if error_id not in lessons:
                add_error(residuals, "h3_error_class_missing", error=error_id)
        study = read_text(root, str(record.get("study", "")))
        for run in EXPECTED_FAILURES:
            if str(run) not in lessons or str(run) not in study:
                add_error(residuals, "h3_failed_run_not_retained", run=run)

        evidence = json.loads(read_text(root, EXPECTED_EVIDENCE))
        expected_scalars = {
            "status": "CAUCHY_COMPLETE_PASS",
            "verified_run": EXPECTED_RUN,
            "verified_source_commit": EXPECTED_SOURCE,
            "target": EXPECTED_TARGET,
            "actual_declaration_count": EXPECTED_DECLARATIONS,
        }
        for field, expected in expected_scalars.items():
            if evidence.get(field) != expected:
                add_error(
                    residuals,
                    "h3_evidence_scalar_drift",
                    field=field,
                    expected=expected,
                    actual=evidence.get(field),
                )
        if evidence.get("selected_dedekind_declarations") != []:
            add_error(residuals, "h3_selected_dedekind_dependency")
        if evidence.get("kernel_axioms") != ["propext", "Classical.choice", "Quot.sound"]:
            add_error(residuals, "h3_kernel_axiom_report_drift", actual=evidence.get("kernel_axioms"))
        for field in (
            "ordered_field_completed",
            "rational_density_completed",
            "vanishing_rational_scale_completed",
            "cauchy_completeness_proved",
        ):
            if evidence.get(field) is not True:
                add_error(residuals, "h3_positive_scope_missing", field=field)
        for field in (
            "dedekind_lub_bridge_proved",
            "dedekind_comparison_proved",
            "downstream_complex_rebuilt",
            "accepted_real_replacement",
            "alternative_accepted",
            "experiment_closed",
        ):
            if evidence.get(field) is not False:
                add_error(residuals, "h3_scope_inflated", field=field)
        choice = evidence.get("choice_provenance", {})
        for selector in (
            "reciprocal_sequence_selector",
            "vanishing_rational_scale_selector",
            "countable_rational_approximation_selector",
        ):
            item = choice.get(selector, {}) if isinstance(choice, dict) else {}
            if item.get("uses_classical_choice") is not True:
                add_error(residuals, "h3_choice_boundary_missing", selector=selector)
        artifact = evidence.get("artifact", {})
        if artifact.get("id") != 9493600201 or artifact.get("sha256") != (
            "06057754d0042e5c5e166758fedb1ac6b881924c2b7736abd7134c55d9588741"
        ):
            add_error(residuals, "h3_artifact_identity_drift", actual=artifact)
        if evidence.get("residuals") != []:
            add_error(residuals, "h3_machine_evidence_has_residuals")

        frozen = str(record.get("frozen_plan_commit", ""))
        if not re.fullmatch(r"[0-9a-f]{40}", frozen):
            add_error(residuals, "h3_frozen_plan_identity_invalid", actual=frozen)
    except (OSError, ValueError, json.JSONDecodeError) as exc:
        add_error(residuals, "h3_governance_execution_error", error=str(exc))

    result = {
        "schema": "BOMA-ST2-EXP-003-H3-GOVERNANCE-AUDIT-001",
        "status": "H3_GOVERNANCE_PASS" if not residuals else "H3_GOVERNANCE_FAIL",
        "verified_run": EXPECTED_RUN,
        "verified_source_commit": EXPECTED_SOURCE,
        "retained_error_classes": 32,
        "retained_experiment_failure_runs": len(EXPECTED_FAILURES),
        "cauchy_completeness_proved": not residuals,
        "dedekind_lub_bridge_proved": False,
        "dedekind_comparison_proved": False,
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
