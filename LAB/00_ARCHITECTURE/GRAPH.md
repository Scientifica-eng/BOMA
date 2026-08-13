# GRAPH — Transparent Construction Graph

## Status

**ACTIVE — Canonical graph**

## Purpose

This is the human-readable map of the active construction.

## Current graph

```text
                         START
                           │
                           ▼
                 ┌──────────────────┐
                 │ TCT-BLOCK-001     │
                 │ Construction      │
                 │ Kernel             │
                 └────────┬─────────┘
                          │
                       COMPOSES
                          │
                          ▼
                 ┌──────────────────┐
                 │ TCT-BLOCK-002     │
                 │ Finite             │
                 │ Configurations     │
                 └────────┬─────────┘
                          │
                       MEETS_AT
                          │
                          ▼
                 ┌──────────────────┐
                 │ TCT-J-001         │
                 │ Canonicality      │
                 │ Gate              │
                 └────────┬─────────┘
                          │
                       CONSTRAINS
                          │
                          ▼
                 ┌──────────────────┐
                 │ TCT-BLOCK-003     │
                 │ Canonical         │
                 │ Decomposition     │
                 └────────┬─────────┘
                          │
                          ▼
                 ┌──────────────────┐
                 │ TCT-BLOCK-004     │
                 │ Construction      │
                 │ Depth             │
                 └────────┬─────────┘
                          │
                          ▼
                 ┌──────────────────┐
                 │ TCT-BLOCK-005     │
                 │ Successor         │
                 └────────┬─────────┘
                          │
                          ▼
                 ┌──────────────────┐
                 │ TCT-BLOCK-006     │
                 │ Formal Natural    │
                 │ Number Domain     │
                 └────────┬─────────┘
                          │
                          ▼
                         ℕ
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

## Vertical structure

A higher unit depends on outputs of lower units.

Example:

```text
Kernel
  ↓
Finite configurations
  ↓
Decomposition
  ↓
Depth
  ↓
Successor
  ↓
Formal domain
```

## Junction rule

Every convergence point must explicitly state:

```text
What is shared?
What is translated?
What is assumed?
What is proved?
What can fail?
```

## Change propagation

A change to a unit propagates only along declared dependency edges. It does not automatically invalidate unrelated siblings.

Example:

```text
Change TCT-BLOCK-001
        ↓
retest TCT-BLOCK-002
        ↓
retest TCT-J-001
        ↓
retest TCT-BLOCK-003
        ↓
all affected descendants
```

## Current gates

```text
TCT-J-001 → decomposition admissibility
TCT-J-002 → depth / formal-stage correspondence
TCT-J-003 → formal realization boundary
```

Only verified Junctions may be promoted in the registry.
