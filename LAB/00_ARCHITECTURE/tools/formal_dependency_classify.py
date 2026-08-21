#!/usr/bin/env python3
"""Classify BOMA theorem-level dependency closure against an explicit policy.

This stage consumes the JSON produced by `lean_dependency_audit.py`. It does not
re-run Lean and does not alter mathematical payloads. Its job is to answer:

    ActualFormalClosure
      subset-of
    Declared commitments + Trusted Base ?

The classifier keeps review-required leaves explicit and records shortest paths
from accepted targets to sensitive dependencies so classification decisions are
based on provenance rather than a flat name whitelist.
"""

from __future__ import annotations

import argparse
import json
from collections import deque
from pathlib import Path
from typing import Any


def load_json(path: Path) -> dict[str, Any]:
    with path.open("r", encoding="utf-8") as fh:
        data = json.load(fh)
    if not isinstance(data, dict):
        raise ValueError(f"expected JSON object: {path}")
    return data


def shortest_path(edges: list[dict[str, str]], starts: list[str], target: str) -> list[str] | None:
    adjacency: dict[str, list[str]] = {}
    for edge in edges:
        a = edge.get("consumer")
        b = edge.get("dependency")
        if not a or not b:
            continue
        adjacency.setdefault(a, []).append(b)

    queue: deque[str] = deque()
    parent: dict[str, str | None] = {}
    for start in starts:
        if start not in parent:
            parent[start] = None
            queue.append(start)

    while queue:
        node = queue.popleft()
        if node == target:
            path: list[str] = []
            cur: str | None = node
            while cur is not None:
                path.append(cur)
                cur = parent[cur]
            path.reverse()
            return path
        for nxt in adjacency.get(node, []):
            if nxt not in parent:
                parent[nxt] = node
                queue.append(nxt)
    return None


def direct_consumers(edges: list[dict[str, str]], dependency: str) -> list[str]:
    return sorted({
        edge.get("consumer", "")
        for edge in edges
        if edge.get("dependency") == dependency and edge.get("consumer")
    })


def allowed_source(source: str | None, rule: dict[str, Any]) -> bool:
    exact = set(rule.get("allowed_direct_sources", []))
    prefixes = tuple(rule.get("allowed_direct_source_prefixes", []))
    if not exact and not prefixes:
        return True
    if source is None:
        return False
    if source in exact:
        return True
    return any(source.startswith(prefix) for prefix in prefixes)


