# N-MUL-J-001 — Dual-Recursion Multiplication Convergence

- **Operational Status:** **CONDITIONAL PASS — WRITTEN V4 / V5 PENDING**
- **Epistemic Status:** **DERIVED CROSS-PATH AGREEMENT / FORMAL EVIDENCE PENDING**
- **Incoming:** `N-MUL-BLOCK-001`, `N-MUL-BLOCK-002`, `N-MUL-BR-005`, `N-MUL-BR-006`
- **PDSA:** `PDSA-N-MUL-001`

## Question

Do the two independent recursion orientations define the same pointwise multiplication operation?

## Written result

```text
Route R definition/equations       PASS
Route L definition/equations       PASS
opposite-side Route-R equations    PASS
∀a b, mulL(a,b)=mulR(a,b)          PASS
provenance separation              PASS
written cross-path level           V4 PASS
claim-level formal V5              PENDING
```

Primary evidence:

`LAB/PDSA/experiments/PDSA-N-MUL-001-WRITTEN-CONVERGENCE-001.md`

## Provenance

```text
Route R: recursion on second factor; repeated addition of first factor
Route L: recursion on first factor; repeated addition of second factor
```

Neither multiplication route depends on the other for its definition. Both depend on the accepted canonical addition package.

## Consequence

Written convergence supplies direct provenance for multiplication commutativity after argument exchange, analogous to the successful addition reconvergence experiment.

## Current export

A conditional reusable multiplication contribution with both production histories preserved. Canonical promotion waits for the dedicated V5 evidence.

## Reopening conditions

Reopen if the accepted addition package changes, either multiplication route changes, or formal verification rejects a route/convergence premise.
