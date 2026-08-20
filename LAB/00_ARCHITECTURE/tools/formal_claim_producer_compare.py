#!/usr/bin/env python3
"""Compare BOMA R Claim Records with the actual Lean dependency closure.

This is the semantic bridge after theorem-level boundary classification:

    accepted Claim Registry
      -> explicit claim producer policy
      -> actual producer declarations in Lean closure
      -> transitive internal support ancestry

The comparison intentionally does *not* allow the integration certificate itself
to claim transitive ownership of the whole graph. Doing so would make the audit
vacuous. Every direct internal dependency of the certificate must instead be an
explicit claim producer or integration-local generated/packaging infrastructure.
"""

from __future__ import annotations

import argparse
import json
import re
from collections import deque
from pathlib import Path
from typing import Any


CLAIM_RE = re.compile(r"`(R-CL-[A-Z0-9-]+)`")


def load_json(path: Path) -> dict[str, Any]:
    with path.open("r", encoding="utf-8") as fh:
        data = json.load(fh)
    if not isinstance(data, dict):
        raise ValueError(f"expected JSON object: {path}")
    return data


def load_registry_claims(path: Path, section_label: str) -> list[str]:
    lines = path.read_text(encoding="utf-8").splitlines()
    in_section = False
    claims: list[str] = []
    seen: set[str] = set()

    for line in lines:
        if line.startswith("## "):
            if in_section:
                break
            if section_label in line:
                in_section = True
            continue
        if not in_section:
            continue
        match = CLAIM_RE.search(line)
        if match:
            claim = match.group(1)
            if claim not in seen:
                seen.add(claim)
                claims.append(claim)

    if not in_section:
        raise ValueError(f"registry section not found: {section_label}")
    if not claims:
        raise ValueError(f"no R Claim IDs found in registry section: {section_label}")
    return claims


def adjacency_from_edges(edges: list[dict[str, Any]], internal_names: set[str]) -> dict[str, list[str]]:
    adjacency: dict[str, list[str]] = {}
    for edge in edges:
        consumer = edge.get("consumer")
        dependency = edge.get("dependency")
        if not isinstance(consumer, str) or not isinstance(dependency, str):
            continue
        if dependency in internal_names:
            adjacency.setdefault(consumer, []).append(dependency)
    for key in adjacency:
        adjacency[key] = sorted(set(adjacency[key]))
    return adjacency


def reachable_internal(start: str, adjacency: dict[str, list[str]], internal_names: set[str]) -> set[str]:
    reached: set[str] = set()
    queue: deque[str] = deque([start])
    while queue:
        node = queue.popleft()
        if node in reached:
            continue
        if node in internal_names:
            reached.add(node)
        for nxt in adjacency.get(node, []):
            if nxt not in reached:
                queue.append(nxt)
    return reached


def shortest_path(start: str, target: str, adjacency: dict[str, list[str]]) -> list[str] | None:
    queue: deque[str] = deque([start])
    parent: dict[str, str | None] = {start: None}
    while queue:
        node = queue.popleft()
        if node == target:
            out: list[str] = []
            cur: str | None = node
            while cur is not None:
                out.append(cur)
                cur = parent[cur]
            out.reverse()
            return out
        for nxt in adjacency.get(node, []):
            if nxt not in parent:
                parent[nxt] = node
                queue.append(nxt)
    return None


def matches_prefix(name: str, prefixes: list[str]) -> bool:
    return any(name == p or name.startswith(p + ".") for p in prefixes)


def source_stage(source: str | None) -> str:
    if source is None:
        return "UNMAPPED"
    if "/NCore/" in source:
        return "N-Core"
    if "/NArithmetic/" in source:
        return "N-Arithmetic"
    if "/ZStage/" in source:
        return "Z"
    if "/QStage/" in source:
        return "Q"
    if "/RStage/" in source:
        return "R"
    return "OTHER"


