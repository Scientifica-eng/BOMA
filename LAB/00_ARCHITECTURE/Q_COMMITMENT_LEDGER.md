# Q COMMITMENT LEDGER — Stage-One Rational Construction

**Status:** FINAL FOR QA-20 — integration-audited  
**Governing specification:** `BOMA-Q-ACCEPT-001`  
**Identity decision:** `Q-DP-001` — explicit quotient/setoid carrier

This ledger separates mathematical dependencies from representation and backend commitments. Acceptance still requires the separate QA-23 closure decision.

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

### C-Q-05 — quotient order without proposition extensionality

The selected total order is defined by existence of explicit raw representatives whose cross-products satisfy the accepted Z order:

```text
qLE q r :=
  ∃x y : RawFrac,
    q = qmk x ∧ r = qmk y ∧ RawLE x y
```

Representative invariance is proved before total-order laws are promoted. The construction therefore does not need proposition extensionality merely to transport the raw order.

## Explicitly NOT introduced in the final Q payloads

A final repository search over `LAB/payloads/lean/QStage` after the order and integration files were added found no occurrences of:

```text
Classical
Choice
sorry
axiom
Rat
gcd
```

Interpretation:

- no `Classical` declaration was introduced by the Q construction;
- no choice-based representative selector is used;
- no admitted theorem or new axiom is used;
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

## QA-17 interpretation

Stage One built one formal rational carrier realization after the raw-syntax layer:

```text
RawFrac + FracEquiv
       ↓
Q-DP-001
       ↓
QBOMA quotient carrier
```

The raw layer is production syntax/equivalence evidence for the selected carrier, not a second accepted rational carrier. Therefore the QA-17 requirement for reconvergence of **multiple built rational representations** is not triggered in Stage One.

This does not erase the retained reduced-fraction or external-setoid alternatives; they remain explicit Stage-II branch candidates.

## Final verification evidence

```text
QG-01 cancellation                     32172230166  PASS
fraction equivalence                   32172543345  PASS
raw arithmetic respect                 32173010564  PASS
quotient carrier / lifted operations   32174050137  PASS
raw additive laws                      32174278297  PASS
quotient additive laws                 32174565823  PASS
raw multiplicative laws                32174478593  PASS
quotient multiplicative laws           32176289914  PASS
raw distributivity                     32176145896  PASS
quotient distributivity                32176439510  PASS
nonzero inverse unique witness         32176692789  PASS
Z/N embedding preservation             32177123730  PASS
integer-fraction generation            32177245619  PASS
order core                             32177345921  PASS
order additive compatibility           32177896509  PASS
order multiplicative compatibility     32178098823  PASS
full N/Z/Q integration certificate     32178326013  PASS
Lean                                   4.32.1
```

## QA-20 result

```text
commitment inventory    COMPLETE
undeclared Q principle  NOT DETECTED IN SOURCE AUDIT
V5 integration          PASS
QA-20                    PASS
```

The ledger does not claim a field-of-fractions universal property, reduced-fraction uniqueness, or mathematical necessity of quotient identity.
