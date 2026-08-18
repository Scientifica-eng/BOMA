# PDSA-N-007 — Claim-Level V5 Verification Experiment 001

**Experiment ID:** `PDSA-N-007-CLAIM-V5-001`  
**Date:** 2026-08-18  
**Status:** ACTIVE — CHECKER RESULT PENDING OBSERVATION

## Question

Can the current R-B N-Core candidate be checked under the pinned Lean environment at the same granularity as the canonical N-DAG rather than as one monolithic backend file?

## Do

Created claim/block ownership wrappers:

```text
Verify_N_BLOCK_001.lean
Verify_N_BLOCK_002.lean
Verify_N_BLOCK_003.lean
Verify_N_BLOCK_004.lean
Verify_N_BLOCK_005.lean
Verify_N_BLOCK_006.lean
Verify_N_J_001_RouteB.lean
Verify_N_J_001.lean
```

Created ownership manifest:

`LAB/20_FORMALIZATION/N_CORE/V5_THEOREM_OWNERSHIP.md`

Created workflow:

`.github/workflows/boma-ncore-rb-004.yml`

## New explicit witnesses

Two claims that were previously too implicit now have dedicated backend witnesses:

1. `N-BR-007` generatedness/no-junk via verification predicate `Generated` and theorem `all_generated`;
2. `N-BR-017` structural-history / constructor-ancestry step correspondence via:

```text
reify (s n) = extU (reify n)
```

Neither witness changes the canonical object-layer definition.

## N-J-001 Route-B formalization

`Verify_N_J_001_RouteB.lean` formalizes the constructional route for:

```text
s(n) ≠ z
s(a)=s(b) ⇒ a=b
```

without invoking the Route-A theorem names:

```text
s_ne_z
s_injective
```

The proof instead uses:

```text
selected TCT representation
extension empty-exclusion/injectivity
bridge reflection
coverage/reconstruction
base/extension realization
```

`Verify_N_J_001.lean` then checks that Route A and Route B export the same formal interface.

## Study criteria

If CI fails, classify each failing step separately:

```text
producer payload
N-BLOCK-001
N-BLOCK-002
N-BLOCK-003
N-BLOCK-004
N-BLOCK-005
N-BLOCK-006
N-J-001 Route B
N-J-001 convergence
```

A failure in one unit does not automatically invalidate unrelated parallel units.

If CI passes, update only the claims mapped by `V5_THEOREM_OWNERSHIP.md` and only after the run is observed.

## Current conclusion

No V5 promotion is made in this record yet.
