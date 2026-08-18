# PDSA-R-002 — Dedekind Real Formal Identity Realization

**CycleID:** `PDSA-R-002`  
**Status:** **ACTIVE — QUOTIENT IDENTITY PROBE UNDER V5**  
**Date:** 2026-08-18  
**Input:** `R-DP-001 RESOLVED — Dedekind selected`  
**Decision Point:** `R-DP-002`

## PLAN

Determine whether Stage One should realize extensional Dedekind-cut identity as formal carrier equality by quotienting `LowerCut` by `CutEquiv`, or retain `CutEquiv` as an external equality relation.

Primary question:

> Can the quotient route provide formal identity, faithful rational embedding, and an order interface without silently adding function/proposition extensionality or Classical/Choice merely to form the carrier?

## DO — Candidate A quotient probe

Created:

`LAB/payloads/lean/RStage/RDedekindQuotientIdentity.lean`

Candidate definitions:

```text
cutSetoid : Setoid LowerCut
RBOMA := Quotient cutSetoid
rmk : LowerCut → RBOMA
rOfQ : QBOMA → RBOMA
```

The probe tests:

```text
rmk A = rmk B ↔ CutEquiv A B
rOfQ injective
CutLE respects CutEquiv
witness-based quotient order rLE
rLE(rOfQ q, rOfQ r) ↔ qLE q r
```

The quotient order is deliberately witness-based, following the successful Q pattern, so proposition extensionality is not silently used to transport an order predicate.

## Candidate B — external identity

Retain:

```text
carrier syntax = LowerCut
real identity = CutEquiv
```

This remains viable and is not rejected by constructing Candidate A.

Its main cost is architectural rather than mathematical: every downstream field/order/completeness interface would remain setoid-relative, including the later complex-number stage.

## Verification

Workflow:

`.github/workflows/boma-r-dedekind-quotient-identity-001.yml`

Evidence:

`LAB/20_FORMALIZATION/R_STAGE/evidence/R_DEDEKIND_QUOTIENT_IDENTITY_V5_LATEST.md`

## STUDY lock

Do not resolve `R-DP-002` until V5 establishes the quotient identity/Q embedding/order probe.

If PASS, the next Study must compare the measured quotient commitment with the persistent downstream cost of external `CutEquiv`.

## ACT candidates

```text
select quotient identity for Stage One / retain external-setoid alternative
retain external CutEquiv as Stage-One identity
defer decision if quotient probe exposes new logical commitments
```

No real field operation is promoted before this cycle closes.
