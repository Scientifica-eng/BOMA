# RATIONAL ACCEPTANCE SPECIFICATION

**Document ID:** `BOMA-Q-ACCEPT-001`  
**Version:** `1.0`  
**Status:** **ACTIVE — TARGET SPECIFICATION**  
**Depends on:** `Z-BLOCK-002 — Accepted Stage-One Integer Interface`  
**Post-Z reverse prerequisite:** `PDSA-Z-RE-001` CLOSED

## Purpose

Define what BOMA must establish before a Stage-One rational domain may be accepted.

This specification is representation-neutral. It does **not** define rationals as Lean built-in `Rat`, as a quotient of pairs by default, or as reduced fractions by default.

The rational stage must expose a new structural issue that did not need to be settled merely to accept Z:

> denominator validity and multiplicative cancellation must be explicit before fraction equivalence can be trusted.

---

# Pre-rational gateway

## QG-01 — Nonzero multiplication / cancellation gateway

Before a fraction-equivalence route may be promoted, establish an explicit integer theorem sufficient for denominator cancellation, for example:

```text
c ≠ 0 ∧ a*c = b*c  ⇒  a=b
```

or an equivalent integral-domain/no-zero-divisor interface with exact hypotheses.

This theorem must be derived from the accepted BOMA Z package; it must not be imported from built-in integers or an external field/ring structure.

The gateway is a separate auditable unit because transitivity of cross-product fraction equivalence consumes it.

## QG-02 — Positive/nonzero denominator interface

Declare the denominator discipline used by the selected route. Candidate Stage-One disciplines include:

```text
positive natural denominator
nonzero natural denominator + sign normalization
nonzero integer denominator + sign normalization
```

The relationship between denominator syntax, nonzeroness proof, and rational identity must be explicit.

---

# Carrier / identity obligations

## QA-01 — Explicit rational carrier

Construct a fresh/scoped rational carrier `Q_BOMA` or an explicitly declared equivalent realization.

Built-in `Rat` must not be the carrier definition.

## QA-02 — Rational identity/equality

State exactly when two representations denote the same rational.

For a pair-style route, a typical candidate is:

```text
(a,b) ~ (c,d)  iff  a*d = c*b
```

under the declared denominator discipline.

Reflexivity, symmetry, and especially transitivity must be independently justified.

## QA-03 — Representation/accounting boundary

Distinguish:

```text
raw fraction syntax
valid denominator evidence
representation equivalence
normalization/reduction
formal rational equality
backend-only representation
```

No equality layer may be silently substituted for another.

---

# Integer embedding / field operations

## QA-04 — Integer embedding

Construct:

```text
ιZ : Z_BOMA → Q_BOMA
```

and prove injectivity/faithfulness.

## QA-05 — Zero / one

Construct rational zero and one and prove compatibility with integer zero/one embedding.

## QA-06 — Negation

Construct total negation and prove compatibility with the integer embedding.

## QA-07 — Addition

Construct total rational addition and prove representation independence / well-definedness.

## QA-08 — Multiplication

Construct total rational multiplication and prove representation independence / well-definedness.

## QA-09 — Multiplicative inverse on nonzero rationals

Construct:

```text
inv : {q : Q_BOMA // q ≠ 0} → Q_BOMA
```

or an exact equivalent partial/total-with-proof interface.

Prove:

```text
q ≠ 0 → q * inv(q) = 1
```

with all denominator-validity obligations exposed.

## QA-10 — Field laws

Verify the exact commutative-field interface required for Stage One:

```text
commutative additive group
commutative multiplication
one identity
zero absorption
distributivity
nonzero multiplicative inverses
```

Do not rely only on a field label.

---

# Embedding preservation

## QA-11 — Integer arithmetic preservation

Prove:

```text
ιZ(0)=0
ιZ(1)=1
ιZ(a+b)=ιZ(a)+ιZ(b)
ιZ(a*b)=ιZ(a)*ιZ(b)
ιZ(-a)=-ιZ(a)
```

and injectivity.

## QA-12 — Natural embedding coherence

The composed embedding:

