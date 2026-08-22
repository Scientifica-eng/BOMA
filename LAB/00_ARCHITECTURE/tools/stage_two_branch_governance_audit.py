#!/usr/bin/env python3
"""Reject Stage-Two origin drift, stale current-state claims, and scope confusion."""
from __future__ import annotations

import argparse
import fnmatch
import json
import re
from pathlib import Path
from typing import Any

LEDGER = "LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json"
LEDGER_MD = "LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.md"
LESSONS = "LAB/PDSA/STAGE_TWO_WORK_ERRORS_AND_PREVENTION_001.md"
ARCHITECTURE_AUDIT = "LAB/00_ARCHITECTURE/tools/architecture_consistency_audit.py"
WORKFLOW = ".github/workflows/boma-st2-exp-002-quotient-route-comparison.yml"
EVIDENCE = "LAB/20_FORMALIZATION/C_STAGE/ST2_EXP_002_VERIFIED_EVIDENCE_RUN_32597030998.json"
JUNCTION = "ST2-EXP-002-PQ-J-001"
ACCEPTED_JUNCTION = "C-J-001"
Q_STATUS = "VERIFIED INDEPENDENT RESEARCH FIELD / NOT AN ACCEPTED EXPORT"

EXPECTED_ORIGINS = {
    "ST2-EXP-001": ("DEPENDENCY_EDGE", "BOMA-C-R-DEP-001", 32593045224),
    "ST2-EXP-002": ("DECISION_POINT", "C-DP-001", 32597346281),
}
REQUIRED_RECORD_FIELDS = (
    "experiment_id",
    "status",
    "origin_kind",
    "origin_id",
    "source_unit_id",
    "target_unit_id",
    "baseline_producer_unit_id",
    "accepted_export_unit_id",
    "changed_factor",
    "preserved_controls",
    "first_divergence",
    "affected_cone",
    "frozen_reference_commit",
    "frozen_plan",
    "experimental_product_status",
    "reconvergence_strength",
    "verified_run",
    "unit_sources",
)

CURRENT_STATE_FILES = {
    "LAB/00_ARCHITECTURE/JUNCTION_LEDGER.md",
    "LAB/00_ARCHITECTURE/C_DAG.md",
    "LAB/00_ARCHITECTURE/GRAPH.md",
    "LAB/00_ARCHITECTURE/REGISTRY.md",
    "LAB/00_ARCHITECTURE/BLOCK_CLAIM_MAP.md",
    "LAB/10_CONSTRUCTION/blocks/C-BLOCK-001/UNIT.md",
    "LAB/10_CONSTRUCTION/blocks/C-BLOCK-002/UNIT.md",
    "LAB/10_CONSTRUCTION/decisions/C-DP-001/UNIT.md",
    "LAB/PDSA/STATUS.md",
    "README.md",
    "AGENTS.md",
}

JUNCTION_REQUIRED_FILES = {
    "LAB/00_ARCHITECTURE/JUNCTION_LEDGER.md",
    "LAB/00_ARCHITECTURE/C_DAG.md",
    "LAB/00_ARCHITECTURE/GRAPH.md",
    "LAB/00_ARCHITECTURE/REGISTRY.md",
    "LAB/00_ARCHITECTURE/BLOCK_CLAIM_MAP.md",
    "LAB/10_CONSTRUCTION/blocks/C-BLOCK-001/UNIT.md",
    "LAB/10_CONSTRUCTION/blocks/C-BLOCK-002/UNIT.md",
    "LAB/10_CONSTRUCTION/decisions/C-DP-001/UNIT.md",
    "LAB/PDSA/STATUS.md",
    "README.md",
}

