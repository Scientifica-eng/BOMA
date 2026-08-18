# N-ADD-BR-003 — Left-Recursive Addition Definition

- **Status:** ACTIVE — CONSTRUCTED CANDIDATE / V5 PENDING
- **Epistemic:** DERIVED FROM ACCEPTED RECURSOR + REPRESENTATIONAL ORIENTATION CHOICE
- **Depends on:** N-BLOCK-007, N-BR-008

Define independently:
```text
addL(a,b) := fold b s a
```
Recursion is on the first argument. It must not depend on `addR`.
