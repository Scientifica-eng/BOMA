# ST2-EXP-015_FAILURE_002 — Gate-C inherited Classical.choose audit false positive

**Experiment:** `ST2-EXP-015`  
**Program:** `ST2-RP-001`  
**Date:** `2026-08-25`  
**Classification:** `TECHNICAL AUDIT FAILURE / RECOVERABLE INSIDE FROZEN PLAN`  
**Failed exact head:** `3b24dae2dde4a3ca072644b13c76b05ab23317f5`  
**Workflow:** `BOMA ST2-EXP-015 Cauchy Route Composition Square — V5`  
**Run:** `32890319684`  
**Job:** `97940476045`  
**Artifact:** `9579186013`  
**Artifact SHA-256:** `94f692e551c891a1fa8fca55f5637199198135f01cb56c9343c8b48d7f3e40ab`

## Observed result

The repaired Gate-C source elaborated successfully under pinned Lean. Exact-head,
Frozen-Plan identity, owner/program authority, accepted Q/R/C source immutability,
Gate A, Gate B, Gate-C manifest/firewall, and Gate-C Lean elaboration all passed.

The failure occurred only in the declaration-closure post-check because the
workflow rejected every transitive occurrence of `Classical.choose` anywhere in
the fixed Cauchy-real dependency chain.

The closure audit itself returned `PROTOTYPE_PASS`. The `Classical.choose` edges
were inherited from already verified and frozen RCBOMA implementation sources,
including:

```text
BOMA.R.StageTwo.CauchyApproximation003
BOMA.R.StageTwo.CauchyInverse003
BOMA.R.StageTwo.CauchyLUBSequence003
BOMA.R.StageTwo.CauchyScale003
```

No `Classical.choose` literal occurs in the new ST2-EXP-015 Gate-B or Gate-C
Route-Q sources. No Dedekind, ST2-EXP-002, H5, H6/CCBOMA, ST2-EXP-011, or
ST2-EXP-014 implementation producer entered the native Q field manifest.

## Root cause

The Gate-C Do record/workflow strengthened the Frozen Plan's selector boundary
incorrectly from:

```text
no new Classical.choose for representatives / coordinates / inverse selection
```

to:

```text
no transitive Classical.choose anywhere in the frozen RCBOMA producer closure
```

That stronger test is incompatible with the very Cauchy scalar producer fixed by
the Frozen Plan, whose verified scalar order/inverse/completion machinery already
has historical classical-choice provenance.

This is an audit-scope defect, not a scientific failure and not authority
ambiguity: the immutable Frozen Plan explicitly permits the verified Cauchy
scalar field/order/inverse facts while forbidding introduction of a new selector
or logical/foundational commitment by 015.

## Authorized recovery

1. Keep the source-level ban on literal `Classical.choose` in new 015 sources.
2. Keep all forbidden Dedekind/002/H5/H6/011/014 implementation-producer checks.
3. In declaration closure, reject any `Classical.choose` or
   `Classical.choose_spec` edge whose consumer is an ST2-EXP-015 Route-Q
   declaration or any unexpected non-frozen producer.
4. Allow and explicitly report only the pre-existing choice provenance inside the
   frozen RCBOMA Cauchy modules.
5. Correct the Gate-C evidence record to match the Frozen Plan rather than its
   over-strong Do-time audit wording.
6. Rerun the full exact-head V5. Gate D remains unauthorized until PASS.

## Scientific status

`GATE C MATHEMATICAL ELABORATION PASS ON FAILED AUDIT HEAD / OVERALL GATE C NOT YET EXACT PASS`.

No Frozen Plan, scientific factor, Claim cone, route selection, accepted export,
acceptance contract, logical regime, or queue order is changed by this recovery.