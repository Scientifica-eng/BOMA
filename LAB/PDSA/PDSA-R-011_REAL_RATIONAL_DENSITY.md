# PDSA-R-011 — Real Rational-Image Density

**CycleID:** `PDSA-R-011`  
**Status:** **CLOSED — RA-12 PASS**  
**Date:** 2026-08-20  
**ParentCycles/LearningInputs:** `PDSA-R-010`, `R-QARCH-BLOCK-001`, accepted Q density gateway  
**Primary acceptance target:** `RA-12`

## ResearchQuestion

Can the accepted rational image be proved strictly order-dense in the selected `RBOMA` carrier without importing standard-real density or a stronger completion theorem?

Target:

```text
x < y
  →
∃ q : QBOMA,
  x < rOfQ q ∧ rOfQ q < y
```

where `<` on `RBOMA` is derived from `rLE` plus inequality rather than introduced as a new primitive.

## PLAN

1. Add a derived strict-order interface `rLT x y := rLE x y ∧ x ≠ y`.
2. Translate strict quotient order into strict cut inclusion.
3. Extract a rational point `b` in the larger cut and outside the smaller cut.
4. Use roundedness of the larger cut and the already-certified internal Q density theorem to choose a rational `m` strictly above `b` but still inside the larger cut.
5. Prove the principal cut at `m` lies strictly between the two source cuts.
6. Lift the statement to `RBOMA` and run V5 at the actual dependency level.

## DO

New formal payloads:

```text
RDedekindStrictOrder.lean
RDedekindRationalDensity.lean
```

Core theorem:

```text
r_rational_image_dense
```

The representative-level construction is:

```text
A ⊊ B
  → choose b ∈ B \ A
  → choose c ∈ B with b < c
  → choose m with b < m < c
  → A ⊊ principalCut(m) ⊊ B.
```

## Observations

1. The density proof does not need the earlier fine cut-bracketing theorem.
2. Internal Q density plus the `rounded` axiom of the larger Dedekind cut is sufficient once a strict-inclusion witness is available.
3. Extracting an explicit `b ∈ B \ A` from `¬ CutEquiv A B` uses localized classical proposition reasoning in the current strict-order representation.
4. No built-in real carrier, standard rational density theorem, floor/ceiling, or Choice-based global boundary selector is used.

## ErrorsDetected

Initial V5 run:

```text
32359624237 — FAIL_OR_INCOMPLETE
```

Root cause: the new workflow omitted `RDedekindSupremumProbe.lean`, the canonical provider of `CutLE`. This was a CI dependency-DAG defect. The mathematical payload was not changed in response.

## STUDY

The useful architectural distinction is:

```text
Q internal density                   reusable arithmetic contribution
Dedekind roundedness                 representation axiom
strict inclusion witness extraction  localized classical proof step
principal-cut sandwich               representation-level theorem
quotient density                     exported RBOMA theorem
```

The current classical use is tied to representing strict real order as `rLE + ≠` and then extracting a point from failure of extensional equality. A future branch could instead carry a positive strict-inclusion witness as part of the strict-order interface and compare the logical cost.

## Successes

Corrected V5:

```text
32359834460 — PASS
```

Verified theorem:

```text
∀ {x y : RBOMA},
  rLT x y →
  ∃ q : QBOMA,
    rLT x (rOfQ q) ∧ rLT (rOfQ q) y
```

## HiddenAssumptions

Explicitly not imported:

```text
standard Real density;
preexisting Archimedean real instance;
completed analysis package;
canonical cut boundary;
global Choice selector.
```

## HumanContributions

The project requirement that density be independently auditable prevented treating it as a generic consequence of “these are the reals”.

## AIContributions

The AI isolated the strict-order layer, built the principal-cut sandwich proof, diagnosed the first V5 failure as a missing dependency rather than a counterexample, and preserved the logical provenance of the witness-extraction step.

## VerificationEvidence

```text
V5 failure  32359624237 — CI-DAG: CutLE provider omitted
V5 PASS     32359834460 — RA-12 theorem verified
```

## ACT

**Accept RA-12.**

Create/activate `R-DENSITY-BLOCK-001` as the canonical Stage-I rational-density contribution.

Do not infer RA-13 from RA-12; the Archimedean property remains an independent acceptance theorem with its own dependency path.

## ConstructionGraphEffects

```text
Q internal density
      +
Dedekind roundedness
      +
strict cut inclusion
      ↓
R-DENSITY-BLOCK-001
      ↓
RA-12 PASS
```

## LearningGraphEffects

```text
first V5 failure
  → missing CutLE provider identified
  → CI-DAG repaired without changing theorem
  → density PASS
  → reusable lesson: workflow assembly failure ≠ mathematical failure
```

## NextCycleInputs

`PDSA-R-012` — independent Archimedean characterization.
