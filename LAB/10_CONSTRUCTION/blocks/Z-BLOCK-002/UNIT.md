# Z-BLOCK-002 — Accepted Stage-One Integer Interface

- **Operational Status:** **ACTIVE — ACCEPTED**
- **Epistemic Status:** **MIXED DECLARED REPRESENTATION CHOICE + DERIVED CERTIFIED PACKAGE**
- **Acceptance:** `ZA-21 = ACCEPT`
- **Depends on:** `Z-J-002`, `PDSA-Z-005`

## Purpose

Provide the canonical downstream interface for the accepted BOMA Stage-One integer domain without erasing its internal construction DAG.

## Carrier / identity

```text
Z_BOMA := selected signed normal forms
zero
one
formal equality on the selected carrier
```

Difference pairs and `~` remain a retained alternative representation, not the canonical identity relation.

## Natural embedding

```text
embedN : N_BOMA → Z_BOMA
```

with injectivity and preservation of:

```text
0
1
+
*
≤
```

## Algebra

```text
zneg
zadd
zmul
```

with the verified commutative-ring interface:

```text
additive commutative group
multiplicative commutative monoid
zero absorption
distributivity
```

Every accepted integer is explicitly a difference of two embedded naturals.

## Order

```text
zLE
```

is a total order extending the accepted N order, with:

```text
addition translation invariance
negation reversal
multiplication monotonicity for nonnegative factors
```

Derived bridge:

```text
x ≤ y ↔ ∃k : N_BOMA, x + embedN(k) = y.
```

## Preserved production histories

The interface has multiple retained witnesses:

```text
signed representation       ↔ difference-pair representation
direct signed arithmetic    ↔ pair-mediated arithmetic
direct signed order         ↔ pair cross-sum order
```

All corresponding Junctions passed.

## Verification summary

```text
representation V5   32168105466
arithmetic V5       32169328837
ring-law V5         32169564747
order-route V5      32169832933
order-law V5        32170144944
Lean                4.32.1
```

## Characterization scope

The accepted Stage-One certificate includes normal-form exhaustiveness, pair-equivalence classification, faithful N embedding, natural-difference generation, ring laws, and ordered-ring laws.

No unbuilt group-completion universal property is implied.

## Mandatory post-acceptance experiment

Before promoting the rational-number stage, BOMA now opens the required reverse-engineering study:

```text
Z-BLOCK-002
   ↓
N_from_Z
   ↓
comparison against bottom-up N-BLOCK-007 / N-ARITH-BLOCK-001
```

The reverse reconstruction must not simply define `N_from_Z := N_BOMA` or use `embedN` as its definition.
