#!/usr/bin/env python3
"""Cross-stage closure audit for PDSA-ARCH-002.

This gate complements, rather than replaces, the theorem-level stage audits.
It checks the remaining architecture-program invariants that are naturally
repository-wide:

* required architecture records and five generated views exist;
* every accepted stage has a current transparency certificate and machine
  evidence with zero residuals;
* the current Claim Registry and producer policies still match;
* latest stage evidence is not stale relative to current verification inputs;
* canonical Block/Junction/Decision/Brick UNIT records are represented by the
  current architecture mapping corpus;
* Junction and Decision ledgers do not retain numeric canonical IDs whose UNIT
  records have disappeared;
* declared Junction -> Claim links still exist in both the Junction Ledger and
  Claim Registry.

The script intentionally does not reinterpret historical/superseded artifacts
as canonical units merely because their identifiers appear in prose. Canonical
unit enumeration is filesystem-based: a UNIT.md whose parent directory is a
canonical ID is treated as an actual unit.
"""

from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any

DEFAULT_POLICY = Path("LAB/00_ARCHITECTURE/ARCHITECTURE_CONSISTENCY_POLICY.json")

UNIT_ID_RE = re.compile(
    r"^[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)*-(BR|BLOCK|J|DP)-\d{3}$"
)
EXPLICIT_ID_RE = re.compile(
    r"(?<![A-Z0-9-])([A-Z][A-Z0-9]*(?:-[A-Z0-9]+)*-(?:BR|BLOCK|J|DP)-\d{3})(?![A-Z0-9-])"
)
RANGE_RE = re.compile(
    r"([A-Z][A-Z0-9]*(?:-[A-Z0-9]+)*-(?:BR|BLOCK|J|DP)-)(\d{3})\.\.(\d{3})"
)
AUDITED_SHA_RE = re.compile(r"Audited source commit:\*\*\s*`([0-9a-f]{40})`")
RUN_ID_RE = re.compile(r"\b\d{11}\b")


@dataclass(frozen=True)
class Finding:
    level: str
    scope: str
    path: str
    message: str


def load_json(path: Path) -> dict[str, Any]:
    with path.open("r", encoding="utf-8") as fh:
        data = json.load(fh)
    if not isinstance(data, dict):
        raise ValueError(f"expected JSON object: {path}")
    return data


def read_text(root: Path, rel: str) -> str:
    path = root / rel
    if not path.is_file():
        raise FileNotFoundError(rel)
    return path.read_text(encoding="utf-8")


def expanded_ids(text: str) -> set[str]:
    ids = set(EXPLICIT_ID_RE.findall(text))
    for match in RANGE_RE.finditer(text):
        prefix, lo_raw, hi_raw = match.groups()
        lo, hi = int(lo_raw), int(hi_raw)
        if hi < lo or hi - lo > 500:
            continue
        width = len(lo_raw)
        for value in range(lo, hi + 1):
            ids.add(f"{prefix}{value:0{width}d}")
    return ids


def unit_kind(unit_id: str) -> str:
    match = UNIT_ID_RE.fullmatch(unit_id)
    if not match:
        raise ValueError(f"not a canonical unit id: {unit_id}")
    return match.group(1)


def canonical_units(root: Path, scan_root: str) -> dict[str, str]:
    base = root / scan_root
    out: dict[str, str] = {}
    if not base.is_dir():
        return out
    for unit_path in base.rglob("UNIT.md"):
        candidate = unit_path.parent.name
        if UNIT_ID_RE.fullmatch(candidate):
            out[candidate] = str(unit_path.relative_to(root))
    return out


def registry_claims(text: str, section_label: str, pattern: str) -> list[str]:
    regex = re.compile(rf"`({pattern})`")
    in_section = False
    out: list[str] = []
    seen: set[str] = set()
    for line in text.splitlines():
        if line.startswith("## "):
            if in_section:
                break
            if section_label in line:
                in_section = True
            continue
        if not in_section:
            continue
        for claim in regex.findall(line):
            if claim not in seen:
                seen.add(claim)
                out.append(claim)
    if not in_section:
        raise ValueError(f"registry section not found: {section_label}")
    return out


