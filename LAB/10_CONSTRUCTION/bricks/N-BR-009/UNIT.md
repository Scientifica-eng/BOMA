# N-BR-009 — Recursor Computation Equations

- **Operational Status:** ACTIVE — WRITTEN / V5 PENDING
- **Epistemic Status:** DERIVED / COMPUTATION
- **Depends on:** `N-BR-008`

Required equations:

```text
fold x₀ f z = x₀
fold x₀ f (s n) = f (fold x₀ f n)
```

The exact equality is the formal identity interface of `N-BR-002`.
