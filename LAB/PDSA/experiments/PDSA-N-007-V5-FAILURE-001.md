# PDSA-N-007 — V5 Failure Study 001

**Experiment ID:** `PDSA-N-007-V5-FAILURE-001`  
**Observed run ID:** `32162999218`  
**Verified commit:** `08c9ea0fb3bf2ac5cbc4a452cc4e6aac09f50552`  
**Pinned Lean:** `leanprover/lean4:v4.32.1`  
**Status:** CLOSED — FAILURE CLASSIFIED / CORRECTIVE ACT APPLIED

## Observation

The first repository-resident evidence run recorded:

```text
setup                         success
unified producer              failure
N-BLOCK-001..006 wrappers     failure
N-J-001 Route B               failure
N-J-001 convergence           failure
```

The job logs show that this apparent all-branch failure had **two different root causes** and must not be interpreted as eight independent mathematical failures.

## Failure F1 — eliminator motive sort mismatch

Lean reported at the proposition-valued induction theorem that the custom eliminator had a Type-valued motive while the theorem required a Prop-valued motive.

Original design:

```text
P : BOMANat → Type u
```

but `induction_adequacy` instantiated:

```text
P : BOMANat → Prop
```

### Classification

`UNIVERSE / TYPE-SCOPE`

### Study

The architectural target already requires both:

```text
Type-valued dependent elimination
Prop-valued induction
```

The formal contract's `Type` wording was therefore too narrow/ambiguous for the actual acceptance target.

### Act

The backend eliminator is corrected to:

```text
P : BOMANat → Sort u
```

so `u = 0` covers `Prop` and positive sorts cover Type-valued motives.

This is recorded as a formalization-scope correction; it is not reclassified as a pre-numerical theorem.

## Failure F2 — unary-algebra universe ambiguity

Lean failed to infer consistent universe levels for `PointwiseInitial`, `Hom`, and `pointwise_initial_unique`.

### Classification

`UNIVERSE / TYPE-SCOPE`

### Study

The mathematical idea was under-specified at one point: the record said the universal property is regime-scoped but the backend did not state whether source and target unary algebras must inhabit the same universe, or whether heterogeneous cross-universe morphisms are required.

This is scientifically material because NAC-10/NAC-12 require the **admissible target scope** to be explicit.

### Act

Current correction:

```text
UnaryAlgebra.{u}       remains universe-polymorphic
Hom A B                is same-universe
PointwiseInitial A     is same-universe
bomaAlg                lives at universe 0
boma_pointwise_initial is Stage-One Type-0 scoped
pointwise_initial_unique remains generic for same-universe initial algebras
fold itself            remains Type-u polymorphic
```

The choice of the canonical Stage-One initiality scope is separately recorded as `N-DP-002` rather than being hidden in Lean inference.

## Failure F3 — unknown module prefix `LAB`

All claim wrappers failed with:

```text
unknown module prefix 'LAB'
```

### Classification

`MISSING IMPORT / BUILD CONFIG`

### Study

The repository's minimal `lakefile.toml` does not define `LAB` as a Lean library/module root. The wrappers had assumed one for convenience.

This is not evidence against any N-Block theorem.

### Act

Current verification wrappers are now **producer-attached fragments**. The active workflow constructs temporary verification sources as:

```text
NCoreRB001.lean + Block fragment
```

and for the reconvergence test:

```text
NCoreRB001.lean + Route-B fragment + Junction fragment
```

This avoids adding a repository-wide Lean module-root commitment solely for verification plumbing.

The first claim-level workflow `boma-ncore-rb-004.yml` is retained manual-only as provenance. Active verification uses `boma-ncore-rb-005-evidence.yml`.

## Learning

1. Formal verification exposed a **real contract ambiguity** about `Type` versus `Prop`; the correct response is to refine the formalization boundary, not merely patch syntax.
2. Universe scope is part of the mathematical/formal interface when a universal property is claimed.
3. A backend packaging failure must not be propagated as a mathematical failure to all downstream Blocks.
4. Claim-level CI makes this distinction visible: one producer failure can cascade into many wrapper failures without implying independent branch invalidity.
5. Evidence-producing CI is useful precisely because a failed run becomes durable Study input.

## Closure

The failed run remains permanent provenance. It is not overwritten by later successful runs.

A new V5 run must test the corrected producer and fragment assembly before any V5 status promotion.
