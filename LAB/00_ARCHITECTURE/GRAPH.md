# GRAPH — Transparent Construction Graph

## Status

**ACTIVE — Canonical graph**

## Purpose

This is the human-readable map of the active construction.

The graph distinguishes **constructed/active units** from **resolved gates** and **reserved downstream targets**. A reserved node is shown for architectural planning only and must not be read as constructed.

## Current graph

```text
                         START
                           │
                           ▼
                 ┌──────────────────┐
                 │ TCT-BLOCK-001    │
                 │ Construction     │
                 │ Kernel           │
                 │ ACTIVE           │
                 └────────┬─────────┘
                          │
                          ▼
                 ┌──────────────────┐
                 │ TCT-BLOCK-002    │
                 │ Selected Finite  │
                 │ Configurations   │
                 │ ACTIVE           │
                 └────────┬─────────┘
                          │
                          ▼
          ┌────────────────────────────────┐
          │ TCT-BR-010                    │
          │ Structural Equivalence ≈      │
          │ ACTIVE — DECLARED IDENTITY    │
          │ SPECIFICATION                 │
          └───────────────┬────────────────┘
                          │
                          ▼
          ┌────────────────────────────────┐
          │ TCT-BR-009                    │
          │ Terminal Preservation         │
          │ ACTIVE — DERIVED UNDER        │
          │ BR-010                        │
          └───────────────┬────────────────┘
                          │
                          ▼
          ┌────────────────────────────────┐
          │ TCT-J-001                     │
          │ Canonicality Gate             │
          │ PASS / RESOLVED               │
          └───────────────┬────────────────┘
                          │
                          ▼
          ┌────────────────────────────────┐
          │ TCT-BLOCK-003                 │
          │ Canonical Decomposition       │
          │ ACTIVE                        │
          └───────────────┬────────────────┘
                          │
                          ▼
          ┌────────────────────────────────┐
          │ TCT-BLOCK-004                 │
          │ Structural Iteration History  │
          │ ACTIVE                        │
          └───────────────┬────────────────┘
                          │
                          ▼
          ┌────────────────────────────────┐
          │ TCT-BLOCK-005                 │
          │ Successor-Like Extension      │
          │ RESERVED — ADMISSIBLE NEXT    │
          │ NOT YET CONSTRUCTED           │
          └───────────────┬────────────────┘
                          │
                          ▼
          ┌────────────────────────────────┐
          │ TCT-BLOCK-006                 │
          │ Formal Natural-Number Domain  │
          │ RESERVED — NOT CONSTRUCTED    │
          └───────────────┬────────────────┘
                          │
                   NOT YET REACHED
                          │
                          ▼
                         ℕ
```

## Current frontier

The active mathematical construction now reaches:

```text
TCT-BLOCK-004 — Structural Iteration History
```

This Block does not assign numerical depth. It records canonical repeated decomposition history and the extension-tail relation.

The next frontier is:

```text
TCT-BLOCK-005 — Successor-Like Extension Structure
```

which remains RESERVED / NOT CONSTRUCTED.

## Verification chain to the current frontier

```text
TCT-BLOCK-002
      ↓
TCT-BR-010  structural equivalence
      ↓
TCT-BR-009  terminal preservation
      ↓
TCT-J-001   canonical recovery PASS
      ↓
TCT-BLOCK-003 canonical decomposition
      ↓
TCT-BLOCK-004 structural iteration history
```

Key evidence:

```text
LAB/PDSA/experiments/PDSA-TCT-004-TERMINAL-RECOVERY-PROOF-001.md
LAB/PDSA/experiments/PDSA-TCT-005-CANONICAL-DECOMPOSITION-VERIFICATION-001.md
LAB/PDSA/experiments/PDSA-TCT-006-STRUCTURAL-HISTORY-001.md
```

## Anti-circularity note

The historical planning label “Construction Depth” is not used as the canonical role at this stage.

The current Block exports:

```text
history witness
history correspondence under ≈
extension-tail relation
```

and does **not** export:

```text
numeric depth
cardinality
natural-number length
```

This is a direct architectural consequence of CAL-001 learning.

## Horizontal structure

Alternative or parallel constructions are represented horizontally:

```text
CANDIDATE-A  ── ALTERNATIVE_TO ── CANDIDATE-B
       \                         /
        \                       /
              TCT-J-XXX
```

No alternative is deleted merely because another candidate is selected.

## Vertical target view

```text
Kernel
  ↓
Selected finite configurations
  ↓
Structural equivalence
  ↓
Canonical decomposition
  ↓
Structural iteration history
  ↓
Successor-like extension
  ↓
Formalization boundary
  ↓
Formal natural-number domain
```

The path is currently active through Structural Iteration History only.

## Junction rule

Every convergence or compatibility gate must explicitly state:

```text
What is shared?
What is translated?
What is assumed?
What is proved?
What can fail?
What PDSA evidence resolved the gate?
```

## Change propagation

A change to BR-010 or the decomposition layer propagates through the active history Block and all future descendants.

Example:

```text
Change TCT-BR-010
        ↓
retest TCT-BR-009
        ↓
reopen TCT-J-001
        ↓
retest TCT-BLOCK-003
        ↓
retest TCT-BLOCK-004
        ↓
all affected descendants
```

## Current and planned gates

```text
TCT-J-001 → decomposition admissibility          PASS / RESOLVED
TCT-J-002 → structural-iteration / formal-stage correspondence
                                                   PLANNED / NOT YET ACTIVE
TCT-J-003 → formal realization boundary           PLANNED / NOT YET ACTIVE
```

## PDSA relation

The Construction Graph records **what depends on what mathematically**.

PDSA records under `LAB/PDSA/` record **how the project learned, tested, corrected, and decided**.

The two views are cross-linked but are not the same graph.
