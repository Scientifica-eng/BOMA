# ST2-EXP-004 Failure 010 — GitHub App Workflow Push Permission

**Phase:** post-Study lifecycle provenance repair  
**Failed exact head:** `14a6d63b0f8be87237c7f42280f326e589baa7e8`  
**Workflow:** `BOMA ST2-EXP-004 Lifecycle Closure`  
**Run:** `32841397381`  
**Job:** `apply verified closed-state provenance repair`  
**Local repair commit:** `e5237f7` (`Apply verified ST2-EXP-004 closed-state provenance repair`)  
**Classification:** `CI DELIVERY PERMISSION / WORKFLOW-FILE PUSH REJECTED`  
**Mathematical impact:** `NONE`

## Observed result

The repair job passed its bounded rendering step and all three required audits
with empty residual sets:

- `ST2_EXP_011_LIFECYCLE_CLOSED_PASS`, mode
  `ST2_EXP_004_CLOSED_INTEGRATION_PENDING`;
- `ST2_EXP_004_LIFECYCLE_CLOSED_PASS`;
- `ST2_EXP_001_003_HISTORICAL_CLOSURE_PASS`.

It then created local commit `e5237f7`, changing only the intended bounded
repair paths and deleting the temporary renderer workflow. GitHub rejected the
push because the Actions GitHub App token may not create or update workflow
files without the separate `workflows` permission:

```text
refusing to allow a GitHub App to create or update workflow
.github/workflows/boma-st2-exp-004-r-total-order-logical-regime.yml
without workflows permission
```

The remote experiment branch therefore did **not** receive the local repair
commit.

## Root cause

The delivery job combined two categories with different authorization
requirements:

1. provenance/current-state files that the Actions token may push normally;
2. `.github/workflows/*` changes, which GitHub protects behind an additional
   workflow-modification permission.

This is an authorization-boundary failure, not a failure of the rendered
repair or of any mathematical/governance audit.

## Corrective boundary

The repair is split by authorization surface:

- the temporary CI job may commit and push only non-workflow provenance files;
- workflow cleanup/replay changes are applied separately through the already
  authorized GitHub Contents API;
- the same exact-head and bounded-path checks remain in force;
- no Frozen Plan, Final Study/Act, accepted Q/R/C source or manifest,
  architectural `SELECTS`, Block, Decision Point, Junction, Claim meaning, or
  accepted export changes.

This failure record is immutable after creation.
