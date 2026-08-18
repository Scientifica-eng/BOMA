# N-BR-018 — Constructional No-Confusion Transfer

- **Operational Status:** ACTIVE — WRITTEN DERIVATION PASS / V5 DEPENDENCIES PENDING
- **Epistemic Status:** DERIVED CONDITIONALLY ON FAITHFUL BRIDGE + COVERAGE
- **Depends on:** `TCT-BLOCK-005`, `N-BLOCK-005`
- **PDSA:** `PDSA-N-009`

## Exported contribution

Derive the formal no-confusion interface through constructional ancestry:

```text
∀n, s(n) ≠ z
s(a) = s(b) ⇒ a = b
```

without using the internal constructor no-confusion theorems of `N-BLOCK-002`.

## Route

For an arbitrary formal inhabitant, bridge coverage/reconstruction supplies a selected TCT presentation realizing it. Base/extension realization transports formal successor equations into realization equations. Faithfulness reflects those equations into TCT structural equivalence, where the verified successor-like guarantees provide:

```text
ExtU(A) ≉ ε
ExtU(A) ≈ ExtU(B) ⇒ A ≈ B.
```

Bridge preservation then transports predecessor equivalence back to formal equality.

## Evidence

`LAB/PDSA/experiments/PDSA-N-009-NO-CONFUSION-RECONVERGENCE-001.md`

The written proof establishes both clauses and includes an independence audit showing that Route A's internal no-confusion theorems are not premises of Route B.

## Verification status

```text
Written mathematical derivation: PASS
Cross-path architectural use:      PASS candidate
V5 for bridge/backend premises:     PENDING under PDSA-N-007
```

This Brick is the Route B producer for `N-J-001`.

## Sensitivity

Reopen if TCT-BLOCK-005, BR-010, bridge faithfulness, bridge coverage/reconstruction, or the formal equality/constructor regime changes materially.
