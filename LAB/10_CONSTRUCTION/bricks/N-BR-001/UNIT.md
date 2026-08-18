# N-BR-001 — Fresh Unary Inductive Declaration

- **Type:** Brick
- **Layer:** L2 formal realization
- **Operational Status:** ACTIVE — CANDIDATE CONSTRUCTED
- **Epistemic Status:** DECLARED FORMALIZATION COMMITMENT
- **Depends on:** `N-DP-001`, `BOMA-RB-FORMAL-001`

## Commitment

Admit one fresh unary inductive declaration in R-B with outputs:

```text
N_BOMA : Type
z : N_BOMA
s : N_BOMA → N_BOMA
```

These outputs are kept in one Brick because the selected regime introduces them as one inductive formation act. This Brick is not derived from TCT.

## Evidence

`N-RB-CAND-001`; backend representation in `NCoreRB001.lean`.
