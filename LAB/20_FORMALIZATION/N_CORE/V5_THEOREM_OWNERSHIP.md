# V5 THEOREM OWNERSHIP — N-Core R-B

**Document ID:** `BOMA-N-V5-OWN-001`  
**Status:** **ACTIVE — V5 EVIDENCE RECORDED**  
**PDSA:** `PDSA-N-007`  
**Scope:** selected R-B Stage-One N-Core candidate only.

## Observed V5 evidence

```text
workflow run:     32163771789
verified commit:  5fb03a48e243697f49f1cbde30be986d73f2ff68
pinned toolchain: leanprover/lean4:v4.32.1
job conclusion:   success
```

Repository evidence record:

`LAB/20_FORMALIZATION/N_CORE/evidence/V5_CLAIM_LEVEL_LATEST.md`

The run checked the unified producer, all six N-Block verification fragments, the independent constructional Route B, and the N-J-001 convergence fragment. Every required step succeeded.

## Purpose

Map each machine-checked claim to its canonical Brick/Block/Junction owner.

A successful Lean run upgrades only the claims actually checked. It does not by itself mark the whole N-Core or `ℕ` as accepted.

## Ownership map

| Canonical owner | Claim / interface | Lean evidence target | V5 result |
|---|---|---|---|
| N-BR-001 | fresh unary inductive declaration `N_BOMA, z, s` | producer + `Verify_N_BLOCK_001` | PASS |
| N-BR-002 | formal identity interface | `Verify_N_BLOCK_001` | PASS |
| N-BR-003 | Sort-polymorphic dependent eliminator interface | `ind` + `Verify_N_BLOCK_001` | PASS |
| N-BR-004 | `s(n) ≠ z` — internal Route A | `s_ne_z` + `Verify_N_BLOCK_002` | PASS |
| N-BR-005 | `s(a)=s(b) ⇒ a=b` — internal Route A | `s_injective` + `Verify_N_BLOCK_002` | PASS |
| N-BR-006 | proposition-valued induction adequacy | `induction_adequacy` + `Verify_N_BLOCK_003` | PASS |
| N-BR-007 | generatedness / no-junk | `Generated`, `all_generated` | PASS |
| N-BR-008 | nondependent recursor | `fold` + `Verify_N_BLOCK_004` | PASS |
| N-BR-009 | recursor computation equations | `fold_z`, `fold_s` | PASS |
| N-BR-010 | pointwise recursion uniqueness | `fold_unique` | PASS |
| N-BR-011 | Stage-One Type-0 pointwise initiality | `boma_pointwise_initial` | PASS |
| N-BR-012 | `ε ↦ z` | `realize_eps` | PASS |
| N-BR-013 | `ExtU ↦ s` | `realize_extU` | PASS |
| N-BR-014 | selected-scope equivalence preservation | `bridge_preserves_selected_identity` | PASS |
| N-BR-015 | formal identity reflection / faithfulness | `bridge_reflects_formal_identity` | PASS |
| N-BR-016 | reconstruction / coverage | `realize_reify`, `reify_realize` | PASS |
| N-BR-017 | history / constructor-ancestry step correspondence | `reify (s n) = extU (reify n)` witness | PASS |
| N-BR-018 | constructional no-confusion transfer — Route B | `Verify_N_J_001_RouteB` | PASS |
| N-BR-019 | comparison maps from pointwise initiality | `pointwise_initial_unique` | PASS |
| N-BR-020 | pointwise inverse / standardness laws | `pointwise_initial_unique` | PASS |
| N-J-001 | same no-confusion interface from Route A and Route B | `Verify_N_J_001` | PASS |

## Scope note from N-DP-002

The successful run verifies the corrected explicit scope:

```text
eliminator               Sort-polymorphic
fold                     Type-u target polymorphic
bomaAlg initiality       UnaryAlgebra.{0}
standardness comparison  same-universe polymorphic
```

This scope is formalization-dependent and must not be generalized silently.

## Block-level V5 aggregation

Because all machine-relevant member claims for `N-BLOCK-001` through `N-BLOCK-006` passed in the same pinned-toolchain run, each Block may record **V5 PASS for its mapped formal claims**, subject to its separate architectural/epistemic qualifications.

This still does not imply:

```text
N-J-002 PASS
NAC-15 closure
N-Core / ℕ ACCEPTED
```

## N-J-001 V5 conclusion

The required convergence conditions are machine-checked:

1. Route A no-confusion claims pass;
2. bridge premises used by Route B pass;
3. independent Route B passes;
4. the convergence wrapper checks the same formal contribution interface for both witnesses.

Therefore the prior V5 qualification on `N-J-001` may be removed after its canonical unit record is updated.

## Backend-representation boundary

`TCTNF`, `Generated`, all `Verify_*` fragments, and the CI workflow remain verification artifacts. They do not replace canonical mathematical units.

```text
backend datatype ≠ canonical TCT carrier
backend verification predicate ≠ new number definition
Lean theorem name ≠ BOMA unit identity
V5 PASS ≠ NAC-15 acceptance
```

## Historical failure provenance

The preceding failed runs remain scientifically relevant, especially:

`PDSA-N-007-V5-FAILURE-001`.

They exposed the Sort/universe scope correction and the verification-assembly issue that led to the successful run.
