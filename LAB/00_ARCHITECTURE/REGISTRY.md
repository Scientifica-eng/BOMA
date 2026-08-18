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

## Accepted N-Arithmetic

### Addition

| Unit | Role | Status |
|---|---|---|
| N-ADD-BLOCK-001 | right-recursive route | PASS / V5 |
| N-ADD-BLOCK-002 | left-recursive route | PASS / V5 |
| N-ADD-J-001 | route convergence | PASS / V4+V5 |
| N-ADD-BLOCK-003 | canonical addition + laws | ACTIVE / PASS |

V5: run `32164861155`.

### Multiplication

| Unit | Role | Status |
|---|---|---|
| N-MUL-BLOCK-001 | right-recursive route | PASS / V5 |
| N-MUL-BLOCK-002 | left-recursive route | PASS / V5 |
| N-MUL-J-001 | route convergence | PASS / V4+V5 |
| N-MUL-BLOCK-003 | canonical multiplication + laws | ACTIVE / PASS |

V5: run `32165318266`.

### Order

| Unit | Role | Status |
|---|---|---|
| N-ORD-BLOCK-001 | additive-witness route | PASS / V5 |
| N-ORD-BLOCK-002 | N-Core-only inductive route | PASS / V5 |
| N-ORD-J-001 | route equivalence | PASS / V4+V5 |
| N-ORD-BLOCK-003 | canonical total order + laws | ACTIVE / PASS |
| N-ORD-BLOCK-004 | arithmetic/order compatibility | ACTIVE / PASS |

V5: run `32165691581`.

### Arithmetic integration

| Unit | Role | Status |
|---|---|---|
| N-ARITH-J-001 | arithmetic integration gate | PASS / RESOLVED |
| N-ARITH-BLOCK-001 | accepted arithmetic downstream interface | ACTIVE — ACCEPTED |

```text
NAA-01..17 PASS
NAA-18 ACCEPT
```

## Integer representation stage

| Unit | Role | Status |
|---|---|---|
| Z-S-BLOCK-001 | signed normal-form representation | ACTIVE / V5 PASS / SELECTED |
| Z-D-BLOCK-001 | difference-pair + equivalence representation | ACTIVE / V5 PASS / RETAINED |
| Z-J-001 | representation convergence | PASS / RESOLVED |
| Z-DP-001 | canonical integer representation | RESOLVED — signed normal form selected |
| Z-BLOCK-001 | selected carrier / identity interface | ACTIVE |

Representation V5:

```text
run 32168105466 / Lean 4.32.1 / PASS
```

The pair route remains first-class provenance and proof infrastructure. No quotient carrier was formed.

## Accepted integer arithmetic

| Unit | Role | Status |
|---|---|---|
| Z-ARITH-BLOCK-001 | direct signed arithmetic route | ACTIVE / V5 PASS |
| Z-ARITH-BLOCK-002 | pair-mediated arithmetic route | ACTIVE / V5 PASS |
| Z-ARITH-J-001 | arithmetic route convergence | PASS / RESOLVED |
| Z-ARITH-BLOCK-003 | canonical commutative-ring + N-embedding/generation package | ACTIVE / V5 PASS |

Verification:

```text
arithmetic convergence 32169328837 PASS
ring laws / embedding  32169564747 PASS
```

## Accepted integer order

| Unit | Role | Status |
|---|---|---|
| Z-ORD-J-001 | direct/pair order convergence | PASS / RESOLVED |
| Z-ORD-BLOCK-001 | canonical total ordered-integer interface | ACTIVE / V5 PASS |

Verification:

```text
order convergence 32169832933 PASS
order laws        32170144944 PASS
```

## Integer integration / closure

| Unit | Role | Status |
|---|---|---|
| Z-J-002 | final integer integration gate | PASS / RESOLVED |
| Z-BLOCK-002 | accepted Stage-One integer downstream interface | ACTIVE — ACCEPTED |

```text
ZA-01..20 PASS
ZA-21 ACCEPT
```

Closure:

`LAB/PDSA/PDSA-Z-005_INTEGER_CLOSURE.md`

No active Z-stage proof requires Lean built-in `Int`, quotient carrier formation, `Classical`, choice, `sorry`, or a new axiom.

## Mandatory post-Z reverse engineering

### Z-only reverse candidates

| Unit | Role | Status |
|---|---|---|
| Z-RE-BLOCK-001 | nonnegative-cone `N_Cone(Z)` candidate | ACTIVE / Z-ONLY V5 PASS |
| Z-RE-BLOCK-002 | successor-reachability `ReachZ` candidate | ACTIVE / Z-ONLY V5 PASS |

Z-only verification:

```text
run 32170817620 / PASS
```

Autonomous Z-derived results include cone closure, inherited order, `ReachZ→nonnegative`, and proposition-valued ReachZ induction.

### Bottom-up comparison Junction

| Unit | Role | Status |
|---|---|---|
| Z-RE-J-001 | compare reverse N-from-Z with accepted bottom-up N | PASS / RESOLVED — INTERFACE RECONVERGENCE / PROVENANCE DIVERGENCE |

Final comparison V5:

```text
run:             32171528363
verified commit: 335ad9780d8cfee45624998f59dae264c1057be1
Lean:            4.32.1
result:          PASS
```

The selected reverse cone preserves/reconverges on:

```text
0
successor
addition
multiplication
order
```

Exact decoding is representation-aware because `ZSigned` retains `BOMANat` magnitudes. Type-valued recursion is currently comparison-assisted rather than independently reverse-derived from the abstract Z interface.

Detailed comparison:

`LAB/PDSA/experiments/PDSA-Z-RE-001_BOTTOM_UP_VS_REVERSE_COMPARISON.md`

## Current frontier

```text
N-Core            ACCEPTED
N-Arithmetic      ACCEPTED
Z                 ACCEPTED
post-Z Z→N study  CLOSED — INTERFACE RECONVERGENCE / PROVENANCE DIVERGENCE
Q                 NOT YET CONSTRUCTED
```

The next canonical action is the rational-number acceptance/architecture stage. No built-in rational carrier or undeclared fraction-equivalence/normalization regime may be promoted before an explicit Q specification and construction path are established.
