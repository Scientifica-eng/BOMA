#!/usr/bin/env python3
"""Prototype BOMA theorem-level dependency-closure orchestrator.

The accepted assembly is first compiled *without* importing Lean's metaprogramming
API. The resulting .olean is then imported by a separate audit module that may
import `Lean` and execute `LeanDependencyExtractor.lean`.

This separation is deliberate: audit metaprogramming infrastructure must not
change the elaboration environment of the accepted mathematical assembly.

The prototype computes the transitive declaration closure inside the accepted
assembly module and stops recursion at declarations owned by other modules.
Those boundary leaves are candidates for Trusted Base classification.

Multiple targets are supported. Their closures are unioned by declaration name
and dependency edge so a stage without one synthetic integration theorem can be
audited without inventing a new accepted certificate.
"""

from __future__ import annotations

import argparse
import json
import os
import re
import subprocess
import sys
import tempfile
from dataclasses import asdict, dataclass, replace
from pathlib import Path
from typing import Iterable


EXTRACTOR = Path("LAB/00_ARCHITECTURE/tools/LeanDependencyExtractor.lean")

GENERATED_SOURCE_OVERRIDES: dict[str, tuple[str, str]] = {
    "BOMA.NCore.RB001.ind.match_1": (
        "LAB/payloads/lean/NCore/NCoreRB001.lean",
        "BOMA.NCore.RB001.ind",
    ),
}


@dataclass(frozen=True)
class SourceRange:
    path: str
    start_line: int
    end_line: int


@dataclass(frozen=True)
class InternalDecl:
    name: str
    kind: str
    start_line: int | None
    end_line: int | None
    source: str | None
    source_resolution: str
    source_anchor: str | None


@dataclass(frozen=True)
class ExternalDecl:
    name: str
    kind: str
    module: str


@dataclass(frozen=True)
class DependencyEdge:
    consumer: str
    dependency: str


def run(cmd: list[str], *, cwd: Path, env: dict[str, str] | None = None) -> subprocess.CompletedProcess[str]:
    proc = subprocess.run(
        cmd,
        cwd=cwd,
        env=env,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )
    if proc.returncode != 0:
        print(proc.stdout, file=sys.stderr)
        raise RuntimeError(f"command failed ({proc.returncode}): {' '.join(cmd)}")
    return proc


def load_manifest(root: Path, rel: str) -> list[str]:
    path = root / rel
    if not path.is_file():
        raise FileNotFoundError(f"manifest missing: {rel}")
    entries: list[str] = []
    seen: set[str] = set()
    for raw in path.read_text(encoding="utf-8").splitlines():
        item = raw.strip()
        if not item or item.startswith("#"):
            continue
        p = Path(item)
        if p.is_absolute() or ".." in p.parts:
            raise ValueError(f"unsafe manifest path: {item}")
        if item in seen:
            raise ValueError(f"duplicate manifest path: {item}")
        if not (root / p).is_file():
            raise FileNotFoundError(f"manifest source missing: {item}")
        seen.add(item)
        entries.append(item)
    if not entries:
        raise ValueError(f"empty manifest: {rel}")
    return entries


def legal_module_name(stage: str) -> str:
    stem = re.sub(r"[^A-Za-z0-9_]", "", stage.title())
    if not stem or not stem[0].isalpha():
        stem = "Stage" + stem
    return "BOMAAudit" + stem + "Accepted"


def build_assembly(root: Path, entries: Iterable[str], output: Path) -> list[SourceRange]:
    ranges: list[SourceRange] = []
    line = 1
    chunks: list[str] = []

    for rel in entries:
        marker = f"/- BOMA_AUDIT_SOURCE_BEGIN {rel} -/\n"
        chunks.append(marker)
        line += marker.count("\n")

        text = (root / rel).read_text(encoding="utf-8")
        if not text.endswith("\n"):
            text += "\n"
        start = line
        chunks.append(text)
        line += text.count("\n")
        end = max(start, line - 1)
        ranges.append(SourceRange(rel, start, end))

        end_marker = f"/- BOMA_AUDIT_SOURCE_END {rel} -/\n"
        chunks.append(end_marker)
        line += end_marker.count("\n")

    output.write_text("".join(chunks), encoding="utf-8")
    return ranges


