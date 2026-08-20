#!/usr/bin/env python3
"""BOMA accepted-source claim-surface audit.

This tool checks the *declared accepted source surface* against the machine-readable
PDSA-ARCH-002 policy. It deliberately does not claim to compute Lean's transitive
theorem/declaration dependency graph.

Exit status:
  0  source-surface policy passes
  1  one or more transparency defects were found
  2  policy/tool invocation error
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable


DEFAULT_POLICY = Path("LAB/00_ARCHITECTURE/CLAIM_SURFACE_POLICY.json")


@dataclass(frozen=True)
class Finding:
    level: str
    stage: str
    path: str
    message: str


def strip_lean_comments_and_strings(text: str) -> str:
    """Remove Lean line/block comments and strings while preserving newlines.

    Lean block comments are nestable. Replacing removed characters by spaces keeps
    line structure stable for diagnostic line numbers and avoids false positives
    from documentary mentions such as `Classical.em` in comments.
    """

    out: list[str] = []
    i = 0
    n = len(text)
    block_depth = 0
    in_string = False

    while i < n:
        c = text[i]
        nxt = text[i + 1] if i + 1 < n else ""

        if block_depth > 0:
            if c == "/" and nxt == "-":
                block_depth += 1
                out.extend((" ", " "))
                i += 2
                continue
            if c == "-" and nxt == "/":
                block_depth -= 1
                out.extend((" ", " "))
                i += 2
                continue
            out.append("\n" if c == "\n" else " ")
            i += 1
            continue

        if in_string:
            if c == "\\" and i + 1 < n:
                out.extend((" ", " "))
                i += 2
                continue
            if c == '"':
                in_string = False
                out.append(" ")
                i += 1
                continue
            out.append("\n" if c == "\n" else " ")
            i += 1
            continue

        if c == "-" and nxt == "-":
            out.extend((" ", " "))
            i += 2
            while i < n and text[i] != "\n":
                out.append(" ")
                i += 1
            continue

        if c == "/" and nxt == "-":
            block_depth = 1
            out.extend((" ", " "))
            i += 2
            continue

        if c == '"':
            in_string = True
            out.append(" ")
            i += 1
            continue

        out.append(c)
        i += 1

    return "".join(out)


def line_number(text: str, offset: int) -> int:
    return text.count("\n", 0, offset) + 1


def load_manifest(root: Path, rel_path: str) -> tuple[list[str], list[str]]:
    path = root / rel_path
    if not path.is_file():
        return [], [f"manifest missing: {rel_path}"]

    entries: list[str] = []
    errors: list[str] = []
    seen: set[str] = set()

    for raw in path.read_text(encoding="utf-8").splitlines():
        item = raw.strip()
        if not item or item.startswith("#"):
            continue
        p = Path(item)
        if p.is_absolute() or ".." in p.parts:
            errors.append(f"unsafe manifest path: {item}")
            continue
        if item in seen:
            errors.append(f"duplicate manifest path: {item}")
            continue
        seen.add(item)
        entries.append(item)

    if not entries:
        errors.append(f"manifest is empty: {rel_path}")
    return entries, errors


def all_matches(pattern: re.Pattern[str], text: str) -> Iterable[re.Match[str]]:
    return pattern.finditer(text)


def audit(root: Path, policy_path: Path) -> tuple[list[Finding], dict[str, dict[str, int]]]:
    full_policy_path = root / policy_path
    if not full_policy_path.is_file():
        raise FileNotFoundError(f"policy missing: {policy_path}")

    policy = json.loads(full_policy_path.read_text(encoding="utf-8"))
    findings: list[Finding] = []
    stats: dict[str, dict[str, int]] = {}

    global_cfg = policy["global"]
    registry_path = root / global_cfg["registry"]
    trusted_path = root / global_cfg["trusted_base"]
    architecture_path = root / global_cfg["claim_architecture"]

    for required in (registry_path, trusted_path, architecture_path):
        if not required.is_file():
            findings.append(Finding("ERROR", "GLOBAL", str(required.relative_to(root)), "required architecture record is missing"))

    registry_text = registry_path.read_text(encoding="utf-8") if registry_path.is_file() else ""
    forbidden_patterns = {
        token: re.compile(rf"(?<![A-Za-z0-9_']){re.escape(token)}(?![A-Za-z0-9_'])")
        for token in global_cfg.get("forbidden_tokens", [])
    }
    classical_pattern = re.compile(r"(?<![A-Za-z0-9_'])Classical(?![A-Za-z0-9_'])")
    quotient_pattern = re.compile(r"(?<![A-Za-z0-9_'])Quotient(?![A-Za-z0-9_'])")

    for stage, cfg in policy["stages"].items():
        stage_errors = 0
        stage_warnings = 0
        files_scanned = 0

        claim_audit = root / cfg["claim_audit"]
        if not claim_audit.is_file():
            findings.append(Finding("ERROR", stage, cfg["claim_audit"], "claim-closure audit is missing"))
            stage_errors += 1

        claim_id = cfg["integration_claim"]
        if claim_id not in registry_text:
            findings.append(Finding("ERROR", stage, global_cfg["registry"], f"integration claim {claim_id} is not registered"))
            stage_errors += 1

        entries, manifest_errors = load_manifest(root, cfg["manifest"])
        for msg in manifest_errors:
            findings.append(Finding("ERROR", stage, cfg["manifest"], msg))
            stage_errors += 1

        allowed_classical = set(cfg.get("classical_allowed_files", []))
        manifest_set = set(entries)
        for allowed in sorted(allowed_classical - manifest_set):
            findings.append(Finding("ERROR", stage, allowed, "classical whitelist entry is not part of this accepted-source manifest"))
            stage_errors += 1

        observed_classical_files: set[str] = set()

        for rel in entries:
            source = root / rel
            if not source.is_file():
                findings.append(Finding("ERROR", stage, rel, "manifest source is missing"))
                stage_errors += 1
                continue

            files_scanned += 1
            raw = source.read_text(encoding="utf-8")
            code = strip_lean_comments_and_strings(raw)

            for token, pattern in forbidden_patterns.items():
                for match in all_matches(pattern, code):
                    findings.append(Finding("ERROR", stage, rel, f"forbidden token `{token}` at line {line_number(code, match.start())}"))
                    stage_errors += 1

            classical_matches = list(all_matches(classical_pattern, code))
            if classical_matches:
                observed_classical_files.add(rel)
                if rel not in allowed_classical:
                    lines = sorted({line_number(code, m.start()) for m in classical_matches})
                    findings.append(Finding("ERROR", stage, rel, f"undeclared `Classical` usage at lines {lines}"))
                    stage_errors += 1

            quotient_matches = list(all_matches(quotient_pattern, code))
            if quotient_matches and not cfg.get("allow_quotient", False):
                lines = sorted({line_number(code, m.start()) for m in quotient_matches})
                findings.append(Finding("ERROR", stage, rel, f"undeclared/forbidden `Quotient` surface at lines {lines}"))
                stage_errors += 1

        for allowed in sorted(allowed_classical - observed_classical_files):
            findings.append(Finding("ERROR", stage, allowed, "classical whitelist entry contains no code-level `Classical` usage; policy may be stale"))
            stage_errors += 1

        stats[stage] = {
            "files_scanned": files_scanned,
            "errors": stage_errors,
            "warnings": stage_warnings,
            "classical_files": len(observed_classical_files),
        }

    return findings, stats


def main() -> int:
    parser = argparse.ArgumentParser(description="Audit BOMA accepted-source transparency surface")
    parser.add_argument("--root", type=Path, default=Path.cwd(), help="repository root")
    parser.add_argument("--policy", type=Path, default=DEFAULT_POLICY, help="policy path relative to repository root")
    parser.add_argument("--json", action="store_true", help="emit JSON instead of human-readable output")
    args = parser.parse_args()

    root = args.root.resolve()
    try:
        findings, stats = audit(root, args.policy)
    except (OSError, KeyError, ValueError, json.JSONDecodeError) as exc:
        print(f"claim-surface audit configuration error: {exc}", file=sys.stderr)
        return 2

    errors = [f for f in findings if f.level == "ERROR"]

    if args.json:
        print(json.dumps({
            "status": "PASS" if not errors else "FAIL",
            "scope": "accepted-source surface only; not theorem-level transitive dependency closure",
            "stats": stats,
            "findings": [f.__dict__ for f in findings],
        }, indent=2, ensure_ascii=False))
    else:
        print("BOMA Claim Surface Audit")
        print("Scope: accepted-source surface only; NOT theorem-level transitive dependency closure")
        for stage, stage_stats in stats.items():
            print(
                f"- {stage}: files={stage_stats['files_scanned']} "
                f"classical_files={stage_stats['classical_files']} "
                f"errors={stage_stats['errors']}"
            )
        for finding in findings:
            print(f"{finding.level}: [{finding.stage}] {finding.path}: {finding.message}")
        print("RESULT:", "PASS" if not errors else "FAIL")

    return 0 if not errors else 1


if __name__ == "__main__":
    raise SystemExit(main())
