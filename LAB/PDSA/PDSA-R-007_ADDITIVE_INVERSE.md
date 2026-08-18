# PDSA-R-007 — Dedekind Real Additive Inverse Certification

**CycleID:** `PDSA-R-007`  
**Status:** **CLOSED — RA-05 PASS**  
**Date:** 2026-08-18  
**ParentCycles/LearningInputs:** `PDSA-R-005`, `PDSA-R-006`  
**Construction Effect:** `R-ADD-GROUP-BLOCK-001`

## ResearchQuestion

Does the independently verified Dedekind negation candidate become the genuine additive inverse on formal `RBOMA`, and exactly which earlier contributions are required for each direction of the proof?

## PLAN

Prove at raw-cut level:

```text
cutAdd A (cutNeg A) ≈ principalCut(0)
```

as two separate containments, then lift through `CutEquiv` to `RBOMA` and derive cancellation/uniqueness/involution.

## DO

### Direction 1

```text
A + (-A) ⊆ 0
```

Given `a∈A`, a negative witness below `-r` with `r∉A`, and `x<a+b`, lower-set monotonicity gives `a≤r`, hence:

```text
a+b < a-r ≤ 0.
```

This direction uses no fine Archimedean bracketing.

### Direction 2

```text
0 ⊆ A + (-A)
```

Given `x<0`, use `cut_bracket_approx A (-x)` to obtain:

```text
b∈A,
r∉A,
0 < r-b < -x.
```

Order reversal gives:

```text
x < b-r.
```

Translate to:

```text
x-b < -r.
```

Rational density then supplies `c` with:

```text
x-b < c < -r.
```

so `c∈cutNeg(A)` and `x<b+c`.

### Quotient lift

Derived:

```text
rAdd x (rNeg x) = rZero
rAdd (rNeg x) x = rZero
```

then:

```text
rAdd_left_cancel
rAdd_inverse_unique
rNeg_involutive
```

## Observations

The proof confirms that the approximation gateway is not part of the representation of negation itself. Its only essential use in this cycle is the reverse containment requiring arbitrarily fine boundary witnesses.

This is a useful dependency distinction for later reverse engineering.

## STUDY

### Successful decomposition

```text
negation definition          no Archimedean bracketing
CutEquiv respect             no Archimedean bracketing
Q-negation preservation      no Archimedean bracketing
A+(-A) ⊆ 0                  no Archimedean bracketing
0 ⊆ A+(-A)                  consumes cut_bracket_approx
```

### Logical provenance

The additive-inverse theorem itself contains no new ad hoc `Classical.em`. It consumes `cut_bracket_approx`, whose finite membership-search provenance is already isolated in `R-QARCH-BLOCK-001`.

Thus logical requirements are inherited through the consumed interface rather than copied into every downstream proof.

## ErrorsDetected

No new mathematical or proof-engineering failure occurred in the claim-level additive-inverse V5 run.

## VerificationEvidence

```text
R Dedekind additive inverse
V5 32186543211 PASS
```

The verified target included:

```text
raw CutEquiv with principal zero
RBOMA right inverse
RBOMA left inverse
additive cancellation
inverse uniqueness
negation involution
```

## HiddenAssumptions

No built-in Real or Choice-based boundary selection is introduced here.

The reverse containment explicitly consumes the already-certified `R-QARCH-BLOCK-001` contribution rather than reconstructing approximation silently.

## HumanContributions

The requirement that later reverse engineering remain meaningful motivated preserving the two inverse containments as distinct dependency paths rather than collapsing them into one opaque theorem.

## AIContributions

The AI assembled the inverse proof from the accepted cut-negation candidate and fine-bracketing interface, formalized both containments separately, lifted the result to `RBOMA`, and derived the standard additive-group consequences.

## LessonsLearned

```text
L-R-INV-001:
An operation may be representationally well-defined long before its algebraic inverse law is certified.

L-R-INV-002:
Interface-level dependency inheritance permits downstream proofs to consume a theorem with known logical provenance without reintroducing the underlying logical principle locally.

L-R-INV-003:
Reverse-engineering value increases when bidirectional equivalence proofs preserve asymmetric dependency information.
```

## ACT

Promote:

```text
R-ADD-GROUP-BLOCK-001 = PASS / ACTIVE
RA-05 = PASS
RA-06 = PASS
```

The next forward cycle is multiplicative construction. It must not silently define multiplication by an opaque classical sign-case split; competing sign-handling architectures should be studied before promotion.

## ConstructionGraphEffects

```text
R-ADD-BLOCK-001
R-NEG-CANDIDATE-BLOCK-001
R-QARCH-BLOCK-001
        ↓
R-ADD-GROUP-BLOCK-001
```

## LearningGraphEffects

```text
verified negation candidate
  ↓
approximation gate isolated and solved
  ↓
two inverse containments analyzed separately
  ↓
formal additive group accepted
  ↓
next decision: multiplication sign architecture
```

## OpenQuestions

Can multiplication be defined without embedding unrestricted classical sign decisions into the operation definition itself? A positive-part / negative-part decomposition is the primary candidate for the next probe.

## NextCycleInputs

Open a multiplication representation Decision Point and compare at least:

```text
A. positive-part / negative-part decomposition with positive-cut multiplication;
B. direct classical sign-case multiplication;
```

Prefer the route with clearer dependency provenance, representative invariance, and Stage-II branch value.
