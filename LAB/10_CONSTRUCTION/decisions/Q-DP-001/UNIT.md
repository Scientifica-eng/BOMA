# Q-DP-001 — Stage-One Rational Identity Realization

- **Operational Status:** **RESOLVED — QUOTIENT / SETOID CARRIER SELECTED**
- **Epistemic Status:** **METHODOLOGICAL / FORMALIZATION CHOICE**
- **Triggered by:** `Q-F-BLOCK-001`, raw-arithmetic respect V5 PASS
- **Target:** `BOMA-Q-ACCEPT-001`

## Decision question

Given valid positive-denominator raw fractions, a verified cross-product equivalence, and verified equivalence-respecting raw arithmetic, how should Stage One realize formal rational identity?

This Decision Point is deliberately separate from the denominator representation choice.

## Candidate A — Quotient / setoid carrier

```text
RawFrac / FracEquiv
```

### Evidence already available

```text
FracEquiv is reflexive/symmetric/transitive
raw negation respects FracEquiv
raw addition respects FracEquiv
raw multiplication respects FracEquiv
Z embedding a ↦ a/1 reflects FracEquiv
```

V5:

```text
fraction equivalence   32172543345 PASS
raw arithmetic respect 32173010564 PASS
Lean                   4.32.1
```

### Commitment cost

Selecting this candidate introduces the first explicit accepted BOMA **quotient/setoid carrier formation commitment** in the number-domain chain:

```text
Setoid RawFrac
Quotient formation
quotient soundness
quotient lift/induction for well-defined operations/theorems
```

This commitment is formalization-dependent and must remain visible in QA-20.

It does not imply `Classical`, choice, proof irrelevance, or use of a built-in rational type unless later evidence actually introduces them.

## Candidate B — canonical reduced fractions

This route remains mathematically viable but requires a substantial new construction family before it can supply carrier identity:

```text
divisibility
gcd/reduction algorithm
gcd correctness
canonical sign/zero handling
uniqueness of reduced representatives
normalization compatibility with + and *
```

These are real mathematical obligations, not backend formatting costs.

The route is **RETAINED as a Stage-II / alternative construction branch**, not rejected.

## Candidate C — external setoid identity without quotient carrier

This minimizes new formal machinery but would make downstream field/order/completion APIs carry `FracEquiv` externally instead of using carrier equality.

It remains a legitimate comparison branch but is not selected for the canonical Stage-One export.

## Decision

Select **Candidate A — explicit quotient/setoid carrier** for Stage One.

Rationale:

```text
identity relation already constructed and V5 checked
operation well-definedness already constructed and V5 checked
no gcd/reduction infrastructure is required merely to form the field carrier
formal equality becomes aligned with verified representation equivalence
later field/order/completion interfaces receive a stable equality notion
new quotient cost is explicit rather than hidden
```

## Non-necessity statement

This selection is a methodological/formalization choice.

BOMA does **not** claim that rational numbers are mathematically required to be quotient objects, nor that reduced fractions are inferior. The preserved alternatives are valuable Stage-II experiments precisely because they expose different identity/normalization costs.

## Immediate construction effect

The next unit may introduce:

```text
Q_BOMA := Quotient(FracEquiv)
```

and lift only operations whose respect proofs are already available.

No field law, inverse, order, or QA-23 acceptance is implied by quotient formation alone.

## Reopening conditions

Reopen if:

```text
quotient machinery introduces an undeclared stronger principle
raw operation respect fails under actual quotient lifting
a reduced-fraction branch demonstrates materially lower accepted commitment cost
a later real-completion stage exposes a decisive obstruction unique to quotient export
```
