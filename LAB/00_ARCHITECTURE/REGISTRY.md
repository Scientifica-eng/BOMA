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
| TCT-BLOCK-005 | Block | L1 | Successor-Like Extension Structure | ACTIVE | DERIVED STRUCTURAL OPERATION PACKAGE / VERIFIED | `LAB/10_CONSTRUCTION/blocks/TCT-BLOCK-005/UNIT.md` |
| TCT-BLOCK-006 | Block | L2 | Formal natural-number domain | RESERVED — BLOCKED BY CALIBRATION / FORMALIZATION BOUNDARY | PENDING / NOT CONSTRUCTED | reserved |

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
TCT-BLOCK-002  Selected Finite Configurations
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

## TCT-BLOCK-005 verified package

The current extension schema has verified:

```text
selected extension availability
canonical predecessor recovery
injectivity modulo ≈
ε not in extension image
no fixed points modulo ≈
history-tail extension
acyclicity for explicit non-empty extension histories
```

This package is **successor-like**, not yet the natural-number successor.

No completed natural-number carrier, object-level induction, or formal successor function has been constructed.

Verification evidence:

`LAB/PDSA/experiments/PDSA-TCT-007-SUCCESSOR-LIKE-VERIFICATION-001.md`

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
18. Successor-like structural properties must not be reported as a natural-number successor before a formal carrier/realization is explicitly established.

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
TCT-BLOCK-006  RESERVED / BLOCKED
```

## Mandatory next gate

Before `TCT-BLOCK-006` or any formal natural-number carrier work, run:

```text
PDSA-TCT-008 — Pre-Numerical Whole-Path Calibration
```

The audit must review the full active path for silent imports of:

```text
numerical counting / cardinality
numerical depth or stage
completed global totality
object-level induction / recursion over ℕ
unannounced equality strength
quotient / equivalence-class existence
set/type carrier assumptions
ordered-pair or function objects
successor identification by analogy
classical/nonconstructive principles not declared
```

Only after this calibration closes may the project define the acceptance specification and formalization boundary for a natural-number realization.

## Current PDSA status

```text
PDSA-TCT-001  CLOSED
PDSA-TCT-002  CLOSED
PDSA-TCT-003  CLOSED
PDSA-TCT-004  CLOSED
PDSA-TCT-005  CLOSED
PDSA-TCT-006  CLOSED
PDSA-TCT-007  CLOSING — successor-like Block constructed and verified
PDSA-TCT-008  NEXT — pre-numerical whole-path calibration
```
