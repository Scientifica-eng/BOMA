# PDSA-R-009 — Real Multiplication Law Certification

**CycleID:** `PDSA-R-009`  
**Status:** **ACTIVE — K0/K1/K2 PASS; SIGNED BASIC-LAW GATE ACTIVE**  
**Date:** 2026-08-18  
**ParentCycles/LearningInputs:** `PDSA-R-008`, `PDSA-R-007`, `PDSA-R-006`  
**Selected architecture:** `R-DP-005 / Candidate A`

## ResearchQuestion

Can the selected sign-case-free multiplication architecture be certified as the multiplicative component of the Stage-One real ordered-field interface without importing built-in `Real` algebra?

## PLAN

Certify the nonnegative-envelope kernel first:

```text
K0  zero annihilation
K1  one / positive-envelope identity
K2  associativity
K3  distributive interface over nonnegative addition
K4  order / positivity compatibility needed by the signed lift
```

Then lift through:

```text
xy = x⁺y⁺ + x⁻y⁻ - x⁺y⁻ - x⁻y⁺
```

to:

```text
S1  commutativity
S2  zero laws
S3  one laws
S4  associativity
S5  distributivity
S6  Q preservation — inherited PASS
S7  ordered-ring compatibility
```

## DO — completed in this cycle so far

### K0/K2 — zero and associativity

A dedicated payload proved:

```text
K(0,x)=0
K(x,0)=0
positive-envelope closure of K
K(K(x,y),z)=K(x,K(y,z))
```

Associativity was not mere syntactic reassociation because kernel membership is defined by strict rational witnesses. Reassociation required a fresh interior witness. The previously certified Q theorem `q_positive_product_inner_approx` supplied exactly that witness.

### K1 — one on the nonnegative kernel

The correct kernel unit statement is:

```text
K(1,x)=x⁺
K(x,1)=x⁺
```

not `K(1,x)=x` for arbitrary signed x.

The reverse inclusion again reused `q_positive_product_inner_approx`; no new approximation gateway was required.

### Signed positive/negative decomposition

A separate payload proved:

```text
x = x⁺ - x⁻
```

in formal notation:

```text
rAdd (rPosPart x) (rNeg (rNegPart x)) = x.
```

The envelope definitions remain sign-case-free. The final identification theorem explicitly consumes the already-isolated `rLE_total_classical` interface. Thus classical comparability is proof-level provenance, not definition-level provenance.

### Signed basic laws

A separate payload is testing:

```text
S1 commutativity
S2 zero annihilation
S3 one identity
```

The one proof reduces `1*x` to `x⁺-x⁻` and then consumes the decomposition theorem.

Two early V5 failures in this payload were proof normalization only:

```text
repeating a zero rewrite after the first rewrite had already rewritten all matches;
failing to expose rOne = rOfQ qOne before applying rOfQ_neg.
```

Both were corrected without changing any theorem statement or mathematical definition.

## Observations

1. Kernel associativity reuses the Q multiplicative-approximation contribution from PDSA-R-008; it did not require a new axiom or approximation family.
2. The kernel unit is naturally an identity on the nonnegative envelope, which validates the two-layer architecture rather than collapsing it.
3. A signed decomposition theorem is genuinely needed before the full multiplication unit law can be proved cleanly.
4. The decomposition theorem provides a precise logical boundary: sign-free definitions plus isolated classical sign identification in proof.
5. Preliminary analysis of K3 suggests distributivity on the nonnegative cone may be derivable from Q density, cut roundedness, and rational distributivity rather than a new Archimedean gateway. This remains a hypothesis until V5.

## STUDY

### Why associativity needed approximation reuse

From a nested witness such as

```text
q < u*c
u < a*b
```

one obtains `q < a*(b*c)`, but the opposite nesting requires an interior witness actually belonging to the nested kernel. `q_positive_product_inner_approx` supplies such an interior factorization. This is a **real representation proof dependency** on a reusable Q contribution, and must be visible during `RE-R-001`.

### Why the full one law needs classical comparability

The definitions `x⁺` and `x⁻` do not decide whether x is positive or negative. To prove their canonical decomposition equals x, the current selected proof uses the isolated classical total-order witness to identify which envelope collapses to zero. Therefore:

```text
definition-level multiplication architecture — no sign selector;
signed decomposition identification proof — consumes localized classical comparability.
```

This distinction is architecturally material.

## ErrorsDetected

```text
1. signed-basic-law V5 initially used repeated rw steps after one rewrite had already normalized all zero-kernel occurrences;
2. the -1 kernel lemma initially attempted rOfQ_neg before unfolding rOne.
```

Both are proof-engineering errors.

## Successes

```text
K0 zero annihilation                                  PASS
K1 one-to-positive-envelope identity                 PASS
K2 associativity                                     PASS
positive/negative signed decomposition               PASS
S6 all-sign Q multiplication preservation            PASS inherited
S1/S2/S3 combined V5                                 active after normalization fixes
```

## HiddenAssumptions

Forbidden shortcuts remain:

```text
built-in Real ring/field instances;
semantic transfer from standard Dedekind reals;
untracked classical sign selectors in operation definitions;
assuming distributivity from Q preservation alone.
```

The localized classical comparability used by the decomposition theorem is explicit, previously audited, and not hidden.

## VerificationEvidence

```text
32187257316  nonnegative multiplication kernel          PASS
32187981163  nonnegative Q multiplication preservation PASS
32189753112  signed candidate + all-sign Q preservation PASS
32190372037  K0/K1/K2 kernel laws                       PASS
32190664688  positive-negative decomposition            PASS
S1/S2/S3 signed basic-law rerun                         PENDING
```

## HumanContributions

The project requirement that reverse engineering remain meaningful determined the separation among kernel algebra, Q approximation, positive/negative decomposition, and classical sign identification.

## AIContributions

The AI isolated the kernel-law package, identified approximation reuse in associativity, derived the correct one-to-positive-envelope statement, separated the signed decomposition theorem, and diagnosed proof-normalization failures without reclassifying them as mathematical failures.

## ACT candidates

```text
A  after S1/S2/S3 PASS, proceed to K3 distributivity;
B  if K3 exposes a genuinely new approximation obligation, isolate it as a reusable gateway;
C  if K3 can be proved from density/roundedness/Q distributivity, record that no new gateway was needed;
D  reopen R-DP-005 only if a structural law fails mathematically, not for proof-engineering failures.
```

## ConstructionGraphEffects

Current frontier:

```text
R-SIGNED-MUL-CANDIDATE
  ├── K0/K1/K2 certified
  ├── signed decomposition certified
  └── S1/S2/S3 gate active
          ↓
       K3/K4
          ↓
       S4/S5/S7
          ↓
       R-MUL-BLOCK
```

## LearningGraphEffects

```text
architecture selected
  ↓
kernel strict-witness associativity
  ↓
reuse Q inner-product approximation
  ↓
K0/K1/K2 PASS
  ↓
signed decomposition isolates classical sign identification
  ↓
signed 0/1/commutativity gate
```

## Reverse-engineering note

`RE-R-001` must separately tag:

```text
Q inner-product approximation reuse in K2/K1;
Dedekind roundedness used to produce interior cut witnesses;
classical comparability used only for signed decomposition identification;
proof-normalization failures as proof-engineering-only.
```

## NextCycleInputs

1. close the rerun of S1/S2/S3;
2. construct K3 distributivity on the nonnegative cone;
3. record explicitly whether K3 needs a new approximation gateway;
4. only then attempt signed associativity/distributivity and ordered-ring compatibility.

Do not promote `RA-07` until the law package is sufficiently complete for the acceptance specification.
