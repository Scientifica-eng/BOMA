# ARCHITECTURE-001 — Auditable Construction System Architecture

## Status

**Design decision — active construction architecture**  
Cycle: `PDCA-001`

## Purpose

This document fixes the engineering architecture for the transparent construction track.

The project is no longer organized as a simple linear sequence of explanatory documents. It is organized as a **small construction system** whose units have explicit interfaces, positions, dependencies, and verification status.

The target remains:

```text
weakest viable declared starting point
        ↓
explicit mathematical construction
        ↓
formal natural-number structure
```

The architecture must allow a human reviewer to:

1. identify one construction unit;
2. read the unit in isolation;
3. determine its exact role and geometric position in the construction;
4. inspect what it consumes and what it produces;
5. inspect which claims are proven, chosen, assumed, or pending;
6. modify the unit experimentally and trace the consequences through dependent units.

---

## 1. Core architectural decision

The construction is modeled as a **directed dependency graph**, not merely as a linear document list.

```text
                      ┌───────────────┐
                      │   Block A     │
                      │  lower layer  │
                      └──────┬────────┘
                             │
             ┌───────────────┼───────────────┐
             │               │               │
             ▼               ▼               ▼
         ┌───────┐       ┌───────┐       ┌───────┐
         │ Brick │       │ Brick │       │ Brick │
         │  B1   │       │  B2   │       │  B3   │
         └───┬───┘       └───┬───┘       └───┬───┘
             │               │               │
             └───────┬───────┴───────┬───────┘
                     ▼               ▼
                  ┌─────────────────────┐
                  │    Junction J1      │
                  │ integration point   │
                  └──────────┬──────────┘
                             ▼
                        ┌───────────┐
                        │  Block B  │
                        └───────────┘
```

A construction may therefore contain:

- **horizontal adjacency** — units at the same structural level that can interact or combine;
- **vertical composition** — an upper unit built from outputs of lower units;
- **junctions** — explicit points at which independent substructures are integrated;
- **alternative branches** — competing candidate constructions that can be compared without silently replacing one another;
- **terminal blocks** — structures that culminate in a formal object or theorem.

The graph is acyclic with respect to construction dependency unless a cycle is explicitly introduced as an experimental object and recorded as such.

---

## 2. Four architectural unit types

### 2.1 Brick

A **Brick** is the smallest independently reviewable construction unit.

A Brick must answer exactly:

```text
What goes in?
What operation is performed?
What comes out?
What invariant is preserved?
What is newly obtained?
Why is the step valid?
What assumptions are added?
Where does it sit in the graph?
```

A Brick should normally correspond to **one mathematical idea that can be changed independently**.

Examples:

```text
B-001  elementary configuration
B-002  compatible concatenation
B-003  terminal-block recovery
```

A Brick may use geometry, symbols, diagrams, or prose, but its construction rule must be explicit enough to reproduce.

---

### 2.2 Block

A **Block** is a coherent cluster of Bricks that jointly establishes one higher-level structure.

A Block has:

- a defined input interface;
- a set of internal Bricks;
- one or more integration points;
- a defined output interface;
- an exit criterion.

Examples:

```text
BLOCK-FINITE-CONFIGURATIONS
    ├─ Brick: formation
    ├─ Brick: normalization
    ├─ Brick: decomposition
    └─ Brick: equivalence audit
```

Blocks are the main unit for architectural navigation.

---

### 2.3 Junction

A **Junction** is not itself necessarily a mathematical object. It is an architectural marker identifying where two or more previously independent construction paths meet.

A Junction must record:

```text
inputs
compatibility condition
identification rule
new shared output
possible conflicts
verification status
```

Examples:

```text
J-001  forward/reverse convergence
J-002  construction-depth / formal-stage correspondence
J-003  arithmetic operation integration
```

Junctions are especially important for debugging because a contradiction may originate in one incoming branch or in the compatibility rule itself.

---

### 2.4 Configuration / Geometric Assembly

A **Configuration** is the mathematical or geometric arrangement produced by one or more Bricks.

Examples:

```text
ε
U
U ⊙ U
(U ⊙ U) ⊙ U
```

A configuration must be distinguishable from the document that describes it.

