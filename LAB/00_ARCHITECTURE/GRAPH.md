# GRAPH — Transparent Construction Graph

## Status

**ACTIVE — Canonical graph**

## Purpose

This is the human-readable map of the active construction.

The graph distinguishes constructed/active units from resolved gates and reserved downstream targets. A reserved node is shown for architectural planning only and must not be read as constructed.

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
                 │ Selected         │
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
          │ ACTIVE                        │
          └───────────────┬────────────────┘
                          │
          ───────── PRE-NUMERICAL ─────────
             WHOLE-PATH CALIBRATION GATE
                   PDSA-TCT-008
                          │
                          ▼
          ┌────────────────────────────────┐
          │ TCT-BLOCK-006                 │
          │ Formal Natural-Number Domain  │
          │ RESERVED / BLOCKED            │
          │ NOT YET CONSTRUCTED           │
          └───────────────┬────────────────┘
                          │
                   NOT YET REACHED
                          │
                          ▼
                         ℕ
```

The PDSA-TCT-008 label above is a research/calibration gate, not a mathematical construction node.

## Current frontier

The active mathematical construction now reaches:

```text
TCT-BLOCK-005 — Successor-Like Extension Structure
```

Its verified package includes:

```text
selected extension availability
canonical predecessor
injectivity modulo ≈
ε excluded from extension image
no structural fixed point
history-tail extension
acyclicity for explicit non-empty extension chains
```

This package does not establish a formal natural-number successor or carrier.

The immediate frontier is therefore the whole-path calibration gate, not `TCT-BLOCK-006` itself.

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
      ↓
TCT-BLOCK-005 successor-like extension
```

Key evidence:

```text
LAB/PDSA/experiments/PDSA-TCT-004-TERMINAL-RECOVERY-PROOF-001.md
LAB/PDSA/experiments/PDSA-TCT-005-CANONICAL-DECOMPOSITION-VERIFICATION-001.md
LAB/PDSA/experiments/PDSA-TCT-006-STRUCTURAL-HISTORY-001.md
LAB/PDSA/experiments/PDSA-TCT-007-SUCCESSOR-LIKE-VERIFICATION-001.md
```

## Anti-circularity boundary

The project has constructed structural ancestry and successor-like extension properties without exporting:

```text
numeric depth
cardinality
natural-number indexing
a completed global carrier
object-level induction over ℕ
```

Before any formal natural-number realization, PDSA-TCT-008 must audit the full active path for silent imports of such structure.

## Horizontal structure

Alternative or parallel constructions are represented horizontally and retain distinct identities. No alternative is deleted merely because another candidate is selected.

## Vertical target view

```text
Kernel
  ↓
Selected generated configurations
  ↓
Structural equivalence
  ↓
Canonical decomposition
  ↓
Structural iteration history
  ↓
Successor-like extension
  ↓
Pre-numerical whole-path calibration
  ↓
Formalization boundary / acceptance specification
  ↓
Formal natural-number realization
```

The path is currently active through Successor-Like Extension only.

## Junction rule

Every convergence or compatibility gate must explicitly state what is shared, translated, assumed, proved, what can fail, and what PDSA evidence resolved the gate.

## Change propagation

A change to BR-010 or the decomposition layer propagates through the active history and extension Blocks and all affected future descendants.

## Current and planned gates

```text
TCT-J-001 → decomposition admissibility          PASS / RESOLVED
PDSA-TCT-008 → pre-numerical whole-path audit    REQUIRED / NEXT
TCT-J-002 → structural/formal correspondence     PLANNED / NOT YET ACTIVE
TCT-J-003 → formal realization boundary          PLANNED / NOT YET ACTIVE
```

## PDSA relation

The Construction Graph records what depends on what mathematically.

PDSA records under `LAB/PDSA/` record how the project learned, tested, corrected, and decided.

The two views are cross-linked but are not the same graph.
