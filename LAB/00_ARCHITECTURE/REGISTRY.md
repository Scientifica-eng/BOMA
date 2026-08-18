# REGISTRY — Canonical Construction Unit Registry

**Status:** ACTIVE — Canonical registry  
**Topology:** `CONSTRUCTION_TOPOLOGY.md`  
**N-Core:** `N_CORE_DAG.md`  
**N-Arithmetic:** `N_ARITHMETIC_DAG.md`

Operational, verification, and epistemic status remain separate.

## Pre-numerical TCT

| ID | Type | Role | Status |
|---|---|---|---|
| TCT-BLOCK-001 | Block | Construction Kernel | ACTIVE |
| TCT-BLOCK-002 | Block | Generated Selected Configurations | ACTIVE |
| TCT-BR-010 | Brick | Structural equivalence `≈` | ACTIVE — declared identity specification |
| TCT-BR-009 | Brick | Terminal preservation | ACTIVE — derived under BR-010 |
| TCT-J-001 | Junction | Canonical decomposition gate | PASS |
| TCT-BLOCK-003 | Block | Canonical Decomposition | ACTIVE |
| TCT-BLOCK-004 | Block | Structural Iteration History | ACTIVE |
| TCT-BLOCK-005 | Block | Successor-Like Extension | ACTIVE |
| TCT-BLOCK-006 | provenance aggregate | old monolithic N candidate | DECOMPOSED / PROVENANCE |

## Natural-number formalization decisions

| ID | Role | Status |
|---|---|---|
| N-DP-001 | Stage-One realization regime | RESOLVED — R-B selected |
| N-DP-002 | eliminator / universe scope | RESOLVED |

Scope:

```text
eliminator               Sort-polymorphic
fold                     Type-u target polymorphic
bomaAlg initiality       Type-0 unary-algebra scope
standardness comparison  same-universe polymorphic
```

## Accepted N-Core

Canonical detailed units are `N-BR-001..020`, `N-BLOCK-001..007`, `N-J-001`, `N-J-002`.

```text
N-BLOCK-001..006 mapped V5 claims PASS
N-J-001 PASS / V4+V5
N-J-002 PASS
NAC-01..14 PASS
NAC-15 ACCEPT
N-BLOCK-007 ACTIVE — ACCEPTED N-CORE EXPORT
```

V5: run `32163771789`, Lean 4.32.1.

## Accepted addition

| Unit | Role | Status |
|---|---|---|
| N-ADD-BLOCK-001 | right-recursive route | PASS / V5 |
| N-ADD-BLOCK-002 | left-recursive route | PASS / V5 |
| N-ADD-J-001 | route convergence | PASS / V4+V5 |
| N-ADD-BLOCK-003 | canonical addition + laws | ACTIVE / PASS |

Bricks `N-ADD-BR-001..012` remain canonical members/provenance.

V5: run `32164861155`.

## Accepted multiplication

| Unit | Role | Status |
|---|---|---|
| N-MUL-BLOCK-001 | right-recursive route | PASS / V5 |
| N-MUL-BLOCK-002 | left-recursive route | PASS / V5 |
| N-MUL-J-001 | route convergence | PASS / V4+V5 |
| N-MUL-BLOCK-003 | canonical multiplication + laws | ACTIVE / PASS |

Bricks `N-MUL-BR-001..012` remain canonical members/provenance.

V5: run `32165318266`.

## Accepted order

| Unit | Role | Status |
|---|---|---|
| N-ORD-BLOCK-001 | additive-witness route | PASS / V5 |
| N-ORD-BLOCK-002 | N-Core-only inductive route | PASS / V5 |
| N-ORD-J-001 | route equivalence | PASS / V4+V5 |
| N-ORD-BLOCK-003 | canonical total order + laws | ACTIVE / PASS |
| N-ORD-BLOCK-004 | arithmetic/order compatibility | ACTIVE / PASS |

Bricks `N-ORD-BR-001..012` remain canonical members/provenance.

V5: run `32165691581`.

## Accepted N-Arithmetic

| Unit | Role | Status |
|---|---|---|
| N-ARITH-J-001 | arithmetic integration gate | PASS / RESOLVED |
| N-ARITH-BLOCK-001 | accepted arithmetic downstream interface | ACTIVE — ACCEPTED |

```text
NAA-01..17 PASS
NAA-18 ACCEPT
```

Exact law interface is recorded in:

- `LAB/PDSA/PDSA-N-ARITH-002_INTEGRATION_AUDIT.md`
- `LAB/10_CONSTRUCTION/blocks/N-ARITH-BLOCK-001/UNIT.md`

## Current frontier

```text
N-Core         ACCEPTED
N-Arithmetic   ACCEPTED
Integers       NOT YET CONSTRUCTED
```

The next canonical action is the integer acceptance/architecture stage. No pair, quotient, or signed representation is canonical until an explicit integer Decision Point is studied and resolved.
