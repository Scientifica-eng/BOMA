# BOMA Stage One — PDSA Execution Plan

**Document ID:** `BOMA-STAGE1-PDSA-PLAN-2026-08-18`  
**Date:** 2026-08-18  
**Status:** ACTIVE — governing execution plan for the current research stage  
**Method:** PDSA — Plan, Do, Study, Act  
**Scope:** From the current TCT pre-numerical construction boundary through the first canonical construction of `ℕ`, then `ℤ`, `ℚ`, `ℝ`, and `ℂ`.

---

## 1. Purpose

This document converts the project roadmap into an executable sequence of cumulative PDSA research cycles.

The plan is governed by two parallel project products:

```text
PRODUCT A — MATHEMATICAL CONSTRUCTION
A transparent, traceable, logically founded and internally coherent
architecture beginning before object-level numerical notions and progressing
toward the standard number domains.

PRODUCT B — RESEARCH KNOWLEDGE
A traceable body of learning extracted from the construction process,
including failures, corrections, successful methods, hidden assumptions,
decision criteria, and the strengths and failure modes of human–AI research
collaboration.
```

Neither product is secondary.

---

## 2. Governing method

All new research cycles use:

> **PDSA — Plan → Do → Study → Act**

Historical repository identifiers containing `PDCA` remain legacy provenance only. They are not the name of the current governing method.

The controlling governance record is:

`LAB/BOMA_PDSA_GOVERNANCE_AND_PDCA_LEGACY_CORRECTION_2026-08-18.md`

---

## 3. Starting canonical state

At the start of this plan, the canonical mathematical path is:

```text
TCT-BLOCK-001  Construction kernel       ACTIVE
      ↓
TCT-BLOCK-002  Finite configurations     ACTIVE
      ↓
TCT-J-001      Canonicality gate         CONDITIONAL / PENDING
      ↓
TCT-BLOCK-003  Canonical decomposition   RESERVED
      ↓
TCT-BLOCK-004  Construction depth        RESERVED
      ↓
TCT-BLOCK-005  Successor                 RESERVED
      ↓
TCT-BLOCK-006  Formal natural-number domain  RESERVED
```

`TCT-BR-009 — Terminal Interface Preservation` has already been shown by its derivability test to be **not derived from the current specification of structural equivalence `≈`** and is therefore a **DECLARED ADDITIONAL CONSTRAINT** unless a later definition of `≈` makes it derivable.

The current mathematical frontier is therefore not `ℕ`; it is the canonical-decomposition gate.

---

## 4. Execution principles

The following rules govern every cycle in this plan:

1. **One primary research question per cycle.** A cycle may discover secondary questions, but they become explicit next-cycle inputs or branch candidates.
2. **No silent premise.** Every non-derived commitment must be locatable.
3. **No downstream promotion through an unresolved Junction.**
4. **No numerical concept is silently introduced into the pre-numerical object layer.**
5. **Pre-numerical does not mean metatheory-free.** The metatheory must be declared and versioned.
6. **Construction is distinguished from interpretation.** A structural operation is not called numerical merely because a later realization interprets it numerically.
7. **Failures are retained as evidence.** Scientifically relevant failed attempts are never silently erased.
8. **Study is not a binary check.** It must explain what was learned and why the result occurred.
9. **Every Act states what the next Plan inherits.**
10. **Canonical status requires evidence appropriate to the layer.** Fluency, familiarity, or AI agreement is never sufficient.
11. **Human and AI contributions are distinguishable where materially relevant.**
12. **Every major mathematical result must link to the PDSA cycle(s) that produced or stabilized it.**

---

## 5. Parallel graphs

The project shall maintain two cross-linked conceptual graphs.

### 5.1 Construction Graph

Tracks mathematical dependency:

```text
Brick / Block / Junction
        ↓
constructed or derived mathematical contribution
        ↓
downstream units
```

### 5.2 Learning Graph

Tracks research learning:

```text
PDSA cycle
   ↓
observation / failure / success
   ↓
lesson
   ↓
changed definition / decision / next-cycle constraint
```

A PDSA cycle may affect the Learning Graph even when it creates no new canonical mathematical unit.

---

# PART I — CURRENT TCT PROGRAM

## 6. PDSA-TCT-001 — Baseline Stabilization

### Primary question

Can the present canonical, historical, governance, and status records be synchronized sufficiently to establish a reliable starting state for new work without changing unresolved mathematics?

### Intended actions