def classify_external(
    decl: dict[str, Any],
    policy: dict[str, Any],
    internal_by_name: dict[str, dict[str, Any]],
    edges: list[dict[str, str]],
    targets: list[str],
) -> dict[str, Any]:
    name = decl.get("name", "")
    module = decl.get("module", "")
    kind = decl.get("kind", "")

    overrides = policy.get("declaration_overrides", {})
    module_defaults = policy.get("module_defaults", {})
    rule = overrides.get(name)
    source_of_rule = "declaration_override"

    if rule is None:
        rule = module_defaults.get(module)
        source_of_rule = "module_default"

    if rule is None:
        classification = policy.get("rules", {}).get(
            "unknown_external_module", "UNDECLARED_DEPENDENCY"
        )
        rule = {
            "classification": classification,
            "reason": f"no declaration override or module default for {module}",
        }
        source_of_rule = "fallback"

    classification = rule.get("classification", "UNDECLARED_DEPENDENCY")

    # An external axiom must have an explicit declaration-level override. A
    # module-wide Trusted Base default is intentionally insufficient.
    if kind == "axiom" and source_of_rule != "declaration_override":
        classification = policy.get("rules", {}).get(
            "external_axiom_without_override", "REVIEW_REQUIRED"
        )

    consumers = direct_consumers(edges, name)
    consumer_records: list[dict[str, Any]] = []
    out_of_scope: list[dict[str, Any]] = []
    for consumer in consumers:
        record = internal_by_name.get(consumer)
        item = {
            "name": consumer,
            "source": record.get("source") if record else None,
            "source_resolution": record.get("source_resolution") if record else None,
        }
        consumer_records.append(item)
        if not allowed_source(item["source"], rule):
            out_of_scope.append(item)

    if out_of_scope:
        classification = policy.get("rules", {}).get(
            "restricted_override_with_out_of_scope_consumer", "UNDECLARED_DEPENDENCY"
        )

    path = shortest_path(edges, targets, name)
    residual = classification in {"REVIEW_REQUIRED", "UNDECLARED_DEPENDENCY"}

    return {
        "name": name,
        "kind": kind,
        "module": module,
        "classification": classification,
        "policy_source": source_of_rule,
        "trusted_base_refs": rule.get("trusted_base_refs", []),
        "refs": rule.get("refs", []),
        "reason": rule.get("reason"),
        "direct_consumers": consumer_records,
        "out_of_scope_consumers": out_of_scope,
        "shortest_target_path": path,
        "residual": residual,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description="Classify BOMA formal dependency closure")
    parser.add_argument("--closure", required=True, type=Path)
    parser.add_argument("--policy", required=True, type=Path)
    parser.add_argument("--json-out", type=Path)
    args = parser.parse_args()

    closure = load_json(args.closure)
    policy = load_json(args.policy)

    internal = closure.get("internal", [])
    external = closure.get("external_boundary", [])
    edges = closure.get("edges", [])
    targets = closure.get("targets", [])
    internal_by_name = {
        item.get("name"): item
        for item in internal
        if isinstance(item, dict) and item.get("name")
    }

    classified_external = [
        classify_external(item, policy, internal_by_name, edges, targets)
        for item in external
        if isinstance(item, dict)
    ]

    residuals: list[dict[str, Any]] = [
        item for item in classified_external if item.get("residual")
    ]

    internal_residuals: list[dict[str, Any]] = []
    for name in closure.get("internal_axioms", []):
        internal_residuals.append({
            "type": "internal_axiom",
            "name": name,
            "classification": policy.get("rules", {}).get(
                "internal_axiom", "UNDECLARED_DEPENDENCY"
            ),
        })
    for name in closure.get("unresolved", []):
        internal_residuals.append({
            "type": "unresolved_declaration",
            "name": name,
            "classification": policy.get("rules", {}).get(
                "unresolved_declaration", "UNDECLARED_DEPENDENCY"
            ),
        })
    for name in closure.get("unmapped_internal_ranges", []):
        internal_residuals.append({
            "type": "internal_without_source",
            "name": name,
            "classification": policy.get("rules", {}).get(
                "internal_without_source_after_generated_inference", "REVIEW_REQUIRED"
            ),
        })

    all_residuals: list[dict[str, Any]] = residuals + internal_residuals
    by_classification: dict[str, int] = {}
    for item in classified_external:
        key = item.get("classification", "UNKNOWN")
        by_classification[key] = by_classification.get(key, 0) + 1

    status = "CLASSIFICATION_PASS" if not all_residuals else "CLASSIFICATION_REVIEW_REQUIRED"
    result = {
        "status": status,
        "policy_schema": policy.get("schema"),
        "closure_status": closure.get("status"),
        "stage": closure.get("stage"),
        "targets": targets,
        "counts": {
            "external_boundary": len(classified_external),
            "classified_external": len(classified_external) - len(residuals),
            "external_residuals": len(residuals),
            "internal_residuals": len(internal_residuals),
            "total_residuals": len(all_residuals),
        },
        "classification_counts": dict(sorted(by_classification.items())),
        "residuals": all_residuals,
        "external": classified_external,
    }

    rendered = json.dumps(result, indent=2, ensure_ascii=False) + "\n"
    if args.json_out:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(rendered, encoding="utf-8")
    print(rendered, end="")

    return 0 if status == "CLASSIFICATION_PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main())
