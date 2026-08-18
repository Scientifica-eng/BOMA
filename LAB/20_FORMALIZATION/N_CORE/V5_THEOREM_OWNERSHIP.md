# V5 THEOREM OWNERSHIP — N-Core R-B

**Document ID:** `BOMA-N-V5-OWN-001`  
**Status:** ACTIVE — verification ownership manifest  
**PDSA:** `PDSA-N-007`  
**Scope:** selected R-B Stage-One N-Core candidate only.

## Purpose

Map each machine-checkable claim to its canonical Brick/Block/Junction owner.

A successful Lean run upgrades only the claims actually checked. It does not mark the whole N-Core, a whole file, or `ℕ` as verified.

## Ownership map

| Canonical owner | Claim / interface | Lean evidence target |
|---|---|---|
| N-BR-001 | fresh unary inductive declaration `N_BOMA, z, s` | `NCoreRB001.lean` + `Verify_N_BLOCK_001.lean` |
| N-BR-002 | formal identity interface | `Verify_N_BLOCK_001.lean` |
| N-BR-003 | dependent eliminator interface | `ind` + `Verify_N_BLOCK_001.lean` |
| N-BR-004 | `s(n) ≠ z` — internal Route A | `s_ne_z` + `Verify_N_BLOCK_002.lean` |
| N-BR-005 | `s(a)=s(b) ⇒ a=b` — internal Route A | `s_injective` + `Verify_N_BLOCK_002.lean` |
| N-BR-006 | induction adequacy | `induction_adequacy` + `Verify_N_BLOCK_003.lean` |
| N-BR-007 | generatedness / no-junk | `Generated`, `all_generated` in `Verify_N_BLOCK_003.lean` |
| N-BR-008 | nondependent recursor | `fold` + `Verify_N_BLOCK_004.lean` |
| N-BR-009 | recursor computation equations | `fold_z`, `fold_s` + `Verify_N_BLOCK_004.lean` |
| N-BR-010 | pointwise recursion uniqueness | `fold_unique` + `Verify_N_BLOCK_004.lean` |
| N-BR-011 | pointwise initiality | `boma_pointwise_initial` + `Verify_N_BLOCK_004.lean` |
| N-BR-012 | `ε ↦ z` | `realize_eps` + `Verify_N_BLOCK_005.lean` |
| N-BR-013 | `ExtU ↦ s` | `realize_extU` + `Verify_N_BLOCK_005.lean` |
| N-BR-014 | selected-scope equivalence preservation | `bridge_preserves_selected_identity` + `Verify_N_BLOCK_005.lean` |
| N-BR-015 | formal identity reflection / faithfulness | `bridge_reflects_formal_identity` + `Verify_N_BLOCK_005.lean` |
| N-BR-016 | reconstruction / coverage | `realize_reify`, `reify_realize` + `Verify_N_BLOCK_005.lean` |
| N-BR-017 | history / constructor-ancestry step correspondence | `reify (s n) = extU (reify n)` witness in `Verify_N_BLOCK_005.lean` |
| N-BR-018 | constructional no-confusion transfer — Route B | `Verify_N_J_001_RouteB.lean` |
| N-BR-019 | comparison maps from pointwise initiality | `pointwise_initial_unique` + `Verify_N_BLOCK_006.lean` |
| N-BR-020 | pointwise inverse / standardness laws | `pointwise_initial_unique` + `Verify_N_BLOCK_006.lean` |
| N-J-001 | same no-confusion interface from Route A and Route B | `Verify_N_J_001.lean` |

## Block-level V5 aggregation rule

A Block may receive V5 only when all machine-relevant member claims in this manifest pass under the pinned toolchain and any non-machine obligations of the Block have separately passed their architectural checks.

Thus:

```text
successful NCoreRB001.lean
        ≠
V5 for every N-Block
        ≠
N-Core ACCEPTED
```

## Junction rule

`N-J-001` may lose its V5 qualification only if:

1. `N-BLOCK-002` Route A evidence passes;
2. `N-BLOCK-005` bridge premises used by Route B pass;
3. `Verify_N_J_001_RouteB.lean` passes without invoking Route-A theorem names;
4. `Verify_N_J_001.lean` passes and exposes the same formal contribution interface for both witnesses.

## Backend-representation boundary

`TCTNF`, `Generated`, and all `Verify_*` files are verification artifacts. They do not replace canonical mathematical units.

In particular:

```text
backend datatype ≠ canonical TCT carrier
backend verification predicate ≠ new number definition
Lean theorem name ≠ BOMA unit identity
```

## Current status

All mappings above are prepared for checking. V5 remains **PENDING OBSERVED CHECKER EVIDENCE** until a successful pinned-toolchain run is inspected and recorded.