def git(root: Path, args: list[str], *, check: bool = True) -> subprocess.CompletedProcess[str]:
    proc = subprocess.run(
        ["git", *args],
        cwd=root,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )
    if check and proc.returncode != 0:
        raise RuntimeError(f"git {' '.join(args)} failed:\n{proc.stdout}")
    return proc


def stale_inputs(root: Path, audited_sha: str, paths: list[str]) -> list[str]:
    exists = git(root, ["cat-file", "-e", f"{audited_sha}^{{commit}}"], check=False)
    if exists.returncode != 0:
        raise RuntimeError(f"audited commit unavailable in checkout: {audited_sha}")
    proc = git(root, ["diff", "--name-only", audited_sha, "HEAD", "--", *paths])
    return [line for line in proc.stdout.splitlines() if line.strip()]


def add(findings: list[Finding], level: str, scope: str, path: str, message: str) -> None:
    findings.append(Finding(level, scope, path, message))


def audit(root: Path, policy_rel: Path) -> tuple[list[Finding], dict[str, Any]]:
    policy_path = root / policy_rel
    policy = load_json(policy_path)
    findings: list[Finding] = []
    stats: dict[str, Any] = {"stages": {}, "units": {}}

    for rel in policy.get("required_records", []):
        if not (root / rel).is_file():
            add(findings, "ERROR", "GLOBAL", rel, "required architecture/view record is missing")

    registry_rel = str(policy["registry"])
    try:
        registry_text = read_text(root, registry_rel)
    except FileNotFoundError:
        registry_text = ""
        add(findings, "ERROR", "GLOBAL", registry_rel, "Claim Registry is missing")

    # Stage-level evidence, Claim-set equality, and evidence freshness.
    for stage, cfg_any in policy.get("stages", {}).items():
        cfg = dict(cfg_any)
        stage_errors_before = sum(1 for f in findings if f.level == "ERROR")
        required_stage_paths = [
            cfg["claim_audit"],
            cfg["certification"],
            cfg["producer_policy"],
            cfg["closure_evidence"],
            cfg["classification_evidence"],
            cfg["producer_evidence"],
        ]
        missing = [rel for rel in required_stage_paths if not (root / rel).is_file()]
        for rel in missing:
            add(findings, "ERROR", stage, rel, "required stage transparency/evidence record is missing")
        if missing:
            stats["stages"][stage] = {"status": "INCOMPLETE", "missing_records": len(missing)}
            continue

        audit_text = read_text(root, cfg["claim_audit"])
        cert_text = read_text(root, cfg["certification"])
        closure_text = read_text(root, cfg["closure_evidence"])
        producer_policy = load_json(root / cfg["producer_policy"])
        classification = load_json(root / cfg["classification_evidence"])
        producer_evidence = load_json(root / cfg["producer_evidence"])

        try:
            reg_claims = registry_claims(
                registry_text,
                str(cfg["registry_section"]),
                str(cfg["claim_pattern"]),
            )
        except ValueError as exc:
            reg_claims = []
            add(findings, "ERROR", stage, registry_rel, str(exc))

        policy_claims_obj = producer_policy.get("claims", {})
        policy_claims = list(policy_claims_obj.keys()) if isinstance(policy_claims_obj, dict) else []
        if set(reg_claims) != set(policy_claims):
            add(
                findings,
                "ERROR",
                stage,
                cfg["producer_policy"],
                f"Registry/policy Claim sets differ: registry-only={sorted(set(reg_claims)-set(policy_claims))}, policy-only={sorted(set(policy_claims)-set(reg_claims))}",
            )

        missing_from_audit = [claim for claim in reg_claims if claim not in audit_text]
        if missing_from_audit:
            add(
                findings,
                "ERROR",
                stage,
                cfg["claim_audit"],
                f"registered Claims absent from declared-closure audit: {missing_from_audit}",
            )

        if "TRANSPARENCY PASS" not in cert_text:
            add(findings, "ERROR", stage, cfg["certification"], "certification does not state TRANSPARENCY PASS")
        if not RUN_ID_RE.search(cert_text):
            add(findings, "ERROR", stage, cfg["certification"], "certification contains no workflow/V5 run identifier")

        if "**Status:** PROTOTYPE_PASS" not in closure_text:
            add(findings, "ERROR", stage, cfg["closure_evidence"], "latest closure evidence is not PROTOTYPE_PASS")
        if "**Boundary classification:** CLASSIFICATION_PASS" not in closure_text:
            add(findings, "ERROR", stage, cfg["closure_evidence"], "latest closure evidence boundary is not CLASSIFICATION_PASS")
        if "**Claim/producer comparison:** CLAIM_PRODUCER_PASS" not in closure_text:
            add(findings, "ERROR", stage, cfg["closure_evidence"], "latest closure evidence Claim/producer result is not PASS")

        if classification.get("status") != "CLASSIFICATION_PASS":
            add(findings, "ERROR", stage, cfg["classification_evidence"], f"classification status is {classification.get('status')!r}")
        class_counts = classification.get("counts", {})
        if isinstance(class_counts, dict) and class_counts.get("total_residuals", 0) != 0:
            add(findings, "ERROR", stage, cfg["classification_evidence"], f"formal residual count is {class_counts.get('total_residuals')}")

        if producer_evidence.get("status") != "CLAIM_PRODUCER_PASS":
            add(findings, "ERROR", stage, cfg["producer_evidence"], f"producer comparison status is {producer_evidence.get('status')!r}")
        prod_counts = producer_evidence.get("counts", {})
        if isinstance(prod_counts, dict):
            if prod_counts.get("residual_groups", 0) != 0:
                add(findings, "ERROR", stage, cfg["producer_evidence"], f"Claim/producer residual groups = {prod_counts.get('residual_groups')}")
            if prod_counts.get("unowned_internal_declarations", 0) != 0:
                add(findings, "ERROR", stage, cfg["producer_evidence"], f"unowned internal declarations = {prod_counts.get('unowned_internal_declarations')}")

        sha_match = AUDITED_SHA_RE.search(closure_text)
        audited_sha = sha_match.group(1) if sha_match else None
        stale: list[str] = []
        if audited_sha is None:
            add(findings, "ERROR", stage, cfg["closure_evidence"], "cannot parse audited source commit")
        else:
            try:
                stale = stale_inputs(root, audited_sha, list(cfg.get("freshness_inputs", [])))
            except RuntimeError as exc:
                add(findings, "ERROR", stage, cfg["closure_evidence"], str(exc))
            if stale:
                add(
                    findings,
                    "ERROR",
                    stage,
                    cfg["closure_evidence"],
                    "latest PASS evidence is stale relative to current verification inputs: " + ", ".join(stale),
                )

        stage_errors_after = sum(1 for f in findings if f.level == "ERROR")
        stats["stages"][stage] = {
            "status": "PASS" if stage_errors_after == stage_errors_before else "FAIL",
            "registry_claims": len(reg_claims),
            "policy_claims": len(policy_claims),
            "audited_sha": audited_sha,
            "stale_inputs": len(stale),
        }

    # Filesystem-grounded canonical-unit coverage.
    units = canonical_units(root, str(policy.get("unit_scan_root", "LAB")))
    by_kind: dict[str, set[str]] = {"BR": set(), "BLOCK": set(), "J": set(), "DP": set()}
    for unit_id in units:
        by_kind[unit_kind(unit_id)].add(unit_id)

    corpus_ids: set[str] = set()
    for rel in policy.get("mapping_corpus", []):
        path = root / rel
        if not path.is_file():
            add(findings, "ERROR", "UNITS", rel, "mapping-corpus record is missing")
            continue
        corpus_ids |= expanded_ids(path.read_text(encoding="utf-8"))

    block_text = read_text(root, str(policy["block_map"])) if (root / str(policy["block_map"])).is_file() else ""
    junction_text = read_text(root, str(policy["junction_ledger"])) if (root / str(policy["junction_ledger"])).is_file() else ""
    decision_text = read_text(root, str(policy["decision_ledger"])) if (root / str(policy["decision_ledger"])).is_file() else ""
    block_ids = {i for i in expanded_ids(block_text) if unit_kind(i) == "BLOCK"}
    junction_ids = {i for i in expanded_ids(junction_text) if unit_kind(i) == "J"}
    decision_ids = {i for i in expanded_ids(decision_text) if unit_kind(i) == "DP"}

    coverage_sets = {
        "BR": corpus_ids,
        "BLOCK": block_ids,
        "J": junction_ids,
        "DP": decision_ids,
    }
    for kind, actual in by_kind.items():
        mapped = coverage_sets[kind]
        for unit_id in sorted(actual - mapped):
            add(findings, "ERROR", "UNITS", units[unit_id], f"orphan canonical {kind} unit is absent from the current architecture mapping corpus")

    # Ledger/map numeric IDs must resolve back to actual canonical UNIT records.
    for unit_id in sorted(block_ids - by_kind["BLOCK"]):
        add(findings, "ERROR", "UNITS", str(policy["block_map"]), f"stale Block mapping has no canonical UNIT.md: {unit_id}")
    for unit_id in sorted(junction_ids - by_kind["J"]):
        add(findings, "ERROR", "JUNCTION", str(policy["junction_ledger"]), f"stale Junction ledger entry has no canonical UNIT.md: {unit_id}")
    for unit_id in sorted(decision_ids - by_kind["DP"]):
        add(findings, "ERROR", "DECISION", str(policy["decision_ledger"]), f"stale Decision ledger entry has no canonical UNIT.md: {unit_id}")

    # Explicit Junction -> Claim linkage integrity.
    for junction_id, claim_id in policy.get("junction_claim_links", {}).items():
        if junction_id not in junction_text:
            add(findings, "ERROR", "JUNCTION", str(policy["junction_ledger"]), f"required Junction link is absent: {junction_id}")
        if claim_id not in junction_text:
            add(findings, "ERROR", "JUNCTION", str(policy["junction_ledger"]), f"Junction {junction_id} does not expose linked Claim {claim_id}")
        if claim_id not in registry_text:
            add(findings, "ERROR", "JUNCTION", registry_rel, f"Junction {junction_id} links unregistered Claim {claim_id}")

    stats["units"] = {
        "canonical_total": len(units),
        "bricks": len(by_kind["BR"]),
        "blocks": len(by_kind["BLOCK"]),
        "junctions": len(by_kind["J"]),
        "decisions": len(by_kind["DP"]),
        "orphan_actual_units": sum(1 for f in findings if f.level == "ERROR" and "orphan canonical" in f.message),
        "stale_mapped_units": sum(1 for f in findings if f.level == "ERROR" and "stale " in f.message.lower()),
    }

    return findings, stats


def main() -> int:
    parser = argparse.ArgumentParser(description="Audit BOMA PDSA-ARCH-002 cross-stage architecture consistency")
    parser.add_argument("--root", type=Path, default=Path.cwd())
    parser.add_argument("--policy", type=Path, default=DEFAULT_POLICY)
    parser.add_argument("--json-out", type=Path)
    args = parser.parse_args()

    root = args.root.resolve()
    try:
        findings, stats = audit(root, args.policy)
    except (OSError, KeyError, ValueError, json.JSONDecodeError, RuntimeError) as exc:
        print(f"architecture consistency audit configuration/runtime error: {exc}", file=sys.stderr)
        return 2

    errors = [f for f in findings if f.level == "ERROR"]
    result = {
        "status": "PASS" if not errors else "REVIEW_REQUIRED",
        "policy_schema": "BOMA-ARCHITECTURE-CONSISTENCY-POLICY-001",
        "stats": stats,
        "findings": [asdict(f) for f in findings],
    }
    rendered = json.dumps(result, indent=2, ensure_ascii=False) + "\n"
    if args.json_out:
        out = args.json_out if args.json_out.is_absolute() else root / args.json_out
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0 if not errors else 1


if __name__ == "__main__":
    raise SystemExit(main())
