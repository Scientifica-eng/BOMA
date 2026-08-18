# Z-RE-BLOCK-002 — Z-Internal Successor-Reachability Candidate

- **Operational Status:** **ACTIVE / Z-ONLY V5 PASS**
- **Epistemic Status:** **DERIVED GENERATEDNESS PREDICATE**
- **PDSA:** `PDSA-Z-RE-001`
- **Depends on:** `Z-BLOCK-002`

## Definition

```text
ReachZ(0)
ReachZ(x) → ReachZ(x+1)
```

This route is defined from accepted Z zero, one, and addition. It does not define itself through the already accepted `N_BOMA` carrier.

## Z-only results

Verified:

```text
ReachZ(x) → 0 ≤ x
```

and propositional induction over ReachZ derivations.

Thus Route G maps into the nonnegative-cone candidate `Z-RE-BLOCK-001`.

## Important scope boundary

Because `ReachZ : Z_BOMA → Prop`, its intrinsic eliminator supplies proposition-valued induction. It does **not by itself** provide the Type-valued recursor / pointwise-initiality package owned by the original N-Core.

This distinction is a first-class reverse-engineering result, not a defect to hide.

## Verification

Z-only reverse-core workflow:

```text
run:  32170817620
Lean: 4.32.1
PASS
```

## Open reverse Junction

Whether every nonnegative integer is ReachZ is intentionally not promoted as a Z-only result yet. The current exact converse proof uses the representation-aware bottom-up comparison layer and must be classified accordingly.
