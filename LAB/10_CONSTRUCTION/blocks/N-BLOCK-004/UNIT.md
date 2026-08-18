# N-BLOCK-004 — Recursion / Pointwise Initiality

- **Operational Status:** **ACTIVE — V4/V5 PASS IN DECLARED SCOPE**
- **Epistemic Status:** DERIVED UNDER R-B / FORMALIZATION-SCOPE DEPENDENT
- **Members:** `N-BR-008`, `N-BR-009`, `N-BR-010`, `N-BR-011`
- **Depends on:** `N-BLOCK-001`, `N-DP-002`

## Export

```text
nondependent recursion
computation equations
pointwise recursion uniqueness
pointwise initiality in the declared Stage-One unary-algebra scope
```

Scope under `N-DP-002`:

```text
fold targets                Type-u polymorphic
bomaAlg pointwise initiality  Type-0 unary algebras
```

The canonical uniqueness statement is pointwise; function extensionality is not required.

## Verification

Claim-level V5: PASS in run `32163771789` under Lean 4.32.1.

No unrestricted cross-universe or cross-foundation initiality claim is inferred.
