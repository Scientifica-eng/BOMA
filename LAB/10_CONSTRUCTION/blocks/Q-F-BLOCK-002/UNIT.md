# Q-F-BLOCK-002 — Equivalence-Respecting Raw Fraction Arithmetic

- **Operational Status:** **PASS / V5**
- **Epistemic Status:** **DERIVED MODULO VERIFIED FRACTION EQUIVALENCE**
- **Depends on:** `Q-F-BLOCK-001`, `Q-GATE-BLOCK-001`

## Purpose

Verify that the intended fraction arithmetic is representation-independent before any quotient carrier is created.

## Raw operations

```text
rawNeg(a/b)      = (-a)/b
rawAdd(a/b,c/d)  = (a*d + c*b)/(b*d)
rawMul(a/b,c/d)  = (a*c)/(b*d)
```

Denominator multiplication remains positive by construction.

## Respect interface

Verified:

```text
x ~ x'                     → rawNeg(x) ~ rawNeg(x')
x ~ x' ∧ y ~ y'            → rawAdd(x,y) ~ rawAdd(x',y')
x ~ x' ∧ y ~ y'            → rawMul(x,y) ~ rawMul(x',y')
```

The proofs use explicit accepted-Z distributivity and factor rearrangement; no external ring normalizer supplies the mathematical argument.

## Verification

First V5 run `32172739356` failed only in proof orientation/factor-ordering and unavailable helper syntax. Operation definitions were not changed.

After explicit algebraic correction:

```text
workflow run: 32173010564
Lean:         4.32.1
result:       PASS
```

Evidence:

`LAB/20_FORMALIZATION/Q_STAGE/evidence/Q_RAW_ARITH_V5_LATEST.md`

## Architectural effect

`Q-DP-001` is eligible to resolve because the quotient/setoid candidate now has both:

```text
verified equivalence relation
verified operation-respect proofs
```

This Block itself still uses raw syntax + external equivalence and does not create formal rational carrier equality.
