# PDSA-R-008 — Real Multiplication Sign Architecture

**CycleID:** `PDSA-R-008`  
**Status:** **CLOSED — CANDIDATE A SELECTED**  
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

starting with:

```text
A⁺ = A ∪ principalCut(0)
A⁻ = (-A) ∪ principalCut(0).
```

Retained alternatives:

```text
direct sign-case multiplication
shift-to-positive multiplication
```

Acceptance required a valid positive envelope, representative-invariant nonnegative multiplication, explicit Q-preservation, and comparison of definition-level logical commitments.

## DO

The cycle produced and V5-tested the following chain.

### 1. Positive part

```text
cutPosPart
cutPosPart_respects
rPosPart
```

No sign-case `if` occurs in the definition.

**V5:** `32187088594` — PASS.

### 2. Nonnegative multiplication kernel

```text
cutMulNonnegEnvelope
cutMulNonnegEnvelope_respects
rMulNonnegEnvelope
```

The kernel is representative-invariant and commutative.

**V5:** `32187257316` — PASS.

### 3. Q-level multiplicative approximation

A reusable rational contribution was isolated before attempting preservation:

```text
strict multiplication by positive factors;
nonzero cancellation via existential inverse witnesses;
interior product witnesses below positive rational factors.
```

A first draft incorrectly oriented one `qle_antisymm` call. Study also showed that an assumed positivity hypothesis on the first factor was unnecessary; the interface was strengthened by deleting the redundant hypothesis.

**V5:** `32187796232` — PASS.

### 4. Nonnegative Q preservation

For `q,r ≥ 0`:

```text
rMulNonnegEnvelope (rOfQ q) (rOfQ r)
  = rOfQ (qMul q r).
```

**V5:** `32187981163` — PASS.

### 5. Signed compositional candidate

The selected definition is:

```text
xy = x⁺y⁺ + x⁻y⁻ - x⁺y⁻ - x⁻y⁺.
```

implemented as `rMulCandidate` without proposition-valued sign branching in the operation definition.

All-sign preservation of Q was then proved by sign analysis **in the proof only**.

The first V5 run exposed only normalization gaps in two mixed-sign proof branches; after adding the missing additive-zero simplifications, the same mathematical definition passed.

**V5:** `32189753112` — PASS.

## Observations

1. Union-with-zero is sufficient to build a canonical representative-invariant nonnegative envelope.
2. The nonnegative multiplication kernel can be defined without proof-valued sign parameters.
3. Q-preservation is easiest to audit when the rational multiplicative-approximation lemma is its own reusable contribution rather than hidden inside the Dedekind proof.
4. Total sign comparison is still useful, but Candidate A needs it only in identification/preservation proofs, not in the operation definition.
5. Direct sign-case multiplication would generally require a decidable/classical sign selector to return different `RBOMA` values from proposition-valued sign information, placing that commitment at definition level.
6. Candidate C would introduce extra shift-existence and shift-independence obligations and couples multiplication more strongly to approximation infrastructure.

## STUDY

### Why Candidate A is preferred

The decisive architectural gain is **localization of logical commitments**.

Candidate A separates:

```text
construction of positive envelope;
nonnegative product kernel;
rational multiplicative approximation;
signed algebraic recombination;
proof-only sign comparison.
```

This separation makes each dependency independently testable and later reverse-engineerable.

Candidate B is not mathematically rejected. It is retained as a Stage-II alternative because it may have shorter textbook-style local proofs, but its definition-level logical provenance is coarser.

Candidate C remains a useful branch candidate if later multiplication-law proofs show unexpected complexity in Candidate A.

### ErrorsDetected

```text
1. positive-part V5 initially omitted the CutLE-producing supremum dependency from CI assembly;
2. Q multiplicative approximation initially used antisymmetry arguments in the wrong order;
3. signed Q preservation initially left two additive-zero normalization steps unresolved.
```

All three were classified as proof/verification engineering errors, not counterexamples to the candidate mathematics.

### Successes

```text
positive-part layer PASS;
nonnegative multiplication kernel PASS;
Q multiplicative approximation PASS;
nonnegative Q preservation PASS;
signed all-sign Q preservation PASS;
classical sign selection kept out of operation definition.
```

## HiddenAssumptions

No built-in `Real` multiplication was used.

No global sign selector or Choice-based branch selector was introduced into `rMulCandidate`.

Classical/order-total reasoning may appear in proof branches that identify the positive and negative parts, and that provenance must remain distinct from the definition itself.

## HumanContributions

The project requirement that later reverse engineering remain meaningful determined an important acceptance criterion: sign handling, logical commitments, rational approximation, and the multiplication kernel must remain separable rather than compressed into one opaque textbook definition.

## AIContributions

The AI proposed the decomposition route, isolated the Q multiplicative approximation layer, distinguished definition-level from proof-level classical sign use, diagnosed V5 failures, and minimized one rational approximation theorem by deleting a redundant positivity assumption.

## VerificationEvidence

```text
32187088594  positive-part envelope                     PASS
32187257316  nonnegative multiplication kernel          PASS
32187796232  Q multiplicative approximation             PASS
32187981163  nonnegative Q multiplication preservation  PASS
32189753112  signed candidate + all-sign Q preservation PASS
```

## LessonsLearned

1. A sign-sensitive operation need not have a sign-sensitive **definition** if a suitable algebraic decomposition is available.
2. Rational approximation lemmas should be extracted as reusable certified contributions before being consumed by real-analysis constructions.
3. V5 assembly errors can imitate theorem failures; dependency assembly must be audited before mathematical conclusions are drawn.
4. Minimal-assumption pressure during formalization can improve the mathematical interface, not merely the Lean proof.
5. The selected architecture creates a particularly clean reverse-engineering boundary between Q arithmetic, Dedekind representation, sign decomposition, and logic.

## ACT

**Select Candidate A as the canonical Stage-I multiplication architecture.**

Resolve `R-DP-005` accordingly.

Promote `rMulCandidate` as the selected multiplication-definition candidate, but do **not** mark the field multiplication obligations complete until law-level gates pass.

Retain Candidates B and C as explicit Stage-II alternatives.

## ConstructionGraphEffects

Add/recognize the chain:

```text
R-ADD-GROUP-BLOCK-001
  ↓
R-POS-PART-BLOCK
  ↓
R-NONNEG-MUL-KERNEL
  ↓
Q-POS-MUL-APPROX contribution
  ↓
R-SIGNED-MUL-CANDIDATE
```

with `R-DP-005` resolved in favor of the final node as the Stage-I multiplication architecture.

## LearningGraphEffects

```text
sign-sensitive multiplication question
  ↓
positive-envelope hypothesis
  ↓
nonnegative kernel succeeds
  ↓
Q approximation isolated and minimized
  ↓
Q preservation succeeds
  ↓
all-sign compositional candidate succeeds
  ↓
definition-level logic comparison
  ↓
Candidate A selected
```

## OpenQuestions

The selected operation still requires law-level certification:

```text
multiplicative identity;
associativity;
distributivity;
order compatibility;
nonzero inverse;
field-level acceptance.
```

## NextCycleInputs

Open a separate multiplication-law PDSA cycle. First prove the algebra of the nonnegative kernel—especially zero, one, associativity, and the distributive interface needed by the signed expansion—then lift those results to `rMulCandidate`.

`R-DP-005` must be included explicitly in the later `RE-R-001` reverse-engineering pass.
