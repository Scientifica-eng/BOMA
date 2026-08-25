# ST2-EXP-004 Failure 013 — Post-Closure Gate-A Active-State Assertion

**Phase:** post-Study lifecycle-closed CI replay  
**Failed exact head:** `209ea191a4f5be0c036814978258c181255204c9`  
**Workflow:** `BOMA ST2-EXP-004 R Total-Order Logical Regime — Gate A`  
**Run:** `32842063699`  
**Job:** `97785743560` — `verify frozen controls and measure F-04 declaration closures`  
**Failed step:** `Verify Gate-0 lifecycle and single active experiment`  
**Artifact:** `9561131684` — `st2-exp-004-gate-a-32842063699`  
**Artifact SHA-256:** `29734e781e521e03652db57075e2e876b03a74aaee5cf91e4740fef2fd344738`  
**Classification:** `POST-CLOSURE CI / STALE ACTIVE-LIFECYCLE EXPECTATION`  
**Mathematical impact:** `NONE`

## Observed failure

The exact-head guard passed at `209ea191a4f5be0c036814978258c181255204c9`.
The immutable Frozen Plan check passed. The workflow also proved that the
accepted Q/R/C manifests, every source listed by those manifests, the protected
R/C interface files, `BOMA-C-R-DEP-001`, and `R-DP-003` were unchanged from the
frozen accepted reference `50f3031b8d2657cbe0710e73e5935d997d40e49b`.

The ST2-EXP-011 lifecycle audit then passed, and the autonomous research-program
audit passed with `state=NO_ACTIVE_PROGRAM` and `active_program_id=None`.
The following legacy Gate-0 assertion nevertheless required:

`d["active_experiment"] == "ST2-EXP-004"`

The lifecycle-closed ledger correctly contained `active_experiment = null`, so
the inline Python guard raised `AssertionError: None`. Subsequent Gate-A target
validation and Lean measurement steps were skipped in this replay.

## Root cause

The Gate-A workflow retained an activation-era invariant after ST2-EXP-004 had
already been lifecycle-closed. The canonical closed-state auditor requires
`active_experiment` to be null and requires the ST2-EXP-004 record to remain
`CLOSED / PASS / EXACT F-04 IMPACT CLASSIFIED...`. The failed replay therefore
compared a valid closed lifecycle state against an obsolete ACTIVE-state
precondition.

This is a governance/CI lifecycle-state mismatch. It is not a regression of the
historical Gate-A result and does not invalidate the already preserved exact
Gate-A evidence.

## Corrective boundary

The correction must make post-closure CI read-only and lifecycle-aware. It may
validate immutable historical Gate evidence, the Frozen Plan, accepted-control
immutability, and canonical closed-state provenance, but it must not regenerate
or reinterpret the scientific result as a new experiment. Temporary
write-capable provenance-repair machinery must be removed after closure.

No accepted Q/R/C source or accepted manifest, selected route, Claim, Block,
Decision Point, Junction, or accepted export may change as part of this repair.

This failure record is immutable after creation.