def main() -> int:
    parser = argparse.ArgumentParser(description="Compare R Claim producers with actual Lean closure")
    parser.add_argument("--closure", required=True, type=Path)
    parser.add_argument("--classification", required=True, type=Path)
    parser.add_argument("--policy", required=True, type=Path)
    parser.add_argument("--registry", required=True, type=Path)
    parser.add_argument("--json-out", type=Path)
    args = parser.parse_args()

    closure = load_json(args.closure)
    classification = load_json(args.classification)
    policy = load_json(args.policy)

    target = policy.get("target")
    if not isinstance(target, str) or not target:
        raise ValueError("policy target missing")

    internal = [item for item in closure.get("internal", []) if isinstance(item, dict)]
    internal_by_name = {
        item.get("name"): item
        for item in internal
        if isinstance(item.get("name"), str) and item.get("name")
    }
    internal_names = set(internal_by_name)
    edges = [item for item in closure.get("edges", []) if isinstance(item, dict)]
    adjacency = adjacency_from_edges(edges, internal_names)

    registry_claims = load_registry_claims(args.registry, str(policy.get("registry_section", "R Claim IDs")))
    policy_claims_obj = policy.get("claims", {})
    if not isinstance(policy_claims_obj, dict):
        raise ValueError("policy claims must be an object")
    policy_claims = list(policy_claims_obj.keys())

    residuals: list[dict[str, Any]] = []

    missing_policy_claims = sorted(set(registry_claims) - set(policy_claims))
    extra_policy_claims = sorted(set(policy_claims) - set(registry_claims))
    if missing_policy_claims:
        residuals.append({
            "type": "registry_claim_missing_policy_record",
            "claims": missing_policy_claims,
        })
    if extra_policy_claims:
        residuals.append({
            "type": "policy_claim_not_in_registry",
            "claims": extra_policy_claims,
        })

    if classification.get("status") != "CLASSIFICATION_PASS":
        residuals.append({
            "type": "formal_boundary_classification_not_pass",
            "status": classification.get("status"),
        })

    if closure.get("status") != "PROTOTYPE_PASS":
        residuals.append({
            "type": "formal_closure_extraction_not_pass",
            "status": closure.get("status"),
        })

    target_reach = reachable_internal(target, adjacency, internal_names)
    target_reach.add(target)

    integration_prefixes = [
        p for p in policy.get("integration_local_prefixes", []) if isinstance(p, str) and p
    ]

    ownership: dict[str, set[str]] = {}
    producer_names: set[str] = set()
    claim_results: list[dict[str, Any]] = []

    for claim_id in registry_claims:
        record = policy_claims_obj.get(claim_id)
        if not isinstance(record, dict):
            continue
        producers = [p for p in record.get("producers", []) if isinstance(p, str) and p]
        if not producers:
            residuals.append({
                "type": "claim_without_producer",
                "claim": claim_id,
            })
            continue

        transitive = record.get("transitive_ownership", True)
        producer_results: list[dict[str, Any]] = []
        claim_owned: set[str] = set()

        for producer in producers:
            producer_names.add(producer)
            exists = producer in internal_names
            path = shortest_path(target, producer, adjacency) if producer != target else [target]
            reachable = producer == target or path is not None
            if not exists:
                residuals.append({
                    "type": "declared_producer_not_internal",
                    "claim": claim_id,
                    "producer": producer,
                })
            if exists and not reachable:
                residuals.append({
                    "type": "declared_producer_not_reachable_from_target",
                    "claim": claim_id,
                    "producer": producer,
                })

            owned = set()
            if exists:
                owned.add(producer)
                if transitive:
                    owned |= reachable_internal(producer, adjacency, internal_names)
            claim_owned |= owned
            producer_results.append({
                "name": producer,
                "exists_in_internal_closure": exists,
                "reachable_from_target": reachable,
                "shortest_target_path": path,
                "source": internal_by_name.get(producer, {}).get("source") if exists else None,
                "owned_internal_count": len(owned),
            })

        for name in claim_owned:
            ownership.setdefault(name, set()).add(claim_id)

        claim_results.append({
            "claim": claim_id,
            "role": record.get("role"),
            "transitive_ownership": bool(transitive),
            "producers": producer_results,
            "owned_internal_count": len(claim_owned),
        })

    # Integration-local declarations are packaging/generated artifacts, not a
    # license for the integration claim to own their transitive dependencies.
    for name in internal_names:
        if matches_prefix(name, integration_prefixes):
            ownership.setdefault(name, set()).add("R-CL-INTEGRATION-001")

    direct_internal = sorted(set(adjacency.get(target, [])))
    undeclared_direct: list[str] = []
    for dep in direct_internal:
        if dep in producer_names or matches_prefix(dep, integration_prefixes):
            continue
        undeclared_direct.append(dep)
    if undeclared_direct:
        residuals.append({
            "type": "undeclared_target_direct_internal_dependency",
            "dependencies": undeclared_direct,
        })

    unowned_internal = sorted(name for name in internal_names if name not in ownership)
    if unowned_internal:
        residuals.append({
            "type": "internal_without_claim_producer_ancestry",
            "count": len(unowned_internal),
            "declarations": unowned_internal,
        })

    multi_owned = sorted(name for name, claims in ownership.items() if len(claims) > 1)

    stage_counts: dict[str, int] = {}
    unowned_stage_counts: dict[str, int] = {}
    for name, record in internal_by_name.items():
        stage = source_stage(record.get("source"))
        stage_counts[stage] = stage_counts.get(stage, 0) + 1
        if name in unowned_internal:
            unowned_stage_counts[stage] = unowned_stage_counts.get(stage, 0) + 1

    status = "CLAIM_PRODUCER_PASS" if not residuals else "CLAIM_PRODUCER_REVIEW_REQUIRED"
    result = {
        "status": status,
        "policy_schema": policy.get("schema"),
        "stage": policy.get("stage"),
        "target": target,
        "closure_status": closure.get("status"),
        "boundary_classification_status": classification.get("status"),
        "registry_claims": registry_claims,
        "policy_claims": policy_claims,
        "counts": {
            "registry_claims": len(registry_claims),
            "policy_claims": len(policy_claims),
            "declared_producers": len(producer_names),
            "internal_declarations": len(internal_names),
            "owned_internal_declarations": len(ownership),
            "unowned_internal_declarations": len(unowned_internal),
            "target_direct_internal_dependencies": len(direct_internal),
            "undeclared_target_direct_internal_dependencies": len(undeclared_direct),
            "multi_claim_owned_internal_declarations": len(multi_owned),
            "residual_groups": len(residuals),
        },
        "internal_by_source_stage": dict(sorted(stage_counts.items())),
        "unowned_by_source_stage": dict(sorted(unowned_stage_counts.items())),
        "target_direct_internal_dependencies": [
            {
                "name": name,
                "declared_producer": name in producer_names,
                "integration_local": matches_prefix(name, integration_prefixes),
                "source": internal_by_name.get(name, {}).get("source"),
            }
            for name in direct_internal
        ],
        "claims": claim_results,
        "multi_claim_owned_internal": [
            {"name": name, "claims": sorted(ownership[name])}
            for name in multi_owned
        ],
        "residuals": residuals,
    }

    rendered = json.dumps(result, indent=2, ensure_ascii=False) + "\n"
    if args.json_out:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0 if status == "CLAIM_PRODUCER_PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main())