The document is a **representation artifact**; the configuration is the constructional entity being represented.

---

## 3. Representation rule

Each construction unit may have several synchronized artifacts:

```text
UNIT RECORD
    ├─ primary mathematical statement
    ├─ construction description
    ├─ geometric representation (optional)
    ├─ dependency map
    ├─ verification record
    └─ decision/failure record
```

Therefore:

> One Brick may be represented by one document or a tightly coupled set of documents, but the unit itself has one canonical identity.

The canonical identity must never depend on filename wording alone.

Recommended identifier:

```text
TCT-B-001
TCT-B-002
TCT-J-001
TCT-BLOCK-001
```

---

## 4. Explicit graph relations

Only the following relation types are currently admitted as architectural edges.

### `DEPENDS_ON`

The target cannot be constructed/verified without the source.

### `COMPOSES`

The target is formed from the source units.

### `REFINES`

The target makes a previously broader construction more precise.

### `VERIFIES`

The target provides a proof, test, or audit for the source.

### `CONSTRAINS`

The source limits what is admissible in the target.

### `ALTERNATIVE_TO`

Two units provide competing construction choices rather than cumulative steps.

### `MEETS_AT`

Two branches converge at a Junction.

### `REPRESENTS`

A mathematical configuration is represented by a geometric or documentary artifact.

No other semantic dependency type should be invented casually.

---

## 5. Local unit schema

Every Brick should use a compact header of the following form:

```text
ID:
TITLE:
BLOCK:
LAYER:
INPUTS:
OUTPUT:
INVARIANTS:
NEW STRUCTURE:
CONSTRUCTION RULE:
VERIFICATION:
DEPENDENCIES:
EDGE RELATIONS:
ASSUMPTIONS ADDED:
STATUS:
FAILURE CONDITIONS:
SENSITIVITY:
```

### `SENSITIVITY` is mandatory

This is the feature that supports the user's proposed experimental modification test.

Every Brick must state:

```text
If this Brick is changed,
which downstream units are expected to change?
which upstream units remain valid?
which sibling units may conflict?
what properties must be retested?
```

This makes the system **perturbation-auditable** rather than merely proof-auditable.

---

## 6. Construction layers

The architecture uses three conceptual layers.

```text
L0  Starting conditions / pre-formal interface
L1  Explicit constructed mathematical structures
L2  Formal natural-number realization
```

However, these are **layers of semantic status**, not necessarily three folders.

A Brick may have a physical/documentary location in the repository that differs from its semantic layer.

The crossing from one layer to another must be recorded by a named Junction or formalization block.

---

## 7. Horizontal and vertical organization

### Horizontal

Units are horizontal peers when they:

- consume compatible inputs;
- produce comparable outputs;
- can be tested independently;
- occupy the same construction level.

Example:

```text
B-101  distinguishability model A
B-102  distinguishability model B
B-103  geometric distinction model
```

These may later converge on a Junction.

### Vertical

A unit is vertically above another when it depends on the lower unit as part of its construction.

Example:

```text
B-001  elementary block
   ↓
B-010  finite configuration
   ↓
B-020  predecessor structure
   ↓
B-030  stage structure
```

### Multiple vertical parents

An upper Brick may legitimately depend on several lower Bricks:

```text
B-030
 ↑   ↑
B-020 B-021
```

This is a normal integration point, not an architectural defect.

---

## 8. Branching and alternatives

When a construction choice is genuinely unresolved, do **not** overwrite the existing Brick.

Instead use:

```text
B-A01  candidate A
B-B01  candidate B
        │
        └── ALTERNATIVE_TO ──┘
```

Both branches remain reviewable until an explicit Decision Record selects, rejects, or merges them.

This rule is essential for preserving counterfactual experiments.

---

## 9. Junction discipline

A Junction must not silently merge incompatible meanings.

For each Junction, the record must state:

```text
What is identical?
What is merely analogous?
What is being translated?
What is being discarded?
What assumptions make the merge legal?
```

Example:

```text
Construction depth
        ↓
       J-depth
        ↓
formal stage index
```

The Junction must explicitly state that the right-hand side is a formal realization of the left-hand side, not that the symbols were identical from the start.

