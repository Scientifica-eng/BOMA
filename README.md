# BOMA — Project Handoff / START HERE

This repository is an active research project for building a **transparent, traceable, logically explicit mathematical architecture** from a declared pre-numerical constructional layer toward the standard number systems.

The governing research method is:

> **PDSA — Plan → Do → Study → Act**

Historical files or paths containing `PDCA` are legacy provenance only.

---

## Mandatory reading order for any new human or AI collaborator

Before creating, modifying, promoting, or interpreting canonical mathematical units, read these records in order:

1. `LAB/00_ARCHITECTURE/ARCHITECTURE.md`  
   Canonical unit types, statuses, Decision Points, Junctions, relations, and invariants.

2. `LAB/00_ARCHITECTURE/CONSTRUCTION_TOPOLOGY.md`  
   **Mandatory topology rule:** construction is a DAG, not a forced linear chain. Bricks/Blocks may be vertical, horizontal, convergent, or branch and later reconverge.

3. `LAB/BOMA_PDSA_GOVERNANCE_AND_PDCA_LEGACY_CORRECTION_2026-08-18.md`  
   PDSA governance and the role of Study as an epistemic output.

4. `LAB/PDSA/STATUS.md`  
   Current PDSA cycle status.

5. Latest checkpoint under `LAB/PDSA/`  
   At the time this handoff entry is created: `LAB/PDSA/CHECKPOINT_2026-08-18_NCORE_V5_GATE.md`.

6. `LAB/00_ARCHITECTURE/REGISTRY.md` and `LAB/00_ARCHITECTURE/GRAPH.md`  
   Current canonical unit identities and human-readable construction graph.

Do not infer current scientific status from file chronology alone.

---

## Core architectural rule — do not linearize BOMA

BOMA is an auditable construction graph.

Valid topologies include:

### Vertical dependency

```text
B1
 ↓
B2
 ↓
B3
```

### Horizontal independence

```text
B1       B2       B3
```

### Parallel contributions that converge

```text
B1 ──┐
B2 ──┼──► shared Block / Junction
B3 ──┘
```

### Branching followed by reconvergence

```text
                  ┌──► Path A ──┐
Common trunk ─────┤             ├──► Junction ──► shared trunk
                  └──► Path B ──┘
```

The current Stage-One research program gives particular attention to:

> **split → independent development → explicit convergence test → shared path if verified**

Reconvergence never erases branch provenance.

A common downstream contribution does not imply that its production histories were identical.

For the normative rules, read:

`LAB/00_ARCHITECTURE/CONSTRUCTION_TOPOLOGY.md`.

---

## Fork classification

Do not call every fork a Decision Point.

A fork may be:

```text
PARALLEL DEPENDENCY
both branches are needed and are not alternatives

DECISION POINT
alternative admissible routes arise from a non-derived choice

EXPLORATORY PDSA BRANCH
research routes tested before canonical promotion
```

Likewise, do not claim reconvergence without an explicit Junction/compatibility result.

---

## Brick / Block principle

A Brick is the smallest independently reviewable/changeable constructional commitment at the chosen project granularity.

Its status does not depend on whether it is drawn horizontally or vertically.

A Brick may therefore be:

```text
dependency-free
dependent on prior Bricks
independent of sibling Bricks
branch-specific
one of several parallel contributors to a Block or Junction
```

A Block composes one or more Bricks for an explicit architectural purpose while preserving their identities and provenance.

Historical Brick/Block investigations remain relevant evidence; the active canonical architecture is under `LAB/00_ARCHITECTURE/`.

---

## Decision Point versus Junction

These are different.

**Decision Point** records a non-derived choice among admissible alternatives and may produce branches.

**Junction** verifies whether multiple incoming routes/contributions can share a downstream interface or path.

Canonical reconvergent pattern:

```text
Decision Point
   ├──► Route A ──┐
   └──► Route B ──┤
                  ▼
               Junction
                  ▼
          shared contribution
```

The selected branch is not thereby converted into logical necessity.

---

## Two research outputs

BOMA produces two linked research products:

```text
1. MATHEMATICAL CONSTRUCTION
   Bricks, Blocks, Junctions, Decision Points, formal realizations,
   verified dependencies and certified contributions.

2. LEARNING / METHODOLOGY
   errors, failed routes, corrections, successful strategies,
   human–AI collaboration evidence, and lessons inherited by later PDSA cycles.
```

A mathematically failed branch may still be an important epistemic result.

Do not delete or silently rewrite scientifically useful failures.

---

## Current broad target

Stage One aims toward a traceable construction of:

```text
pre-numerical constructional layer
    ↓
formal natural-number core
    ↓
ℕ
    ↓
ℤ
    ↓
ℚ
    ↓
ℝ
    ↓
ℂ
```

No arrow is accepted merely because its endpoint is familiar.

Every transition must expose its dependencies, new commitments, epistemic status, verification evidence, and formalization regime where applicable.

Stage Two will perform controlled branching experiments on selected Bricks/Blocks/Junctions/Decision Points. The present Stage-One emphasis already studies useful **branch-and-reconverge** cases when they arise naturally.

---

## Non-negotiable handoff rules

Any continuation of the project must respect the following:

1. Do not treat repository/file order as the mathematical dependency order.
2. Do not force a linear architecture when independent or reconvergent topology is more accurate.
3. Do not manufacture branches for visual symmetry.
4. Do not manufacture convergence merely to simplify the graph.
5. Preserve branch-specific assumptions and provenance after reconvergence.
6. Do not promote a choice into a theorem.
7. Do not promote backend representation into BOMA mathematical definition.
8. Do not introduce numerical content silently into the pre-numerical object layer.
9. Keep operational, epistemic, and verification statuses distinct.
10. Work through PDSA and record Study outputs, including errors and negative results.

If a future cycle changes these rules, it must do so by an explicit, versioned, traceable architectural revision.
