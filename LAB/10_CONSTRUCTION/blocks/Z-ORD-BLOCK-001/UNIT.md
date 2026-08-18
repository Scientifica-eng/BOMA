# Z-ORD-BLOCK-001 — Canonical Ordered-Integer Interface

- **Operational Status:** **ACTIVE / V4+V5 PASS**
- **Epistemic Status:** **DERIVED FROM DUAL ORDER ROUTES**
- **Depends on:** `Z-ORD-J-001`, `Z-ARITH-BLOCK-003`

## Canonical order

```text
zLE := zLEd
```

with retained semantic witness:

```text
zLE(x,y) ↔ pairLE(pairOfSigned x, pairOfSigned y).
```

## Verified total-order interface

```text
reflexivity
transitivity
antisymmetry
totality
```

A derived characterization also states:

```text
x ≤ y ↔ ∃k : N_BOMA, x + embedN(k) = y.
```

This characterization is derived from the converged pair cross-sum route; it is not the definition of the selected order.

## Natural-order extension

```text
embedN(a) ≤_Z embedN(b) ↔ a ≤_N b.
```

This discharges ZA-12.

## Ordered-arithmetic compatibility

Verified:

```text
x ≤ y → x+c ≤ y+c
x ≤ y → c+x ≤ c+y
x ≤ y → -y ≤ -x
x ≤ y ∧ 0 ≤ c → x*c ≤ y*c
x ≤ y ∧ 0 ≤ c → c*x ≤ c*y
```

This discharges the current ZA-13 target exactly, with nonnegative-factor hypotheses explicit.

## Verification

Order route convergence:

```text
run 32169832933 — PASS
```

Order / ordered-ring law package:

```text
run 32170144944 — PASS
Lean 4.32.1
```

Evidence:

`LAB/20_FORMALIZATION/Z_STAGE/evidence/Z_ORDER_LAWS_V5_LATEST.md`
