# Q-GATE-BLOCK-001 — Integer No-Zero-Divisor / Cancellation Gateway

- **Operational Status:** **PASS / V5**
- **Epistemic Status:** **DERIVED FROM ACCEPTED N/Z ARITHMETIC**
- **PDSA:** `PDSA-Q-001`
- **Depends on:** `N-ARITH-BLOCK-001`, `Z-BLOCK-002`

## Purpose

Expose the exact integer theorem consumed by rational fraction equivalence instead of treating denominator cancellation as implicit algebraic background.

## Export

```text
zmul_eq_zero:
  a*b = 0 → a=0 ∨ b=0

zmul_ne_zero:
  a≠0 ∧ b≠0 → a*b≠0

zmul_right_cancel_nonzero:
  c≠0 ∧ a*c=b*c → a=b

zmul_left_cancel_nonzero:
  c≠0 ∧ c*a=c*b → a=b
```

The derivation also records natural no-zero-divisor lemmas and additive cancellation/inverse uniqueness required internally.

## Verification

```text
workflow run: 32172230166
Lean:         4.32.1
result:       PASS
```

Evidence:

`LAB/20_FORMALIZATION/Q_STAGE/evidence/Q_GATEWAY_V5_LATEST.md`

## Architectural significance

Cross-product fraction equivalence is not allowed to claim transitivity without consuming this Block or an explicit alternative theorem of equivalent strength.

The gateway therefore sits between accepted Z and any pair/equivalence fraction route.
