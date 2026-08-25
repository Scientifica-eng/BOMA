# ST2-EXP-004 Failure 002 — Gate-B Failure Before Evidence with stderr Uncaptured

**Experiment:** `ST2-EXP-004`  
**Gate:** `B — independent no-F-04 R survivor assembly`  
**Date:** `2026-08-25`  
**Disposition:** `PRESERVED EXECUTION / OBSERVABILITY FAILURE — UNDERLYING GATE-B CAUSE NOT YET CLASSIFIED`

## Exact failed evidence

```text
head      d70077c21b8b9095b424780803ef99f350157fdf
run       32829594272
job       97745062266
artifact  9556226938
sha256    2454502a10b9cf8ece4f0650c82188f3d80ecc0d6cb6cf258b6afd32e75be37b
result    FAILURE
```

Frozen-authority verification, accepted-control immutability, and pinned Lean
setup all passed. The failure occurred in:

```text
Build and kernel-check no-F04 survivor assembly
```

The artifact contains the exact provenance record but contains neither the
proposed no-F-04 manifest nor the Gate-B JSON. The captured Gate-B log is empty.

## Why the underlying cause is not yet classified

The Python Gate-B auditor writes fatal diagnostic messages to `stderr`, while
the workflow invocation used:

```text
... | tee /tmp/st2-exp-004-gate-b.log
```

which preserved `stdout` only. Therefore the historical run proves that Gate B
failed before producing its result artifacts, but it does **not** preserve the
specific diagnostic needed to decide whether the failure was:

- source-packaging coupling;
- an auditor assumption error;
- a target/source mapping error;
- or another execution defect.

No mathematical conclusion is permitted from this run alone.

## Correction rule

Change only workflow observability so the next run captures both stdout and
stderr, for example:

```text
... 2>&1 | tee /tmp/st2-exp-004-gate-b.log
```

Do not change the Frozen Plan, accepted sources/manifests, target manifest, or
Gate-B survivor algorithm before the underlying diagnostic is observed.

This record remains historical after the diagnostic rerun.
