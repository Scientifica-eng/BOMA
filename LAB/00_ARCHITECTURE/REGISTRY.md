# REGISTRY — Canonical Construction Unit Registry

**Status:** ACTIVE — Canonical registry  
**Topology:** `CONSTRUCTION_TOPOLOGY.md`  
**N-Core:** `N_CORE_DAG.md`

Operational, verification, and epistemic status remain separate.

## Pre-numerical TCT path

| ID | Type | Role | Operational | Epistemic |
|---|---|---|---|---|
| TCT-BLOCK-001 | Block | Construction Kernel | ACTIVE | mixed declared/constructed |
| TCT-BLOCK-002 | Block | Generated Selected Configurations | ACTIVE | constructed + representation choices |
| TCT-BR-010 | Brick | Structural equivalence `≈` | ACTIVE | DECLARED CHOICE |
| TCT-BR-009 | Brick | Terminal preservation | ACTIVE | DERIVED under BR-010 |
| TCT-J-001 | Junction | Canonical decomposition gate | PASS / RESOLVED | DERIVED |
| TCT-BLOCK-003 | Block | Canonical Decomposition | ACTIVE | constructed + derived guarantee |
| TCT-BLOCK-004 | Block | Structural Iteration History | ACTIVE | DERIVED |
| TCT-BLOCK-005 | Block | Successor-Like Extension | ACTIVE | DERIVED |
| TCT-BLOCK-006 | retained aggregate | old monolithic N candidate view | DECOMPOSED / PROVENANCE | provisional aggregate |

## Natural-number Decision Points

| ID | Role | Operational | Epistemic |
|---|---|---|---|
| N-DP-001 | Stage-One realization regime | RESOLVED — R-B selected | METHODOLOGICAL / FORMALIZATION CHOICE |
| N-DP-002 | eliminator and universe scope | RESOLVED | FORMALIZATION-DEPENDENT / METHODOLOGICAL CHOICE |

Selected scope at `N-DP-002`:

```text
eliminator               Sort-polymorphic
fold                     Type-u target polymorphic
bomaAlg initiality       Type-0 unary-algebra scope
standardness comparison  same-universe polymorphic
```

## N-Core Bricks

All machine-relevant claims below passed claim-level V5 in workflow run `32163771789` under Lean 4.32.1.

| ID | Role | Operational | Epistemic |
|---|---|---|---|
| N-BR-001 | Fresh unary inductive declaration | ACTIVE / V5 | DECLARED FORMALIZATION COMMITMENT |
| N-BR-002 | Formal identity interface | ACTIVE / V5 | FORMALIZATION-DEPENDENT |
| N-BR-003 | Dependent eliminator interface | ACTIVE / V5 | regime interface |
| N-BR-004 | Constructor disjointness | ACTIVE / V5 | DERIVED |
| N-BR-005 | Successor injectivity | ACTIVE / V5 | DERIVED |
| N-BR-006 | Induction adequacy | ACTIVE / V5 | DERIVED |
| N-BR-007 | Generatedness / no-junk | ACTIVE / V5 | DERIVED |
| N-BR-008 | Nondependent recursor | ACTIVE / V5 | DERIVED |
| N-BR-009 | Recursor equations | ACTIVE / V5 | DERIVED |
| N-BR-010 | Pointwise recursion uniqueness | ACTIVE / V5 | DERIVED |
| N-BR-011 | Pointwise initiality | ACTIVE / V5 | DERIVED IN DECLARED SCOPE |
| N-BR-012 | Base realization | ACTIVE / V5 | bridge |
| N-BR-013 | Extension realization | ACTIVE / V5 | bridge |
| N-BR-014 | `≈` preservation | ACTIVE / V5 | DERIVED bridge obligation |
| N-BR-015 | Identity reflection / faithfulness | ACTIVE / V5 | DERIVED bridge obligation |
| N-BR-016 | Bridge reconstruction / coverage | ACTIVE / V5 | DERIVED bridge certificate |
| N-BR-017 | History / constructor-ancestry correspondence | ACTIVE / V5 | DERIVED bridge obligation |
| N-BR-018 | Constructional no-confusion transfer | ACTIVE / V4+V5 | DERIVED independent route |
| N-BR-019 | Initial-candidate comparison maps | ACTIVE / V5 | DERIVED |
| N-BR-020 | Pointwise inverse / standardness | ACTIVE / V5 | DERIVED IN DECLARED SCOPE |

## N-Core Blocks / Junctions

| ID | Type | Role | Operational | Epistemic |
|---|---|---|---|---|
| N-BLOCK-001 | Block | Formal Unary Kernel | ACTIVE / V5 | mixed declared/formal interfaces |
| N-BLOCK-002 | Block | Internal No-Confusion | ACTIVE / V4+V5 PASS | DERIVED |
| N-BLOCK-003 | Block | Induction / Generatedness | ACTIVE / V4+V5 PASS | DERIVED |
| N-BLOCK-004 | Block | Recursion / Pointwise Initiality | ACTIVE / V4+V5 PASS | DERIVED IN SCOPE |
| N-BLOCK-005 | Block | TCT Realization Bridge | ACTIVE / V3+V5 PASS | mixed representation + derived bridge |
| N-BLOCK-006 | Block | Pointwise Standardness | ACTIVE / V4+V5 PASS | DERIVED IN SCOPE |
| N-J-001 | Junction | Dual-route no-confusion convergence | PASS / RESOLVED | DERIVED CROSS-PATH AGREEMENT |
| N-J-002 | Junction | N-Core integration gate | PASS / RESOLVED | DERIVED ARCHITECTURAL INTEGRATION |
| N-BLOCK-007 | Block | Accepted Natural-Number Core Interface | ACTIVE — ACCEPTED | mixed formal commitments + derived certified package |

## Acceptance

```text
NAC-01..14: PASS
NAC-15:     ACCEPT
N-Core:     ACCEPTED under Stage-One R-B scope
```

Closure:

`LAB/PDSA/PDSA-N-012_N_CORE_CLOSURE.md`

Canonical downstream export:

`LAB/10_CONSTRUCTION/blocks/N-BLOCK-007/UNIT.md`

## Arithmetic boundary

The accepted N-Core does **not** yet contain:

```text
addition
multiplication
order
semiring/arithmetic laws
```

These require a new auditable N-Arithmetic DAG before the project proceeds to integers.
