# PDSA-R-009 — Real Multiplication Law Certification

**CycleID:** `PDSA-R-009`  
**Status:** **ACTIVE**  
**Date:** 2026-08-18  
**ParentCycles/LearningInputs:** `PDSA-R-008`, `PDSA-R-007`, `PDSA-R-006`  
**Selected architecture:** `R-DP-005 / Candidate A`

## ResearchQuestion

Can the selected sign-case-free multiplication architecture be certified as the multiplicative component of the Stage-One real ordered-field interface without importing built-in `Real` algebra?

## PLAN

Do not attack all signed laws at once.

First certify the nonnegative-envelope kernel as an algebraic component:

```text
K0  zero annihilation
K1  one / positive-envelope identity
K2  associativity
K3  distributive interface over nonnegative addition
K4  order / positivity compatibility needed by the signed lift
```

Then lift through the selected signed expansion:

```text
xy = x⁺y⁺ + x⁻y⁻ - x⁺y⁻ - x⁻y⁺
```

to prove:

```text
S1  rMul commutative
S2  rMul zero laws
S3  rMul one laws
S4  rMul associative
S5  left/right distributivity over rAdd
S6  Q embedding preserves selected multiplication
S7  ordered-ring compatibility
```

`S6` already has candidate-level V5 evidence from PDSA-R-008 and will be inherited, not reproved unnecessarily.

## DO — initial target

Build a dedicated kernel-law payload rather than extending the candidate definition file.

First theorem family:

```text
cutMulNonnegEnvelope zero A ≈ zero
cutMulNonnegEnvelope A zero ≈ zero
rMulNonnegEnvelope rZero x = rZero
rMulNonnegEnvelope x rZero = rZero
```

Then test associativity before distributivity.

## STUDY questions

1. Which laws follow directly by witness reassociation and rational algebra?
2. Which laws require new approximation lemmas?
3. Does `cutPosPart` being idempotent on nonnegative cuts eliminate extra sign logic from kernel associativity?
4. Does distributivity require an additive approximation contribution analogous to the multiplicative Q approximation isolated in PDSA-R-008?
5. Can all signed laws be reduced to kernel laws plus additive-group algebra, or is an additional positive/negative-part decomposition theorem needed?

## HiddenAssumptions

Forbidden shortcuts:

```text
built-in Real ring/field instances;
semantic transfer from standard Dedekind reals without proof;
untracked classical sign selectors inside operation definitions;
assuming distributivity from Q preservation alone.
```

## VerificationEvidence

Inherited:

```text
32187257316  nonnegative multiplication kernel          PASS
32187981163  nonnegative Q multiplication preservation PASS
32189753112  signed candidate + all-sign Q preservation PASS
```

New law-level evidence is pending.

## HumanContributions

The project requires the selected multiplication route to remain reverse-engineerable. Therefore law proofs must preserve the distinction between Q arithmetic, Dedekind witness algebra, sign decomposition, and logical comparability.

## AIContributions

The AI proposed separating the kernel-law certification cycle from the architecture-selection cycle so that a successful definition is not conflated with a certified field operation.

## ACT candidates

```text
A  certify kernel laws, then promote signed multiplication laws;
B  isolate a new approximation gateway if distributivity/identity exposes one;
C  revise only the failing kernel interface if a law reveals a structural defect;
D  reopen R-DP-005 only if the selected architecture itself becomes untenable.
```

## ConstructionGraphEffects

Current frontier:

```text
R-SIGNED-MUL-CANDIDATE
  ↓
PDSA-R-009 law gates
  ↓
R-MUL-BLOCK (only after required laws PASS)
```

## LearningGraphEffects

```text
multiplication architecture selected
  ↓
definition/Q-preservation separated from law certification
  ↓
kernel laws studied before signed algebra
```

## Reverse-engineering note

All new law dependencies must be tagged for `RE-R-001`, especially any approximation theorem that appears only because of the Dedekind witness representation.

## NextCycleInputs

Start with kernel zero laws and associativity. Do not promote `RA-07` until the law package is sufficiently complete for the acceptance specification.
