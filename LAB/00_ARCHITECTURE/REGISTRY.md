# REGISTRY — Canonical Construction Unit Registry

## Status

**ACTIVE — Canonical registry**

## Purpose

This file is the single navigation table for the active construction.

The registry distinguishes two independent status dimensions:

```text
OPERATIONAL STATUS
Where the unit is in the project lifecycle / active graph.
Examples: ACTIVE, CONDITIONAL / PENDING, RESERVED, REJECTED.

EPISTEMIC STATUS
How the mathematical or architectural content is justified.
Examples: CONSTRUCTED, DERIVED, DECLARED CHOICE,
FORMALIZATION-DEPENDENT, PENDING, REJECTED.
```

Operational status and epistemic status must not be collapsed into one field.

## Unit registry

| ID | Type | Layer | Role | Operational Status | Epistemic Status | Canonical path |
|---|---|---|---|---|---|---|
| TCT-BLOCK-001 | Block | L1 | Construction kernel | ACTIVE | MIXED — declared constitutive choices + constructional definition; see unit | `LAB/10_CONSTRUCTION/blocks/TCT-BLOCK-001/UNIT.md` |
| TCT-BLOCK-002 | Block | L1 | Finite configurations | ACTIVE | MIXED — constructed formation + declared normal-form choice; see unit | `LAB/10_CONSTRUCTION/blocks/TCT-BLOCK-002/UNIT.md` |
| TCT-J-001 | Junction | L1 | Canonicality gate | CONDITIONAL / PENDING | PENDING | `LAB/10_CONSTRUCTION/junctions/TCT-J-001/UNIT.md` |
| TCT-BR-009 | Brick | L1 | Terminal interface preservation constraint | ACTIVE | DECLARED CHOICE — ADDITIONAL CONSTRAINT | `LAB/10_CONSTRUCTION/bricks/TCT-BR-009/UNIT.md` |
| TCT-BLOCK-003 | Block | L1 | Canonical decomposition | RESERVED | PENDING / NOT CONSTRUCTED | reserved |
| TCT-BLOCK-004 | Block | L1 | Construction depth | RESERVED | PENDING / NOT CONSTRUCTED | reserved |
| TCT-BLOCK-005 | Block | L1 | Successor | RESERVED | PENDING / NOT CONSTRUCTED | reserved |
| TCT-BLOCK-006 | Block | L2 | Formal natural-number domain | RESERVED | PENDING / NOT CONSTRUCTED | reserved |

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

Its derivability test established that this condition is **not derived from the currently specified definition of `≈`**.

Accordingly:

```text
Operational Status = ACTIVE
Epistemic Status   = DECLARED CHOICE — ADDITIONAL CONSTRAINT
```

This classification keeps the unit active in the graph while preserving the fact that its content is declared rather than derived.

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
10. Operational status and epistemic status are separate dimensions and must be recorded separately.
11. A declared constraint may be operationally ACTIVE while remaining epistemically a DECLARED CHOICE rather than a DERIVED result.

## Current position

```text
TCT-BLOCK-001  ACTIVE                 | mixed declared/constructed content
TCT-BLOCK-002  ACTIVE                 | constructed + declared normal-form choice
TCT-BR-009     ACTIVE                 | DECLARED CHOICE — ADDITIONAL CONSTRAINT
TCT-J-001      CONDITIONAL / PENDING  | PENDING
TCT-BLOCK-003  RESERVED               | NOT CONSTRUCTED
```

## Gate condition for TCT-BLOCK-003

`TCT-BLOCK-003` must not be treated as constructed until `TCT-J-001` is independently resolved under an explicit specification of structural equivalence.

The current path may retain `TCT-BR-009` as an independent declared constraint, or a later explicit definition of `≈` may make terminal-interface preservation derivable.

## Current next action

The active PDSA sequence is documented in:

`LAB/PDSA/BOMA_STAGE_ONE_PDSA_EXECUTION_PLAN.md`

The immediate research order is:

```text
PDSA-TCT-001  Baseline stabilization
PDSA-TCT-002  Pre-numerical metatheory contract
PDSA-TCT-003  Structural equivalence ≈
PDSA-TCT-004  Terminal recovery theorem / countermodel
```

No choice between alternative definitions of `≈` is made by this registry update.
