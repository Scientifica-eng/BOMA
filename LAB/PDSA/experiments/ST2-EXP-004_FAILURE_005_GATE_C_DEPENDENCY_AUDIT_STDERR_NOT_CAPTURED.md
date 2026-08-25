# ST2-EXP-004 Failure 005 — Gate C dependency-audit stderr not captured

**Experiment:** `ST2-EXP-004`  
**Gate:** `C — conditional comparability interface isolation`  
**Classification:** `CI / evidence-observability failure; mathematical status unresolved`  
**Exact head:** `766b93b5d635d43a4c5bceb81fcb172bd09bbc17`

## Evidence

```text
run       32833119635
job       97755996498
artifact  9557560339
sha256    8fe1758ce826c5fd6f151dfe09563209338d1f4d0c1ffe94a3c31d63ff2e591b
result    FAILURE
```

The run passed:

```text
exact-head / frozen-authority checks
accepted Q/R/C immutability checks
Gate-C source forbidden-token checks
pinned Lean setup
Gate-B survivor-base regeneration and Gate-C source append
```

It failed at `Kernel and dependency audit Gate-C roots` before the axiom-print step.

The uploaded dependency log is empty and no dependency JSON was produced because the workflow piped only stdout into `tee`; `lean_dependency_audit.py` reports command/elaboration failures on stderr. Therefore this run does **not** establish whether the Gate-C Lean probe itself is invalid or whether the failure is only an audit invocation/elaboration issue.

## Correction boundary

The next correction is evidence-only:

```text
capture stderr with `2>&1 | tee ...`
```

No Frozen Plan, accepted source, accepted manifest, theorem statement, or Gate-C research source is changed by that observability correction.

This record is historical and must not be overwritten after the diagnostic is recovered.