def extractor_body(root: Path) -> str:
    text = (root / EXTRACTOR).read_text(encoding="utf-8")
    lines = text.splitlines()
    while lines and (not lines[0].strip() or lines[0].lstrip().startswith("import ")):
        lines.pop(0)
    return "\n".join(lines) + "\n"


def source_for_line(ranges: list[SourceRange], line: int | None) -> str | None:
    if line is None:
        return None
    for candidate in (line, line + 1, line - 1):
        for r in ranges:
            if r.start_line <= candidate <= r.end_line:
                return r.path
    return None


def parse_int(value: str) -> int | None:
    value = value.strip()
    if not value:
        return None
    try:
        return int(value)
    except ValueError:
        return None


def infer_generated_sources(internal: list[InternalDecl]) -> list[InternalDecl]:
    """Associate range-less generated/private declarations with source provenance."""

    mapped = [d for d in internal if d.source is not None]
    out: list[InternalDecl] = []
    for decl in internal:
        if decl.source is not None:
            out.append(decl)
            continue

        candidates = [
            anchor
            for anchor in mapped
            if decl.name.startswith(anchor.name + ".")
        ]
        if candidates:
            anchor = max(candidates, key=lambda d: len(d.name))
            out.append(
                replace(
                    decl,
                    source=anchor.source,
                    source_resolution="generated-prefix",
                    source_anchor=anchor.name,
                )
            )
            continue

        override = GENERATED_SOURCE_OVERRIDES.get(decl.name)
        if override is not None:
            source, anchor_name = override
            out.append(
                replace(
                    decl,
                    source=source,
                    source_resolution="generated-override",
                    source_anchor=anchor_name,
                )
            )
            continue

        out.append(decl)
    return out


def parse_output(
    text: str,
    ranges: list[SourceRange],
) -> tuple[list[InternalDecl], list[ExternalDecl], list[str], list[DependencyEdge], dict[str, str]]:
    internal: list[InternalDecl] = []
    external: list[ExternalDecl] = []
    unresolved: list[str] = []
    edge_pairs: set[tuple[str, str]] = set()
    meta: dict[str, str] = {}

    for raw in text.splitlines():
        fields = raw.rstrip("\n").split("\t")
        if not fields:
            continue
        tag = fields[0]
        if tag == "BOMA_INTERNAL" and len(fields) >= 5:
            start = parse_int(fields[3])
            end = parse_int(fields[4])
            source = source_for_line(ranges, start)
            internal.append(
                InternalDecl(
                    name=fields[1],
                    kind=fields[2],
                    start_line=start,
                    end_line=end,
                    source=source,
                    source_resolution="direct-range" if source else "unmapped",
                    source_anchor=None,
                )
            )
        elif tag == "BOMA_EXTERNAL" and len(fields) >= 4:
            external.append(ExternalDecl(fields[1], fields[2], fields[3]))
        elif tag == "BOMA_UNRESOLVED" and len(fields) >= 2:
            unresolved.append(fields[1])
        elif tag == "BOMA_EDGE" and len(fields) >= 3:
            edge_pairs.add((fields[1], fields[2]))
        elif tag == "BOMA_AUDIT" and len(fields) >= 3:
            meta[fields[1]] = "\t".join(fields[2:])

    edges = [DependencyEdge(a, b) for a, b in sorted(edge_pairs)]
    return internal, external, unresolved, edges, meta


def dedupe_internal(items: list[InternalDecl]) -> list[InternalDecl]:
    """Union repeated target closures by declaration name.

    Prefer a record that already carries a direct source range. Multiple target
    commands otherwise print the same internal declarations repeatedly.
    """

    by_name: dict[str, InternalDecl] = {}
    for item in items:
        prev = by_name.get(item.name)
        if prev is None or (prev.source is None and item.source is not None):
            by_name[item.name] = item
    return list(by_name.values())


def dedupe_external(items: list[ExternalDecl]) -> list[ExternalDecl]:
    by_name: dict[str, ExternalDecl] = {}
    for item in items:
        prev = by_name.get(item.name)
        if prev is None:
            by_name[item.name] = item
        elif prev.module != item.module or prev.kind != item.kind:
            raise ValueError(f"inconsistent external declaration metadata across targets: {item.name}")
    return list(by_name.values())


