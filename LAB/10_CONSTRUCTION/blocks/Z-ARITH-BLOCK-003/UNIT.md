# Z-ARITH-BLOCK-003 — Canonical Integer Commutative-Ring Interface

- **Operational Status:** **ACTIVE / V4+V5 PASS**
- **Epistemic Status:** **DERIVED FROM TWO PRESERVED PRODUCTION ROUTES**
- **Depends on:** `Z-ARITH-J-001`

## Canonical spelling

After direct/pair-mediated reconvergence, the direct signed functions are selected as the canonical executable spelling:

```text
zadd := zaddD
zmul := zmulD
```

This selection does not erase the pair-mediated witnesses `zaddP` and `zmulP`; pointwise equality to those witnesses is part of the Junction certificate.

## Exported arithmetic interface

```text
zero
one := embedN(1)
zneg
zadd
zmul
```

with verified laws:

```text
addition associative
addition commutative
zero additive identity
x + (-x) = 0
negation involutive
multiplication associative
multiplication commutative
one multiplicative identity
zero absorption
left/right distributivity
```

Thus the Block exports the exact commutative-ring law interface required by ZA-06, ZA-08, and ZA-09 rather than relying on a label alone.

## Natural embedding preservation

The accepted embedding `embedN : N_BOMA → Z_BOMA` is injective and now also satisfies:

```text
embedN(0) = 0
embedN(1) = 1
embedN(a+b) = embedN(a) + embedN(b)
embedN(a*b) = embedN(a) * embedN(b)
```

This discharges ZA-10 at the arithmetic level.

## Natural-difference characterization

Every selected signed integer has explicit witnesses `a,b : N_BOMA` such that:

```text
x = embedN(a) + zneg(embedN(b)).
```

This is the accepted ZA-07 generation/characterization certificate.

## Verification

Operation reconvergence:

```text
workflow run: 32169328837
result: PASS
```

Canonical group/ring/embedding/generation laws:

```text
workflow run: 32169564747
Lean:         4.32.1
result:       PASS
```

Evidence:

`LAB/20_FORMALIZATION/Z_STAGE/evidence/Z_RING_V5_LATEST.md`

## Remaining integer obligations

This Block does not yet discharge:

```text
ZA-11 integer order
ZA-12 natural-order extension
ZA-13 ordered-arithmetic compatibility
ZA-17 optional stronger universal characterization beyond natural-difference generation
ZA-18 final commitment ledger
ZA-20 integration gate
ZA-21 closure
```
