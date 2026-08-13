# REGISTRY — Canonical Construction Unit Registry

## Status

**ACTIVE — Canonical registry**

## Purpose

This file is the single navigation table for the active construction.

## Unit registry

| ID | Type | Layer | Role | Status |
|---|---|---|---|---|
| TCT-BLOCK-001 | Block | L1 | Construction kernel | ACTIVE |
| TCT-BLOCK-002 | Block | L1 | Finite configurations | ACTIVE |
| TCT-J-001 | Junction | L1 | Canonicality gate | PENDING |
| TCT-BLOCK-003 | Block | L1 | Canonical decomposition | PENDING |
| TCT-BLOCK-004 | Block | L1 | Construction depth | PENDING |
| TCT-BLOCK-005 | Block | L1 | Successor | PENDING |
| TCT-BLOCK-006 | Block | L2 | Formal natural-number domain | PENDING |

## Legacy correspondence

| Canonical ID | Previous document |
|---|---|
| TCT-BLOCK-001 | `LAB/BUILDING/reverse/TCT-001_CONSTRUCTION_KERNEL.md` |
| TCT-BLOCK-002 | `LAB/BUILDING/reverse/TCT-002_FINITE_CONFIGURATION_FORMATION.md` |
| TCT-J-001 | `LAB/BUILDING/reverse/TCT-J-001_CANONICAL_DECOMPOSITION_JUNCTION.md` |

Legacy documents remain source records. They are not the canonical identity of the active unit.

## Initial Brick decomposition

### TCT-BLOCK-001 — candidate Bricks

```text
TCT-BR-001  Empty configuration
TCT-BR-002  Elementary block U
TCT-BR-003  Interface compatibility
TCT-BR-004  Concatenation
```

### TCT-BLOCK-002 — candidate Bricks

```text
TCT-BR-005  Formation
TCT-BR-006  Normal form
TCT-BR-007  Terminal visibility
TCT-BR-008  Recovery candidate
```

These are registry candidates only until individual unit records are created and verified.

## Registry rules

1. Every active unit has exactly one canonical ID.
2. A filename is not an identity.
3. Historical documents may correspond to canonical units.
4. Variants receive distinct IDs.
5. No unit is marked PASS without its own verification record.
6. A Junction remains PENDING until its compatibility condition is independently verified.
7. Registry status must reflect the graph, not narrative convenience.

## Current position

```text
TCT-BLOCK-001  ACTIVE
TCT-BLOCK-002  ACTIVE
TCT-J-001      PENDING
```

Next active construction unit:

```text
TCT-BLOCK-003
```

but only after `TCT-J-001` is independently resolved.
