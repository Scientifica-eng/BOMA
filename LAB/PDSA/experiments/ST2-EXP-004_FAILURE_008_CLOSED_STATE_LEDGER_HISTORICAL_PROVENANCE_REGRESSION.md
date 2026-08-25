# ST2-EXP-004 Failure 008 — Closed-State Ledger Historical Provenance Regression

**Phase:** post-Study lifecycle closure verification  
**Failed exact head:** `5bab057292dcaa5499a0d75fdf3a872e70bb608e`  
**Primary workflow:** `BOMA ST2-EXP-004 Lifecycle Closure`  
**Primary run:** `32837451796`  
**Primary artifact:** `9559162216`  
**Primary artifact SHA256:** `b27f0a1442c1d094a4667e6a829aa99b62cf91966a24e771d0f347fa62d2c1d3`  
**Corroborating historical run:** `BOMA ST2-EXP-003 Independent Cauchy Real Route — V5 / 32837451803`  
**Corroborating artifact:** `9559164963`  
**Corroborating artifact SHA256:** `49e8f362ada854222b9b02da8cc153be7a2556703a53dde3464fc8dd27c77bfd`  
**Classification:** `POST-STUDY MACHINE-LEDGER REGENERATION / HISTORICAL PROVENANCE REGRESSION`  
**Mathematical impact:** `NONE`

## Observed failure

The exact-head closure workflow proved that the ST2-EXP-004 Frozen Plan,
Final Study/Act, closure record, and every accepted Q/R/C manifest and
manifest-listed accepted source remained unchanged. The monotone ST2-EXP-011
closure audit also reached the intended closed-004 mode.

The subsequent closed-state checks exposed two distinct residual classes:

1. the new ST2-EXP-004 lifecycle auditor used text markers that were stricter
   than the immutable Study/Act and current-state documents actually contain;
2. more importantly, the machine origin ledger had regenerated historical
   records from stale values. ST2-EXP-003 exact closure identities and critical
   exact-head evidence no longer matched the previously verified final values,
   and the ST2-EXP-011 `baseline_producer_unit_id` differed from the last green
   preclosure ledger.

The historical Cauchy workflow independently confirmed the same ledger drift:
its accepted-source controls passed, then the historical closure audit failed
on ST2-EXP-003 run/head/merge/evidence identities.

## Correction to Failure 007 diagnosis

`ST2-EXP-004_FAILURE_007_CLOSED_STATE_011_AUDIT_BASELINE_UNIT_EXPECTATION.md`
is preserved unchanged as the contemporaneous first diagnosis. Later evidence
shows that diagnosis was incomplete.

The exact green preclosure head
`6779d028c49f73757ea838c163d3968a982559fe` records the ST2-EXP-011 historical
machine value as:

```text
baseline_producer_unit_id = C-COMPARE-BLOCK-001
```

Therefore changing the auditor to expect `C-BLOCK-001` was not the correct
long-term repair. The historical ledger itself had drifted.

## Root cause

The closed-state machine-ledger rendering step rebuilt historical experiment
records from an older/stale representation instead of treating closed records
as immutable provenance. This regressed ST2-EXP-003 final exact-head identities
and changed an ST2-EXP-011 historical field while attempting to update only the
current ST2-EXP-004 lifecycle state.

No accepted mathematical source, manifest, `SELECTS`, Block, Decision Point,
Junction, Claim meaning, or accepted export changed.

## Corrective boundary

The repair is intentionally narrow and fail-closed:

1. restore machine-ledger records `ST2-EXP-001`, `ST2-EXP-002`, `ST2-EXP-003`,
   and `ST2-EXP-011` **byte-for-byte semantically from the green head
   `6779d028c49f73757ea838c163d3968a982559fe`**;
2. retain only the closed-state top-level fields and the closed `ST2-EXP-004`
   record from the current lifecycle transition;
3. restore the ST2-EXP-011 lifecycle auditor to the historical value
   `C-COMPARE-BLOCK-001`;
4. make the ST2-EXP-004 closure auditor validate the actual immutable
   Study/Act and per-document current-state markers rather than inventing
   absent wording;
5. do not edit the Frozen Plan, Final Study/Act, prior failure records, accepted
   Q/R/C sources/manifests, or any accepted architectural selection.

This failure record is immutable after creation.