STALE_CURRENT_ASSERTIONS = {
    "representation_not_selected": re.compile(
        r"no representation has been selected", re.IGNORECASE
    ),
    "accepted_c_still_awaiting": re.compile(
        r"final C acceptance still awaits", re.IGNORECASE
    ),
    "q_field_absent": re.compile(
        r"Route Q is not a complete field"
        r"|a second completed C field or route-comparison Junction",
        re.IGNORECASE,
    ),
    "q_probe_only": re.compile(
        r"verified probe only|VERIFIED NONCANONICAL PROBE",
        re.IGNORECASE,
    ),
    "decision_open": re.compile(r"^C-DP-001\s+OPEN\s*$", re.MULTILINE),
    "c_routes_unbuilt": re.compile(
        r"^C candidate routes\s+IDENTIFIED / UNBUILT\s*$", re.MULTILINE
    ),
    "no_c_junction": re.compile(r"^C Junctions\s+NONE\s*$", re.MULTILINE),
    "no_c_reconvergence": re.compile(
        r"^C reconvergence claim\s+NONE YET\s*$", re.MULTILINE
    ),
    "no_c_integration": re.compile(
        r"^C final integration\s+NONE YET\s*$", re.MULTILINE
    ),
    "accepted_c_claims_still_open": re.compile(
        r"^C provisional Claims\s+OPEN\s*$", re.MULTILINE
    ),
    "accepted_reverse_still_scheduled": re.compile(
        r"RE-STAGE1-001.*remains scheduled", re.IGNORECASE
    ),
    "obsolete_current_feature_branch": re.compile(
        r"current feature branch is `feature/c-stage-acceptance-001`",
        re.IGNORECASE,
    ),
    "pending_accepted_c_decision": re.compile(
        r"\*\*Pending decision:\*\*", re.IGNORECASE
    ),
}


def read_text(root: Path, relative: str) -> str:
    path = root / relative
    if not path.is_file():
        raise ValueError(f"missing required repository file: {relative}")
    return path.read_text(encoding="utf-8")


def normalized(value: str) -> str:
    return " ".join(value.split())


def add_error(
    residuals: list[dict[str, Any]], kind: str, **context: Any
) -> None:
    residuals.append({"type": kind, **context})


