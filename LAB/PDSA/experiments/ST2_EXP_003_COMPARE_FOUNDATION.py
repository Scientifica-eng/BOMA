#!/usr/bin/env python3
"""Keep the first independent Cauchy milestone distinct from full completion."""
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
}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--independent-closure", type=Path, required=True)
    parser.add_argument("--governance", type=Path, required=True)
    parser.add_argument("--json-out", type=Path, required=True)
    args = parser.parse_args()

    closure: dict[str, Any] = json.loads(args.independent_closure.read_text(encoding="utf-8"))
    governance: dict[str, Any] = json.loads(args.governance.read_text(encoding="utf-8"))
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
    if governance.get("status") != "GOVERNANCE_PASS":
        residuals.append({"type": "typed_origin_governance_failed", "status": governance.get("status")})
    if governance.get("counts", {}).get("active_experiments") != 1:
        residuals.append({"type": "single_active_frontier_missing"})
    if forbidden:
        residuals.append({"type": "selected_dedekind_or_downstream_c_in_independent_closure", "declarations": forbidden})
    if missing:
        residuals.append({"type": "proved_foundation_target_missing", "declarations": missing})

    result = {
        "schema": "BOMA-ST2-EXP-003-INDEPENDENT-CAUCHY-FOUNDATION-001",
        "status": "FOUNDATION_PASS" if not residuals else "FOUNDATION_FAIL",
        "origin": "DECISION_POINT / R-DP-001",
        "common_upstream": "Q-BLOCK-002",
        "changed_factor": "Dedekind completion syntax/identity -> rational Cauchy quotient identity",
        "verified_milestone": "rational epsilon laws / Cauchy quotient / faithful Q embedding / additive group / eventual boundedness",
        "required_targets": sorted(REQUIRED_TARGETS),
        "actual_declaration_count": len(internal),
        "selected_dedekind_declarations": forbidden,
        "accepted_real_replacement": False,
        "additive_group_completed": not residuals,
        "eventual_boundedness_completed": not residuals,
        "ordered_field_completed": False,
        "cauchy_completeness_proved": False,
        "dedekind_comparison_proved": False,
        "downstream_complex_rebuilt": False,
        "experiment_closed": False,
        "residuals": residuals,
    }
    args.json_out.parent.mkdir(parents=True, exist_ok=True)
    args.json_out.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result, indent=2))
    return 0 if not residuals else 1


if __name__ == "__main__":
    raise SystemExit(main())
