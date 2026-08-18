# PDSA-ARCH-001 — Construction Topology Adoption

**CycleID:** `PDSA-ARCH-001`  
**Track:** Architecture / Handoff Governance  
**Date:** 2026-08-18  
**Status:** **CLOSED — ADOPTED**  
**Cycle type:** Architectural consolidation and handoff clarification

---

## Learning inputs

This cycle consolidates existing project evidence rather than inventing a new topology from scratch.

Primary lineage:

```text
LAB/BRICK_BLOCK_DEFINITION_001.md
LAB/BOMA_INITIAL_PLAN.md
LAB/BOMA_SOURCE_AUDIT_001.md
historical Brick/Block dependency experiments
historical DAG / Decision Point / Branch experiments
Construction Unit ≠ Reusable Certified Contribution learning
current ARCHITECTURE.md Decision Point / Junction distinction
```

Historical records may use `PDCA`; those labels remain provenance. The active method is PDSA.

---

# PLAN

## Research / governance question

How should the project make explicit, for future human and AI collaborators, the already investigated fact that Brick/Block construction is not restricted to a linear chain?

Required clarification:

```text
Bricks may be vertical/dependent.
Bricks may be horizontal/independent.
Independent contributions may converge.
A common path may branch into alternatives or parallel routes.
Branches may later reconverge through explicit evidence.
Reconvergence must preserve provenance.
Not every fork is a Decision Point.
Not every meeting is a valid Junction.
```

The current Stage-One emphasis is on **branches that split, develop independently, and return to a shared path when convergence is verified**.

## Acceptance criteria

The clarification must:

1. become part of canonical architecture rather than chat-only context;
2. be discoverable by a new human at repository entry;
3. be discoverable by an AI/code agent at repository entry;
4. distinguish parallel decomposition from genuine Decision Point branching;
5. specify the evidence required for reconvergence;
6. preserve branch provenance after reconvergence;
7. explicitly influence the upcoming N-Core Brick/Block decomposition;
8. remain consistent with PDSA and the Construction Graph / Learning Graph distinction.

---

# DO

Created:

```text
LAB/00_ARCHITECTURE/CONSTRUCTION_TOPOLOGY.md
```

as the canonical operational specialization for serial/parallel/branch/reconvergence topology.

Created root handoff entry:

```text
README.md
```

with mandatory reading order and the non-linear construction rule.

Created AI-agent handoff entry:

```text
AGENTS.md
```

requiring agents to read the architecture/topology/status records before modifying canonical construction.

The topology document explicitly defines:

```text
T1 vertical dependency
T2 horizontal independence
T3 parallel convergence
T4 branching followed by reconvergence
```

and fork classes:

```text
F1 parallel dependency fork
F2 Decision Point branch
F3 exploratory PDSA branch
```

---

# STUDY

## S1 — Historical consistency

The adopted rule is consistent with the earlier project definition that a Brick may have explicit dependencies but is not required to be dependency-free.

It is also consistent with the early experimental plan that anticipated:

```text
multiple Bricks and explicit dependency
Decision Points
Branches
architectural DAG
cross-branch comparison
```

Therefore the adopted topology is a consolidation/refinement of existing research learning, not an unsupported architectural invention.

## S2 — Important distinction recovered

The project must not confuse:

```text
horizontal independence
```

with:

```text
alternative branching.
```

Two parallel Bricks may both be required by the same later Block.

A genuine Decision Point requires a non-derived selection among admissible alternatives.

## S3 — Reconvergence is epistemically rich

When two branches reconverge, the valuable research output is not merely that their endpoints can share a name.

Study must record:

```text
what differed
what remained invariant
which assumptions were branch-local
which assumptions survive downstream
what common certified contribution was recovered
what compatibility/equivalence evidence permits sharing the downstream interface
```

Therefore a branch can remain scientifically important after it has reconverged.

## S4 — Current N-Core implication

The upcoming natural-number decomposition must not be forced into:

```text
Brick → Brick → Brick → ... → N
```

if the actual dependency structure is richer.

Candidate independent/subparallel tracks include, subject to actual dependency analysis:

```text
no-confusion
induction / generatedness
recursion / initiality
TCT realization fidelity
formal-regime commitments
```

Their exact graph must be discovered and verified, not imposed for visual symmetry.

## S5 — Human/AI handoff implication

A repository-level README is necessary because architectural knowledge stored only in deep LAB paths is too easy for a new collaborator to miss.

An AI-specific `AGENTS.md` reduces the risk that an automated coding/research agent will interpret file order or a unified Lean payload as the canonical mathematical architecture.

---

# ACT

**ADOPTED.**

The following rule is now canonical:

> BOMA is an auditable construction DAG. Bricks and Blocks may be serial, parallel, convergent, branch-specific, and reconvergent. Current Stage-One research gives special attention to meaningful split → independent development → verified reconvergence patterns. Reconvergence preserves provenance and requires an explicit compatibility/Junction result.

Canonical operational reference:

```text
LAB/00_ARCHITECTURE/CONSTRUCTION_TOPOLOGY.md
```

Mandatory entry points:

```text
README.md
AGENTS.md
```

Future architectural changes to this rule require a new traceable PDSA revision.

---

# ConstructionGraphEffects

No mathematical theorem or existing Brick/Block was reclassified by this cycle.

The cycle changes the **governing interpretation and design discipline** for future graph construction.

Most immediate downstream effect:

```text
N-Core canonical decomposition must be topology-first,
not a retrospective decomposition of one monolithic formal payload.
```

---

# LearningGraphEffects

New reusable learning:

```text
L-ARCH-001
Graph orientation does not determine Brick status.

L-ARCH-002
Fork ≠ Decision Point by default.

L-ARCH-003
Meeting ≠ verified Junction by default.

L-ARCH-004
Reconvergence preserves production-history provenance.

L-ARCH-005
Same reusable certified contribution may have different valid production paths.

L-ARCH-006
Current Stage One should preferentially exploit scientifically meaningful
branch-and-reconverge cases before broad permanently divergent Stage-Two branching.
```
