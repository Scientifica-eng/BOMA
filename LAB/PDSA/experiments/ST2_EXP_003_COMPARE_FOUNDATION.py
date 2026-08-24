#!/usr/bin/env python3
"""Audit the independently assembled Cauchy route through the exact H4 LUB contract."""
from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any


FORBIDDEN_SELECTED_REAL_PREFIXES = (
    "BOMA.R.Dedekind",
    "BOMA.R.StageIntegration002",
    "BOMA.C.",
    "Real.",
)
REQUIRED_TARGETS = {
    "BOMA.R.StageTwo.CauchyQuotient003.cauchyEquiv_refl",
    "BOMA.R.StageTwo.CauchyQuotient003.cauchyEquiv_symm",
    "BOMA.R.StageTwo.CauchyQuotient003.cauchyEquiv_trans",
    "BOMA.R.StageTwo.CauchyQuotient003.cauchySetoid",
    "BOMA.R.StageTwo.CauchyQuotient003.rCOfQ_injective",
    "BOMA.R.StageTwo.CauchyAdditive003.rCAdd_comm",
    "BOMA.R.StageTwo.CauchyAdditive003.rCAdd_assoc",
    "BOMA.R.StageTwo.CauchyAdditive003.rCAdd_zero_left",
    "BOMA.R.StageTwo.CauchyAdditive003.rCAdd_neg_right",
    "BOMA.R.StageTwo.CauchyAdditive003.rCOfQ_add",
    "BOMA.R.StageTwo.CauchyAdditive003.rCOfQ_neg",
    "BOMA.R.StageTwo.CauchyAdditive003.cauchyAdditiveCertificate",
    "BOMA.R.StageTwo.CauchyBounded003.cauchy_eventually_bounded",
    "BOMA.R.StageTwo.CauchyBounded003.cauchyBoundedCertificate",
    "BOMA.R.StageTwo.CauchyProductBounds003.qAbsBound_mul",
    "BOMA.R.StageTwo.CauchyProductBounds003.q_product_difference",
    "BOMA.R.StageTwo.CauchyProductBounds003.qClose_mul_of_common_bound",
    "BOMA.R.StageTwo.CauchyProductBounds003.cauchyProductBoundCertificate",
    "BOMA.R.StageTwo.CauchyMultiplicative003.seqMul_cauchy",
    "BOMA.R.StageTwo.CauchyMultiplicative003.cMulSeq_respects",
    "BOMA.R.StageTwo.CauchyMultiplicative003.rCMul_comm",
    "BOMA.R.StageTwo.CauchyMultiplicative003.rCMul_assoc",
    "BOMA.R.StageTwo.CauchyMultiplicative003.rCMul_one_left",
    "BOMA.R.StageTwo.CauchyMultiplicative003.rCMul_zero_left",
    "BOMA.R.StageTwo.CauchyMultiplicative003.rCMul_add_right",
    "BOMA.R.StageTwo.CauchyMultiplicative003.rCOfQ_mul",
    "BOMA.R.StageTwo.CauchyMultiplicative003.cauchyCommutativeRingCertificate",
    "BOMA.R.StageTwo.CauchyOrderCore003.cauchyLE_refl",
    "BOMA.R.StageTwo.CauchyOrderCore003.cauchyLE_trans",
    "BOMA.R.StageTwo.CauchyOrderCore003.cauchyLE_respects",
    "BOMA.R.StageTwo.CauchyOrderCore003.cauchyLE_antisymm",
    "BOMA.R.StageTwo.CauchyOrderCore003.rcle_refl",
    "BOMA.R.StageTwo.CauchyOrderCore003.rcle_trans",
    "BOMA.R.StageTwo.CauchyOrderCore003.rcle_antisymm",
    "BOMA.R.StageTwo.CauchyOrderCore003.rCOfQ_order",
    "BOMA.R.StageTwo.CauchyOrderCore003.cauchyPartialOrderCertificate",
    "BOMA.R.StageTwo.CauchyOrderTotal003.not_cauchyLE_witness",
    "BOMA.R.StageTwo.CauchyOrderTotal003.cauchyLE_total",
    "BOMA.R.StageTwo.CauchyOrderTotal003.rcle_total",
    "BOMA.R.StageTwo.CauchyOrderTotal003.cauchyTotalOrderCertificate",
    "BOMA.R.StageTwo.CauchyOrderedRing003.cauchyLE_add_right",
    "BOMA.R.StageTwo.CauchyOrderedRing003.rcle_add_right",
    "BOMA.R.StageTwo.CauchyOrderedRing003.qMul_approx_nonneg_lower",
    "BOMA.R.StageTwo.CauchyOrderedRing003.cauchyLE_mul_nonneg",
    "BOMA.R.StageTwo.CauchyOrderedRing003.rcle_mul_nonneg",
    "BOMA.R.StageTwo.CauchyOrderedRing003.cauchyOrderedRingCertificate",
    "BOMA.R.StageTwo.CauchyNonzeroGap003.eventually_positive_gap_of_nonzero",
    "BOMA.R.StageTwo.CauchyNonzeroGap003.eventually_negative_gap_of_nonzero",
    "BOMA.R.StageTwo.CauchyNonzeroGap003.nonzero_eventually_sign_separated",
    "BOMA.R.StageTwo.CauchyNonzeroGap003.cauchyNonzeroGapCertificate",
    "BOMA.R.StageTwo.CauchyInverse003.q_reciprocal_difference",
    "BOMA.R.StageTwo.CauchyInverse003.qClose_reciprocals_of_positive_lower",
    "BOMA.R.StageTwo.CauchyInverse003.positive_gap_inverse_sequence_exists",
    "BOMA.R.StageTwo.CauchyInverse003.representative_inverse_exists",
    "BOMA.R.StageTwo.CauchyInverse003.rC_inverse_exists",
    "BOMA.R.StageTwo.CauchyInverse003.rC_inverse_exists_unique",
    "BOMA.R.StageTwo.CauchyInverse003.cauchyOrderedFieldCertificate",
    "BOMA.R.StageTwo.CauchyScale003.qCauchyScale_tends_zero",
    "BOMA.R.StageTwo.CauchyScale003.cauchyScaleCertificate",
    "BOMA.R.StageTwo.CauchyCompletionCore003.rCClose_trans_add",
    "BOMA.R.StageTwo.CauchyCompletionCore003.rCClose_mono",
    "BOMA.R.StageTwo.CauchyCompletionCore003.cauchyCompletionCoreCertificate",
    "BOMA.R.StageTwo.CauchyDensity003.rCClose_ofQ_iff",
    "BOMA.R.StageTwo.CauchyDensity003.rational_approximation_exists",
    "BOMA.R.StageTwo.CauchyDensity003.cauchyDensityCertificate",
    "BOMA.R.StageTwo.CauchyApproximation003.qApproxAtScale_close",
    "BOMA.R.StageTwo.CauchyApproximation003.qApproxSeq_cauchy",
    "BOMA.R.StageTwo.CauchyApproximation003.cauchyApproximationCertificate",
    "BOMA.R.StageTwo.CauchyCompletion003.embedded_terms_converge_to_class",
    "BOMA.R.StageTwo.CauchyCompletion003.selected_approximation_converges",
    "BOMA.R.StageTwo.CauchyCompletion003.rCCauchyComplete",
    "BOMA.R.StageTwo.CauchyCompletion003.cauchyCompletionCertificate",
    "BOMA.R.StageTwo.CauchyLUBBracket003.rational_lub_bracket_exists",
    "BOMA.R.StageTwo.CauchyLUBBracket003.cauchyLUBBracketCertificate",
    "BOMA.R.StageTwo.CauchyLUBSequence003.h4Lower_cauchy",
    "BOMA.R.StageTwo.CauchyLUBSequence003.cauchyLUBSequenceCertificate",
    "BOMA.R.StageTwo.CauchyLUB003.h4Upper_cauchy",
    "BOMA.R.StageTwo.CauchyLUB003.h4LowerUpper_equiv",
    "BOMA.R.StageTwo.CauchyLUB003.rcle_pointwise_to_class",
    "BOMA.R.StageTwo.CauchyLUB003.rcle_class_to_pointwise",
    "BOMA.R.StageTwo.CauchyLUB003.rCauchy_lub_exists",
    "BOMA.R.StageTwo.CauchyLUB003.cauchyLUBCertificate",
}
HISTORICALLY_CLOSED = {"ST2-EXP-001", "ST2-EXP-002", "ST2-EXP-003"}


