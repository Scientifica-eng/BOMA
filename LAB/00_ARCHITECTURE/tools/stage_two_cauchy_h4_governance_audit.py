#!/usr/bin/env python3
"""Audit ST2-EXP-003 H4 LUB evidence and gate H5 comparison readiness."""
from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any

LEDGER = "LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json"
H4_LESSONS = "LAB/PDSA/STAGE_TWO_WORK_ERRORS_AND_PREVENTION_H4_001.md"
H4_STUDY = "LAB/PDSA/experiments/ST2-EXP-003_LUB_MILESTONE_001.md"
EVIDENCE = "LAB/20_FORMALIZATION/R_STAGE/ST2_EXP_003_LUB_VERIFIED_EVIDENCE_RUN_32643579395.json"
MANIFEST = "LAB/20_FORMALIZATION/R_STAGE/ST2_EXP_003_CAUCHY_INDEPENDENT_INPUTS.txt"
COMPARATOR = "LAB/PDSA/experiments/ST2_EXP_003_COMPARE_FOUNDATION.py"
WORKFLOW = ".github/workflows/boma-st2-exp-003-cauchy-real-route.yml"
EXPECTED_RUN = 32643579395
EXPECTED_SOURCE = "0f4a706d94c394b8e8a9eec836859caac772a944"
EXPECTED_SOURCE_COMPLETION = "cb31e12e2b4fb7a07488a09c2a9394d4ab61946c"
EXPECTED_ROOT = "BOMA.R.StageTwo.CauchyLUB003.cauchyLUBCertificate"
EXPECTED_DECLARATIONS = 625
EXPECTED_ARTIFACT_ID = 9494260356
EXPECTED_ARTIFACT_SHA256 = "487e43f17949555fd0a518052538b993ec7552f09a5b00da4aa0f1b7e1d90437"
EXPECTED_H4_FAILURES = {32641626366, 32643073959, 32643253314}
EXPECTED_H4_SOURCES = {
    "LAB/payloads/lean/RStage/ST2Exp003CauchyLUBBracket.lean",
    "LAB/payloads/lean/RStage/ST2Exp003CauchyLUBSequence.lean",
    "LAB/payloads/lean/RStage/ST2Exp003CauchyLUB.lean",
}
EXPECTED_TARGETS = {
    "BOMA.R.StageTwo.CauchyLUBBracket003.rational_lub_bracket_exists",
    "BOMA.R.StageTwo.CauchyLUBBracket003.cauchyLUBBracketCertificate",
    "BOMA.R.StageTwo.CauchyLUBSequence003.h4Lower_cauchy",
    "BOMA.R.StageTwo.CauchyLUBSequence003.cauchyLUBSequenceCertificate",
    "BOMA.R.StageTwo.CauchyLUB003.h4Upper_cauchy",
    "BOMA.R.StageTwo.CauchyLUB003.h4LowerUpper_equiv",
    "BOMA.R.StageTwo.CauchyLUB003.rcle_pointwise_to_class",
    "BOMA.R.StageTwo.CauchyLUB003.rcle_class_to_pointwise",
    "BOMA.R.StageTwo.CauchyLUB003.rCauchy_lub_exists",
    EXPECTED_ROOT,
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
        record = next(
            (item for item in ledger.get("records", [])
             if isinstance(item, dict) and item.get("experiment_id") == "ST2-EXP-003"),
            None,
        )
        if not isinstance(record, dict):
            raise ValueError("missing ST2-EXP-003 ledger record")
        if record.get("verified_run") is not None:
            add_error(residuals, "active_experiment_top_level_verification_must_remain_null")
        for field, expected in {
            "verified_lub_run": EXPECTED_RUN,
            "verified_lub_source_commit": EXPECTED_SOURCE,
            "lub_source_completion_commit": EXPECTED_SOURCE_COMPLETION,
            "lub_evidence": EVIDENCE,
            "lub_milestone": H4_STUDY,
            "h4_study": H4_STUDY,
        }.items():
            if record.get(field) != expected:
                add_error(residuals, "h4_ledger_identity_drift", field=field, expected=expected, actual=record.get(field))
        status = str(record.get("status", ""))
        product = str(record.get("experimental_product_status", ""))
        strength = str(record.get("reconvergence_strength", ""))
        if "DEDEKIND-LUB CONTRACT PASS" not in status:
            add_error(residuals, "h4_status_not_promoted", actual=status)
        if "H5 COMPARISON READY" not in status:
            add_error(residuals, "h5_readiness_not_explicit", actual=status)
        if "NOT AN ACCEPTED REAL EXPORT" not in product:
            add_error(residuals, "h4_acceptance_boundary_missing", actual=product)
        if "H4 EXACT LUB CONTRACT PASS" not in strength:
            add_error(residuals, "h4_reconvergence_strength_boundary_missing", actual=strength)
        if "H5 COMPARISON READY" in status and record.get("reconvergence_junction_id"):
            add_error(residuals, "premature_h5_reconvergence_junction")

        failures = set(record.get("h4_preserved_failure_runs", []))
        if failures != EXPECTED_H4_FAILURES:
            add_error(residuals, "h4_failure_lineage_drift", expected=sorted(EXPECTED_H4_FAILURES), actual=sorted(failures))
        lessons = read_text(root, H4_LESSONS)
        study = read_text(root, H4_STUDY)
        for number, run in zip(range(33, 36), sorted(EXPECTED_H4_FAILURES)):
            error_id = f"ERR-ST2-{number:03d}"
            if error_id not in lessons:
                add_error(residuals, "h4_error_class_missing", error=error_id)
            if str(run) not in lessons or str(run) not in study:
                add_error(residuals, "h4_failed_run_not_retained", run=run)

        evidence = json.loads(read_text(root, EVIDENCE))
        for field, expected in {
            "milestone_status": "DEDEKIND_LUB_PASS / EXPERIMENT ACTIVE",
            "verified_source_commit": EXPECTED_SOURCE,
            "h4_source_completion_commit": EXPECTED_SOURCE_COMPLETION,
            "verified_run": EXPECTED_RUN,
            "dependency_root": EXPECTED_ROOT,
            "actual_internal_declarations": EXPECTED_DECLARATIONS,
        }.items():
            if evidence.get(field) != expected:
                add_error(residuals, "h4_evidence_scalar_drift", field=field, expected=expected, actual=evidence.get(field))
        if evidence.get("selected_dedekind_declarations") != []:
            add_error(residuals, "h4_selected_dedekind_dependency")
        if evidence.get("residuals") != []:
            add_error(residuals, "h4_machine_evidence_has_residuals")
        for field in (
            "ordered_field_completed", "cauchy_completeness_proved",
            "rational_lub_bracketing_proved", "shrinking_lub_bracket_sequence_proved",
            "dedekind_lub_bridge_proved",
        ):
            if evidence.get(field) is not True:
                add_error(residuals, "h4_positive_scope_missing", field=field)
        for field in (
            "dedekind_comparison_proved", "downstream_complex_rebuilt",
            "alternative_accepted", "experiment_closed",
            "accepted_dedekind_real_changed", "accepted_complex_ca20_changed",
        ):
            if evidence.get(field) is not False:
                add_error(residuals, "h4_scope_inflated", field=field)
        targets = set(evidence.get("verified_targets", []))
        if not EXPECTED_TARGETS.issubset(targets):
            add_error(residuals, "h4_verified_target_set_incomplete", missing=sorted(EXPECTED_TARGETS - targets))
        provenance = evidence.get("logical_provenance", {})
        if provenance.get("kernel_axioms") != ["propext", "Classical.choice", "Quot.sound"]:
            add_error(residuals, "h4_kernel_axiom_report_drift", actual=provenance.get("kernel_axioms"))
        if provenance.get("finite_lub_bracket_search_uses_classical_em") is not True:
            add_error(residuals, "h4_finite_search_provenance_missing")
        if provenance.get("countable_lub_bracket_selection_uses_classical_choice") is not True:
            add_error(residuals, "h4_countable_selection_provenance_missing")
        if provenance.get("sorryAx_in_successful_targets") is not False:
            add_error(residuals, "h4_successful_target_sorryax_drift")
        artifact = evidence.get("artifact", {})
        if artifact.get("id") != EXPECTED_ARTIFACT_ID or artifact.get("sha256") != EXPECTED_ARTIFACT_SHA256:
            add_error(residuals, "h4_artifact_identity_drift", actual=artifact)

        manifest_lines = {line.strip() for line in read_text(root, MANIFEST).splitlines() if line.strip()}
        if not EXPECTED_H4_SOURCES.issubset(manifest_lines):
            add_error(residuals, "h4_sources_missing_from_independent_manifest", missing=sorted(EXPECTED_H4_SOURCES - manifest_lines))
        comparator = read_text(root, COMPARATOR)
        workflow = read_text(root, WORKFLOW)
        for target in EXPECTED_TARGETS:
            if target not in comparator:
                add_error(residuals, "h4_target_not_enforced_by_comparator", target=target)
        if EXPECTED_ROOT not in workflow:
            add_error(residuals, "h4_dependency_root_not_enforced_by_workflow")
        for marker in (
            "Classical.em (RCUpperBound F",
            "exact Classical.choose",
            "Selected Dedekind declarations in actual H4 closure: zero required.",
        ):
            if marker not in workflow:
                add_error(residuals, "h4_workflow_provenance_guard_missing", marker=marker)
    except (OSError, ValueError, json.JSONDecodeError) as exc:
        add_error(residuals, "h4_governance_execution_error", error=str(exc))

    result = {
        "schema": "BOMA-ST2-EXP-003-H4-GOVERNANCE-AUDIT-001",
        "status": "H4_GOVERNANCE_PASS" if not residuals else "H4_GOVERNANCE_FAIL",
        "verified_run": EXPECTED_RUN,
        "verified_source_commit": EXPECTED_SOURCE,
        "actual_declaration_count": EXPECTED_DECLARATIONS,
        "retained_error_classes_through": 35,
        "retained_h4_failure_runs": len(EXPECTED_H4_FAILURES),
        "dedekind_lub_bridge_proved": not residuals,
        "dedekind_comparison_proved": False,
        "h5_comparison_allowed": not residuals,
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
