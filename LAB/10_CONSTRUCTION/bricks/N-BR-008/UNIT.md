# N-BR-008 — Nondependent Recursor

- **Operational Status:** ACTIVE — WRITTEN DEFINITION / V5 PENDING
- **Epistemic Status:** DERIVED FROM ELIMINATION
- **Depends on:** `N-BR-003`

Construct the nondependent recursion interface:

```text
fold : X → (X → X) → N_BOMA → X
```

No separate recursion axiom is introduced when it is derivable from the eliminator.
