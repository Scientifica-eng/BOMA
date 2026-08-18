# Z-ARITH-BLOCK-003 — Canonical Integer Arithmetic Interface

- **Operational Status:** **ACTIVE — OPERATIONS CONVERGED / LAW PACKAGE UNDER V5**
- **Epistemic Status:** **DERIVED FROM TWO PRESERVED PRODUCTION ROUTES**
- **Depends on:** `Z-ARITH-J-001`

## Canonical spelling

After direct/pair-mediated reconvergence, the direct signed functions are selected as the canonical executable spelling:

```text
zadd := zaddD
zmul := zmulD
```

This selection does not erase the pair-mediated witnesses `zaddP` and `zmulP`; pointwise equality to those witnesses is part of the Junction certificate.

## Current guaranteed interface

```text
zadd : Z_BOMA → Z_BOMA → Z_BOMA
zmul : Z_BOMA → Z_BOMA → Z_BOMA
zero
one := embedN(1)
zneg
```

## Verification already closed

The operation definitions and cross-route convergence passed V5 in workflow run `32169328837` under Lean 4.32.1.

## Law subgate

The following are being checked separately and must not be inferred merely from operation convergence:

```text
additive associativity/commutativity/identity/inverses
multiplicative associativity/commutativity/identity
zero absorption
distributivity
N embedding preservation
natural-difference generation
```

These correspond to ZA-06..10 and ZA-07.

Until that law subgate passes, this Block is an operation interface, not yet an accepted commutative-ring package.
