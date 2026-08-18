# REGISTRY — Canonical Construction Unit Registry

## Status

**ACTIVE — Canonical registry**

## Purpose

This file is the single navigation table for the active construction.

The registry distinguishes two independent status dimensions:

```text
OPERATIONAL STATUS
Where the unit is in the project lifecycle / active graph.

EPISTEMIC STATUS
How the mathematical or architectural content is justified.
```

Operational status and epistemic status must not be collapsed into one field.

## Unit registry

| ID | Type | Layer | Role | Operational Status | Epistemic Status | Canonical path |
|---|---|---|---|---|---|---|
| TCT-BLOCK-001 | Block | L1 | Construction kernel | ACTIVE | MIXED — declared constitutive choices + constructional definition; see unit | `LAB/10_CONSTRUCTION/blocks/TCT-BLOCK-001/UNIT.md` |
| TCT-BLOCK-002 | Block | L1 | Generated Selected Configurations | ACTIVE | MIXED — constructed formation + meta-finite witness discipline + declared/refined normal-form choice + derived recovery invariance | `LAB/10_CONSTRUCTION/blocks/TCT-BLOCK-002/UNIT.md` |
| TCT-BR-010 | Brick | L1 | Reassociation-generated structural equivalence `≈` | ACTIVE | DECLARED CHOICE — STRUCTURAL IDENTITY SPECIFICATION | `LAB/10_CONSTRUCTION/bricks/TCT-BR-010/UNIT.md` |
| TCT-BR-009 | Brick | L1 | Terminal interface preservation | ACTIVE | DERIVED UNDER TCT-BR-010; historically declared additional constraint | `LAB/10_CONSTRUCTION/bricks/TCT-BR-009/UNIT.md` |
| TCT-J-001 | Junction | L1 | Canonicality gate | PASS / RESOLVED | DERIVED / VERIFIED UNDER TCT-BR-010 | `LAB/10_CONSTRUCTION/junctions/TCT-J-001/UNIT.md` |
| TCT-BLOCK-003 | Block | L1 | Canonical decomposition | ACTIVE | MIXED — constructed decomposition judgment + derived canonicality guarantee | `LAB/10_CONSTRUCTION/blocks/TCT-BLOCK-003/UNIT.md` |
| TCT-BLOCK-004 | Block | L1 | Structural Iteration History | ACTIVE | DERIVED STRUCTURAL VIEW / VERIFIED INVARIANT | `LAB/10_CONSTRUCTION/blocks/TCT-BLOCK-004/UNIT.md` |
| TCT-BLOCK-005 | Block | L1 | Successor-Like Extension Structure | ACTIVE | DERIVED STRUCTURAL OPERATION PACKAGE / VERIFIED | `LAB/10_CONSTRUCTION/blocks/TCT-BLOCK-005/UNIT.md` |
| TCT-BLOCK-006 | Block | L2 | Formal natural-number domain | RESERVED — BLOCKED BY ACCEPTANCE / FORMALIZATION BOUNDARY | PENDING / NOT CONSTRUCTED | reserved |

## Legacy correspondence

| Canonical ID | Previous document |
|---|---|
| TCT-BLOCK-001 | `LAB/BUILDING/reverse/TCT-001_CONSTRUCTION_KERNEL.md` |
| TCT-BLOCK-002 | `LAB/BUILDING/reverse/TCT-002_FINITE_CONFIGURATION_FORMATION.md` |
| TCT-J-001 | `LAB/BUILDING/reverse/TCT-J-001_CANONICAL_DECOMPOSITION_JUNCTION.md` |

Legacy documents remain source records. They are not the canonical identity of the active unit.

## Current canonical pre-numerical path

```text
TCT-BLOCK-001  Construction Kernel
      ↓
TCT-BLOCK-002  Generated Selected Configurations
      ↓
TCT-BR-010     Structural Equivalence ≈
      ↓
TCT-BR-009     Terminal Preservation — DERIVED
      ↓
TCT-J-001      PASS / RESOLVED
      ↓
TCT-BLOCK-003  Canonical Decomposition
      ↓
TCT-BLOCK-004  Structural Iteration History
      ↓
TCT-BLOCK-005  Successor-Like Extension Structure
```

## Pre-numerical calibration result

`PDSA-TCT-008 — Pre-Numerical Whole-Path Calibration` is CLOSED with result:

```text
PASS WITH DOCUMENTARY / TERMINOLOGICAL REFINEMENTS
```

Primary evidence:

`LAB/PDSA/experiments/PDSA-TCT-008-WHOLE-PATH-AUDIT-001.md`

Calibration corrections included:

```text
Finite Configurations → Generated Selected Configurations
finite-chain wording → explicit meta-finite-chain wording
stale downstream state → synchronized canonical state
```

No unresolved hidden numerical/global/quotient/carrier commitment was identified in the active canonical path at audit closure.

This verdict does not construct or identify ℕ.

## TCT-BLOCK-005 verified package

The current extension schema has verified:

```text
selected extension availability
canonical predecessor recovery
injectivity modulo ≈
ε not in extension image
no fixed points modulo ≈
history-tail extension
acyclicity for explicitly witnessed non-empty meta-finite extension histories
```

This package is successor-like, not yet the natural-number successor.

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
10. Operational status and epistemic status are separate dimensions.
11. A property built into a definition is not to be reported as a derived theorem.
12. Structural-equivalence specifications must be versioned rather than silently broadened.
13. Historical epistemic states remain provenance even if later premises support stronger derivation.
14. Passing a Junction permits downstream work; it does not construct the downstream Block.
15. “Canonical modulo ≈” does not imply quotient-object existence.
16. A reusable certified contribution is distinct from its producer unit/document.
17. Structural history must not be labeled numerical depth before numerical interpretation.
18. Successor-like properties must not be reported as a natural-number successor before formal realization.
19. Meta-finite witness language must not be shortened into an object-level finiteness claim where ambiguity is material.
20. A successful calibration permits the next decision/acceptance cycle; it does not automatically permit a reserved mathematical Block to become ACTIVE.

## Current position

```text
TCT-BLOCK-001  ACTIVE
TCT-BLOCK-002  ACTIVE
TCT-BR-010     ACTIVE
TCT-BR-009     ACTIVE / DERIVED
TCT-J-001      PASS / RESOLVED
TCT-BLOCK-003  ACTIVE
TCT-BLOCK-004  ACTIVE
TCT-BLOCK-005  ACTIVE
PDSA-TCT-008   CLOSED / PASS WITH REFINEMENTS
TCT-BLOCK-006  RESERVED / BLOCKED
```

## Mandatory next gate

Before constructing `TCT-BLOCK-006`, the project must define and approve:

```text
PDSA-N-001 — Natural-Number Acceptance Specification
```

This specification must separate:

```text
what the pre-numerical TCT core already exports
what a formal realization must add
what properties are required to call the result ℕ
what is framework-neutral
what is realization-regime dependent
what evidence establishes identification/adequacy
```

Only after this gate is closed may a formal realization cycle begin.

## Current PDSA status

```text
PDSA-TCT-001  CLOSED
PDSA-TCT-002  CLOSED
PDSA-TCT-003  CLOSED
PDSA-TCT-004  CLOSED
PDSA-TCT-005  CLOSED
PDSA-TCT-006  CLOSED
PDSA-TCT-007  CLOSED
PDSA-TCT-008  CLOSED — PASS WITH REFINEMENTS
PDSA-N-001    NEXT — Natural-Number Acceptance Specification
```
