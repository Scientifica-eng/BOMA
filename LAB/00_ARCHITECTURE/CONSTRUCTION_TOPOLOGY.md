# CONSTRUCTION TOPOLOGY — Canonical DAG, Branching, and Reconvergence

**Document ID:** `BOMA-ARCH-TOPOLOGY-001`  
**Version:** `1.0`  
**Date:** 2026-08-18  
**Status:** **ACTIVE — CANONICAL ARCHITECTURAL RULE**  
**Scope:** Brick / Block / Junction / Decision Point topology across BOMA construction tracks.

---

## 1. Purpose

BOMA construction must be read as an **auditable directed acyclic construction graph (DAG)**, not as a mandatory linear chain of files or mathematical assertions.

This document makes explicit a project capability investigated in the earlier Brick/Block experiments and now adopted as a canonical architectural rule:

> Bricks and Blocks may be arranged vertically by dependency, horizontally by independence, may converge into a shared downstream contribution, and a single path may branch into multiple paths that later reconverge through an explicit Junction.

The current Stage-One research emphasis is especially on **controlled branching followed by reconvergence**.

The graph topology is part of the mathematical architecture. It must not be inferred only from file order.

---

## 2. Governing distinction

The architecture distinguishes at least four different graph situations.

### T1 — Vertical dependency

A downstream unit genuinely requires an upstream contribution.

```text
B1
 │
 ▼
B2
 │
 ▼
B3
```

Interpretation:

```text
B2 DEPENDS_ON B1
B3 DEPENDS_ON B2
```

Vertical position means dependency only when a dependency relation is explicitly recorded.

---

### T2 — Horizontal independence

Two or more Bricks/Blocks may be constructed independently when neither consumes the other's contribution.

```text
B1        B2        B3
```

Absence of dependency does **not** disqualify a unit from being a Brick.

Independent units must preserve separate identities, evidence, statuses, and provenance.

Their horizontal presentation is a graph view; it does not imply equivalence or competition.

---

### T3 — Parallel construction followed by convergence

Independent or partially independent units may be required together by a later unit.

```text
B1 ──┐
     │
B2 ──┼──► J / Block / shared contribution
     │
B3 ──┘
```

This is **not automatically branching in the Decision Point sense**.

The inputs may simply provide different required contributions.

The convergence record must state:

```text
what each incoming path contributes
whether contributions are independent or partially dependent
what compatibility condition is required
what new combined contribution emerges
```

---

### T4 — Branching followed by reconvergence

A common path may split into multiple legitimate routes and later reunite.

```text
                  ┌──► Path A ──┐
Common trunk ─────┤             ├──► Junction ──► shared downstream path
                  └──► Path B ──┘
```

or:

```text
                  ┌──► Path A ──┐
                  │             │
Common trunk ─────┼──► Path B ──┼──► Junction
                  │             │
                  └──► Path C ──┘
```

This topology is a primary BOMA research object.

Reconvergence does not erase branch history.

---

## 3. Fork taxonomy — not every split is a Decision Point

A visible split in the graph must be classified.

### F1 — Parallel dependency fork

```text
        ┌──► B1 ──┐
Input ──┤         ├──► downstream Block
        └──► B2 ──┘
```

Here B1 and B2 are both needed. They are not mutually alternative choices.

This is parallel decomposition of work/content.

### F2 — Decision Point branch

```text
                  ┌──► Route A ──┐
Decision Point ───┤              ├──► possible reconvergence
                  └──► Route B ──┘
```

Here the routes are materially alternative ways to proceed after a non-derived choice.

The Decision Point records the choice and uses `BRANCHES_TO` / `SELECTS` as defined by `ARCHITECTURE.md`.

### F3 — Exploratory branch

A PDSA experiment may open multiple research routes without immediately making any of them canonical.

Such branches belong to the Learning Graph until/adunless promoted into canonical construction units.

---

## 4. Reconvergence rule

A branch may return to a shared path only through an explicit compatibility/convergence result.

Canonical pattern:

```text
Shared input
    │
    ▼
Decision Point or branch-producing structure
   ├───────────────┐
   ▼               ▼
Path A           Path B
   │               │
   ▼               ▼
Contribution A   Contribution B
   └───────┬───────┘
           ▼
        Junction
           │
           ▼
Shared certified contribution
```

The Junction must answer:

```text
1. What outputs of each branch are being compared or translated?
2. Are the outputs identical, equivalent, isomorphic, mutually interpretable,
   or merely sufficient for the same downstream interface?
3. Which assumptions differ between branches?
4. Which assumptions survive into the shared downstream path?
5. Which branch-specific commitments are discharged, hidden, or still relevant?
6. What invariant or reusable contribution is shared?
7. What evidence proves the convergence?
8. What would reopen or invalidate the Junction?
```

No branch may be declared reconverged merely because two endpoints receive the same informal name.

---

## 5. Reconvergence preserves provenance

If:

```text
Route A ──┐
          ├──► J ──► C
Route B ──┘
```

then `C` may be a shared reusable certified contribution while the production histories remain distinct.

The architecture must preserve:

```text
Route A provenance
Route B provenance
assumptions of each route
verification evidence of each route
translation/equivalence evidence at J
the exact interface exported by J
```

