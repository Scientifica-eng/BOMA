# ARCHITECTURE — Auditable Construction System

## Status

**ACTIVE — Canonical project architecture**

## Purpose

This file defines the permanent engineering architecture of the transparent mathematical construction.

The project is represented as an **auditable dependency graph**, not as a linear sequence of documents.

The current Stage-One objective is:

```text
declared pre-numerical constructional starting point
        ↓
explicit construction
        ↓
constructed mathematical structure
        ↓
explicit formalization boundary
        ↓
formal realization
        ↓
natural numbers
        ↓
integers → rationals → reals → complex numbers
```

The diagram is a target architecture, not a claim that downstream units already exist.

## Governing research method

New research work follows:

> **PDSA — Plan, Do, Study, Act**

Historical paths or files containing `PDCA` are legacy provenance only.

The governing correction and methodology record is:

`LAB/BOMA_PDSA_GOVERNANCE_AND_PDCA_LEGACY_CORRECTION_2026-08-18.md`

The current execution plan is:

`LAB/PDSA/BOMA_STAGE_ONE_PDSA_EXECUTION_PLAN.md`

PDSA produces two linked outputs:

```text
CONSTRUCTION OUTPUT
mathematical units and their dependency graph

LEARNING OUTPUT
errors, successes, corrections, methodological lessons, decision criteria,
and human–AI research learning
```

## Canonical unit types

### Brick

The smallest independently reviewable and changeable mathematical construction unit at the declared project granularity.

A Brick must have:

- unique ID;
- explicit inputs;
- explicit construction rule or declared constraint;
- explicit outputs/effect;
- invariants;
- operational status;
- verification status/evidence;
- epistemic status;
- dependencies;
- sensitivity/change impact;
- relevant PDSA provenance when created or changed under the current method.

### Block

A coherent cluster of Bricks that establishes one higher-level structure.

A Block has:

- input interface;
- internal Bricks or declared internal construction components;
- internal relations;
- output interface;
- acceptance criterion;
- operational and epistemic status;
- PDSA provenance where applicable.

### Junction

A compatibility or decision gate where construction paths, representations, interfaces, or constraints must be reconciled before downstream promotion.

A Junction must record:

- incoming units;
- compatibility condition;
- identification/translation rule where applicable;
- shared output or admitted downstream transition;
- possible conflicts/failure modes;
- verification status;
- operational status;
- epistemic status;
- sensitivity and reopening conditions.

### Configuration

A mathematical or constructional object produced by one or more construction units.

A document describing a configuration is not the configuration itself.

## Canonical graph relations

Only these graph relations are admitted unless the architecture is explicitly revised:

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

## Operational status

Operational status records where a unit is in the active project lifecycle and graph. Typical values include:

```text
ACTIVE
CONDITIONAL / PENDING
RESERVED
REJECTED
ARCHIVED
```

Operational status answers questions such as:

- Is the unit currently part of the active graph?
- Is it blocked at a gate?
- Is its identity only reserved for future work?
- Has it been rejected or archived?

## Verification levels

```text
V0  idea
V1  explicit construction
V2  local verification
V3  dependency-compatible verification
V4  cross-path verification
V5  formal verification under selected regime
```

Verification level is not the same as operational or epistemic status.

## Epistemic status

Epistemic status records **how the content is justified**, independently of whether the unit is operationally active.

Every active unit or explicit subclaim must declare, where applicable, one of:

```text
CONSTRUCTED
DERIVED
DECLARED CHOICE
FORMALIZATION-DEPENDENT
PENDING
REJECTED
```

A declared additional constraint is represented as:

```text
Operational Status = ACTIVE
Epistemic Status   = DECLARED CHOICE — ADDITIONAL CONSTRAINT
```

It must not be mislabeled as a derived theorem merely because it is required by downstream construction.

## Status-separation invariant

The following dimensions must not be collapsed:

```text
Operational Status
Verification Status / Evidence
Epistemic Status
```

Example:

```text
TCT-BR-009
Operational Status = ACTIVE
Epistemic Status   = DECLARED CHOICE — ADDITIONAL CONSTRAINT
Verification evidence = derivability test showing NOT DERIVED from current ≈
```

## Sensitivity rule

Every Brick and every high-impact Block/Junction must answer:

```text
If this unit changes:

What remains valid upstream?
Which descendants require retesting?
Which sibling units may become incompatible?
Which Junctions must be reopened?
Which PDSA results or learning claims must be revisited?
```

## Architectural invariants

1. No unit may silently replace another unit.
2. Alternatives receive distinct IDs or explicit versioned revisions when identity is intentionally preserved.
3. A Junction may not hide an unresolved incompatibility.
4. A pending result cannot become accepted because a downstream document exists.
5. Historical material is preserved when scientifically relevant.
6. Geometry or visualization is a representation unless explicitly promoted to mathematical structure.
7. Numerical concepts are not used as hidden premises in the pre-numerical object layer.
8. The pre-numerical layer is **not metatheory-free**; its meta-level resources must be declared.
9. Construction is distinguished from numerical/algebraic interpretation.
10. Operational status, verification status, and epistemic status remain distinct.
11. Scientifically relevant failures and corrections remain traceable through PDSA learning records.
12. AI-generated content never becomes canonical solely because it is fluent or plausible; appropriate verification and human research authority remain explicit.

## Repository structure

Current canonical construction directories remain:

```text
LAB/
├── 00_ARCHITECTURE/
├── 10_CONSTRUCTION/
├── 20_FORMALIZATION/
└── 90_ARCHIVE/
```

The PDSA research-process record is maintained separately under:

```text
LAB/PDSA/
```

`00_ARCHITECTURE` defines the active construction system.

`10_CONSTRUCTION` contains the active mathematical construction.

`20_FORMALIZATION` contains explicit formal realizations.

`90_ARCHIVE` contains historical or superseded material when migrated there intentionally.

`PDSA` records cumulative research cycles and learning. A PDSA record is not itself automatically a canonical mathematical unit.

## Authority rule

The sequence of documents is only a **view** of the construction graph.

The canonical graph and unit identities are authoritative for mathematical construction status.

PDSA cycle records are authoritative for the recorded research process and learning associated with those cycles, subject to later additive correction rather than silent rewriting.
