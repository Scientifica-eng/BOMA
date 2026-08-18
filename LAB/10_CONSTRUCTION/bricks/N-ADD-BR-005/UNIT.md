# N-ADD-BR-005 — Opposite-Side Equations for Route R
- **Status:** ACTIVE / V4+V5 PASS
- **Depends on:** N-ADD-BR-001, N-BLOCK-003

Derived by induction:
```text
addR(z,b)=b
addR(s a,b)=s(addR(a,b))
```
These were not built into Route R.