def governance_mode(governance: dict[str, Any]) -> str | None:
    """Accept active-003, exact closed-frontier, or preserved historical closure governance."""
    status = governance.get("status")
    if status == "GOVERNANCE_PASS":
        if governance.get("counts", {}).get("active_experiments") == 1:
            return "ACTIVE_FRONTIER"
        return None
    if status == "STAGE_TWO_CLOSED_FRONTIER_PASS":
        if governance.get("active_experiment") is None:
            return "CLOSED_FRONTIER"
        return None
    if status == "ST2_EXP_001_003_HISTORICAL_CLOSURE_PASS":
        closed = set(governance.get("historically_closed_experiments", []))
        active = governance.get("current_active_experiment")
        if closed == HISTORICALLY_CLOSED and active not in HISTORICALLY_CLOSED:
            return "HISTORICAL_CLOSURE"
        return None
    return None


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--independent-closure", type=Path, required=True)
    parser.add_argument("--governance", type=Path, required=True)
    parser.add_argument("--json-out", type=Path, required=True)
    args = parser.parse_args()

    closure: dict[str, Any] = json.loads(args.independent_closure.read_text(encoding="utf-8"))
    governance: dict[str, Any] = json.loads(args.governance.read_text(encoding="utf-8"))
    mode = governance_mode(governance)
    internal = {
        item["name"]
        for item in closure.get("internal", [])
        if isinstance(item, dict) and isinstance(item.get("name"), str)
    }
    forbidden = sorted(name for name in internal if name.startswith(FORBIDDEN_SELECTED_REAL_PREFIXES))
    missing = sorted(REQUIRED_TARGETS - internal)
    residuals = []
    if closure.get("status") != "PROTOTYPE_PASS":
        residuals.append({"type": "independent_dependency_extraction_failed", "status": closure.get("status")})
    if mode is None:
        residuals.append({
            "type": "typed_origin_governance_failed",
            "status": governance.get("status"),
            "active_experiment": governance.get("active_experiment", governance.get("current_active_experiment")),
            "active_count": governance.get("counts", {}).get("active_experiments"),
        })
    if forbidden:
        residuals.append({"type": "selected_dedekind_or_downstream_c_in_independent_closure", "declarations": forbidden})
    if missing:
        residuals.append({"type": "proved_independent_target_missing", "declarations": missing})

    passed = not residuals
    result = {
        "schema": "BOMA-ST2-EXP-003-INDEPENDENT-CAUCHY-CURRENT-001",
        "status": "DEDEKIND_LUB_PASS" if passed else "INDEPENDENT_ROUTE_FAIL",
        "governance_mode": mode,
        "origin": "DECISION_POINT / R-DP-001",
        "common_upstream": "Q-BLOCK-002",
        "changed_factor": "Dedekind completion syntax/identity -> rational Cauchy quotient identity",
        "verified_milestone": "independent Cauchy totally ordered field with sequential completeness and the exact bounded-nonempty-family least-upper-bound contract",
        "required_targets": sorted(REQUIRED_TARGETS),
        "actual_declaration_count": len(internal),
        "selected_dedekind_declarations": forbidden,
        "accepted_real_replacement": False,
        "additive_group_completed": passed,
        "eventual_boundedness_completed": passed,
        "bounded_product_estimate_completed": passed,
        "multiplicative_monoid_completed": passed,
        "commutative_ring_completed": passed,
        "partial_order_completed": passed,
        "total_order_completed": passed,
        "ordered_ring_compatibility_completed": passed,
        "eventual_nonzero_sign_separation_completed": passed,
        "ordered_field_completed": passed,
        "rational_density_completed": passed,
        "vanishing_rational_scale_completed": passed,
        "reciprocal_sequence_selection_uses_classical_choice": True,
        "vanishing_scale_selection_uses_classical_choice": True,
        "countable_rational_approximation_selection_uses_classical_choice": True,
        "finite_lub_bracket_search_uses_classical_em": True,
        "countable_lub_bracket_selection_uses_classical_choice": True,
        "cauchy_completeness_proved": passed,
        "dedekind_lub_bridge_proved": passed,
        "dedekind_comparison_proved": False,
        "downstream_complex_rebuilt": False,
        "alternative_accepted": False,
        "experiment_closed": mode in {"CLOSED_FRONTIER", "HISTORICAL_CLOSURE"} and passed,
        "residuals": residuals,
    }
    args.json_out.parent.mkdir(parents=True, exist_ok=True)
    args.json_out.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result, indent=2))
    return 0 if passed else 1


if __name__ == "__main__":
    raise SystemExit(main())