def check_ledger(root: Path, residuals: list[dict[str, Any]]) -> dict[str, Any]:
    ledger = json.loads(read_text(root, LEDGER))
    if ledger.get("schema") != "BOMA-STAGE-TWO-BRANCH-ORIGIN-LEDGER-001":
        add_error(residuals, "origin_schema_drift", actual=ledger.get("schema"))

    records = ledger.get("records", [])
    if not isinstance(records, list):
        add_error(residuals, "origin_records_not_list")
        return {}

    record_map: dict[str, dict[str, Any]] = {}
    for record in records:
        if not isinstance(record, dict):
            add_error(residuals, "origin_record_not_object")
            continue
        experiment = record.get("experiment_id")
        if not isinstance(experiment, str):
            add_error(residuals, "origin_experiment_id_missing")
            continue
        if experiment in record_map:
            add_error(residuals, "duplicate_origin_experiment", experiment=experiment)
        record_map[experiment] = record

    if set(record_map) != set(EXPECTED_ORIGINS):
        add_error(
            residuals,
            "origin_experiment_set_drift",
            expected=sorted(EXPECTED_ORIGINS),
            actual=sorted(record_map),
        )

    accepted = ledger.get("accepted_reference", {})
    for key, expected in {
        "selected_route": "C-ROUTE-P",
        "selected_producer_unit": "C-BLOCK-001",
        "accepted_export_unit": "C-BLOCK-002",
        "acceptance": "CA-20 ACCEPT",
        "upstream_accepted_unit": "R-BLOCK-001",
        "dependency_contract": "BOMA-C-R-DEP-001",
    }.items():
        if accepted.get(key) != expected:
            add_error(
                residuals,
                "accepted_reference_drift",
                field=key,
                expected=expected,
                actual=accepted.get(key),
            )

    allowed = set(ledger.get("allowed_origin_kinds", []))
    if not {"DECISION_POINT", "DEPENDENCY_EDGE"}.issubset(allowed):
        add_error(residuals, "required_origin_types_missing", actual=sorted(allowed))

    for experiment, record in record_map.items():
        missing = [
            field
            for field in REQUIRED_RECORD_FIELDS
            if field not in record
            or record[field] is None
            or record[field] == ""
            or record[field] == []
        ]
        if missing:
            add_error(
                residuals,
                "required_origin_fields_missing",
                experiment=experiment,
                fields=missing,
            )

        wanted = EXPECTED_ORIGINS.get(experiment)
        if wanted:
            kind, origin, run = wanted
            if record.get("origin_kind") != kind or record.get("origin_id") != origin:
                add_error(
                    residuals,
                    "architectural_origin_drift",
                    experiment=experiment,
                    expected={"kind": kind, "origin": origin},
                    actual={
                        "kind": record.get("origin_kind"),
                        "origin": record.get("origin_id"),
                    },
                )
            if record.get("verified_run") != run:
                add_error(
                    residuals,
                    "verified_origin_evidence_drift",
                    experiment=experiment,
                    expected=run,
                    actual=record.get("verified_run"),
                )

        for key, expected in {
            "source_unit_id": "R-BLOCK-001",
            "target_unit_id": "C-BLOCK-001",
            "baseline_producer_unit_id": "C-BLOCK-001",
            "accepted_export_unit_id": "C-BLOCK-002",
            "selected_baseline_route": "C-ROUTE-P",
        }.items():
            if record.get(key) != expected:
                add_error(
                    residuals,
                    "origin_endpoint_drift",
                    experiment=experiment,
                    field=key,
                    expected=expected,
                    actual=record.get(key),
                )

        if len(record.get("affected_cone", [])) != 9:
            add_error(
                residuals,
                "accepted_nine_claim_cone_drift",
                experiment=experiment,
                actual=record.get("affected_cone"),
            )

        if not re.fullmatch(r"[0-9a-f]{40}", str(record.get("frozen_reference_commit", ""))):
            add_error(residuals, "invalid_frozen_git_origin", experiment=experiment)

        frozen = record.get("frozen_plan")
        if isinstance(frozen, str):
            plan = read_text(root, frozen)
            if experiment not in plan or "PLAN" not in plan:
                add_error(
                    residuals,
                    "frozen_plan_experiment_mismatch",
                    experiment=experiment,
                    plan=frozen,
                )

        unit_sources = record.get("unit_sources", {})
        if not isinstance(unit_sources, dict):
            add_error(residuals, "origin_unit_sources_not_map", experiment=experiment)
            continue

        expected_ids = {
            "R-BLOCK-001",
            "C-BLOCK-001",
            "C-BLOCK-002",
            "BOMA-C-R-DEP-001",
        }
        if experiment == "ST2-EXP-002":
            expected_ids.add("C-DP-001")
        if not expected_ids.issubset(unit_sources):
            add_error(
                residuals,
                "origin_unit_source_missing",
                experiment=experiment,
                missing=sorted(expected_ids - set(unit_sources)),
            )

        for unit_id, unit_path in unit_sources.items():
            source = read_text(root, unit_path)
            if unit_id not in source:
                add_error(
                    residuals,
                    "origin_unit_not_found_in_declared_source",
                    experiment=experiment,
                    unit=unit_id,
                    source=unit_path,
                )

    first = record_map.get("ST2-EXP-001", {})
    if "junction" in str(first.get("reconvergence_junction_id", "")).lower():
        add_error(residuals, "fabricated_first_experiment_junction")

    second = record_map.get("ST2-EXP-002", {})
    if second.get("reconvergence_junction_id") != JUNCTION:
        add_error(
            residuals,
            "research_junction_origin_drift",
            actual=second.get("reconvergence_junction_id"),
        )
    if normalized(str(second.get("experimental_product_status", ""))) != Q_STATUS:
        add_error(
            residuals,
            "q_research_status_drift",
            actual=second.get("experimental_product_status"),
        )
    if second.get("alternative_route") != "C-ROUTE-Q":
        add_error(residuals, "alternative_route_drift")

    return record_map


