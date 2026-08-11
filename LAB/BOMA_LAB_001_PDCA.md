# BOMA Laboratory — PDCA-001

## Purpose

This laboratory is the experimental workspace for developing BOMA from practice before enlarging the formal architecture.

The first laboratory cycle is intentionally small. Its purpose is not to prove BOMA, but to expose the minimum operational information required to run, inspect, correct, and scale a BOMA development.

The laboratory adopts **Brick** as the smallest identifiable architectural unit. A **Block** is an optional higher-level grouping of Bricks when grouping provides a real structural or semantic advantage.

## Working Principle

> **Small experiment → observation → explicit correction → extracted specification → larger experiment.**

The laboratory therefore follows a controlled PDCA loop:

1. **Plan** — define a very small construction task and the information that must be recorded.
2. **Do** — construct the task using Bricks and record actual decisions and dependencies.
3. **Check** — inspect traceability, dependency integrity, epistemic status, choice points, and verification evidence.
4. **Act** — correct the model and extract rules that must become part of the next cycle.

## Cycle 001 — Minimal Foundational Construction

### Experimental question

Can a small mathematical development be represented unambiguously as a set of Bricks, with dependencies and epistemic status explicit enough to reproduce the construction and identify genuine choices?

### Scope constraint

Cycle 001 must remain deliberately small:

- no more than 10 Bricks;
- at most 1 Block;
- at most 1 genuine Decision Point;
- no attempt to model a complete mathematical theory;
- no premature commitment to a final BOMA ontology.

The output of this cycle is therefore **experimental evidence**, not a final specification.

---

# PLAN

## P1. Minimal ontology under test

The following entities are provisionally used:

| Entity | Provisional meaning |
|---|---|
| Brick | Smallest independently identifiable architectural unit of foundational content at the chosen level of analysis. |
| Block | Optional grouping of Bricks with a stated structural or semantic purpose. |
| Dependency | Relation stating that one Brick requires another Brick or declared context. |
| Decision Point | Explicit location at which more than one admissible methodological alternative exists. |
| Branch | A development path produced by selecting one alternative at a Decision Point. |
| Verification | Evidence that the Brick or relation satisfies its stated conditions. |

## P2. Brick record under test

Each Brick should initially record only information that is demonstrably useful:

```yaml
Brick:
  ID: B-001
  Type: ...
  Content: ...
  Depends_on: []
  EpistemicStatus: ...
  Introduces: []
  Exports: []
  VerificationStatus: ...
  VerificationEvidence: ...
```

Additional fields must not be added merely because they appear theoretically desirable. Each field must earn its place through laboratory use.

## P3. Experimental controls

The cycle must distinguish:

- content from metadata;
- dependency from logical consequence;
- necessity from methodological choice;
- a Brick from a grouping of Bricks;
- an observed correction from a new foundational assumption.

## P4. Success criteria

Cycle 001 is successful if we can answer, for every Brick:

1. What exactly is it?
2. Why does it exist?
3. What does it depend on?
4. What does it introduce?
5. Is its status necessary or chosen?
6. What evidence verifies it?
7. Can another person reconstruct the same local development from the record?

If any question cannot be answered reliably, that failure is a laboratory result and must be recorded rather than concealed.

---

# DO

## D1. Experimental construction

Use a deliberately simple mathematical example. The first example should contain enough structure to test dependency and choice, but not enough complexity to hide errors.

Recommended initial pattern:

```text
Brick B1  →  Brick B2  →  Brick B3
                    \
                     → Decision Point D1
                         ├─ Branch A
                         └─ Branch B
```

The actual mathematical content is to be selected during the experiment. The laboratory must record the construction exactly as performed, including failed attempts and corrections.

## D2. Observation log

| ID | Observation | Consequence | Evidence |
|---|---|---|---|
| O-001 | | | |
| O-002 | | | |
| O-003 | | | |

## D3. Decision log

Every non-forced methodological decision must be recorded at the moment it occurs.