```text
N_BOMA → Z_BOMA → Q_BOMA
```

must agree with the rational interpretation of accepted naturals.

This is a provenance/coherence obligation rather than permission to bypass Z.

---

# Order obligations

## QA-13 — Rational order construction

Construct a total order on `Q_BOMA` with its representation-independence proof.

## QA-14 — Integer-order extension

Prove:

```text
ιZ(a) ≤_Q ιZ(b) ↔ a ≤_Z b.
```

## QA-15 — Ordered-field compatibility

At minimum establish exact hypotheses/results for:

```text
addition translation invariance
negation order reversal
multiplication monotonicity for nonnegative factors
positive inverse behavior
```

and whatever stronger ordered-field interface is selected for Stage One.

---

# Characterization / adequacy

## QA-16 — Every rational is an integer fraction

Establish a representation/generation theorem of the form:

```text
∀q, ∃a : Z_BOMA, ∃d : valid denominator,
  q = ιZ(a) * inv(ιZ(d))
```

or a precisely equivalent statement.

## QA-17 — Fraction representation convergence

If multiple representations are built, establish explicit translations and round-trip/equivalence theorems before selecting a canonical export.

Candidate routes for study:

### Route F — equivalence-class semantics

```text
integer numerator + positive/nonzero denominator
cross-product equivalence
```

Possible canonical realization may require an explicit quotient/setoid commitment.

### Route R — reduced/canonical fractions

```text
sign-normalized denominator
reduced numerator/denominator by gcd-like structure
```

This avoids quotient identity at the export level but requires divisibility/gcd/reduction infrastructure and a uniqueness proof.

Neither route is declared superior in advance.

## QA-18 — Canonical representation Decision Point

Only after route evidence exists may `Q-DP-001` select the Stage-One canonical rational representation.

Selection criteria must include:

```text
identity transparency
commitment cost
normalization burden
proof burden
field-operation compositionality
order transparency
later real-completion suitability
formal verification suitability
branch comparability
```

A selected representation remains a methodological/formalization choice, not a mathematical necessity.

## QA-19 — Adequacy / uniqueness certificate

Provide enough explicit characterization to distinguish the accepted Q domain from arbitrary fraction-looking structures.

Preferred evidence may include:

```text
integer-fraction generation
field laws
faithful Z embedding
representation classification
and, if constructed, a field-of-fractions universal property with exact scope
```

No universal property may be claimed merely because the carrier behaves like fractions.

---

# Commitment / verification / integration

## QA-20 — Commitment ledger

Record all new commitments, especially any use of:

```text
quotient/setoid carrier formation
proof irrelevance
choice/classical reasoning
gcd/divisibility infrastructure
normalization algorithms
decidable comparison/nonzeroness
new universe assumptions
```

## QA-21 — Formal verification

Map machine-relevant claims to canonical units and check them under the pinned reproducible backend.

Built-in rational numbers may be used only later as an external comparison target after `Q_BOMA` exists.

## QA-22 — Rational integration gate

A final Junction must verify mutual compatibility of:

```text
carrier/equality
denominator discipline
Z embedding
addition/multiplication/inverse
field laws
order
representation convergence
characterization
commitment ledger
V5 evidence
```

## QA-23 — Rational closure

Only after QA-01..22 pass may the project classify the Stage-One rational domain as accepted and promote the project to the real-number stage.

---

# Initial research topology

```text
Z-BLOCK-002 Accepted Z
        │
        ▼
QG-01 cancellation / no-zero-divisor gateway
        │
        ▼
QG-02 denominator discipline
        │
        ├────────► Route F — fraction pairs + explicit equivalence
        │
        └────────► Route R — canonical/reduced fractions
                           \   /
                            \ /
                         Q-J-001
                representation convergence study
                            │
                            ▼
                         Q-DP-001
                canonical representation choice
                            │
                            ▼
               field operations / order / embedding
                            │
                            ▼
                        Q-J-002
                    integration gate
                            │
                            ▼
                       QA-23 ACCEPT
```

The first rational PDSA cycle must study QG-01 before treating cross-product equivalence as an established setoid.