- record the inherited canonical state;
- identify documentary status drift;
- synchronize `TCT-BR-009` with its completed derivability result and authoritative registry state;
- establish the PDSA working directory and cycle-record convention;
- preserve historical `PDCA` paths as legacy provenance;
- record the open mathematical boundary unchanged.

### Acceptance condition

The cycle closes only when the repository has one coherent operational baseline and no known status disagreement for the units inspected in this cycle.

---

## 7. PDSA-TCT-002 — Pre-Numerical Metatheory Contract

### Primary question

What meta-level resources are permitted while claiming that the object-level construction is pre-numerical?

### Required study areas

- logical rules available at the meta level;
- syntax and grammar formation;
- meaning of finite expression/history;
- meta-level identity/equality;
- structural equivalence machinery;
- admissible proof principles;
- induction or recursion used only at the meta level, if any;
- representation versus object distinction;
- what `constructed`, `derived`, `declared`, and `verified` mean at this layer.

### Critical inherited learning

This cycle must explicitly consume the lessons of `CAL-001`, especially the historical leakage of notions such as `finite`, `depth`, and `exactly one` across the meta/object boundary.

### Output target

A versioned metatheory contract. No mathematical downstream unit is promoted solely by completing this cycle.

---

## 8. PDSA-TCT-003 — Structural Equivalence `≈`

### Primary question

What is the weakest useful and auditable definition of structural equivalence for the current construction class?

### Candidate paths

```text
PATH A
Strengthen ≈ so terminal-interface preservation becomes DERIVED.

PATH B
Keep ≈ weaker / more abstract and retain TCT-BR-009 as an independent
DECLARED ADDITIONAL CONSTRAINT.
```

Additional paths may be opened if Study identifies materially distinct alternatives.

### Required properties to examine

- reflexivity;
- symmetry;
- transitivity;
- compatibility/congruence with `⊙` where intended;
- preservation of interfaces and boundary roles;
- effect on normal forms;
- effect on recoverability;
- whether different histories collapse;
- whether the definition introduces unintended mathematical commitments.

### Output target

A precise candidate specification or an explicit branch decision. The cycle must record what each candidate gains and loses.

---

## 9. PDSA-TCT-004 — Terminal Recovery Theorem / Countermodel

### Primary question

Under the selected `≈` specification, does terminal recovery descend to structural-equivalence classes?

Central target:

```text
P ⊙ U ≈ Q ⊙ U  ⇒  P ≈ Q
```

with preservation of the distinguished terminal role.

### Required method

Attempt both:

- proof;
- countermodel / counterexample construction.

### Valid Act outcomes

```text
DERIVED
DECLARED ADDITIONAL CONSTRAINT
COUNTERMODEL / FAIL
REVISE ≈
BRANCH
```

Only a resolved outcome can close `TCT-J-001` sufficiently to permit downstream canonical decomposition.

---

## 10. PDSA-TCT-005 — Canonical Decomposition

### Primary question

Can every non-empty admissible finite configuration be decomposed into predecessor plus terminal construction role in a way that is well-defined at the chosen identity/equivalence level?

### Output target

Candidate realization of `TCT-BLOCK-003`, with explicit existence, recovery, uniqueness/canonicity level, dependencies, and sensitivity.

---

## 11. PDSA-TCT-006 — Structural Iteration / Depth

### Primary question

What representation-independent structural invariant of repeated decomposition can be constructed **before** interpreting that invariant numerically?

### Critical inherited learning

This cycle must explicitly consume the calibration findings concerning `B-013` and `B-014`. Numerical indexing must not be used to define the invariant that is later intended to support numerical interpretation.

### Output target

A structural iteration/decomposition invariant suitable for a later numerical realization, or a documented failure requiring redesign.

---

## 12. PDSA-TCT-007 — Successor-Like Structure

### Primary question

Which successor-like properties arise from elementary extension once canonical decomposition and structural iteration are established?

The cycle must distinguish:

```text
STRUCTURALLY DERIVED PROPERTY
from
LATER NUMERICAL INTERPRETATION
```

### Output target

Candidate `TCT-BLOCK-005`, without prematurely globalizing the construction into `ℕ`.

---

## 13. PDSA-TCT-008 — Pre-Numerical Calibration Gate

### Primary question

Has the complete active TCT path remained free of undeclared object-level numerical, set-theoretic, order-theoretic, or global-totality assumptions?

### Required audit

Inspect the complete path from the construction kernel through the successor-like candidate for leakage involving:

