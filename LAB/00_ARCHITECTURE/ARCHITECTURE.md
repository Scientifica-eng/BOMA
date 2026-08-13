# ARCHITECTURE — Auditable Construction System

## Status

**ACTIVE — Canonical project architecture**

## Purpose

This file defines the permanent engineering architecture of the transparent mathematical construction.

The project is represented as an auditable dependency graph, not as a linear sequence of documents.

## Canonical unit types

### Brick
The smallest independently reviewable and changeable mathematical construction unit.

### Block
A coherent cluster of Bricks that establishes one higher-level structure.

### Junction
A point where two or more construction paths meet and whose compatibility must be explicit.

### Configuration
A mathematical or geometric object produced by one or more construction units.

## Canonical graph relations

`DEPENDS_ON`, `COMPOSES`, `REFINES`, `VERIFIES`, `CONSTRAINS`, `ALTERNATIVE_TO`, `MEETS_AT`, `REPRESENTS`.

## Verification levels

```text
V0  idea
V1  explicit construction
V2  local verification
V3  dependency-compatible verification
V4  cross-path verification
V5  formal verification under selected regime
```

## Epistemic status

```text
CONSTRUCTED
DERIVED
DECLARED CHOICE
FORMALIZATION-DEPENDENT
PENDING
REJECTED
```

## Sensitivity rule

Every Brick must state the expected downstream impact of changing it, including descendants requiring retesting and Junctions that must be reopened.

## Repository structure

```text
LAB/
├── 00_ARCHITECTURE/
├── 10_CONSTRUCTION/
├── 20_FORMALIZATION/
└── 90_ARCHIVE/
```

`00_ARCHITECTURE` defines the system.
`10_CONSTRUCTION` contains the active mathematical construction.
`20_FORMALIZATION` contains explicit formal realizations.
`90_ARCHIVE` contains historical or superseded material.

## Architectural invariant

The sequence of documents is a view of the construction graph. The graph and canonical unit identities are authoritative.
