#!/usr/bin/env python3
"""Run all accepted-stage theorem transparency audits in one source transaction.

The stage theorem closures remain independent: each stage is extracted against its
own accepted source manifest and Claim-producer policy. The orchestration layer
only serializes execution/evidence production so a shared Registry or audit-tool
change cannot cause cross-workflow cancellation or concurrent branch writes.

This script writes rendered evidence into a temporary tree. The GitHub workflow
promotes that tree in one commit only after verification-input drift checks.
"""

from __future__ import annotations

import argparse
import json
import shutil
import subprocess
import sys
from pathlib import Path
from typing import Any

DEFAULT_MATRIX = Path("LAB/00_ARCHITECTURE/STAGE_TRANSPARENCY_MATRIX.json")
REGISTRY = Path("LAB/00_ARCHITECTURE/CLAIM_REGISTRY.md")
FORMAL_POLICY = Path("LAB/00_ARCHITECTURE/FORMAL_DEPENDENCY_POLICY.json")
AUDIT_TOOL = Path("LAB/00_ARCHITECTURE/tools/lean_dependency_audit.py")
CLASSIFY_TOOL = Path("LAB/00_ARCHITECTURE/tools/formal_dependency_classify.py")
COMPARE_TOOL = Path("LAB/00_ARCHITECTURE/tools/formal_claim_producer_compare.py")


def load_json(path: Path) -> dict[str, Any]:
    with path.open("r", encoding="utf-8") as fh:
        data = json.load(fh)
    if not isinstance(data, dict):
        raise ValueError(f"expected JSON object: {path}")
    return data


def run_logged(cmd: list[str], root: Path, log_path: Path) -> int:
    proc = subprocess.run(
        cmd,
        cwd=root,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )
    log_path.parent.mkdir(parents=True, exist_ok=True)
    log_path.write_text(proc.stdout, encoding="utf-8")
    print(f"$ {' '.join(cmd)}")
    print(proc.stdout, end="" if proc.stdout.endswith("\n") or not proc.stdout else "\n")
    return proc.returncode


def json_status(path: Path, default: str) -> str:
    if not path.is_file():
        return default
    try:
        return str(load_json(path).get("status", default))
    except (OSError, ValueError, json.JSONDecodeError):
        return default


def tail_text(path: Path, lines: int = 120) -> str:
    if not path.is_file():
        return ""
    data = path.read_text(encoding="utf-8").splitlines()
    return "\n".join(data[-lines:])


def producer_targets(policy: dict[str, Any]) -> list[str]:
    mode = policy.get("root_mode", "single_target")
    if mode == "single_target":
        target = policy.get("target")
        if not isinstance(target, str) or not target:
            raise ValueError("single_target producer policy has no target")
        return [target]
    if mode == "producer_union":
        targets = [t for t in policy.get("audit_targets", []) if isinstance(t, str) and t]
        if not targets:
            raise ValueError("producer_union policy has no audit_targets")
        return targets
    raise ValueError(f"unsupported root_mode: {mode}")