| Decision ID | Alternatives | Selected | Reason | Unchosen alternatives |
|---|---|---|---|---|
| D-001 | | | | |

## D4. Correction log

Corrections must not silently overwrite the history of the experiment.

| Correction ID | Affected Brick/Block | Original state | Corrected state | Reason | Evidence |
|---|---|---|---|---|---|
| C-001 | | | | | |

---

# CHECK

The Check phase tests the model against the evidence produced during Do.

## C1. Traceability

Can every introduced item be traced to:

- its source;
- its dependency set;
- the operation that introduced it;
- its verification evidence?

## C2. Dependency integrity

Check for:

- missing dependencies;
- circular dependencies;
- dependencies that are actually consequences rather than prerequisites;
- undeclared imported assumptions.

## C3. Epistemic integrity

For every Brick determine whether its status is genuinely:

- Logical Necessity;
- Foundational Necessity;
- Architectural Necessity; or
- Methodological Choice.

If the four-way classification is insufficient, record the failure rather than forcing the Brick into an inappropriate category.

## C4. Branchability

Verify that a Branch is generated only by a genuine alternative and not merely by a difference in notation, exposition, or implementation.

## C5. Auditability

A reviewer who did not perform the experiment should be able to reconstruct the local development from the records alone.

## C6. Minimality

Identify every field, entity, or relation that was recorded but not actually useful. These candidates are removed, merged, or deferred in Act.

---

# ACT

The Act phase converts experimental findings into controlled architectural changes.

## A1. Findings

| Finding ID | Finding | Severity | Architectural implication |
|---|---|---|---|
| F-001 | | | |
| F-002 | | | |
| F-003 | | | |

## A2. Extracted requirements for the next cycle

The next cycle may introduce a new field, entity, relation, or rule only when Cycle 001 provides evidence for it.

| Requirement | Evidence from Cycle 001 | Action for Cycle 002 |
|---|---|---|
| | | |

## A3. Provisional rules

Rules discovered in the laboratory are marked **provisional** until tested in at least one larger or independent cycle.

```text
R-001: [provisional rule]
R-002: [provisional rule]
R-003: [provisional rule]
```

## A4. Exit condition

Cycle 001 is closed only when:

- the construction is reproducible;
- all genuine choices are explicit;
- corrections are traceable;
- the limitations of the current model are recorded;
- the minimum changes required for Cycle 002 are identified.

---

# Data to Carry Forward

The most important output of this laboratory is not the example itself. It is the **minimum sufficient data model** needed to perform the next experiment.

The following categories are therefore candidates for extraction:

1. **Identity data** — how a Brick is uniquely identified.
2. **Content data** — what the Brick asserts or introduces.
3. **Dependency data** — what is required before the Brick is admissible.
4. **Epistemic data** — why the Brick has its stated status.
5. **Choice data** — where alternatives existed and why one was selected.
6. **Branch data** — how alternative developments are represented.
7. **Verification data** — what establishes local validity.
8. **Correction data** — what changed, why, and on what evidence.
9. **Grouping data** — when and why Bricks form a Block.
10. **Provenance data** — where each item originated.

These categories are **not yet declared mandatory BOMA fields**. Their status will be decided after laboratory evidence.

---

# Laboratory Discipline

The laboratory must preserve three distinctions:

### 1. Specification vs. observation

A rule written before the experiment is a hypothesis. A behavior observed during the experiment is evidence. They must not be conflated.

### 2. Correction vs. invention

Fixing an inadequate representation does not automatically constitute a new foundational assumption. The correction record must state whether the change affects mathematical content, architecture, or only representation.

### 3. Local success vs. general validity

A mechanism that works in Cycle 001 is not automatically a BOMA principle. Generalization requires another cycle or independent test.

---

# Cycle Status

**Status:** PLANNED

**Cycle:** PDCA-001

**Scale:** Micro

**Purpose:** Learn the minimum operational requirements before scaling BOMA.

**Next gate:** Do not begin a larger cycle until the Act phase produces an explicit, evidence-based list of changes and retained invariants.
