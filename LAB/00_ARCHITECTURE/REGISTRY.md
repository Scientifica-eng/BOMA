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
| TCT-BLOCK-004 | Block | L1 | Structural iteration / construction depth | RESERVED — ADMISSIBLE NEXT | PENDING / NOT CONSTRUCTED | reserved |
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

## Active identity and decomposition layer

### TCT-BR-010

Defines the current structural equivalence through meta-finitely witnessable SE-1 through SE-4 derivations.

### TCT-BR-009

Terminal predecessor/role preservation is now DERIVED under BR-010 on the current selected normal-form path.

### TCT-J-001

Canonical recovery gate is PASS / RESOLVED with PDSA-TCT-004 proof evidence.

### TCT-BLOCK-003

Canonical decomposition is now an ACTIVE Block.

Its downstream certified contribution is:

> for any explicitly supplied non-empty selected normal-form presentation, terminal predecessor recovery exists; equivalent presentations under BR-010 recover equivalent predecessor presentations with corresponding terminal U roles.

The Block does **not** construct a global predecessor function or quotient domain.

Verification evidence:

```text
LAB/PDSA/experiments/PDSA-TCT-005-CANONICAL-DECOMPOSITION-VERIFICATION-001.md
LAB/PDSA/experiments/PDSA-TCT-004-TERMINAL-RECOVERY-PROOF-001.md
```

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

## Current position

```text
TCT-BLOCK-001  ACTIVE          | kernel
TCT-BLOCK-002  ACTIVE          | selected normal-form construction
TCT-BR-010     ACTIVE          | DECLARED structural identity specification ≈
TCT-BR-009     ACTIVE          | DERIVED terminal preservation
TCT-J-001      PASS / RESOLVED | canonical recovery gate
TCT-BLOCK-003  ACTIVE          | canonical decomposition guarantee
TCT-BLOCK-004  RESERVED        | ADMISSIBLE NEXT, NOT CONSTRUCTED
```

## Next construction target

The project may begin:

```text
PDSA-TCT-006 — Structural Iteration / Pre-Numerical Depth
```

The cycle must inherit CAL-001 and must **not** begin by defining a natural-number-valued depth.

The required first question is:

> What structural invariant of repeated canonical decomposition can be constructed before any numerical interpretation is introduced?

## Current PDSA status

```text
PDSA-TCT-001  CLOSED — baseline stabilization
PDSA-TCT-002  CLOSED — pre-numerical metatheory contract
PDSA-TCT-003  CLOSED — structural equivalence / BR-010
PDSA-TCT-004  CLOSED — terminal recovery theorem / J-001 PASS
PDSA-TCT-005  CLOSING — canonical decomposition Block constructed and verified
PDSA-TCT-006  NEXT — structural iteration / pre-numerical depth
```
