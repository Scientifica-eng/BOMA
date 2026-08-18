# PDSA-N-006 — R-B N-Core Characterization / Standardness

**CycleID:** `PDSA-N-006`  
**Track:** Natural Numbers / R-B Formalization  
**Date opened:** 2026-08-18  
**Status:** **ACTIVE — PLAN / DO**

## Inputs

```text
N-RB-CAND-001
BOMA-N-ACCEPT-001 v1.0
BOMA-RB-FORMAL-001 v1.0
PDSA-N-004 local candidate proofs
PDSA-N-005 TCT bridge audit
```

## PLAN

Discharge the characterization/standardness obligations without silently using Lean built-in `Nat`, set-theoretic standardness, or first-order categoricity claims.

### Target characterization package

For the selected R-B regime, require the formal candidate to provide:

```text
C1  fresh carrier with z and s
C2  constructor no-confusion
C3  dependent induction/generatedness
C4  nondependent recursion
C5  pointwise recursion uniqueness
C6  faithful TCT realization bridge
C7  pointwise initiality as a unary algebra
C8  uniqueness of pointwise-initial unary algebras up to structure-preserving pointwise inverse maps
```

## Unary-algebra scope

A unary algebra consists schematically of:

```text
Carrier
base : Carrier
step : Carrier → Carrier
```

A homomorphism preserves `base` and `step`.

The candidate is **pointwise initial** when for each admissible target unary algebra there exists a homomorphism from the candidate and every other such homomorphism agrees with it pointwise.

This formulation avoids requiring function extensionality merely to package uniqueness.

## Framework scope

The universal claim is scoped to target types/algebras admitted by the selected R-B universe/regime. It is not an unrestricted theorem over every foundation or category.

## DO

The unified backend payload `NCoreRB001.lean` contains candidate definitions/theorems for:

```text
UnaryAlgebra
Hom
foldHom
foldHom_unique
PointwiseInitial
boma_pointwise_initial
pointwise_initial_unique
```

A written mathematical audit follows.

## STUDY

OPEN.

## ACT

PENDING.
