# PDSA-R-008 — Real Multiplication Sign Architecture

**CycleID:** `PDSA-R-008`  
**Status:** **ACTIVE — R-DP-005 OPEN**  
**Date:** 2026-08-18  
**ParentCycles/LearningInputs:** `PDSA-R-005`, `PDSA-R-006`, `PDSA-R-007`  
**Decision Point:** `R-DP-005`

## ResearchQuestion

Can multiplication on arbitrary signed Dedekind reals be constructed without embedding an opaque classical sign decision inside the operation definition, while retaining representative invariance and a viable path to rational preservation and field laws?

## PLAN

Primary probe:

```text
positive/negative-part decomposition
```

starting with the nonnegative envelope:

```text
A⁺ = A ∪ principalCut(0).
```

Alternative probes remain:

```text
direct sign-case multiplication
shift-to-positive multiplication
```

## DO — initial target

Construct and V5-test:

```text
cutPosPart : LowerCut → LowerCut
cutPosPart_respects : CutEquiv A B → CutEquiv (cutPosPart A) (cutPosPart B)
rPosPart : RBOMA → RBOMA
```

with no `Classical.em`, `if` on cut sign, or Choice in the operation definition.

Then test a nonnegative multiplication kernel before defining full signed `rMul`.

## STUDY questions

1. Does union-with-zero give a clean canonical nonnegative envelope?
2. Can its properness/roundedness be proved from existing Q order/density alone?
3. Is sign comparability needed only for later identification theorems, rather than the definition?
4. Does positive-cut multiplication remain manageable without proof-valued parameters?
5. Will the decomposition law `x = x⁺ - x⁻` require only the already-isolated total-order comparability interface?

## ErrorsDetected

None yet.

## HiddenAssumptions

Do not use built-in Real multiplication or a hidden standard Dedekind implementation.

If a proposition-valued sign decision becomes necessary, isolate it and compare it explicitly against Candidate B rather than burying it in notation.

## HumanContributions

The requirement for later reverse engineering favors architectures in which sign handling, logical commitments, and algebraic kernels can be classified independently.

## AIContributions

The AI proposed positive/negative-part decomposition as a candidate for keeping classical sign reasoning out of the definition of multiplication and opened the comparative Decision Point before promotion.

## VerificationEvidence

Pending.

## ACT candidates

```text
A  select positive/negative-part decomposition;
B  select direct sign cases with explicit logical provenance;
C  select shift-to-positive construction;
D  retain multiple viable routes until a deeper multiplication-law probe distinguishes them.
```

## ConstructionGraphEffects

Pending probe results.

## LearningGraphEffects

```text
accepted additive group
  ↓
first sign-sensitive operation
  ↓
R-DP-005 opened before definition lock-in
```

## NextCycleInputs

Build the positive-part layer and verify its independence from representatives. Do not define final `rMul` before the sign architecture gate has enough evidence to close.
