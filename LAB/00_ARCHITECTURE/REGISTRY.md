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
| TCT-BR-010 | Brick | L1 | Reassociation-generated structural equivalence `≈` | ACTIVE | DECLARED CHOICE — STRUCTURAL IDENTITY SPECIFICATION | `LAB/10_CONSTRUCTION/bricks/TCT-BR-010/UNIT.md` |
| TCT-J-001 | Junction | L1 | Canonicality gate | CONDITIONAL / PENDING | PENDING | `LAB/10_CONSTRUCTION/junctions/TCT-J-001/UNIT.md` |
| TCT-BR-009 | Brick | L1 | Terminal interface preservation constraint | ACTIVE | DECLARED CHOICE — ADDITIONAL CONSTRAINT; derivability retest pending under BR-010 | `LAB/10_CONSTRUCTION/bricks/TCT-BR-009/UNIT.md` |
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

### TCT-BR-010 — active structural identity specification

`TCT-BR-010` is the explicit definition of structural equivalence selected by `PDSA-TCT-003` for the current canonical path.

Its defining content is intentionally narrow:

```text
≡ is included in ≈
reassociation is a declared structural-equivalence generator
equivalence closure is admitted
compatible contextual closure is admitted
```

It contains no generator for insertion, deletion, idempotent collapse, contraction, or commutativity and contains no numerical criterion.

Most importantly, `TCT-BR-010` does **not** include terminal-interface preservation as a defining clause. That property remains a separate theorem/constraint question.

### TCT-BR-009

`TCT-BR-009` is the explicit structural constraint discovered at `TCT-J-001`:

> structural equivalence must preserve the distinguished terminal interface and terminal-block role, so that equivalent terminal decompositions recover equivalent predecessor configurations.

Its original derivability test established that this condition was **not derived from the then-incomplete specification of `≈`**.

Accordingly, its current status remains:

```text
Operational Status = ACTIVE
Epistemic Status   = DECLARED CHOICE — ADDITIONAL CONSTRAINT
```

However, `TCT-BR-010` now supplies a new explicit, more restrictive `≈`. Therefore `PDSA-TCT-004` must retest derivability under exactly that definition.

A successful proof may reclassify the current-path mathematical role of BR-009 as DERIVED while preserving the historical declared-constraint provenance.

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
12. A property built into a definition is not to be reported as a derived theorem.
13. An explicit structural-equivalence specification must be versioned/replaced through traceable unit history rather than silently broadened.

## Current position

```text
TCT-BLOCK-001  ACTIVE                 | kernel
TCT-BLOCK-002  ACTIVE                 | finite normal-form construction
TCT-BR-010     ACTIVE                 | DECLARED structural identity specification ≈
TCT-BR-009     ACTIVE                 | DECLARED additional constraint, retest pending
TCT-J-001      CONDITIONAL / PENDING  | theorem/countermodel gate
TCT-BLOCK-003  RESERVED               | NOT CONSTRUCTED
```

## Gate condition for TCT-BLOCK-003

`TCT-BLOCK-003` must not be treated as constructed until `TCT-J-001` is independently resolved under `TCT-BR-010`.

The next question is whether the current generated relation proves:

```text
P ⊙ U ≈ Q ⊙ U  ⇒  P ≈ Q
```

with preservation of the distinguished terminal role.

## Current next action

The active PDSA sequence is documented in:

`LAB/PDSA/BOMA_STAGE_ONE_PDSA_EXECUTION_PLAN.md`

Current status:

```text
PDSA-TCT-001  CLOSED — baseline stabilization
PDSA-TCT-002  CLOSED — pre-numerical metatheory contract
PDSA-TCT-003  CLOSING — structural equivalence selected as TCT-BR-010
PDSA-TCT-004  NEXT — terminal recovery theorem / countermodel
```

No downstream Block is promoted by the selection of `TCT-BR-010`.
