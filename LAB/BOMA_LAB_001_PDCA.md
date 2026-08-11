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

# DO — EXECUTED

## D1. Construction protocol

The development was kept at one Brick only:

```text
D-000
  │
  └── Brick B-001
        │
        └── Verification gate
```

No B-002 was introduced.

## D2. Constructed backend artifact

The Lean payload is recorded at:

`LAB/payloads/lean/B001.lean`

Its essential declaration is:

```lean
inductive BOMAObject where
  | initial : BOMAObject
  | successor : BOMAObject → BOMAObject
```

The mapping is recorded as **Implemented-by**, not **Equivalent**.

## D3. Construction log

| Step | BOMA action | Backend action | Result | Evidence |
|---|---|---|---|---|
| D-001 | Introduce B-001 | Create a Lean inductive declaration with initial and successor constructors | Artifact created; kernel result unavailable | `LAB/payloads/lean/B001.lean` |

## D4. Observation log

| ID | Observation | Consequence | Evidence |
|---|---|---|---|
| O-001 | B-001 can be specified without importing an existing mathematical theory. | Empty-development construction is feasible at the specification level. | B-001 record |
| O-002 | BOMA content can be stated independently of Lean syntax. | BOMA/backend separation is operationally possible. | B-001 record + Lean payload |
| O-003 | A single Lean inductive declaration can represent the current B-001 target. | A one-to-one mapping is possible in this instance but remains unproven as a general rule. | `B001.lean` |
| O-004 | The current execution environment has no Lean or Lake executable. | Formal Check cannot yet be observed. | Environment inspection |
| O-005 | A backend declaration does not by itself establish BOMA Brick atomicity. | Atomicity must be tested architecturally, not inferred from syntax. | B-001 analysis |
| O-006 | Verification infrastructure is itself a prerequisite for reproducible Formal Check. | The laboratory needs an explicit backend execution layer before claiming verified status. | O-004 |

## D5. Decision log

No BOMA Decision Point was created. No genuine mathematical alternative was required to produce B-001.

The choice of Lean syntax is a backend implementation decision, not a BOMA Decision Point.

## D6. Correction log

| Correction ID | Affected Brick/Block | Original state | Corrected state | Reason | Evidence |
|---|---|---|---|---|---|
| C-001 | B-001 | Verification expected to proceed immediately | Verification status set to `BLOCKED` pending a reproducible Lean toolchain | No `lean`/`lake` executable is available in the current laboratory environment | O-004 |

---

# CHECK — PARTIAL / BLOCKED

The Check phase has begun but cannot be closed because the required Lean kernel verification has not been executed.

## C1. Mathematical content

**Preliminary pass.** The payload introduces only the intended object domain, initial object, and successor constructor. No arithmetic operation or law is present in the artifact.

This is a record-level assessment, not a kernel verification result.

## C2. Dependency integrity

**Preliminary pass.** At the BOMA level, `Depends_on: []`. The payload uses no imported mathematical library; `import Init` is backend infrastructure and is not counted as BOMA mathematical content.

This distinction remains provisional until a real Lean execution environment confirms the dependency closure.

## C3. Backend separation

**Pass.** The BOMA record defines B-001 independently of the exact Lean syntax. The Lean declaration is explicitly classified as `Implemented-by`.

## C4. Formal verification

**Blocked.** No Lean executable or Lake executable is available in the current laboratory environment. Therefore no claim of successful kernel checking may be made.

`VerificationStatus = BLOCKED` is the correct current state.

## C5. Atomicity test

**Open.** The fact that one Lean declaration represents B-001 does not prove that B-001 is one atomic BOMA Brick. The laboratory must test whether the initial object and successor constructor can be separated into independently meaningful BOMA units without losing the intended architectural role.

## C6. Epistemic classification

**Preliminary classification:**

- the object-domain target is treated as a **Foundational Necessity** for this experimental path;
- the choice to use an inductive presentation is currently a **Methodological Choice / backend representation choice**;
- no claim is made that this particular object domain is a universal BOMA foundational necessity.

## C7. Reproducibility

**Blocked.** The artifact is recorded, but the current environment cannot reproduce the formal verification result because the Lean toolchain is absent.

---

# ACT — INITIAL

## A1. Findings

| Finding ID | Finding | Severity | Architectural implication |
|---|---|---|---|
| F-001 | A BOMA Brick can be specified independently of a backend artifact. | Positive | Preserve BOMA-first specification. |
| F-002 | One backend declaration can represent the current Brick candidate. | Informative | Do not infer one-to-one Brick/declaration equivalence. |
| F-003 | Formal verification cannot be claimed without an executable backend environment. | Critical | Verification infrastructure must become an explicit laboratory dependency. |
| F-004 | Brick atomicity cannot be inferred from backend syntax. | Critical | Atomicity requires an architectural test. |

## A2. Extracted requirements

| Requirement | Evidence from B-001 | Action |
|---|---|---|
| R-001 | O-004 | Establish a reproducible Lean execution path before closing Formal Check. |
| R-002 | O-005 | Keep Brick-to-backend mapping explicit and typed; never infer equivalence from syntax. |
| R-003 | O-006 | Treat verification infrastructure as an explicit laboratory prerequisite. |
| R-004 | C5 | Add an explicit Brick atomicity test to the construction protocol. |

## A3. Provisional rules

```text
R-001: A backend verification claim requires an executable and reproducible backend environment.
R-002: A BOMA Brick is not identified with a backend declaration by default.
R-003: Backend infrastructure is not silently counted as BOMA mathematical content.
R-004: Brick atomicity is an architectural property and must be tested independently of backend syntax.
```

## A4. Gate to B-002

**CLOSED.** B-002 is not admitted yet.

The next cycle must first address the verification-environment requirement and the unresolved atomicity question. Increasing mathematical complexity before resolving these would confound the experiment.

---

# Data to Carry Forward

The experiment has provided evidence for the continued usefulness of:

1. Identity data.
2. Content data.
3. Dependency data.
4. Epistemic data.
5. Verification data.
6. Backend-mapping data.
7. Provenance/correction data.

Choice, branch, and grouping data remain untested and should not yet be promoted to required fields for a minimal Brick record.

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

**Status:** DO COMPLETE → CHECK PARTIAL / BLOCKED → ACT INITIAL

**Cycle:** PDCA-001

**Current development:** D-000 + B-001

**Next action:** Establish a reproducible Lean verification path and resolve the B-001 atomicity question before introducing B-002.

**Gate:** B-002 remains blocked.