def check_current_state(root: Path, residuals: list[dict[str, Any]]) -> None:
    for relative in sorted(CURRENT_STATE_FILES):
        content = read_text(root, relative)
        for name, pattern in STALE_CURRENT_ASSERTIONS.items():
            if pattern.search(content):
                add_error(
                    residuals,
                    "stale_current_state_assertion",
                    document=relative,
                    assertion=name,
                )

    for relative in sorted(JUNCTION_REQUIRED_FILES):
        content = read_text(root, relative)
        if JUNCTION not in content:
            add_error(
                residuals,
                "research_junction_missing_current_state",
                document=relative,
            )
        if "C-BLOCK-002" not in content or "CA-20" not in content:
            add_error(
                residuals,
                "accepted_export_missing_current_state",
                document=relative,
            )

    ledger = read_text(root, "LAB/00_ARCHITECTURE/JUNCTION_LEDGER.md")
    if ACCEPTED_JUNCTION not in ledger or JUNCTION not in ledger:
        add_error(residuals, "accepted_and_research_junction_not_both_indexed")
    if "SAME-CARRIER-INTEGRATION" not in ledger or "R-FIELD-ISOMORPHISM" not in ledger:
        add_error(residuals, "junction_strength_not_explicit")

    for relative in (
        "LAB/00_ARCHITECTURE/C_DAG.md",
        "LAB/00_ARCHITECTURE/REGISTRY.md",
        "LAB/00_ARCHITECTURE/BLOCK_CLAIM_MAP.md",
        "LAB/10_CONSTRUCTION/blocks/C-BLOCK-001/UNIT.md",
        "LAB/10_CONSTRUCTION/blocks/C-BLOCK-002/UNIT.md",
    ):
        if Q_STATUS not in normalized(read_text(root, relative)):
            add_error(
                residuals,
                "q_strength_or_acceptance_boundary_missing",
                document=relative,
            )


def check_retained_failures(
    root: Path,
    records: dict[str, dict[str, Any]],
    residuals: list[dict[str, Any]],
) -> None:
    lessons = read_text(root, LESSONS)
    ledger_document = read_text(root, LEDGER_MD)
    for number in range(1, 16):
        error_id = f"ERR-ST2-{number:03d}"
        if error_id not in lessons:
            add_error(residuals, "retained_error_record_missing", error=error_id)

    for experiment, record in records.items():
        if experiment not in ledger_document:
            add_error(
                residuals,
                "human_readable_origin_missing",
                experiment=experiment,
            )
        if str(record.get("origin_id")) not in ledger_document:
            add_error(
                residuals,
                "human_readable_origin_id_missing",
                experiment=experiment,
            )
        study = read_text(root, record["study"])
        for run in record.get("preserved_failure_runs", []):
            if str(run) not in study or str(run) not in lessons:
                add_error(
                    residuals,
                    "failed_verification_not_retained",
                    experiment=experiment,
                    run=run,
                )

    evidence = json.loads(read_text(root, EVIDENCE))
    evidence_failures = {
        item.get("id")
        for item in evidence.get("preserved_failed_runs", [])
        if isinstance(item, dict)
    }
    if not {32596872373, 32596968581, 32597282848}.issubset(evidence_failures):
        add_error(
            residuals,
            "machine_evidence_lost_failed_runs",
            actual=sorted(evidence_failures),
        )

    ledger = json.loads(read_text(root, LEDGER))
    cross_stage = ledger.get("cross_stage_governance_failure_runs", [])
    if not isinstance(cross_stage, list):
        add_error(residuals, "cross_stage_failure_records_not_list")
        return
    required = next(
        (item for item in cross_stage if isinstance(item, dict) and item.get("id") == 32599546288),
        None,
    )
    if required is None or required.get("error_id") != "ERR-ST2-015":
        add_error(residuals, "cross_stage_research_junction_failure_not_retained")
    elif str(required["id"]) not in lessons or str(required["id"]) not in ledger_document:
        add_error(residuals, "cross_stage_research_junction_failure_not_documented")

    architecture_audit = read_text(root, ARCHITECTURE_AUDIT)
    for control in (
        "def declared_research_junctions(",
        "indexed_junction_ids - research_junction_ids",
        "NOT A CANONICAL ACCEPTANCE JUNCTION",
        "NOT AN ACCEPTED EXPORT",
    ):
        if control not in architecture_audit:
            add_error(residuals, "cross_stage_research_scope_control_missing", control=control)


