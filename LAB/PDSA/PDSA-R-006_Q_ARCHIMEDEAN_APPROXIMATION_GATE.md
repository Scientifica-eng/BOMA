# PDSA-R-006 — Rational Archimedean Approximation Gate

**CycleID:** `PDSA-R-006`  
**Status:** **CLOSED — ROUTE A SELECTED / BRACKETING PASS**  
**Date:** 2026-08-18  
**ParentCycles/LearningInputs:** `PDSA-R-005`, accepted Q construction, `BOMA-R-ACCEPT-001 / RG-01`  
**Decision Point:** `R-DP-004 RESOLVED`

## ResearchQuestion

What is the smallest transparent theorem about the accepted `QBOMA` that supplies arbitrarily fine rational bracketing of an arbitrary Dedekind cut, as required by the real additive-inverse proof, without importing a built-in rational/real Archimedean package?

## PLAN

Compare:

```text
Route A — derive reusable Q Archimedean structure and then cut bracketing;
Route B — derive cut bracketing directly from the explicit fraction representation.
```

Common acceptance target:

```text
∀ A eps,
  0 < eps →
  ∃ b r,
    A.lower b ∧
    ¬ A.lower r ∧
    0 < r-b ∧
    r-b < eps.
```

## DO

### A1 — rational natural upper bound

Constructed:

```text
q_le_natural_upper :
  ∀q : QBOMA, ∃n : N_BOMA, q ≤ qOfN(n)
```

from the explicit positive-denominator fraction representation.

V5:

```text
32185265579 PASS
```

### A2 — Archimedean scaling

Constructed:

```text
q_archimedean_scale :
  ∀ gap delta,
    0 < delta →
    ∃ n : N_BOMA,
      gap ≤ qOfN(n) * delta
```

using the already-accepted rational inverse only as an existential witness.

V5:

```text
32185547400 PASS
```

### A3 — rational grid

Constructed:

```text
qGrid(a,delta,n) = a + qOfN(n)*delta
```

with successor compatibility and an eventual-outside crossing theorem for proper lower cuts.

An initial V5 failed because the namespace containing `qadd_mono_right` was guessed incorrectly. The actual namespace is:

```text
BOMA.Q.OrderedField001
```

The correction did not change any mathematical statement.

Study also showed that the crossing theorem did not need an assumption that its grid base belongs to the cut. That unused hypothesis was removed, making the theorem strictly more general.

### A4 — finite exit search

Constructed a separate theorem that takes:

```text
base grid point inside A
finite endpoint outside A
```

and returns an adjacent inside/outside pair.

The finite search uses one explicit form of proposition-level excluded middle:

```text
Classical.em (A.lower (qGrid ... n))
```

This is isolated from the arithmetic Archimedean results.

V5:

```text
32186080453 PASS
```

### A5 — cut bracketing

Using rational density to choose

```text
0 < delta < eps
```

and the grid/finite-exit interfaces, constructed:

```text
cut_bracket_approx
```

producing `b∈A`, `r∉A`, and positive width `r-b < eps`.

V5:

```text
32186209544 PASS
```

## Observations

The needed approximation interface decomposes naturally into:

```text
fraction representation
  ↓
natural upper bound
  ↓
Archimedean scaling
  ↓
finite rational grid crossing
  ↓
finite membership search
  ↓
arbitrarily fine cut bracket
```

This decomposition is substantially more informative than a direct monolithic proof of `A + (-A) = 0`.

## STUDY

### Main mathematical learning

Rational order density alone is insufficient for arbitrary boundary precision. The missing contribution is Archimedean scaling.

However, **Archimedean arithmetic and logical cut-membership search are different dependencies**:

```text
natural upper bound        no Classical
scaling                    no Classical
arithmetic grid crossing   no Classical
first exit from predicate  local Classical.em
```

Therefore the correct project statement is not “R Archimedean approximation is classical.”

The correct statement is:

> The selected Stage-One Dedekind bracketing theorem combines a constructive rational Archimedean arithmetic route with an isolated classical finite membership search over the arbitrary lower-cut predicate.

### Route comparison

Route A passed and produced reusable theorems expected to serve RA-12 and RA-13 later. Route B was therefore not required for the canonical Stage-One path.

Route B remains a Stage-II branch candidate. No claim has been made that it is impossible or inferior in every formal regime.