---

## 10. Debugging model

The architecture must support four debugging queries.

### Query A — local error

```text
Which Brick contains the first invalid step?
```

### Query B — dependency propagation

```text
If B-014 changes,
which descendants become invalid or require retesting?
```

### Query C — counterfactual substitution

```text
Replace B-014 with candidate B-014'
What downstream outputs change?
```

### Query D — architectural bottleneck

```text
At which Junction do two independent constructions first disagree?
```

This is why the construction should be represented as a graph rather than a flat manuscript.

---

## 11. Verification levels

Every unit must declare one of:

```text
V0  undeveloped idea
V1  explicit construction stated
V2  local verification completed
V3  dependency-compatible verification completed
V4  cross-path verification completed
V5  formally verified under selected realization regime
```

A V5 result does not automatically make the unit framework-independent.

Framework dependence is a separate status dimension.

---

## 12. Epistemic status

Every unit must separately declare:

```text
CONSTRUCTED
DERIVED
DECLARED CHOICE
FORMALIZATION-DEPENDENT
PENDING
REJECTED
```

These labels are not interchangeable with verification level.

For example:

```text
Status: DERIVED
Verification: V5
Framework: Peano-specific
```

is valid and different from:

```text
Status: DECLARED CHOICE
Verification: V5
Framework: neutral
```

---

## 13. Modification protocol

When a human reviewer changes a Brick, the project must create a **Change Experiment Record** containing:

```text
Original Brick ID
Modified Brick ID / variant
Reason for modification
Expected effect
Affected downstream units
Tests rerun
Observed changes
Decision
```

A variant must not silently replace the original.

Recommended naming:

```text
TCT-B-014-A
TCT-B-014-B
```

with an explicit `ALTERNATIVE_TO` relation.

---

## 14. Repository organization

The repository should expose the construction graph in a human-readable index:

```text
LAB/BUILDING/
    ARCHITECTURE-001...
    GRAPH-001...
    blocks/
    bricks/
    junctions/
    experiments/
    decisions/
```

The exact filesystem may evolve, but the semantic categories must remain stable.

A top-level graph index should let a reviewer jump from:

```text
Brick → parent → siblings → Junction → descendants
```

without reading the entire project.

---

## 15. First target graph

The immediate graph for the transparent track is:

```text
TCT-001 kernel
     │
     ├──▶ TCT-B-001 formation
     │          │
     │          ├──▶ TCT-B-002 normalization
     │          │          │
     │          │          └──▶ TCT-J-001 decomposition check
     │          │
     │          └──▶ TCT-B-003 last-step candidate
     │
     └──▶ TCT-B-004 composition candidate
                    │
                    └──▶ TCT-J-002 composition/decomposition integration
                                      │
                                      ▼
                                TCT-BLOCK-001
                                      │
                                      ▼
                                stage structure
```

Only after this graph has been verified should the project introduce a numerical stage label.

---

## 16. Architectural decision

The project adopts the following permanent rule:

> **A mathematical construction is represented as an auditable dependency graph whose smallest independently changeable unit is a Brick, whose coherent clusters are Blocks, and whose convergence points are Junctions.**

The sequence of documents is therefore a **view of the construction graph**, not the construction itself.

This decision directly supports:

- human inspection;
- local error detection;
- controlled hypothesis testing;
- counterfactual modification;
- dependency-aware retesting;
- comparison of alternative constructions;
- eventual formal verification.

## Current decision status

```text
ARCHITECTURE: ACCEPTED
LINEAR-ONLY DOCUMENT MODEL: REJECTED
GRAPH MODEL: ACCEPTED
BRICK AS SMALLEST REVIEWABLE UNIT: ACCEPTED
BLOCK AS CLUSTER: ACCEPTED
JUNCTION AS EXPLICIT CONVERGENCE POINT: ACCEPTED
COUNTERFACTUAL VARIANTS: ACCEPTED
```

## Plan position

Transparent Construction Track — architecture decision before TCT-003.

**Next action:** retrofit TCT-001 and TCT-002 to this architecture, assign canonical IDs and interfaces, then continue with TCT-003 only after the graph representation is stable.