def main() -> int:
    parser = argparse.ArgumentParser(description="Prototype BOMA Lean declaration dependency audit")
    parser.add_argument("--stage", required=True, help="stage label, e.g. R or Q")
    parser.add_argument("--manifest", required=True, help="accepted source manifest relative to repo root")
    parser.add_argument("--target", action="append", required=True, help="fully-qualified Lean declaration; repeatable")
    parser.add_argument("--root", type=Path, default=Path.cwd(), help="repository root")
    parser.add_argument("--json-out", type=Path, help="write JSON result to this path")
    args = parser.parse_args()

    root = args.root.resolve()
    try:
        entries = load_manifest(root, args.manifest)
        module = legal_module_name(args.stage)

        with tempfile.TemporaryDirectory(prefix=".boma-lean-deps-", dir=root) as td_raw:
            td = Path(td_raw)
            assembly = td / f"{module}.lean"
            olean = td / f"{module}.olean"
            ranges = build_assembly(root, entries, assembly)

            run(
                ["lake", "env", "lean", "-o", str(olean), str(assembly)],
                cwd=root,
            )

            runner = td / "BOMADependencyRunner.lean"
            commands = "\n".join(f"#boma_dependency_closure {t}" for t in args.target)
            runner.write_text(
                f"import Lean\nimport {module}\n\n"
                + extractor_body(root)
                + "\n"
                + commands
                + "\n",
                encoding="utf-8",
            )

            env = os.environ.copy()
            existing = env.get("LEAN_PATH", "")
            env["LEAN_PATH"] = str(td) + (os.pathsep + existing if existing else "")
            audit_proc = run(["lake", "env", "lean", str(runner)], cwd=root, env=env)

            raw_internal, external, unresolved, edges, meta = parse_output(audit_proc.stdout, ranges)

        raw_internal = dedupe_internal(raw_internal)
        external = dedupe_external(external)
        unresolved = sorted(set(unresolved))

        raw_unmapped = sorted(d.name for d in raw_internal if d.source is None)
        internal = infer_generated_sources(raw_internal)
        internal = dedupe_internal(internal)
        unmapped_internal = sorted(d.name for d in internal if d.source is None)
        inferred_generated = sorted(
            d.name for d in internal
            if d.source_resolution in {"generated-prefix", "generated-override"}
        )
        internal_axioms = sorted({d.name for d in internal if d.kind == "axiom"})
        external_modules = sorted({d.module for d in external})

        result = {
            "status": "PROTOTYPE_PASS" if not unresolved and not internal_axioms else "PROTOTYPE_FAIL",
            "scope": (
                "union of transitive declaration closures inside the compiled accepted assembly module; "
                "direct consumer→dependency edges retained; external module leaves are boundary candidates "
                "for Trusted Base classification; Claim-Registry semantic comparison remains separate"
            ),
            "stage": args.stage,
            "manifest": args.manifest,
            "targets": args.target,
            "assembly_module": meta.get("MODULE", module),
            "source_files": [asdict(r) for r in ranges],
            "counts": {
                "internal": len(internal),
                "external_boundary": len(external),
                "dependency_edges": len(edges),
                "unresolved": len(unresolved),
                "raw_unmapped_internal_ranges": len(raw_unmapped),
                "generated_source_inferences": len(inferred_generated),
                "unmapped_internal_ranges": len(unmapped_internal),
                "internal_axioms": len(internal_axioms),
                "targets": len(args.target),
            },
            "internal_axioms": internal_axioms,
            "unresolved": unresolved,
            "raw_unmapped_internal_ranges": raw_unmapped,
            "generated_source_inferences": inferred_generated,
            "unmapped_internal_ranges": unmapped_internal,
            "external_modules": external_modules,
            "internal": [asdict(d) for d in sorted(internal, key=lambda d: d.name)],
            "external_boundary": [asdict(d) for d in sorted(external, key=lambda d: (d.module, d.name))],
            "edges": [asdict(e) for e in edges],
        }

        rendered = json.dumps(result, indent=2, ensure_ascii=False) + "\n"
        if args.json_out:
            out = args.json_out
            if not out.is_absolute():
                out = root / out
            out.parent.mkdir(parents=True, exist_ok=True)
            out.write_text(rendered, encoding="utf-8")
        print(rendered, end="")

        return 0 if result["status"] == "PROTOTYPE_PASS" else 1

    except (OSError, RuntimeError, ValueError, json.JSONDecodeError) as exc:
        print(f"Lean dependency audit error: {exc}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
