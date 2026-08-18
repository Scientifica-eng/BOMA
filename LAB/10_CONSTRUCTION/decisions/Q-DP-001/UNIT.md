# Q-DP-001 — Stage-One Rational Identity Realization

- **Operational Status:** **OPEN / BLOCKED ON RAW-ARITHMETIC RESPECT SUBGATE**
- **Epistemic Status:** **METHODOLOGICAL / FORMALIZATION DECISION POINT**
- **Triggered by:** `Q-F-BLOCK-001` representation route
- **Target:** `BOMA-Q-ACCEPT-001`

## Decision question

Given valid positive-denominator raw fractions and explicit cross-product equivalence, how should Stage One realize **formal rational identity**?

This is separate from the denominator-representation choice.

## Candidate A — Quotient / setoid carrier

```text
RawFrac / FracEquiv
```

### Benefits

```text
formal carrier equality matches equivalence classes
raw operations can be lifted after respect proofs
no gcd/reduction infrastructure required merely to form Q
standard field-of-fractions architecture
```

### New commitment cost

```text
explicit quotient/setoid carrier formation
quotient induction/lifting principles
backend equality now depends on the quotient regime
```

This would be the first accepted BOMA number-domain stage to require a quotient-like carrier commitment if selected.

## Candidate B — Canonical reduced fractions

Construct a unique sign-normalized/reduced representative, schematically:

```text
num : Z_BOMA
den : positive N_BOMA
gcd(|num|, den) = 1
```

### Benefits

```text
explicit canonical syntax/equality
no quotient carrier in final export
normalization visible
```

### New construction burden

```text
divisibility
gcd/reduction algorithm
gcd existence/correctness
canonical sign/zero handling
uniqueness of reduced representation
proof that +,* normalize and preserve meaning
```

This burden is mathematically meaningful and must not be hidden behind a library gcd.

## Candidate C — Scoped setoid identity without quotient carrier

Keep:

```text
carrier syntax = RawFrac
rational identity = FracEquiv
```

and state all results modulo `FracEquiv`.

### Benefits

```text
minimal extra formalization commitment
maximal representation transparency
```

### Costs

```text
downstream theorem interfaces use an external equivalence rather than carrier equality
real-number completion would inherit this representational layer
field uniqueness/comparison APIs become less canonical
```

## Decision criteria

```text
identity transparency
new logical/formal commitments
construction burden
well-defined operation lifting
ordered-field proof burden
later real-completion suitability
formal-verification robustness
Stage-II branch comparability
```

## Current lock

Do not resolve before:

```text
1. QG-01 cancellation gateway PASS;
2. positive-denominator FracEquiv PASS;
3. raw neg/add/mul respect FracEquiv;
4. explicit Study of quotient cost versus reduction cost.
```

Items 1 and 2 are already PASS. Item 3 is the active V5 subgate.
