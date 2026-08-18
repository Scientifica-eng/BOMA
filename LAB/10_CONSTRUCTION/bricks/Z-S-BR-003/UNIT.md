# Z-S-BR-003 — Structural Difference Normalizer
- **Status:** ACTIVE / V5 PENDING

Define `diff(a,b)` structurally by simultaneous successor cancellation:
```text
diff(z,z)=zero
diff(s a,z)=pos(a)
diff(z,s b)=neg(b)
diff(s a,s b)=diff(a,b)
```
No built-in integer subtraction is used.
