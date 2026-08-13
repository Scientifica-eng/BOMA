# REGISTRY — Canonical Construction Unit Registry

## Status

**ACTIVE — Canonical registry**

## Purpose

This file is the single navigation table for the active construction.

## Unit registry

| ID | Type | Layer | Role | Status | Canonical path |
|---|---|---|---|---|---|
| TCT-BLOCK-001 | Block | L1 | Construction kernel | ACTIVE | `LAB/10_CONSTRUCTION/blocks/TCT-BLOCK-001/UNIT.md` |
| TCT-BLOCK-002 | Block | L1 | Finite configurations | ACTIVE | `LAB/10_CONSTRUCTION/blocks/TCT-BLOCK-002/UNIT.md` |
| TCT-J-001 | Junction | L1 | Canonicality gate | CONDITIONAL / PENDING | `LAB/10_CONSTRUCTION/junctions/TCT-J-001/UNIT.md` |
| TCT-BR-009 | Brick | L1 | Terminal interface preservation constraint | DECLARED ADDITIONAL CONSTRAINT | `LAB/10_CONSTRUCTION/bricks/TCT-BR-009/UNIT.md` |
| TCT-BLOCK-003 | Block | L1 | Canonical decomposition | RESERVED | reserved |
| TCT-BLOCK-004 | Block | L1 | Construction depth | RESERVED | reserved |
| TCT-BLOCK-005 | Block | L1 | Successor | RESERVED | reserved |
| TCT-BLOCK-006 | Block | L2 | Formal natural-number domain | RESERVED | reserved |

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

### TCT-BR-009

`TCT-BR-009` is no longer merely a candidate. It is the explicit structural constraint discovered at `TCT-J-001`:

> structural equivalence must preserve the distinguished terminal interface and terminal-block role, so that equivalent terminal decompositions recover equivalent predecessor configurations.

Its derivability test established that this condition is **not derived from the currently specified definition of `≈`**. Therefore it is recorded as a declared additional constraint rather than a theorem.

## Registry rules

1. Every active unit has exactly one canonical ID.
2. A filename is not an identity.
3. Historical documents may correspond to canonical units.
4. Variants receive distinct IDs.
5. No unit is marked PASS without its own verification record.
6. A Junction remains unresolved until its compatibility condition is independently verified.
7. Registry status must reflect the graph, not narrative convenience.
8. Reserved units must not be presented as constructed.
9. Additional constraints must be represented as explicit units rather than hidden premises.

## Current position

```text
TCT-BLOCK-001  ACTIVE  ✓ canonical
TCT-BLOCK-002  ACTIVE  ✓ canonical
TCT-BR-009     DECLARED ADDITIONAL CONSTRAINT ✓ canonical
TCT-J-001      CONDITIONAL / PENDING
TCT-BLOCK-003  RESERVED
```

## Gate condition for TCT-BLOCK-003

`TCT-BLOCK-003` must not be treated as constructed until `TCT-J-001` is independently resolved under the explicit `TCT-BR-009` constraint, or until an alternative definition of structural equivalence makes that constraint derivable.

## Current next action

Compare two explicit paths for the definition of `≈`:

```text
A — strengthen ≈ so terminal preservation becomes DERIVED
B — keep ≈ abstract and retain TCT-BR-009 as an independent constraint
```

No choice between A and B has yet been made.
