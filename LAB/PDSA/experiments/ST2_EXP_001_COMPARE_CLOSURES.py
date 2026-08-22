#!/usr/bin/env python3
"""Compare frozen accepted-C and ST2-EXP-001 declaration closures honestly."""
from __future__ import annotations

import argparse
import json
from pathlib import Path

SENSITIVE = {
    "whole_accepted_r_certificate":
        "BOMA.R.StageIntegration002.rStageIntegrationCertificate",
    "dedekind_completeness":
        "BOMA.R.DedekindCompleteness001.rDedekind_lub_exists",
    "rational_density":
        "BOMA.R.DedekindRationalDensity001.r_rational_image_dense",
    "archimedean_upper":
        "BOMA.R.DedekindArchimedean001.r_archimedean_strict_upper",
}
EXPECTED_FIELDS = {
    "addAssoc", "addComm", "addInverseRight", "addTranslateOrderIff",
    "addZeroLeft", "distribRight", "inverseExists", "mulAssoc",
    "mulComm", "mulOneLeft", "negOrderReversing", "nontrivial",
    "orderAntisymm", "orderMulNonneg", "orderTotal", "orderTrans",
}


def load(path: Path) -> dict:
    value = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(value, dict):
        raise ValueError(f"JSON root is not an object: {path}")
    return value


def internal_names(report: dict) -> set[str]:
    return {
        item["name"]
        for item in report.get("internal", [])
        if isinstance(item, dict) and isinstance(item.get("name"), str)
    }


def claim_map(report: dict) -> dict[str, dict]:
    return {
        item["claim"]: item
        for item in report.get("claims", [])
        if isinstance(item, dict) and isinstance(item.get("claim"), str)
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--baseline-closure", required=True, type=Path)
    parser.add_argument("--branch-closure", required=True, type=Path)
    parser.add_argument("--baseline-producers", required=True, type=Path)
    parser.add_argument("--branch-producers", required=True, type=Path)
    parser.add_argument("--interface-source", required=True, type=Path)
    parser.add_argument("--json-out", required=True, type=Path)
    args = parser.parse_args()

    baseline = load(args.baseline_closure)
    branch = load(args.branch_closure)
    base_producers = load(args.baseline_producers)
    narrow_producers = load(args.branch_producers)
    base_names = internal_names(baseline)
    narrow_names = internal_names(branch)

    text = args.interface_source.read_text(encoding="utf-8")
    start_marker = "structure NarrowROrderedFieldCertificate where"
    end_marker = "/-- Direct producer assembly"
    if text.count(start_marker) != 1 or text.count(end_marker) != 1:
        raise ValueError("narrow-interface certificate boundaries drifted")
    block = text.split(start_marker, 1)[1].split(end_marker, 1)[0]
    fields = {
        line.strip().split(":", 1)[0].strip()
        for line in block.splitlines()
        if line.startswith("  ") and not line.startswith("    ") and ":" in line
    }

    base_claims = claim_map(base_producers)
    narrow_claims = claim_map(narrow_producers)
    observations = {
        key: {
            "declaration": declaration,
            "baseline_present": declaration in base_names,
            "branch_present": declaration in narrow_names,
            "removed": declaration in base_names and declaration not in narrow_names,
        }
        for key, declaration in SENSITIVE.items()
    }
    removed = [key for key, value in observations.items() if value["removed"]]
    surviving = [
        key for key, value in observations.items()
        if key != "whole_accepted_r_certificate" and value["branch_present"]
    ]

    failures = []
    if baseline.get("status") != "PROTOTYPE_PASS":
        failures.append("baseline closure extraction did not pass")
    if branch.get("status") != "PROTOTYPE_PASS":
        failures.append("experimental closure extraction did not pass")
    if base_producers.get("status") != "CLAIM_PRODUCER_PASS":
        failures.append("baseline nine-claim producer comparison did not pass")
    if narrow_producers.get("status") != "CLAIM_PRODUCER_PASS":
        failures.append("experimental nine-claim producer comparison did not pass")
    if fields != EXPECTED_FIELDS:
        failures.append("narrow certificate does not contain exactly the sixteen frozen fields")
    if len(base_claims) != 9 or base_claims.keys() != narrow_claims.keys():
        failures.append("baseline and experimental claim surfaces are not the same nine IDs")
    if not observations["whole_accepted_r_certificate"]["baseline_present"]:
        failures.append("frozen baseline does not contain its documented whole-R bundle")
    if observations["whole_accepted_r_certificate"]["branch_present"]:
        failures.append("experimental root still depends on the whole accepted-R certificate")

    result = {
        "schema": "BOMA-ST2-EXP-001-CLOSURE-COMPARISON-001",
        "status": "COMPARISON_PASS" if not failures else "COMPARISON_FAIL",
        "hypotheses": {
            "H1_exact_sixteen_fields":
                "CONFIRMED" if fields == EXPECTED_FIELDS else "REFUTED",
            "H2_same_nine_claims":
                "CONFIRMED" if len(base_claims) == 9 and
                base_claims.keys() == narrow_claims.keys() and
                narrow_producers.get("status") == "CLAIM_PRODUCER_PASS"
                else "REFUTED",
            "H3_unused_bundle_eliminated":
                "CONFIRMED" if not surviving and not
                observations["whole_accepted_r_certificate"]["branch_present"]
                else "PARTIAL",
            "H4_logical_provenance":
                "REQUIRES_SEPARATE_AXIOM_AND_CLASSIFICATION_REVIEW",
        },
        "fields": sorted(fields),
        "claim_ids": sorted(narrow_claims),
        "counts": {
            "baseline_internal": len(base_names),
            "branch_internal": len(narrow_names),
            "baseline_edges": len(baseline.get("edges", [])),
            "branch_edges": len(branch.get("edges", [])),
            "removed_declarations": len(base_names - narrow_names),
            "new_branch_declarations": len(narrow_names - base_names),
        },
        "sensitive_producers": observations,
        "removed_sensitive_producers": removed,
        "surviving_sensitive_producers": surviving,
        "limitations": [
            "A removed whole-certificate edge does not remove genuine upstream "
            "logical commitments of accepted order and inverse producers.",
            "A surviving named producer is reported as actual dependency, "
            "not hidden or classified away.",
            "Identical Claim IDs establish audited contract coverage, not "
            "definitional equality of all branch proof terms.",
        ],
        "failures": failures,
    }
    args.json_out.parent.mkdir(parents=True, exist_ok=True)
    args.json_out.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n",
                             encoding="utf-8")
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0 if not failures else 1


if __name__ == "__main__":
    raise SystemExit(main())
