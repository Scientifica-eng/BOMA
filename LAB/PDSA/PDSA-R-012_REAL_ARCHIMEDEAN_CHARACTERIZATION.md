# PDSA-R-012 — Real Archimedean Characterization

**CycleID:** `PDSA-R-012`  
**Status:** **CLOSED — RA-13 PASS**  
**Date:** 2026-08-20  
**ParentCycles/LearningInputs:** `PDSA-R-011`, `PDSA-R-006`, `R-QARCH-BLOCK-001`  
**Primary acceptance target:** `RA-13`

## ResearchQuestion

Can the selected `RBOMA` ordered field be shown Archimedean through an explicit BOMA-natural bound without importing a standard-real Archimedean instance or unnecessarily inheriting the classical cut-search used by fine Dedekind bracketing?

Target:

```text
∀ x : RBOMA,
  ∃ n : N_BOMA,
    x < rOfQ (qOfN n)
```

## PLAN

1. Reuse only the certified rational theorem `q_le_natural_upper`.
2. For an explicit LowerCut `A`, use `A.proper` to obtain one rational `u` outside the cut.
3. Move to `u+1` to obtain a strict margin.
4. Bound `u+1` above by an embedded BOMA natural.
5. Show every point of `A` is strictly below `u`, hence strictly below that natural image.
6. Prove the resulting principal natural cut strictly contains `A`.
7. Lift through the quotient and verify independently by V5.

## DO

Formal payload:

```text
LAB/payloads/lean/RStage/RDedekindArchimedean.lean
```

Core theorem:

```text
r_archimedean_strict_upper (x : RBOMA) :
  ∃ n : BOMANat, rLT x (rOfQ (qOfN n))
```

Representative-level mechanism:

```text
u ∉ A
u < u+1
u+1 ≤ qOfN(n)
----------------
u < qOfN(n)

any a∈A must satisfy a<u
(otherwise downward closure would imply u∈A)

therefore A ⊊ principalCut(qOfN n).
```

## Observations

1. RA-13 does not require RA-12.
2. The theorem does not consume `cut_bracket_approx`.
3. It therefore does not consume the finite cut-membership `Classical.em` used inside the cut-bracketing production route.
4. The essential representation input is only the `proper` and `downward` fields of `LowerCut` plus principal-cut formation.
5. The essential arithmetic input is the previously certified natural-upper-bound theorem on `QBOMA`.

## ErrorsDetected

Initial V5:

```text
32359661238 — FAIL_OR_INCOMPLETE
```

The logs show that the workflow omitted `RDedekindSupremumProbe.lean`, the canonical source of `CutLE`, causing `QuotientIdentity`, `OrderConstructive`, and strict-order assembly to fail before the new Archimedean theorem was tested.

This was a CI dependency-DAG defect. No mathematical payload change was needed.

## STUDY

This cycle gives a concrete example of the BOMA logical-dependency rule:

```text
historical ancestor used Classical search
        does not imply
new downstream theorem inherits that Classical search
```

Only the interface actually consumed matters.

For RA-13 the consumed chain is:

```text
N_BOMA embedding
  → Q natural-upper-bound theorem
  → LowerCut properness/downwardness
  → principal-cut strict containment
  → RBOMA strict upper bound.
```

The stronger cut-bracketing theorem remains a sibling reusable contribution, not a required ancestor of RA-13.

## Successes

Corrected V5:

```text
32359869558 — PASS
Lean 4.32.1
```

Verified statement:

```text
∀ x : RBOMA,
  ∃ n : BOMANat,
    rLT x (rOfQ (qOfN n)).
```

## HiddenAssumptions

Not imported:

```text
built-in Real;
prepackaged Archimedean instance;
floor or ceiling;
standard natural-number coercion into a standard real carrier;
cut-bracket approximation;
finite cut-membership search;
global Choice selector.
```

## HumanContributions

The requirement that logical provenance be auditable forces the Archimedean result to expose its actual narrow dependency chain rather than inherit the strongest assumptions appearing anywhere in the R construction history.

## AIContributions

The AI isolated a direct properness-based proof, deliberately avoided the stronger cut-bracketing route, built the formal theorem, and diagnosed the first V5 failure as assembly rather than mathematics.

## VerificationEvidence

```text
32359661238  FAIL_OR_INCOMPLETE — CI-DAG omitted CutLE provider
32359869558  PASS               — strict BOMA-natural upper bound verified
```

## ACT

**Accept RA-13.**

Register `R-ARCH-BLOCK-001` as the canonical Stage-I Archimedean characterization.

Keep RA-12 and RA-13 as independent sibling contributions for the final integration audit.

## ConstructionGraphEffects

```text
Q natural-upper-bound
      +
LowerCut proper/downward
      ↓
R-ARCH-BLOCK-001
      ↓
RA-13 PASS
```

## LearningGraphEffects

```text
first V5 failure
  → missing CutLE provider
  → DAG repaired
  → theorem passes unchanged
  → explicit evidence that logical strength follows consumed interfaces, not full ancestor history
```

## NextCycleInputs

`PDSA-R-013` — representation, completeness-scope, hidden-dependency, and formal-commitment audit for RA-14 / RA-17 / RA-18 / RA-19 / RA-20.
