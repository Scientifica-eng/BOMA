# Q COMMITMENT LEDGER — Stage-One Rational Construction

**Status:** ACTIVE — pre-integration audit ledger  
**Governing specification:** `BOMA-Q-ACCEPT-001`  
**Identity decision:** `Q-DP-001` — explicit quotient/setoid carrier

This ledger separates mathematical dependencies from representation and backend commitments. It does not promote Q to ACCEPTED by itself.

## Inherited mathematical commitments

The Q stage consumes only previously accepted BOMA interfaces plus explicitly constructed Q gateways:

```text
N-Core / N-Arithmetic
        ↓
accepted Z commutative ordered-ring interface
        ↓
QG-01 nonzero multiplicative cancellation
        ↓
positive-denominator fraction syntax
        ↓
FracEquiv
```

No standard rational carrier is imported as the mathematical definition of `QBOMA`.

## New Stage-One Q commitments

### C-Q-01 — positive denominator syntax

A valid raw denominator is represented structurally by a predecessor `d.pred : BOMANat`, interpreted as `s d.pred`.

Consequences:

- zero denominators are unrepresentable by syntax;
- denominator sign is not duplicated;
- cross-product order has a fixed positive orientation.

### C-Q-02 — fraction identity relation

Raw fractions are identified by:

```text
(a,d) ~ (b,e)  iff  a*e = b*d
```

Reflexivity, symmetry, and transitivity are proved. Transitivity consumes QG-01 explicitly.

### C-Q-03 — quotient identity realization

Stage One selects:

```text
QBOMA := Quotient fracSetoid
```

This is a **formalization / methodological choice**, not a claim that quotient formation is uniquely necessary for the mathematical rational field.

The verified lifting interface is:

```text
Setoid
Quotient
Quotient.sound / Quotient.exact
Quotient.lift / Quotient.lift₂
```

### C-Q-04 — no global inverse selector

For QA-09, nonzero multiplicative inverses are exposed constructively as a unique-witness relation:

```text
QInvRel q r := q*r = 1
q ≠ 0 → ∃ r, QInvRel q r ∧ ∀ s, QInvRel q s → s = r
```

A global `qInv : QBOMA → QBOMA` is not selected at this stage. This avoids adding a Choice commitment merely to expose the field property.

## Explicitly NOT introduced in the current Q payloads

Repository search over `LAB/payloads/lean/QStage` found no occurrences of:

```text
Classical
Choice
sorry
axiom
Rat
gcd
```

Interpretation:

- no classical reasoning declaration was introduced by the Q construction;
- no choice-based representative selector is used;
- no admitted theorem/axiom is used;
- no built-in rational type is used as the carrier;
- no gcd/reduced-fraction canonicalization machinery is used.

This is a source audit statement, not a claim that the Lean kernel has no foundational primitives of its own.

## Representation alternatives preserved

`Q-DP-001` did not reject alternative mathematical realizations.

Retained for controlled later branching:

```text
A  canonical reduced fractions
B  raw syntax + external FracEquiv identity
C  alternative denominator disciplines
```

The Stage-One route chose quotient identity because FracEquiv and operation-respect were already verified while reduced forms would require an additional divisibility/gcd/reduction/uniqueness construction family.

## Verification evidence currently available

```text
QG-01 cancellation                     PASS
fraction equivalence                   PASS
raw arithmetic respect                 PASS
quotient carrier / lifted operations   PASS
raw additive laws                      PASS
quotient additive laws                 PASS
raw multiplicative laws                PASS
quotient multiplicative laws           PASS
raw distributivity                     PASS
quotient distributivity                PASS
nonzero inverse unique witness         PASS
Z/N embedding preservation             PASS
integer-fraction generation            PASS
order core                             ACTIVE V5
```

## Acceptance discipline

QA-20 can be marked PASS only together with the final integration audit confirming that no later Q file introduced an unrecorded commitment.

Until QA-22 and QA-23 close:

```text
QBOMA = constructed Stage-One rational candidate
not yet final accepted Q export
```
