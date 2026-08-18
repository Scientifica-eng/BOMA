# N-ADD-J-001 — Dual-Recursion Addition Convergence

- **Operational Status:** **CONDITIONAL PASS — WRITTEN V4 / V5 PENDING**
- **Epistemic Status:** **DERIVED CROSS-PATH AGREEMENT / FORMAL EVIDENCE PENDING**
- **Incoming:** `N-ADD-BLOCK-001`, `N-ADD-BLOCK-002`, `N-ADD-BR-005`, `N-ADD-BR-006`
- **PDSA:** `PDSA-N-ADD-001`

## Question

Do the two independent recursion orientations define the same pointwise binary operation?

## Written result

```text
Route R definition/equations      PASS
Route L definition/equations      PASS
opposite-side Route-R equations   PASS
∀a b, addL(a,b)=addR(a,b)         PASS
provenance separation             PASS
written cross-path level          V4 PASS
claim-level formal V5             PENDING
```

Primary written evidence:

`LAB/PDSA/experiments/PDSA-N-ADD-001-WRITTEN-CONVERGENCE-001.md`

## Provenance

```text
Route R: recursion on second argument
Route L: recursion on first argument
```

Neither route depends on the other for its definition. Their equality is a theorem, not an identity of construction histories.

## Consequence

The written convergence also supplies a provenance-rich route to commutativity: swapping the arguments converts the left-recursive spelling into the right-recursive spelling in the opposite order, and convergence identifies them.

## Current export

A **conditional reusable addition contribution** with two production witnesses. Canonical promotion waits for V5 evidence from the dedicated addition workflow.

## Reopening conditions

Reopen if the accepted N-Core recursor changes, either route definition changes, or formal verification rejects a route/convergence premise.
