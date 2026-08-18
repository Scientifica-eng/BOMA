# REGISTRY — Canonical Construction Unit Registry

## Status

**ACTIVE — Canonical registry**

## Purpose

This file is the single navigation table for the active construction.

The registry distinguishes two independent status dimensions:

```text
OPERATIONAL STATUS
Where the unit is in the project lifecycle / active graph.
Examples: ACTIVE, PASS / RESOLVED, RESERVED, REJECTED.

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
| TCT-BLOCK-002 | Block | L1 | Selected finite configurations | ACTIVE | MIXED — constructed formation + declared/refined normal-form choice + derived recovery invariance | `LAB/10_CONSTRUCTION/blocks/TCT-BLOCK-002/UNIT.md` |
| TCT-BR-010 | Brick | L1 | Reassociation-generated structural equivalence `≈` | ACTIVE | DECLARED CHOICE — STRUCTURAL IDENTITY SPECIFICATION | `LAB/10_CONSTRUCTION/bricks/TCT-BR-010/UNIT.md` |
| TCT-BR-009 | Brick | L1 | Terminal interface preservation | ACTIVE | DERIVED UNDER TCT-BR-010; historically declared additional constraint | `LAB/10_CONSTRUCTION/bricks/TCT-BR-009/UNIT.md` |
| TCT-J-001 | Junction | L1 | Canonicality gate | PASS / RESOLVED | DERIVED / VERIFIED UNDER TCT-BR-010 | `LAB/10_CONSTRUCTION/junctions/TCT-J-001/UNIT.md` |
| TCT-BLOCK-003 | Block | L1 | Canonical decomposition | ACTIVE | MIXED — constructed decomposition judgment + derived canonicality guarantee | `LAB/10_CONSTRUCTION/blocks/TCT-BLOCK-003/UNIT.md` |
| TCT-BLOCK-004 | Block | L1 | Structural Iteration History | ACTIVE | DERIVED STRUCTURAL VIEW / VERIFIED INVARIANT | `LAB/10_CONSTRUCTION/blocks/TCT-BLOCK-004/UNIT.md` |
| TCT-BLOCK-005 | Block | L1 | Successor-like extension structure | RESERVED — ADMISSIBLE NEXT | PENDING / NOT CONSTRUCTED | reserved |
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

## Active identity, decomposition, and iteration layer

### TCT-BR-010

Defines the current structural equivalence through meta-finitely witnessable SE-1 through SE-4 derivations.

### TCT-BR-009

Terminal predecessor/role preservation is DERIVED under BR-010 on the current selected normal-form path.

### TCT-J-001

Canonical recovery gate is PASS / RESOLVED with PDSA-TCT-004 proof evidence.

### TCT-BLOCK-003

Exports the Canonical Decomposition Guarantee without constructing a global predecessor function or quotient domain.

### TCT-BLOCK-004

Exports the Structural Iteration History Guarantee:

> every explicitly supplied selected normal-form presentation has a canonical meta-finite decomposition-history witness; equivalent selected presentations have corresponding histories; and extension by terminal `U` prefixes the predecessor history by the canonical recovery record.

This is **not** a numerical depth function.

The earlier planning label “Construction Depth” is superseded on the canonical path by:

```text
Structural Iteration History
```

in direct response to CAL-001 learning.

Verification evidence:

`LAB/PDSA/experiments/PDSA-TCT-006-STRUCTURAL-HISTORY-001.md`

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
11. A property built into a definition is not to be reported as a derived theorem.
12. An explicit structural-equivalence specification must be versioned/replaced through traceable unit history rather than silently broadened.
13. A historical epistemic classification remains part of provenance even if later clarified premises permit a stronger derivation.
14. Passing a Junction permits downstream work; it does not itself construct the downstream Block.
15. “Canonical modulo ≈” does not imply that a quotient object has been constructed.
16. A reusable certified contribution must not be conflated with the construction unit/document that produced it.
17. A structural history/invariant must not be labeled as a numerical depth before a numerical interpretation has been explicitly constructed.

## Current position

```text
TCT-BLOCK-001  ACTIVE          | kernel
TCT-BLOCK-002  ACTIVE          | selected normal-form construction
TCT-BR-010     ACTIVE          | DECLARED structural identity specification ≈
TCT-BR-009     ACTIVE          | DERIVED terminal preservation
TCT-J-001      PASS / RESOLVED | canonical recovery gate
TCT-BLOCK-003  ACTIVE          | canonical decomposition guarantee
TCT-BLOCK-004  ACTIVE          | structural iteration history
TCT-BLOCK-005  RESERVED        | ADMISSIBLE NEXT, NOT CONSTRUCTED
```

## Next construction target

The project may begin:

```text
PDSA-TCT-007 — Successor-Like Extension Structure
```

The first question is not “have we constructed the natural-number successor?”

It is:

> Which structural properties are already possessed by the extension operation `A ↦ A ⊙ U` on supplied selected configurations, and which additional commitments would be required to promote it to successor on a formal carrier?

## Current PDSA status

```text
PDSA-TCT-001  CLOSED — baseline stabilization
PDSA-TCT-002  CLOSED — pre-numerical metatheory contract
PDSA-TCT-003  CLOSED — structural equivalence / BR-010
PDSA-TCT-004  CLOSED — terminal recovery theorem / J-001 PASS
PDSA-TCT-005  CLOSED — canonical decomposition Block
PDSA-TCT-006  CLOSING — structural iteration history constructed and verified
PDSA-TCT-007  NEXT — successor-like extension structure
```
