# ST2-EXP-004 Failure 007 — Closed-State 011 Audit Baseline-Unit Expectation

**Phase:** post-Study lifecycle closure verification  
**Failed exact head:** `cbdf2b604305585e2920c90f5f161565bdffafb5`  
**Workflow:** `BOMA ST2-EXP-004 Lifecycle Closure`  
**Run:** `32837301674`  
**Job:** `97768922590`  
**Artifact:** `9559114548`  
**Artifact SHA256:** `690f3454969ea5e0bf7da0359f80904d5c53225e3ceda7bfc8b9325ae8fdb1ed`  
**Classification:** `POST-STUDY LIFECYCLE-AUDIT COMPATIBILITY / HISTORICAL FIELD EXPECTATION TYPO`  
**Mathematical impact:** `NONE`

## Observed failure

The new ST2-EXP-004 closure workflow first passed:

- exact-head checkout;
- Frozen Plan / Final Study-Act / closure-record immutability checks;
- complete accepted Q/R/C manifest and manifest-listed source comparison against
  the frozen accepted reference.

It then failed while re-running the monotone `ST2-EXP-011` lifecycle audit. The
only residual was:

```text
field: baseline_producer_unit_id
expected: C-COMPARE-BLOCK-001
actual:   C-BLOCK-001
```

## Root cause

The closed-state generalization of
`st2_exp_011_lifecycle_closure_audit.py` accidentally changed the historical
expected value for `baseline_producer_unit_id`. The immutable ST2-EXP-011
machine record correctly records `C-BLOCK-001` as the baseline producer and
`C-COMPARE-BLOCK-001` as the comparison target/origin Block.

This was an auditor expectation typo. It did not alter an ST2-EXP-011 record,
accepted source, accepted manifest, or ST2-EXP-004 mathematical result.

## Corrective boundary

Correct only the auditor constant back to the historical value:

```text
baseline_producer_unit_id = C-BLOCK-001
```

Do not edit any ST2-EXP-011 Frozen Plan, Study/Act, lifecycle record, integration
record, or machine-ledger historical value.

This failure record is immutable after creation.
