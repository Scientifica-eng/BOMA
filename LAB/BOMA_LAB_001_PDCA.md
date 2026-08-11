# BOMA Laboratory — PDCA-001

## Purpose

This laboratory is the experimental workspace for developing BOMA from practice before enlarging the formal architecture.

The laboratory does **not** begin with an external mathematical example. The experiment itself is the construction of a tiny formal mathematical development from zero, Brick by Brick. The purpose is to discover, through actual construction and verification, the minimum information BOMA must record before a larger development is attempted.

The laboratory adopts **Brick** as the smallest identifiable architectural unit. A **Block** is an optional higher-level grouping of Bricks when grouping provides a real structural or semantic advantage.

## Foundational Experimental Principle

> **We are not applying BOMA to an existing theory; we are using BOMA to build a theory.**

The project therefore starts with an explicitly declared empty BOMA development and introduces foundational content one Brick at a time. No pre-existing mathematical example is assumed to be the subject of the experiment.

The proof assistant is a verification backend. Its own pre-existing kernel, primitive type system, and implementation infrastructure are recorded as **backend baseline**, not silently imported as BOMA Bricks.

## Working Principle

> **Small construction → observation → verification → correction → extracted specification → larger construction.**

The laboratory follows a controlled PDCA loop:

1. **Plan** — define the smallest next foundational construction and the evidence required to accept it.
2. **Do** — construct exactly that Brick and record the actual formal/backend artifacts.
3. **Check** — verify the Brick, its dependencies, status, representation, and traceability.
4. **Act** — correct the model and extract requirements before adding the next Brick.

---

# CYCLE 001 — BUILD FROM ZERO

## Experimental question

Can BOMA construct a minimal mathematical development from an explicitly empty BOMA state, one Brick at a time, while preserving a strict separation between:

- mathematical content;
- BOMA architecture;
- Lean/backend representation;
- verification evidence?

## Scope constraint

Cycle 001 remains deliberately microscopic. It will not attempt to build a complete theory. Its objective is to discover the minimum viable construction protocol.

Initial constraints:

- start from an empty BOMA development;
- introduce exactly one new foundational Brick before the first Check;
- do not introduce a Block unless the experiment demonstrates a need for grouping;
- do not introduce a Decision Point unless a genuine alternative is encountered;
- do not assume that a Lean declaration is a Brick;
- do not import a ready-made mathematical theory merely to obtain content for the experiment.

---

# PLAN

## P1. Establish the baseline

The baseline is the state against which the first Brick is introduced.

It has two explicitly separated layers:

### BOMA baseline

```text
BOMA Development D-000
Bricks: none
Blocks: none
Decision Points: none
Branches: none
```

### Backend baseline

The Lean environment necessarily contains trusted implementation infrastructure. This is **not** counted as BOMA mathematical content. Any backend facility used by the experiment must be named when it becomes relevant.

## P2. First construction target

The first Brick will establish the minimal mathematical object-domain required for subsequent construction.

For Cycle 001, the working target is:

> **Brick B-001 — introduce a minimal inductive object domain with a distinguished initial object and a successor constructor.**

This is intentionally smaller than arithmetic. No addition, multiplication, induction theorem, ordering, or arithmetic law is introduced at this stage.

The exact Lean representation is part of the experiment and must not be confused with the BOMA definition of B-001.

## P3. Acceptance conditions for B-001

B-001 can pass Check only if we can state explicitly:

1. its mathematical content;
2. its BOMA identity;
3. its prerequisites;
4. what it introduces;
5. what the backend actually implements;
6. what the backend verifies;
7. which parts are mathematical necessity and which are implementation choices;
8. whether the Brick is genuinely atomic at the chosen BOMA analysis level.

## P4. Data to record

For every construction step, record at minimum:

```yaml
Brick:
  ID: ...
  Content: ...
  Depends_on: []
  Introduces: []
  EpistemicStatus: ...
  VerificationStatus: ...
  Backend:
    System: Lean
    Artifacts: []
    MappingType: ...
```

The schema remains provisional. A field is retained only if the experiment demonstrates that it is useful.

---

# DO

## D1. Construction protocol

The development is constructed sequentially.