def check_exact_experiment_identity(
    root: Path, residuals: list[dict[str, Any]]
) -> None:
    workflow = read_text(root, WORKFLOW)
    bad_pattern = "ST2*EXP*001*"
    if bad_pattern in workflow:
        add_error(residuals, "overbroad_previous_experiment_glob", pattern=bad_pattern)

    precise = (
        "ST2-EXP-001*",
        "ST2_EXP_001*",
        "ST2Exp001*",
        "PDSA-ST2-EXP-001*",
    )
    for pattern in precise:
        if pattern not in workflow:
            add_error(
                residuals,
                "exact_previous_experiment_guard_missing",
                pattern=pattern,
            )

    protected = (
        "ST2-EXP-001_NARROW_R_INTERFACE_STUDY.md",
        "ST2_EXP_001_COMPARE_INTERFACES.py",
        "ST2Exp001NarrowField.lean",
        "PDSA-ST2-EXP-001_NARROW_R_INTERFACE.md",
    )
    unrelated = "ST2-EXP-002_PQ_RECONVERGENCE_JUNCTION_001.md"
    for source in protected:
        if not any(fnmatch.fnmatchcase(source, pattern) for pattern in precise):
            add_error(residuals, "exact_guard_misses_prior_experiment", path=source)
    if any(fnmatch.fnmatchcase(unrelated, pattern) for pattern in precise):
        add_error(residuals, "exact_guard_captures_unrelated_junction", path=unrelated)

    if not fnmatch.fnmatchcase(unrelated, bad_pattern):
        add_error(residuals, "documented_broad_glob_failure_not_reproducible")

    if "stage_two_branch_governance_audit.py" not in workflow:
        add_error(residuals, "governance_audit_not_connected_to_v5")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=Path.cwd())
    parser.add_argument("--json-out", type=Path)
    args = parser.parse_args()
    root = args.root.resolve()
    residuals: list[dict[str, Any]] = []

    try:
        records = check_ledger(root, residuals)
        check_current_state(root, residuals)
        check_retained_failures(root, records, residuals)
        check_exact_experiment_identity(root, residuals)
    except (OSError, ValueError, json.JSONDecodeError, KeyError) as exc:
        add_error(residuals, "governance_audit_execution_error", error=str(exc))
        records = {}

    result = {
        "schema": "BOMA-STAGE-TWO-BRANCH-GOVERNANCE-AUDIT-001",
        "status": "GOVERNANCE_PASS" if not residuals else "GOVERNANCE_FAIL",
        "architectural_origins": {
            experiment: {
                "kind": record.get("origin_kind"),
                "origin": record.get("origin_id"),
                "upstream": record.get("source_unit_id"),
                "baseline_producer": record.get("baseline_producer_unit_id"),
                "accepted_export": record.get("accepted_export_unit_id"),
            }
            for experiment, record in sorted(records.items())
        },
        "accepted_junction": ACCEPTED_JUNCTION,
        "research_junction": JUNCTION,
        "counts": {
            "closed_experiments": len(records),
            "current_state_documents": len(CURRENT_STATE_FILES),
            "junction_index_documents": len(JUNCTION_REQUIRED_FILES),
            "retained_error_classes": 15,
            "retained_failed_runs": sum(
                len(record.get("preserved_failure_runs", []))
                for record in records.values()
            ) + len(
                json.loads(read_text(root, LEDGER)).get(
                    "cross_stage_governance_failure_runs", []
                )
            ),
            "residuals": len(residuals),
        },
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
