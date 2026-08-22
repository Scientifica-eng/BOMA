#!/usr/bin/env python3
"""Machine-check the independent Q closure and its post-completion P/Q junction."""
from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any

Q_ROOT = "BOMA.C.StageTwo.QQuotientField002.qFieldCertificateFromAcceptedR"
PQ_ROOT = "BOMA.C.StageTwo.PQJunction002.qPairJunctionCertificate"
FORBIDDEN_IN_Q = (
    "BOMA.C.RoutePairProbe001",
    "BOMA.C.PairCore001",
    "BOMA.C.PairNormInverse001",
    "BOMA.C.QuadraticComparison001",
    "BOMA.C.StageIntegration001",
    "BOMA.C.StageTwo.Narrow",
)
REQUIRED_Q = (
    "BOMA.C.RouteQuadraticQuotientProbe001.QuotientCandidate",
    "BOMA.C.StageTwo.QQuotientField002.qNormal",
    "BOMA.C.StageTwo.QQuotientField002.q_inverse_exists",
    "BOMA.C.StageTwo.QQuotientField002.q_extract_sound",
    Q_ROOT,
)
REQUIRED_JUNCTION = (
    "BOMA.C.QuadraticComparison001.selectedPresentation",
    "BOMA.C.StageTwo.PQJunction002.quotientPresentation",
    "BOMA.C.StageTwo.PQJunction002.pqIsomorphism",
    "BOMA.C.StageTwo.PQJunction002.pairToQuotient_formula",
    "BOMA.C.StageTwo.PQJunction002.quotientToPair_formula",
    Q_ROOT,
    PQ_ROOT,
)


def read_object(path: Path) -> dict[str, Any]:
    value = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(value, dict):
        raise ValueError(f"expected JSON object: {path}")
    return value


def internal_names(closure: dict[str, Any]) -> set[str]:
    return {
        record["name"]
        for record in closure.get("internal", [])
        if isinstance(record, dict) and isinstance(record.get("name"), str)
    }


def external_names(closure: dict[str, Any]) -> set[str]:
    return {
        record["name"]
        for record in closure.get("external_boundary", [])
        if isinstance(record, dict) and isinstance(record.get("name"), str)
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--independent-closure", required=True, type=Path)
    parser.add_argument("--independent-classification", required=True, type=Path)
    parser.add_argument("--junction-closure", required=True, type=Path)
    parser.add_argument("--junction-classification", required=True, type=Path)
    parser.add_argument("--junction-producers", required=True, type=Path)
    parser.add_argument("--json-out", type=Path)
    args = parser.parse_args()

    independent = read_object(args.independent_closure)
    independent_classification = read_object(args.independent_classification)
    junction = read_object(args.junction_closure)
    junction_classification = read_object(args.junction_classification)
    producers = read_object(args.junction_producers)
    q_names = internal_names(independent)
    pq_names = internal_names(junction)

    forbidden_q = sorted(
        name for name in q_names if name.startswith(FORBIDDEN_IN_Q)
    )
    missing_q = sorted(set(REQUIRED_Q) - q_names)
    missing_pq = sorted(set(REQUIRED_JUNCTION) - pq_names)
    selected_p_declarations = sorted(
        name for name in pq_names
        if name.startswith(("BOMA.C.PairCore001.", "BOMA.C.PairNormInverse001."))
    )
    narrow_contamination = sorted(
        name for name in q_names | pq_names
        if "StageTwo.Narrow" in name or "ST2Exp001" in name
    )
    residuals: list[dict[str, Any]] = []

    expected = [
        (independent.get("status"), "PROTOTYPE_PASS", "independent_closure"),
        (junction.get("status"), "PROTOTYPE_PASS", "junction_closure"),
        (independent_classification.get("status"), "CLASSIFICATION_PASS", "independent_classification"),
        (junction_classification.get("status"), "CLASSIFICATION_PASS", "junction_classification"),
        (producers.get("status"), "CLAIM_PRODUCER_PASS", "junction_producers"),
    ]
    for actual, wanted, label in expected:
        if actual != wanted:
            residuals.append({"type": label + "_not_pass", "actual": actual})
    if independent.get("targets") != [Q_ROOT]:
        residuals.append({"type": "independent_target_drift", "actual": independent.get("targets")})
    if junction.get("targets") != [PQ_ROOT]:
        residuals.append({"type": "junction_target_drift", "actual": junction.get("targets")})
    if forbidden_q:
        residuals.append({"type": "q_route_pair_contamination", "declarations": forbidden_q})
    if missing_q:
        residuals.append({"type": "independent_q_producer_missing", "declarations": missing_q})
    if missing_pq:
        residuals.append({"type": "junction_producer_missing", "declarations": missing_pq})
    if not selected_p_declarations:
        residuals.append({"type": "junction_missing_selected_p_producers"})
    if narrow_contamination:
        residuals.append({"type": "previous_experiment_interface_contamination", "declarations": narrow_contamination})

    registry_claims = sorted(producers.get("registry_claims", []))
    policy_claims = sorted(producers.get("policy_claims", []))
    if len(registry_claims) != 9 or registry_claims != policy_claims:
        residuals.append({
            "type": "nine_claim_family_drift",
            "registry": registry_claims,
            "policy": policy_claims,
        })

    q_external = external_names(independent)
    pq_external = external_names(junction)
    q_quotient_boundary = sorted(
        name for name in q_external if name == "Quotient" or name.startswith("Quotient.")
    )
    result = {
        "schema": "BOMA-ST2-EXP-002-COMPARISON-001",
        "status": "COMPARISON_PASS" if not residuals else "COMPARISON_FAIL",
        "single_changed_decision": "C-DP-001 representation: C-ROUTE-P vs C-ROUTE-Q",
        "fixed_real_interface": "BOMA.R.StageIntegration002.RStageIntegrationCertificate",
        "accepted_route": "C-ROUTE-P / pair-record carrier / CA-20 unchanged",
        "experimental_route": "C-ROUTE-Q / formal-expression normalization quotient",
        "independent_target": Q_ROOT,
        "junction_target": PQ_ROOT,
        "counts": {
            "independent_q_internal": len(q_names),
            "independent_q_external": len(q_external),
            "junction_internal": len(pq_names),
            "junction_external": len(pq_external),
            "selected_p_in_junction": len(selected_p_declarations),
            "forbidden_p_in_independent_q": len(forbidden_q),
            "narrow_interface_contamination": len(narrow_contamination),
            "claim_families": len(registry_claims),
            "q_quotient_external_boundary": len(q_quotient_boundary),
        },
        "claim_ids": registry_claims,
        "q_quotient_external_boundary": q_quotient_boundary,
        "selected_p_representative_declarations": selected_p_declarations[:12],
        "hypotheses": {
            "H1": not forbidden_q and not missing_q,
            "H2": not missing_q,
            "H3": not missing_pq and bool(selected_p_declarations),
            "H4": not missing_pq,
            "H5": len(registry_claims) == 9 and registry_claims == policy_claims,
        },
        "limitations": [
            "Route Q is a formal-expression quotient, not a separately implemented full polynomial ring R[X].",
            "Quotient infrastructure is branch-specifically classified; the accepted formal-dependency policy is unchanged.",
            "Route P remains the accepted CA-20 carrier; Route Q is a research alternative.",
        ],
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
