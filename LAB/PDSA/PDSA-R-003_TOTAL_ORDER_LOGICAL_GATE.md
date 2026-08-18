# PDSA-R-003 — Dedekind Total-Order Logical Gate

**CycleID:** `PDSA-R-003`  
**Status:** **ACTIVE — LOGICAL SENSITIVITY UNDER V5**  
**Date:** 2026-08-18  
**Input:** `R-DP-002 RESOLVED — RBOMA quotient identity selected`  
**Decision Point:** `R-DP-003`

## PLAN

Determine the exact logical cost of promoting representative-invariant cut inclusion to the Stage-One total real order required by `RA-09`.

The cycle separates:

```text
constructive order structure
from
disjunctive total comparability
```

rather than placing `classical` at the top of all real-number proofs.

## DO

Created:

`LAB/payloads/lean/RStage/RDedekindOrderLogicalProbe.lean`

The probe proves without a classical declaration:

```text
CutLE antisymmetry up to CutEquiv
rLE reflexivity
rLE transitivity
rLE antisymmetry
```

It then isolates:

```text
CutComparability := ∀A B, CutLE A B ∨ CutLE B A
```

and proves constructively:

```text
CutComparability → totality of rLE
```

Finally, a single theorem with an explicit local `classical` block is used to test:

```text
Classical → CutComparability
```

from which quotient totality follows.

## Governing metatheory rule

`BOMA-META-TCT-001` permits materially classical proof steps when they are explicitly declared in the relevant PDSA/verification record rather than treated as invisible background.

This cycle applies that traceability rule at the first observed R-stage logical boundary.

## Verification

Workflow:

`.github/workflows/boma-r-dedekind-order-logic-001.yml`

Evidence:

`LAB/20_FORMALIZATION/R_STAGE/evidence/R_DEDEKIND_ORDER_LOGIC_V5_LATEST.md`

## STUDY questions

1. Do partial-order laws pass without `Classical`?
2. Does the only current classical use occur in the witness of `CutComparability`?
3. Can Stage One expose `CutComparability` as the narrow architectural interface while recording that its current proof is classical?
4. Would changing the acceptance target to a constructive non-total order materially change the intended standard-real stage?

## ACT candidates

```text
A  accept an explicit classical proof commitment for CutComparability;
B  declare CutComparability as a narrower formal principle, with classical proof provenance;
C  revise the real acceptance/order contract toward a constructive regime.
```

No later R proof may add independent ad hoc `classical` blocks for totality while this gate is open.
