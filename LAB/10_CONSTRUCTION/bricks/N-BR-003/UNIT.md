# N-BR-003 — Dependent Eliminator Interface

- **Operational Status:** ACTIVE — SPECIFIED
- **Epistemic Status:** FORMALIZATION-DEPENDENT / PROVIDED BY SELECTED INDUCTIVE REGIME
- **Depends on:** `N-BR-001`, `BOMA-RB-FORMAL-001`

Expose the dependent eliminator associated with the fresh inductive declaration:

```text
P(z)
(Π n, P(n) → P(s n))
---------------------
Π n, P(n)
```

This is not a pre-numerical theorem. It is the explicit formal-regime interface from which later induction/generatedness results are derived.