Therefore:

> **same downstream contribution ≠ same construction history**

and:

> **reconvergence ≠ retroactive identity of branches**

This directly supports the project distinction:

```text
Construction Unit ≠ Reusable Certified Contribution
```

Different producers may establish the same reusable contribution.

---

## 6. Current Stage-One research emphasis

At the present project stage, branching experiments should preferentially study routes that **split and later reconverge**.

The immediate scientific objective is to learn:

```text
which commitments can vary while preserving a downstream contribution
which structures are invariant across alternative routes
which branch-specific assumptions contaminate downstream structure
when two routes can safely share the same certified interface
what evidence is sufficient for a Junction to PASS
```

This is distinct from the later Stage-Two program of intentionally exploring branches that may remain permanently divergent.

Current emphasis:

```text
TRUNK
  ↓
FORK
 ├── ROUTE A
 └── ROUTE B
  ↓
RECONVERGENCE TEST
  ↓
SHARED TRUNK IF VERIFIED
```

---

## 7. Application to the natural-number construction

The N-Core architecture must **not** be forced into a single long vertical chain merely because a proof assistant can encode it in one datatype/file.

Likely topology includes parallel and reconvergent components.

Example schematic view:

```text
Formal unary kernel
   │
   ├──► No-confusion track ──────────┐
   ├──► Induction/generatedness ─────┤
   └──► Recursion/initiality ─────────┤
                                      ├──► N-Core internal adequacy Junction
Pre-numerical TCT ─► realization ─────┘
                     bridge
```

A second useful branch/reconvergence pattern may compare two routes to the same certified result, for example:

```text
                 ┌──► induction route ─────┐
generatedness ───┤                         ├──► shared generatedness certificate
                 └──► initiality route ────┘
```

Whether such a diagram becomes canonical depends on actual dependencies and verified convergence. It must not be imposed merely for visual symmetry.

---

## 8. Brick and Block implications

A Brick is defined by independently reviewable semantic/constructional commitment, **not by graph orientation**.

Therefore a Brick may be:

```text
root / dependency-free
vertically dependent
horizontal and independent of sibling Bricks
one contributor among several converging contributors
branch-specific
shared after a Junction through an exported certified contribution
```

A Block may similarly contain:

```text
serial internal dependencies
parallel internal Bricks
multiple incoming contributions
branch-local composition
post-Junction shared composition
```

Block membership must preserve the identities and provenance of its Bricks.

---

## 9. Junction versus Decision Point

These are different architectural units.

### Decision Point

Asks:

> Which admissible route will be taken under a non-derived choice?

It may generate branches.

### Junction

Asks:

> Can incoming routes/contributions be reconciled sufficiently to admit a shared downstream path?

It verifies convergence/compatibility.

Canonical reconvergent pattern:

```text
Decision Point
    ├──► A
    └──► B
          ↓
       Junction
          ↓
    shared contribution
```

A fork can exist without a Decision Point, and a Junction can combine non-alternative parallel inputs. Every graph instance must state which case it is.

---

## 10. PDSA and the Learning Graph

The Construction Graph and Learning Graph must record branching differently but cross-reference each other.

### Construction Graph records

```text
units
dependencies
branches
choices
Junctions
certified outputs
```

### Learning Graph records

```text
why a branch was opened
what each branch tested
failures and successes
human/AI decisions
what was learned from differences
why reconvergence passed or failed
what learning enters the next PDSA cycle
```

A mathematically unsuccessful branch can still be a successful learning output.

No scientifically useful branch should be silently deleted merely because it did not join the canonical trunk.

---

## 11. Handoff rule for humans and AI agents

Any human or AI agent continuing BOMA must apply the following before creating new canonical units:

1. Do **not** assume the construction is linear.
2. Identify which prerequisites genuinely depend on which others.
3. Expose independent contributions horizontally when meaningful.
4. Classify every fork as parallel, Decision Point, or exploratory.
5. Preserve branch identities and assumptions.
6. Use an explicit Junction for claimed reconvergence.
7. Do not erase branch provenance after reconvergence.
8. Prefer, in the current Stage-One research program, branch experiments that can test **split → independent development → verified reconvergence**.
9. Do not manufacture branches where the mathematics gives no meaningful alternative.
10. Do not manufacture convergence merely to simplify the diagram.

Violation of these rules is architectural drift and must be recorded/corrected through PDSA.

---

## 12. Historical lineage

This canonical rule consolidates earlier project investigations including:

```text
LAB/BRICK_BLOCK_DEFINITION_001.md
LAB/BOMA_INITIAL_PLAN.md
LAB/BOMA_SOURCE_AUDIT_001.md
historical Brick/Block dependency and DAG experiments
historical Decision Point / branch experiments
Construction Unit ≠ Reusable Certified Contribution learning
```

Historical `PDCA` labels in those records are legacy provenance. The active research method is PDSA.

---

## 13. Authority

This document is a specialization of:

`LAB/00_ARCHITECTURE/ARCHITECTURE.md`

For graph-topology questions involving serial/parallel construction, branching, and reconvergence, this document is the **canonical operational interpretation**.

If a future result requires changing these rules, the change must occur through a traceable PDSA cycle and an explicit versioned architectural revision.
