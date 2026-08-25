# ST2-EXP-004 Failure 009 — Repair Job `__pycache__` False Positive

**Phase:** post-Study lifecycle provenance repair  
**Failed exact head:** `ab8c833c50af3b9cb7bc637566fcb898719cd6f0`  
**Workflow:** `BOMA ST2-EXP-004 Lifecycle Closure`  
**Run:** `32841161796`  
**Job:** `apply verified closed-state provenance repair`  
**Classification:** `CI PATH-GUARD FALSE POSITIVE / PYTHON BYTECODE CACHE`  
**Mathematical impact:** `NONE`

## Observed result

Before the failure, the bounded repair workspace successfully produced all
three required lifecycle results with empty residual sets:

- `ST2_EXP_011_LIFECYCLE_CLOSED_PASS`, mode
  `ST2_EXP_004_CLOSED_INTEGRATION_PENDING`;
- `ST2_EXP_004_LIFECYCLE_CLOSED_PASS`;
- `ST2_EXP_001_003_HISTORICAL_CLOSURE_PASS`.

The job then failed its changed-path allowlist because `python3 -m py_compile`
created the untracked directory:

```text
LAB/00_ARCHITECTURE/tools/__pycache__/
```

No repair commit was created or pushed by the failed run.

## Root cause

The path firewall correctly rejected an unlisted working-tree path, but the
path was generated mechanically by the audit compilation step rather than by
the intended repository repair. The repair content itself had already passed
the three governance/lifecycle auditors.

## Corrective boundary

The correction is limited to removing generated Python bytecode/cache paths
before evaluating the repository changed-path allowlist. The allowlist itself
is not widened. No Frozen Plan, Study/Act, accepted source, accepted manifest,
Claim, Block, Decision Point, Junction, `SELECTS`, or mathematical result is
changed.

This failure record is immutable after creation.
