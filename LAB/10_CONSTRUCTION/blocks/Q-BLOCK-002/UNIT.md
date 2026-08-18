# Q-BLOCK-002 — Accepted Stage-One Rational Interface

- **Operational Status:** **ACTIVE — ACCEPTED**
- **Epistemic Status:** **MIXED FORMALIZATION CHOICE + DERIVED CERTIFIED PACKAGE**
- **Acceptance:** `QA-23 = ACCEPT`
- **Depends on:** `Q-BLOCK-001`, `Q-J-002`, `PDSA-Q-004`

## Purpose

Provide the canonical downstream interface for the accepted BOMA Stage-One rational domain while preserving the raw-fraction, quotient, verification, and Decision Point provenance.

## Carrier / formal identity

The inherited carrier/identity layer is `Q-BLOCK-001`:

```text
QBOMA := Quotient fracSetoid
```

with raw syntax:

```text
numerator   : Z_BOMA
denominator : structurally positive N_BOMA
```

and representation equivalence:

```text
(a,d) ~ (b,e)  iff  a*e = b*d.
```

The quotient selection comes from `Q-DP-001` and is a declared methodological/formalization choice.

## Core constants and operations

```text
qZero
qOne
qNeg
qAdd
qMul
```

with verified:

```text
additive commutative-group laws
multiplicative commutative-monoid laws
zero absorption
nontriviality
distributivity
```

## Nonzero inverse interface

Stage One does not introduce a global Choice-based inverse selector solely for closure.

Instead:

```text
QInvRel q r := q*r = 1
```

and for every `q ≠ 0` there exists an inverse witness, unique among all witnesses.

This certifies the required field behavior at the accepted interface scope.

## Integer and natural embeddings

```text
qOfZ : Z_BOMA → QBOMA
```

is injective and preserves:

```text
0
1
negation
+
*
≤
```

The natural embedding is the documented composition:

```text
N_BOMA → Z_BOMA → QBOMA
```

and preserves accepted natural zero, one, addition, and multiplication.

## Total order

```text
qLE
```

is a representative-invariant total order induced by positive-denominator cross multiplication.

Verified properties include:

```text
reflexivity
transitivity
antisymmetry
totality
exact extension of accepted Z order
addition translation invariance
negation order reversal
multiplication monotonicity for nonnegative factors
positive inverse behavior
```

## Generation / characterization

Every accepted rational has an explicit representative:

```text
q = class(a / d)
```

with:

```text
a : Z_BOMA
d : structurally positive N_BOMA.
```

Equality of explicit fraction classes is exactly the certified cross-product equivalence.

## Preserved alternatives

The accepted export does not erase unselected representations.

Stage-II candidates remain:

```text
canonical reduced fractions
raw syntax + external FracEquiv identity
alternative denominator disciplines
```

No convergence against a second independently built formal Q carrier is claimed in Stage One.

## Verification summary

```text
cancellation gateway                 32172230166
fraction equivalence                 32172543345
raw arithmetic respect               32173010564
quotient carrier                     32174050137
raw additive laws                    32174278297
quotient additive laws               32174565823
raw multiplicative laws              32174478593
raw distributivity                   32176145896
quotient multiplicative laws         32176289914
quotient distributivity              32176439510
nonzero inverse witness              32176692789
Z/N embeddings                       32177123730
generation                           32177245619
order core                           32177345921
order additive compatibility         32177896509
order multiplicative compatibility   32178098823
final integration                    32178326013
Lean                                 4.32.1
```

## Commitment scope

The final Q payload audit records the explicit quotient commitment and found no source occurrence of:

```text
Classical
Choice
sorry
axiom
Rat
gcd
```

No field-of-fractions universal property, reduced-fraction uniqueness, or mathematical necessity of quotient identity is implied.

## Downstream permission

`Q-BLOCK-002` may feed the real-number acceptance/architecture stage.

It does not preselect a real completion regime.
