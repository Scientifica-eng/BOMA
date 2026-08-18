# N-ADD-BR-005 — Opposite-Side Equations for Route R

- **Status:** ACTIVE — PENDING FORMAL VERIFICATION
- **Depends on:** N-ADD-BR-001, N-BLOCK-003

Derive by induction:
```text
addR(z,b)    = b
addR(s a,b)  = s(addR(a,b))
```
This is support for route convergence; it is not built into the Route-R definition.
