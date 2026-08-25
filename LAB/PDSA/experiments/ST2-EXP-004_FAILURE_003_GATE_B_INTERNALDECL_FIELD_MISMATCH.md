# ST2-EXP-004 Failure 003 — Gate-B `InternalDecl` Field Mismatch

**Experiment:** `ST2-EXP-004`  
**Gate:** `B — independent no-F-04 R survivor assembly`  
**Date:** `2026-08-25`  
**Disposition:** `PRESERVED AUDITOR IMPLEMENTATION FAILURE — NO MATHEMATICAL RESULT`

## Exact failed evidence

```text
head      d0b2983c0242f6ca1eb8e849912a99321933dc7e
run       32829769552
job       97745664111
artifact  9556298854
sha256    026058f8ab91facf00cbd5c49a9eadf6b4240ac811c76a1a5300c5af4c4be994
result    FAILURE
```

The frozen-authority check, accepted-control immutability check, and pinned Lean
setup all passed. The workflow reached the Gate-B auditor, and stderr was
successfully preserved.

## Preserved diagnostic

The auditor terminated before generating a survivor manifest with:

```text
AttributeError: 'InternalDecl' object has no attribute 'source_path'
```

The repository authority `lean_dependency_audit.py` defines `InternalDecl` with:

```text
source: str | None
```

not `source_path`.

Therefore this run did not test source-level no-F-04 survivability. It failed in
Python target/source mapping before the alternative assembly existed.

## Correction rule

Change only the Gate-B auditor's field access from the nonexistent
`InternalDecl.source_path` to the existing `InternalDecl.source` field. Preserve
all classification logic, target manifest, accepted controls, F-04 exclusion,
and Frozen Plan unchanged.

No Claim, theorem, or experiment-level PASS/FAIL may be inferred from this run.
