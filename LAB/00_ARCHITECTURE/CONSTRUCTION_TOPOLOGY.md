# CONSTRUCTION TOPOLOGY — Canonical DAG, Branching, and Reconvergence

**Document ID:** `BOMA-ARCH-TOPOLOGY-001`  
**Version:** `1.1`  
**Date:** 2026-08-24  
**Status:** **ACTIVE — CANONICAL ARCHITECTURAL RULE**  
**Scope:** Brick / Block / Junction / Decision Point topology across BOMA construction tracks.

---

## 1. Purpose

BOMA construction must be read as an **auditable directed acyclic construction graph (DAG)**, not as a mandatory linear chain of files or mathematical assertions.

Bricks and Blocks may be arranged vertically by dependency, horizontally by independence, may converge into a shared downstream contribution, and a single path may branch into multiple paths that later reconverge through an explicit Junction.

The graph topology is part of the mathematical architecture. It must not be inferred only from file order.

---

## 2. Governing distinction

The architecture distinguishes at least four basic graph situations.

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

### T2 — Horizontal independence

Two or more Bricks/Blocks may be constructed independently when neither consumes the other's contribution.

```text
B1        B2        B3
```

Absence of dependency does **not** disqualify a unit from being a Brick.
Independent units preserve separate identities, evidence, statuses, and provenance.

### T3 — Parallel construction followed by convergence

Independent or partially independent units may be required together by a later unit.

```text
B1 ──┐
     │
B2 ──┼──► J / Block / shared contribution
     │
B3 ──┘
```

This is not automatically branching in the Decision Point sense.

The convergence record states what each incoming path contributes, whether the contributions are independent or partially dependent, the compatibility condition, and the combined contribution.

### T4 — Branching followed by reconvergence

A common path may split into multiple legitimate routes and later reunite.

```text
                  ┌──► Path A ──┐
Common trunk ─────┤             ├──► Junction ──► shared downstream path
                  └──► Path B ──┘
```

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

Both contributors are needed; they are not mutually alternative choices.

### F2 — Decision Point branch

```text
                  ┌──► Route A ──┐
Decision Point ───┤              ├──► possible reconvergence
                  └──► Route B ──┘
```

The routes are materially alternative ways to proceed after a non-derived choice. The Decision Point records `BRANCHES_TO` / `SELECTS`.

### F3 — Exploratory branch

A PDSA experiment may open a research route without immediately making it part of the permanent Construction DAG.

Such a branch begins in the Learning Graph. It remains there if it fails, is deferred, or has not earned an architectural role.

### F4 — Verified learning branch integrated into the permanent Construction DAG

A successful experiment may establish that a previously exploratory branch is a stable architectural fact worth retaining permanently.

Owner-authorized integration may therefore produce:

```text
Decision Point
   ├── SELECTS ──► canonical Route A
   └── BRANCHES_TO / ALTERNATIVE_TO ──► verified Route B
                                             │
                                             └──► verified Junction / shared invariant
```

Route B may be permanent and V5-verified while remaining **non-selected** and **non-accepted**.

The promotion is from:

```text
experiment-only visibility
```

to:

```text
permanent architectural visibility
```

not from:

```text
research → accepted export
```

unless a separate explicit Decision/acceptance action says so.

`ST2-EXP-002` and `ST2-EXP-003` are the first owner-authorized examples of F4.

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

No branch is reconverged merely because two endpoints receive the same informal name.

---

## 5. Reconvergence preserves provenance

If:

```text
Route A ──┐
          ├──► J ──► C
Route B ──┘
```

then `C` may be a shared reusable certified contribution while the production histories remain distinct.

The architecture preserves:

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

This supports:

```text
Construction Unit ≠ Reusable Certified Contribution
```

Different producers may establish the same reusable contribution.

---

## 6. Learning-to-Construction feedback

BOMA is not a one-way architecture in which experiments are permanently quarantined after completion.

The controlled feedback pattern is:

```text
Construction DAG
      │
      ├──► Decision / dependency / representation question
      │
      ▼
Learning Graph experiment
      │
      ▼
exact verification + Study/Act
      │
      ▼
owner-authorized architectural integration
      │
      └──► refined Construction DAG
```

Permitted feedback includes:

```text
smaller verified dependency interface
permanent verified alternative route
permanent verified research/non-acceptance Junction
representation-independent invariant
genericity or reopening requirement
```

The old Construction DAG is not rewritten as though the new knowledge had always been known. The Learning Graph preserves the temporal/provenance history.

The first concrete integration is recorded in:

`LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md`.

---

## 7. Application to the natural-number construction

The N-Core architecture must not be forced into a single long vertical chain merely because a proof assistant can encode it in one datatype/file.

Example schematic topology:

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

Whether a branch becomes canonical depends on actual dependencies and verified convergence; it is not imposed for visual symmetry.

---

## 8. Brick and Block implications

A Brick is defined by independently reviewable semantic/constructional commitment, **not by graph orientation**.

A Brick may be root, vertically dependent, horizontal and independent, one contributor among several converging contributors, branch-specific, or shared after a Junction through an exported certified contribution.

A Block may contain serial internal dependencies, parallel internal Bricks, multiple incoming contributions, branch-local composition, or post-Junction shared composition.

Block membership preserves Brick identities and provenance.

---

## 9. Junction versus Decision Point

### Decision Point

Asks:

> Which admissible route will be taken under a non-derived choice?

### Junction

Asks:

> Can incoming routes/contributions be reconciled sufficiently to certify a shared result or downstream transition?

A fork can exist without a Decision Point, and a Junction can combine non-alternative parallel inputs. Every graph instance states which case it is.

A research/non-acceptance Junction may be a permanent Construction-DAG object if its convergence result is permanently relevant; this does not make it an acceptance Junction.

---

## 10. PDSA and the Learning Graph

The Construction Graph and Learning Graph record branching differently but cross-reference each other.

### Construction Graph records

```text
units
dependencies
branches
choices
Junctions
certified outputs
permanent verified alternatives
```

### Learning Graph records

```text
why a branch was opened
what each branch tested
failures and successes
human/AI decisions
what was learned from differences
why reconvergence passed or failed
what learning entered the Construction DAG and when
```

A mathematically unsuccessful branch can still be a successful learning output.
No scientifically useful branch is silently deleted merely because it did not join the selected trunk.

---

## 11. Handoff rule for humans and AI agents

Any human or AI agent continuing BOMA must:

1. Do not assume the construction is linear.
2. Identify genuine dependency edges.
3. Expose independent contributions horizontally when meaningful.
4. Classify every fork as parallel, Decision Point, exploratory, or permanent verified alternative.
5. Preserve branch identities and assumptions.
6. Use an explicit Junction for claimed reconvergence.
7. Do not erase branch provenance after reconvergence.
8. Distinguish permanent graph visibility from `SELECTS` and acceptance.
9. When a closed experiment proves a stable architectural invariant, check whether it should be integrated rather than left only in the Learning Graph.
10. Do not manufacture branches or convergence for presentation convenience.

Violation is architectural drift and must be recorded/corrected through PDSA.

---

## 12. Historical lineage

This canonical rule consolidates earlier project investigations including Brick/Block dependency/DAG experiments, Decision Point/branch experiments, `Construction Unit ≠ Reusable Certified Contribution`, `PDSA-ARCH-001`, and the successful Stage-Two experiments.

Historical `PDCA` labels are legacy provenance. The active research method is PDSA.

---

## 13. Authority

This document is a specialization of:

`LAB/00_ARCHITECTURE/ARCHITECTURE.md`

For graph-topology questions involving serial/parallel construction, branching, reconvergence, and Learning-to-Construction feedback, this document is the **canonical operational interpretation**.

If a future result requires changing these rules, the change must occur through a traceable PDSA cycle and an explicit versioned architectural revision.