def placeholder(path: Path, status: str, reason: str, audited_sha: str, run_id: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(
        json.dumps(
            {
                "status": status,
                "reason": reason,
                "verified_commit": audited_sha,
                "workflow_run": run_id,
            },
            indent=2,
        )
        + "\n",
        encoding="utf-8",
    )


def render_stage_evidence(
    *,
    root: Path,
    stage_cfg: dict[str, Any],
    policy: dict[str, Any],
    work: Path,
    rendered_root: Path,
    audited_sha: str,
    run_id: str,
    toolchain: str,
    audit_rc: int,
    classify_rc: int | None,
    compare_rc: int | None,
) -> dict[str, Any]:
    slug = str(stage_cfg["slug"])
    stage_name = str(stage_cfg["stage"])
    prefix = str(stage_cfg["evidence_prefix"])
    out_dir = rendered_root / str(stage_cfg["evidence_dir"])
    out_dir.mkdir(parents=True, exist_ok=True)

    closure_tmp = work / f"{slug}_closure.json"
    classification_tmp = work / f"{slug}_classification.json"
    producer_tmp = work / f"{slug}_producer.json"
    audit_log = work / f"{slug}_audit.log"
    classify_log = work / f"{slug}_classify.log"
    producer_log = work / f"{slug}_producer.log"

    closure_out = out_dir / f"{prefix}_FORMAL_DEPENDENCY_CLOSURE_PROTOTYPE_LATEST.json"
    classification_out = out_dir / f"{prefix}_FORMAL_DEPENDENCY_CLASSIFICATION_PROTOTYPE_LATEST.json"
    producer_out = out_dir / f"{prefix}_FORMAL_CLAIM_PRODUCER_COMPARISON_PROTOTYPE_LATEST.json"
    md_out = out_dir / f"{prefix}_FORMAL_DEPENDENCY_CLOSURE_PROTOTYPE_LATEST.md"

    if closure_tmp.is_file():
        shutil.copy2(closure_tmp, closure_out)
    else:
        placeholder(closure_out, "PROTOTYPE_FAIL", "dependency extractor did not produce JSON output", audited_sha, run_id)

    if classification_tmp.is_file():
        shutil.copy2(classification_tmp, classification_out)
    else:
        placeholder(
            classification_out,
            "SKIPPED" if classify_rc is None else "NO_OUTPUT",
            "semantic classification did not produce JSON output",
            audited_sha,
            run_id,
        )

    if producer_tmp.is_file():
        shutil.copy2(producer_tmp, producer_out)
    else:
        placeholder(
            producer_out,
            "SKIPPED" if compare_rc is None else "NO_OUTPUT",
            "Claim/producer comparison did not produce JSON output",
            audited_sha,
            run_id,
        )

    closure_status = json_status(closure_tmp, "PROTOTYPE_FAIL")
    classification_status = json_status(classification_tmp, "SKIPPED" if classify_rc is None else "NO_OUTPUT")
    producer_status = json_status(producer_tmp, "SKIPPED" if compare_rc is None else "NO_OUTPUT")
    root_mode = str(policy.get("root_mode", "single_target"))

    log_source = producer_log if producer_log.is_file() else classify_log if classify_log.is_file() else audit_log
    log_tail = tail_text(log_source)

    md = f"""# {stage_name} Formal Dependency Closure — Matrix Evidence

**Status:** {closure_status}  
**Boundary classification:** {classification_status}  
**Claim/producer comparison:** {producer_status}  
**Audited source commit:** `{audited_sha}`  
**Workflow run ID:** `{run_id}`  
**Pinned toolchain:** `{toolchain}`  
**Root mode:** `{root_mode}`  
**Accepted assembly manifest:** `{stage_cfg['manifest']}`  
**Execution:** canonical cross-stage transparency matrix

| Step | Return code |
|---|---:|
| dependency extraction | {audit_rc} |
| formal boundary classification | {classify_rc if classify_rc is not None else 'SKIPPED'} |
| Claim/producer comparison | {compare_rc if compare_rc is not None else 'SKIPPED'} |

## Scope

The cross-stage workflow serializes execution and evidence promotion only. The mathematical/formal closure for this stage remains independently defined by its own accepted manifest and Claim-producer policy.

"""
    if log_tail:
        md += "## Audit log tail\n\n```text\n" + log_tail + "\n```\n"
    md_out.write_text(md, encoding="utf-8")

    passed = (
        audit_rc == 0
        and classify_rc == 0
        and compare_rc == 0
        and closure_status == "PROTOTYPE_PASS"
        and classification_status == "CLASSIFICATION_PASS"
        and producer_status == "CLAIM_PRODUCER_PASS"
    )
    return {
        "stage": stage_name,
        "slug": slug,
        "root_mode": root_mode,
        "audit_rc": audit_rc,
        "classify_rc": classify_rc,
        "compare_rc": compare_rc,
        "closure_status": closure_status,
        "classification_status": classification_status,
        "producer_status": producer_status,
        "passed": passed,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description="Run BOMA theorem transparency for every accepted stage")
    parser.add_argument("--root", type=Path, default=Path.cwd())
    parser.add_argument("--matrix", type=Path, default=DEFAULT_MATRIX)
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--rendered-root", type=Path, required=True)
    parser.add_argument("--audited-sha", required=True)
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--toolchain", required=True)
    parser.add_argument("--summary-out", type=Path, required=True)
    args = parser.parse_args()

    root = args.root.resolve()
    work = args.work_dir.resolve()
    rendered_root = args.rendered_root.resolve()
    work.mkdir(parents=True, exist_ok=True)
    rendered_root.mkdir(parents=True, exist_ok=True)

    try:
        matrix = load_json(root / args.matrix)
        stages = matrix.get("stages", [])
        if not isinstance(stages, list) or not stages:
            raise ValueError("stage transparency matrix has no stages")

        results: list[dict[str, Any]] = []
        for raw_cfg in stages:
            if not isinstance(raw_cfg, dict):
                raise ValueError("stage matrix entry is not an object")
            cfg = raw_cfg
            stage_name = str(cfg["stage"])
            slug = str(cfg["slug"])
            manifest = str(cfg["manifest"])
            producer_policy_path = root / str(cfg["producer_policy"])
            producer_policy = load_json(producer_policy_path)
            targets = producer_targets(producer_policy)

            closure = work / f"{slug}_closure.json"
            classification = work / f"{slug}_classification.json"
            producer = work / f"{slug}_producer.json"
            audit_log = work / f"{slug}_audit.log"
            classify_log = work / f"{slug}_classify.log"
            producer_log = work / f"{slug}_producer.log"

            target_args: list[str] = []
            for target in targets:
                target_args.extend(["--target", target])

            audit_cmd = [
                sys.executable,
                str(AUDIT_TOOL),
                "--stage",
                stage_name,
                "--manifest",
                manifest,
                *target_args,
                "--json-out",
                str(closure),
            ]
            audit_rc = run_logged(audit_cmd, root, audit_log)

            classify_rc: int | None = None
            compare_rc: int | None = None
            if audit_rc == 0:
                classify_cmd = [
                    sys.executable,
                    str(CLASSIFY_TOOL),
                    "--closure",
                    str(closure),
                    "--policy",
                    str(FORMAL_POLICY),
                    "--json-out",
                    str(classification),
                ]
                classify_rc = run_logged(classify_cmd, root, classify_log)

            if classify_rc == 0:
                compare_cmd = [
                    sys.executable,
                    str(COMPARE_TOOL),
                    "--closure",
                    str(closure),
                    "--classification",
                    str(classification),
                    "--policy",
                    str(cfg["producer_policy"]),
                    "--registry",
                    str(REGISTRY),
                    "--json-out",
                    str(producer),
                ]
                compare_rc = run_logged(compare_cmd, root, producer_log)

            result = render_stage_evidence(
                root=root,
                stage_cfg=cfg,
                policy=producer_policy,
                work=work,
                rendered_root=rendered_root,
                audited_sha=args.audited_sha,
                run_id=args.run_id,
                toolchain=args.toolchain,
                audit_rc=audit_rc,
                classify_rc=classify_rc,
                compare_rc=compare_rc,
            )
            results.append(result)

        all_pass = all(item["passed"] for item in results)
        summary = {
            "status": "PASS" if all_pass else "REVIEW_REQUIRED",
            "matrix_schema": matrix.get("schema"),
            "audited_source": args.audited_sha,
            "workflow_run": args.run_id,
            "toolchain": args.toolchain,
            "stages": results,
        }
        args.summary_out.parent.mkdir(parents=True, exist_ok=True)
        args.summary_out.write_text(json.dumps(summary, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
        print(json.dumps(summary, indent=2, ensure_ascii=False))
        return 0 if all_pass else 1

    except (OSError, KeyError, ValueError, json.JSONDecodeError) as exc:
        print(f"stage transparency matrix error: {exc}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
