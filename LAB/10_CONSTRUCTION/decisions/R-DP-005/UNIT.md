# R-DP-005 — Real Multiplication Sign Architecture

- **Operational Status:** **RESOLVED — CANDIDATE A SELECTED FOR CANONICAL STAGE-I ROUTE**
- **Epistemic Status:** **MATHEMATICAL / ARCHITECTURAL DECISION POINT**
- **Input:** `R-ADD-GROUP-BLOCK-001`, selected Dedekind carrier `RBOMA`
- **Targets:** `RA-04`, `RA-07`, `RA-09`, `RA-10`, later `RA-08`
- **Resolution date:** 2026-08-18

## Decision question

How should multiplication on arbitrary signed Dedekind reals be constructed so that:

```text
its definition is representative-invariant;
sign handling is explicit;
logical commitments remain localized;
rational multiplication is preserved;
field laws can be audited without importing built-in Real;
Stage-II alternatives remain testable?
```

## Selected route — Candidate A: positive/negative-part decomposition

Define the nonnegative envelope by union rather than a sign decision:

```text
A⁺ := max(A,0)
    := A ∪ principalCut(0)
```

and use the already-defined negation for the negative envelope:

```text
A⁻ := max(-A,0).
```

Construct multiplication first on nonnegative envelopes, then define signed multiplication compositionally:

```text
xy = x⁺y⁺ + x⁻y⁻ - x⁺y⁻ - x⁻y⁺.
```

The selected Lean candidate is `rMulCandidate` in:

```text
LAB/payloads/lean/RStage/RDedekindSignedMultiplicationCandidate.lean
```

The operation definition itself contains no proposition-valued sign `if`, no global sign selector, and no built-in `Real` multiplication.

## Evidence supporting Candidate A

The route was decomposed into independently audited layers.

### A1/A2 — positive envelope

`cutPosPart` is a valid lower cut, respects `CutEquiv`, lifts to `RBOMA`, and is above both zero and the original input.

```text
V5 run 32187088594 — PASS
```

### A3/A4 — nonnegative multiplication kernel

`cutMulNonnegEnvelope` is a valid lower cut, respects `CutEquiv`, lifts to `RBOMA`, and is commutative.

```text
V5 run 32187257316 — PASS
```

### Shared Q multiplicative approximation

A Q-level contribution was isolated instead of hiding approximation inside the real multiplication proof. It proves strict multiplication/cancellation and interior product witnesses using existential inverse witnesses and rational density.

```text
V5 run 32187796232 — PASS
```

### Nonnegative Q preservation

For nonnegative rationals, the nonnegative-envelope real multiplication agrees exactly with principal-cut rational multiplication.

```text
V5 run 32187981163 — PASS
```

### A5 — signed Q preservation

The signed candidate preserves rational multiplication for all four sign combinations while keeping sign splitting in the proof rather than the operation definition.

```text
V5 run 32189753112 — PASS
```

## Candidate B — direct sign-case multiplication

Candidate B remains a legitimate Stage-II branch but is not selected for the canonical Stage-I route.

The decisive logical distinction is definition-level elimination. The available total-order comparison has proposition-valued output. Using it merely to prove sign-identification lemmas is local logical reasoning; using it to **define an `RBOMA` value by cases** generally requires a computational decision/selector such as classical decidability or an equivalent explicit commitment.

Thus Candidate B tends to place classical sign selection inside the definition of multiplication itself, whereas Candidate A keeps the operation definition compositional and confines sign comparison to proofs.

This is not a claim that Candidate B is mathematically invalid. It is an architectural comparison about dependency localization, auditability, and later branch analysis.

## Candidate C — shift-to-positive multiplication

Candidate C is retained as a non-canonical alternative for later branch testing. It was not selected because it would require additional shift-existence and shift-independence obligations and risks coupling multiplication prematurely to Archimedean/global approximation infrastructure.

## Decision

**Select Candidate A for the canonical Stage-I construction.**

The decision is based on the conjunction of:

```text
representative-invariant positive envelope;
representative-invariant nonnegative product kernel;
all-sign preservation of the accepted Q embedding;
no sign-case selector in the multiplication definition;
separable logical provenance;
clear reusable Q-level approximation interface;
strong reverse-engineering visibility.
```

## Scope of this resolution

This decision selects the **architecture and candidate operation**. It does **not** yet certify the full ordered-field multiplication package.

Still pending after this decision:

```text
multiplicative identity on arbitrary RBOMA;
associativity;
distributivity over rAdd;
order compatibility / positivity laws;
nonzero inverse construction;
field-level RA-04 / RA-07 / RA-08 closure.
```

Therefore `rMulCandidate` may be promoted as the selected multiplication definition interface, but RA-04/RA-07 must remain pending until law-level V5 gates pass.

## Reverse-engineering significance

`R-DP-005` is a mandatory node for `RE-R-001`.

The later reverse-engineering pass must separately classify:

```text
positive-envelope construction;
nonnegative multiplication kernel;
Q multiplicative approximation contribution;
sign-composition formula;
proof-only use of sign totality;
rejected-for-Stage-I definition-level classical sign selection;
```

and determine which are structurally necessary for a real-field realization and which are specific to the selected Dedekind route.

## Stage-II branch value

Retain at least these explicit alternatives:

```text
A  positive/negative-part decomposition — SELECTED Stage-I route;
B  direct sign-case multiplication — retained branch;
C  shift-to-positive multiplication — retained branch.
```

They are suitable later for controlled comparison of definition-level logic, proof burden, dependency propagation, and convergence to equivalent field interfaces.