```text
D-000
  │
  └── Brick B-001
        │
        └── Check
```

No second Brick is added until B-001 has been checked and the laboratory records what was learned from it.

## D2. Construction log

| Step | BOMA action | Backend action | Result | Evidence |
|---|---|---|---|---|
| D-001 | Introduce B-001 | TBD | TBD | TBD |

## D3. Observation log

| ID | Observation | Consequence | Evidence |
|---|---|---|---|
| O-001 | | | |
| O-002 | | | |
| O-003 | | | |

## D4. Decision log

Only genuine alternatives are recorded as Decision Points. Implementation conveniences are not automatically Decision Points.

| Decision ID | Alternatives | Selected | Reason | Unchosen alternatives |
|---|---|---|---|---|
| D-001 | | | | |

## D5. Correction log

Corrections must not silently overwrite experimental history.

| Correction ID | Affected Brick/Block | Original state | Corrected state | Reason | Evidence |
|---|---|---|---|---|---|
| C-001 | | | | | |

---

# CHECK

The Check phase is performed before any additional mathematical Brick is admitted.

## C1. Mathematical content

Does B-001 state exactly what it is intended to state, without importing unrecorded mathematical content?

## C2. Dependency integrity

Check for:

- undeclared prerequisites;
- hidden imported mathematical content;
- backend dependencies mistaken for mathematical dependencies;
- circularity.

## C3. Backend separation

Record which parts of B-001 are BOMA content and which are merely Lean representation.

A backend artifact may implement B-001 without defining what B-001 means in BOMA.

## C4. Verification

Record the exact verification evidence supplied by the backend and distinguish it from the broader BOMA Verification status.

## C5. Atomicity test

Ask:

> Can B-001 be divided into smaller independently meaningful BOMA Bricks without destroying the architectural purpose of the construction?

If yes, Brick granularity is not yet settled and the result must be recorded as a finding.

## C6. Epistemic classification

For every asserted component of B-001 determine whether it is:

- Logical Necessity;
- Foundational Necessity;
- Architectural Necessity; or
- Methodological Choice.

If the classification is insufficient, record the failure rather than forcing a category.

## C7. Reproducibility

Another operator should be able to reconstruct B-001 from the laboratory record and obtain the same verified result.

---

# ACT

## A1. Findings

| Finding ID | Finding | Severity | Architectural implication |
|---|---|---|---|
| F-001 | | | |
| F-002 | | | |
| F-003 | | | |

## A2. Extracted requirements

Only evidence from B-001 may justify changes to the next cycle.

| Requirement | Evidence from B-001 | Action |
|---|---|---|
| | | |

## A3. Provisional rules

```text
R-001: [provisional rule]
R-002: [provisional rule]
R-003: [provisional rule]
```

## A4. Gate to B-002

B-002 may not be introduced until:

- B-001 has a stable record;
- its backend mapping is explicit;
- its verification evidence is recorded;
- unresolved ambiguity is identified;
- the laboratory has extracted the minimum changes required for the next construction.

---

# Data to Carry Forward

The experiment will determine which of the following categories are actually necessary:

1. Identity data.
2. Content data.
3. Dependency data.
4. Epistemic data.
5. Choice data.
6. Branch data.
7. Verification data.
8. Correction data.
9. Grouping data.
10. Provenance data.
11. Backend-mapping data.

These are **candidates**, not normative BOMA fields.

---

# Laboratory Discipline

### Specification vs. observation

A rule written before construction is a hypothesis. An observed behavior is evidence.

### Mathematical content vs. representation

The BOMA Brick is not defined by its Lean syntax. Lean is one possible backend representation.

### Backend baseline vs. BOMA content

The trusted infrastructure required to run Lean is not silently counted as mathematical content introduced by BOMA.

### Correction vs. invention

A representation correction is not automatically a new foundational assumption.

### Local success vs. general validity

A rule that works for B-001 is not automatically a BOMA principle. Generalization requires further experimental evidence.

---

# Cycle Status

**Status:** PLAN → READY FOR DO

**Cycle:** PDCA-001

**Current development:** D-000 (empty BOMA state)

**Next action:** Construct and record B-001 only.

**Gate:** No B-002 until B-001 completes Check and Act.
