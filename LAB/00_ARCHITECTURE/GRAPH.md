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
                       COMPOSES
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
          │ Structural Iteration / Depth  │
          │ RESERVED — ADMISSIBLE NEXT    │
          │ NOT YET CONSTRUCTED           │
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

The active mathematical construction now reaches:

```text
TCT-BLOCK-003 — Canonical Decomposition
```

The Block exports a representation-invariant decomposition guarantee but no quotient object and no global predecessor function.

The next frontier is:

```text
TCT-BLOCK-004 — Structural Iteration / Pre-Numerical Depth
```

which remains RESERVED / NOT CONSTRUCTED.

## Verification chain to the current frontier

```text
TCT-BLOCK-002
      ↓
TCT-BR-010  explicit current-path ≈
      ↓
TCT-BR-009  terminal preservation DERIVED
      ↓
TCT-J-001   PASS / RESOLVED
      ↓
TCT-BLOCK-003 ACTIVE
```

Key evidence:

```text
LAB/PDSA/experiments/PDSA-TCT-004-TERMINAL-RECOVERY-PROOF-001.md
LAB/PDSA/experiments/PDSA-TCT-005-CANONICAL-DECOMPOSITION-VERIFICATION-001.md
```

## Horizontal structure

Alternative or parallel constructions are represented horizontally:

```text
CANDIDATE-A  ── ALTERNATIVE_TO ── CANDIDATE-B
       \                         /
        \                       /
              TCT-J-XXX
```

No alternative is deleted merely because another candidate is selected.

The interface-preserving equivalence studied in PDSA-TCT-003 remains a legitimate future branch, but it is not the current canonical identity specification.

## Vertical structure

A higher unit depends on outputs of lower units.

Target view:

```text
Kernel
  ↓
Selected finite configurations
  ↓
Structural equivalence
  ↓
Canonical decomposition
  ↓
Structural iteration / depth
  ↓
Successor-like structure
  ↓
Formalization boundary
  ↓
Formal natural-number domain
```

The path is currently active through Canonical Decomposition only.

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
Change TCT-BR-010
        ↓
retest TCT-BR-009
        ↓
reopen/retest TCT-J-001
        ↓
retest TCT-BLOCK-003
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

Only resolved Junctions may permit downstream canonical promotion.

## PDSA relation

The Construction Graph records **what depends on what mathematically**.

PDSA records under `LAB/PDSA/` record **how the project learned, tested, corrected, and decided**.

The two views are cross-linked but are not the same graph.