## ErrorsDetected

### E1 — zero proof normalization

First natural-upper-bound probe left the goal `zLE 0 0` after simplification.

Fix:

```text
zle_refl zzero
```

Classification:

```text
PROOF-ENGINEERING / NORMALIZATION
```

### E2 — wrong namespace

The first grid proof attempted an incorrect namespace for `qadd_mono_right`.

Fix:

```text
BOMA.Q.OrderedField001
```

Classification:

```text
FORMALIZATION API / NAMESPACE RESOLUTION
```

### E3 — over-specified theorem hypothesis

The initial `qGrid_eventually_outside` statement included `a∈A`, but the proof did not consume it. The theorem was generalized by removing that hypothesis.

Classification:

```text
SUCCESSFUL STUDY REFINEMENT / INTERFACE MINIMIZATION
```

## Successes

1. `RG-01` was honored: Archimedean approximation lemmas were reconstructed before use.
2. No built-in `Rat`, `Real`, floor, or ceiling theorem was imported.
3. The accepted Q inverse was consumed existentially; no Choice-based inverse selector was added.
4. The only new classical step is named and isolated at finite predicate membership search.
5. The common cut-bracketing target passed V5.

## HiddenAssumptions

Forbidden shortcuts remained unused:

```text
built-in Rat Archimedean instance
built-in Real
prepackaged floor / ceiling
Choice-based global boundary selector
```

The local `Classical.em` in finite membership search is explicit and is not to be treated as hidden background.

## HumanContributions

The project requirement that reverse engineering be performed at an architecturally useful time affected the design: the approximation contribution was split into independently classifiable dependencies so `RE-R-001` can later distinguish structural arithmetic from Dedekind-route logical search.

## AIContributions

The AI decomposed the approximation obligation into natural upper bounds, scaling, finite grids, finite membership search, and cut bracketing; implemented the Lean probes and V5 workflows; diagnosed proof-engineering failures; and minimized an over-specified theorem interface after linter/verification feedback.

## VerificationEvidence

```text
Q natural upper bound        32185265579 PASS
Q Archimedean scaling        32185547400 PASS
finite cut exit search       32186080453 PASS
Dedekind cut bracketing      32186209544 PASS
```

Toolchain:

```text
leanprover/lean4:v4.32.1
```

## LessonsLearned

```text
L-R-ARCH-001:
Density and Archimedean approximation are distinct mathematical contributions.

L-R-ARCH-002:
A route-specific proof can often be decomposed into reusable arithmetic plus a narrow representation-specific logical interface.

L-R-ARCH-003:
Unused hypotheses exposed by verification are architectural information; removing them can reveal a more reusable theorem.

L-R-ARCH-004:
Classical provenance should be attached to the smallest theorem that actually consumes excluded middle, not inherited by every downstream theorem indiscriminately.
```

## ACT

```text
R-DP-004 = RESOLVED
Route A = SELECTED
Route B = RETAINED FOR LATER BRANCH TESTING
```

Promote the successful approximation chain as a reusable certified construction block.

Do not yet mark `RA-05` PASS: the additive-inverse theorem must consume `cut_bracket_approx` explicitly and pass its own V5 gate.

## ConstructionGraphEffects

```text
accepted QBOMA fraction structure
       ↓
Q natural upper bound
       ↓
Q Archimedean scaling
       ↓
Q finite grid crossing
       ↓
Dedekind finite membership exit  [local Classical.em]
       ↓
cut_bracket_approx
       ↓
RA-05 additive inverse proof  [next]
```

## LearningGraphEffects

```text
hidden approximation need detected before formalization
       ↓
density distinguished from Archimedean scaling
       ↓
reusable Route A developed
       ↓
logical predicate search isolated
       ↓
common bracketing target PASS
       ↓
R-DP-004 resolved
```

## OpenQuestions

1. How much of this approximation block will transfer unchanged to the retained Cauchy branch?
2. Can the local `Classical.em` finite membership search be eliminated under an alternative constructive cut interface?
3. Which parts will be consumed directly by RA-12 and RA-13?

These questions are specifically reserved for later Study and `RE-R-001`.

## NextCycleInputs

Use `cut_bracket_approx` to prove the additive-inverse law for the already verified `rNeg` candidate. If that passes, close `RA-05` and the additive-group interface before starting real multiplication.
