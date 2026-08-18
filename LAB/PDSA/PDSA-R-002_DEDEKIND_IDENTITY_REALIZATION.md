# PDSA-R-002 — Dedekind Real Formal Identity Realization

**CycleID:** `PDSA-R-002`  
**Status:** **CLOSED — QUOTIENT IDENTITY SELECTED**  
**Date:** 2026-08-18  
**Input:** `R-DP-001 RESOLVED — Dedekind selected`  
**Decision Point:** `R-DP-002 RESOLVED`

## PLAN

Determine whether Stage One should realize extensional Dedekind-cut identity as formal carrier equality by quotienting `LowerCut` by `CutEquiv`, or retain `CutEquiv` as an external equality relation.

Primary question:

> Can the quotient route provide formal identity, faithful rational embedding, and an order interface without silently adding function/proposition extensionality or Classical/Choice merely to form the carrier?

## DO — Candidate A quotient probe

Created:

`LAB/payloads/lean/RStage/RDedekindQuotientIdentity.lean`

Definitions:

```text
cutSetoid : Setoid LowerCut
RBOMA := Quotient cutSetoid
rmk : LowerCut → RBOMA
rOfQ : QBOMA → RBOMA
```

Verified:

```text
rmk A = rmk B ↔ CutEquiv A B
rOfQ injective
CutLE respects CutEquiv
witness-based quotient order rLE
rLE(rOfQ q, rOfQ r) ↔ qLE q r
```

V5:

```text
run 32180783725
Lean 4.32.1
PASS
```

## STUDY

### Measured quotient cost

The probe required the already-declared quotient mechanism:

```text
Setoid
Quotient
Quotient.sound / Quotient.exact
```

No additional extensionality or classical principle was needed merely for identity, equality reflection, the rational embedding, or its order interface.

Source audit at decision time found no R payload occurrence of:

```text
Classical
Choice
funext
propext
sorry
axiom
Real
```

### Candidate B cost

Keeping `LowerCut` plus external `CutEquiv` would avoid quotient carrier formation, but every downstream operation, order theorem, completeness theorem, and later complex construction would retain a setoid-relative equality layer.

### Candidate C

Raw Lean structure equality was not selected because the predicate field would make raw predicate equality versus extensional equality a hidden substantive commitment.

## ACT

`R-DP-002` selects:

```text
RBOMA := Quotient cutSetoid
```

with external `CutEquiv` retained as an alternative Stage-II identity regime.

Reason:

```text
the quotient probe passed;
formal equality matches CutEquiv exactly;
Q embedding is faithful/order-reflecting;
no funext/propext/Classical/Choice was added at this layer;
downstream interfaces gain ordinary carrier equality.
```

This is a formalization choice, not a mathematical necessity claim.

## Construction Graph effect

```text
LowerCut + CutEquiv
       │
       ├──────── external CutEquiv identity ───► RETAINED
       │
       └──────── quotient identity ────────────► SELECTED
                          │
                          ▼
                        RBOMA
                          │
                          ├── rOfQ injective
                          └── rOfQ order-reflecting
```

## Learning Graph effect

1. Predicate-valued representations need explicit extensional identity before formal carrier equality is chosen.
2. Witness-based quotient relations can avoid proposition-extensionality transport.
3. A quotient commitment can be isolated from later logical commitments such as total-order classicality.

## Next cycle

`PDSA-R-003` must test the logical cost of **total order on Dedekind cuts**.

The current cut specification does not silently contain a classical comparability principle. Before `rLE` is promoted to a total order, BOMA must determine whether Stage One:

```text
adds an explicit Classical/LEM commitment for cut comparability;
strengthens/revises the constructive cut/order contract;
or changes the acceptance claim.
```

No field operations are promoted past this logical gate.