- number/cardinality;
- order;
- global infinity/totality;
- equality stronger than declared;
- induction not justified at the relevant layer;
- set or quotient machinery not declared;
- representation/object conflation.

### Act rule

Failure sends the construction back to the earliest affected cycle. Passing the gate permits opening the natural-number realization program.

---

# PART II — NATURAL NUMBERS

## 14. PDSA-N-001 — `ℕ` Acceptance Specification

### Primary question

What must be established before BOMA may claim that the natural-number domain has been constructed?

The acceptance specification must classify requirements such as:

- carrier/domain;
- initial element;
- successor;
- injectivity/non-cyclicity where intended;
- generation/no junk;
- induction and/or recursion;
- addition;
- multiplication;
- order;
- universal/categorical characterization if required;
- comparison/isomorphism with standard realizations;
- logic and formalization dependencies.

The target is defined **before** attempting to certify it.

---

## 15. PDSA-N-002+ — Formal Realization and Arithmetic Package

After `PDSA-N-001`, separate cycles shall handle at least:

```text
formal carrier realization
identity/equivalence
generation / completion
initial element and successor
induction / recursion
addition
multiplication
order
whole-package consistency
comparison with standard ℕ
final ℕ audit
```

Historical Phase 9 and Phase 10 records are learning inputs, not automatically canonical proofs for this new path.

---

# PART III — LATER NUMBER DOMAINS

## 16. `ℤ`, `ℚ`, `ℝ`, `ℂ`

Each standard number domain receives its own PDSA family:

```text
PDSA-Z-*
PDSA-Q-*
PDSA-R-*
PDSA-C-*
```

Each family must begin with an acceptance specification before construction.

### Integers

Expose pair formation, equivalence, quotient/identity machinery, operations, and universal/algebraic characterization.

### Rationals

Expose denominator admissibility, representation equivalence, quotient/identity, field operations, and inherited logical commitments.

### Reals

Treat construction as a major Decision Point. Candidate paths such as Dedekind cuts and Cauchy completion are preserved for later comparison. Stage One may select one canonical route, but alternatives remain explicit.

### Complex numbers

Construct from the accepted real-number layer with explicit algebraic structure and identity rules; alternative characterizations may be investigated later.

---

# PART IV — STAGE TWO

## 17. Controlled branching after the first canonical number-domain path

Broad branching experiments begin only after Stage One produces one coherent canonical path through the scoped standard number domains.

High-value branch targets include:

- structural equivalence `≈`;
- construction kernel choices `ε`, `U`, `⊙`;
- formal completion regime;
- logical regime;
- quotient versus quotient-free identity mechanisms;
- alternative real-number constructions.

Each branch must preserve its Decision Point, inherited interface, changed assumptions, downstream effects, convergence conditions, and reusable certified contributions.

---

## 18. Minimum record for every cycle

Every cycle record must include at least:

```text
CycleID
Status
ParentCycles / LearningInputs
ConstructionUnitsAffected
ResearchQuestion
PLAN
DO
Observations
STUDY
ErrorsDetected
Successes
HiddenAssumptions
HumanContributions
AIContributions
VerificationEvidence
LessonsLearned
ACT
ConstructionGraphEffects
LearningGraphEffects
OpenQuestions
NextCycleInputs
```

---

## 19. Immediate execution order

The active sequence from the present repository state is:

```text
PDSA-TCT-001  Baseline Stabilization
      ↓
PDSA-TCT-002  Pre-Numerical Metatheory Contract
      ↓
PDSA-TCT-003  Structural Equivalence ≈
      ↓
PDSA-TCT-004  Terminal Recovery Theorem / Countermodel
      ↓
PDSA-TCT-005  Canonical Decomposition
      ↓
PDSA-TCT-006  Structural Iteration / Depth
      ↓
PDSA-TCT-007  Successor-Like Structure
      ↓
PDSA-TCT-008  Pre-Numerical Calibration Gate
      ↓
PDSA-N-001    ℕ Acceptance Specification
      ↓
PDSA-N-002+   ℕ realization and arithmetic
      ↓
PDSA-Z-* → PDSA-Q-* → PDSA-R-* → PDSA-C-*
      ↓
Stage-One audit and canonical release
      ↓
Stage-Two controlled branching
```

---

## 20. Plan authority

This document is an **execution plan**, not a claim that downstream units already exist or are proven.

The canonical construction registry remains authoritative for actual unit status. PDSA Study and Act records may propose changes; status changes become authoritative only when the corresponding canonical records and evidence are updated consistently.
