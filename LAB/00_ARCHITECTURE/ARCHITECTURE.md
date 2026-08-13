# ARCHITECTURE — Auditable Construction System

## Status

**ACTIVE — Canonical project architecture**

## Purpose

This file defines the permanent engineering architecture of the transparent mathematical construction.

The project is represented as an **auditable dependency graph**, not as a linear sequence of documents.

The objective is:

```text
declared starting point
        ↓
explicit construction
        ↓
constructed mathematical structure
        ↓
formal realization
        ↓
natural numbers
```

## Canonical unit types

### Brick

The smallest independently reviewable and changeable mathematical construction unit.

A Brick must have:

- unique ID;
- explicit inputs;
- explicit construction rule;
- explicit outputs;
- invariants;
- verification status;
- epistemic status;
- dependencies;
- sensitivity/change impact.

### Block

A coherent cluster of Bricks that establishes one higher-level structure.

A Block has:

- input interface;
- internal Bricks;
- internal relations;
- output interface;
- acceptance criterion.

### Junction

A point where two or more construction paths meet.

A Junction must record:

- incoming units;
- compatibility condition;
- identification/translation rule;
- shared output;
- possible conflicts;
- verification status.

### Configuration

A mathematical or geometric object produced by one or more construction units.

A document describing a configuration is not the configuration itself.

## Canonical graph relations

Only these graph relations are admitted:

```text
DEPENDS_ON
COMPOSES
REFINES
VERIFIES
CONSTRAINS
ALTERNATIVE_TO
MEETS_AT
REPRESENTS
```

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

Every active unit must separately declare one of:

```text
CONSTRUCTED
DERIVED
DECLARED CHOICE
FORMALIZATION-DEPENDENT
PENDING
REJECTED
```

## Sensitivity rule

Every Brick must answer:

```text
If this Brick changes:

What remains valid upstream?
Which descendants require retesting?
Which sibling units may become incompatible?
Which Junctions must be reopened?
```

## Architectural invariants

1. No unit may silently replace another unit.
2. Alternatives receive distinct IDs.
3. A Junction may not hide an unresolved incompatibility.
4. A pending result cannot become accepted because a downstream document exists.
5. Historical material is preserved.
6. Geometry is a representation unless explicitly promoted to mathematical structure.
7. Numerical concepts are not used as hidden premises in the pre-formal construction layer.

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

## Authority rule

The sequence of documents is only a **view** of the construction graph.

The graph and canonical unit identities are authoritative.
