# GRAPH — Transparent Construction Graph

## Status

**ACTIVE — Canonical graph**

## Purpose

This is the human-readable map of the active construction.

The graph distinguishes **constructed/active units** from **conditional gates** and **reserved downstream targets**. A reserved node is shown for architectural planning only and must not be read as constructed.

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
                       COMPOSES
                          │
                          ▼
                 ┌──────────────────┐
                 │ TCT-BLOCK-002    │
                 │ Finite           │
                 │ Configurations   │
                 │ ACTIVE           │
                 └────────┬─────────┘
                          │
                       MEETS_AT
                          │
                          ▼
          ┌────────────────────────────────┐
          │ TCT-J-001                     │
          │ Canonicality Gate             │
          │ CONDITIONAL / PENDING         │
          └───────────────┬────────────────┘
                          ▲
                          │ CONSTRAINS current path
                          │
          ┌────────────────────────────────┐
          │ TCT-BR-009                    │
          │ Terminal Interface            │
          │ Preservation                  │
          │ Operational: ACTIVE           │
          │ Epistemic: DECLARED CHOICE    │
          │ — ADDITIONAL CONSTRAINT       │
          └────────────────────────────────┘
                          │
                 gate unresolved
                          │
                          ▼
          ┌────────────────────────────────┐
          │ TCT-BLOCK-003                 │
          │ Canonical Decomposition       │
          │ RESERVED — NOT CONSTRUCTED    │
          └───────────────┬────────────────┘
                          │
                          ▼
          ┌────────────────────────────────┐
          │ TCT-BLOCK-004                 │
          │ Construction Depth            │
          │ RESERVED — NOT CONSTRUCTED    │
          └───────────────┬────────────────┘
                          │
                          ▼
          ┌────────────────────────────────┐
          │ TCT-BLOCK-005                 │
          │ Successor                     │
          │ RESERVED — NOT CONSTRUCTED    │
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

The actual mathematical frontier is:

```text
TCT-BLOCK-002
      ↓
TCT-J-001  ← constrained on the current path by TCT-BR-009
```

The project has **not** yet constructed `TCT-BLOCK-003` or any later node.

The current research program must first specify the permitted metatheory and then define/study structural equivalence `≈` before attempting to resolve the Junction.

Active execution plan:

`LAB/PDSA/BOMA_STAGE_ONE_PDSA_EXECUTION_PLAN.md`

## Horizontal structure

Alternative or parallel constructions are represented horizontally:

```text
CANDIDATE-A  ── ALTERNATIVE_TO ── CANDIDATE-B
       \                         /
        \                       /
              TCT-J-XXX
```

No alternative is deleted merely because another candidate is selected.

## Vertical structure

A higher unit depends on outputs of lower units.

Example target view:

```text
Kernel
  ↓
Finite configurations
  ↓
Decomposition
  ↓
Structural iteration / depth
  ↓
Successor-like structure
  ↓
Formalization boundary
  ↓
Formal natural-number domain
```

Only the first two Blocks are currently active constructed Blocks.

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

A change to a unit propagates only along declared dependency/sensitivity edges. It does not automatically invalidate unrelated siblings.

Example:

```text
Change TCT-BLOCK-001
        ↓
retest TCT-BLOCK-002
        ↓
retest TCT-J-001
        ↓
retest TCT-BLOCK-003 if it exists at that time
        ↓
all affected descendants
```

## Current and planned gates

```text
TCT-J-001 → decomposition admissibility          CURRENT / UNRESOLVED
TCT-J-002 → depth / formal-stage correspondence  PLANNED / NOT YET ACTIVE
TCT-J-003 → formal realization boundary           PLANNED / NOT YET ACTIVE
```

Only resolved Junctions may permit downstream canonical promotion.

## PDSA relation

The Construction Graph records **what depends on what mathematically**.

PDSA records under `LAB/PDSA/` record **how the project learned, tested, corrected, and decided**.

The two views are cross-linked but are not the same graph.
