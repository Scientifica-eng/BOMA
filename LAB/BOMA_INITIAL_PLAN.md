# BOMA Initial Experimental Plan

**Status:** Initial experimental plan — Proposed
**Branch:** `lab/pdca-001`
**Baseline:** BOMA I + BOMA II

## 1. Purpose

This document records the initial plan for the BOMA laboratory. It is an experimental plan, not a final revision of the BOMA specification.

The laboratory will build a foundational development from an empty state, one traceable unit at a time, and use repeated PDCA cycles to discover which architectural distinctions, records, and verification interfaces are actually required.

The immediate objective is not to prove substantial mathematics. It is to test whether BOMA can describe and control the construction of a formal theory from the ground up while remaining independent of any particular verification backend.

## 2. Baseline and Scope

BOMA I and BOMA II are the current conceptual and operational baseline.

The laboratory must distinguish among:

1. concepts already specified by BOMA;
2. interpretations of those concepts;
3. proposed extensions;
4. observations produced by experiments;
5. validated revisions, if any.

Experimental findings must not silently rewrite the baseline specification.

## 3. Foundational Architectural Hypothesis

The laboratory is investigating the hypothesis that **Brick** can serve as the smallest independently identifiable unit of foundational content at the selected architectural level, while **Block** remains the BOMA concept defined in the existing architecture and may be composed of one or more Bricks when such grouping has a justified structural or semantic role.

This is a **Proposed** hypothesis. It is not yet a normative replacement of the Block definitions in BOMA I or BOMA II.

The first experiments must therefore test:

- whether Brick can be given a stable identity;
- whether a Brick can be smaller than a Block without becoming an arbitrary syntactic fragment;
- whether one Brick maps to one backend artifact, several artifacts, or neither;
- whether Block formation adds information that cannot be represented adequately at Brick level;
- whether the distinction remains meaningful across different verification backends.

## 4. Empty Starting State

The experimental development begins at:

`D-000 = Empty BOMA Development`

No external mathematical theory is imported as the subject matter of Cycle 001. The laboratory is itself the construction environment.

The first construction step must therefore be chosen as the smallest meaningful addition to an otherwise empty development, rather than as an arbitrary example selected in advance.

## 5. Separation of Languages

BOMA has its own architectural language. Backend systems have their own implementation and verification languages.

The following systems are treated as candidate **Verification Backends**:

- Lean
- Coq
- Agda
- Isabelle
- Informal

`Informal` is included as a documentation/argumentation mode, not as a proof assistant.

The architectural principle is:

`BOMA meaning != backend representation`

A BOMA Brick must retain its architectural identity independently of whether its payload is represented in Lean, Coq, Agda, Isabelle, Informal text, or more than one of these.

No backend term is automatically promoted to BOMA terminology merely because it is convenient or common in implementation.

## 6. Verification Model

Each experimental unit is checked at two distinct levels.

### 6.1 Formal Check

Determines whether the selected backend accepts the formal payload according to its own rules.

Examples include kernel/type checking and the backend's other trusted verification mechanisms.

### 6.2 Architectural Check

Determines whether the construction is adequately represented and compliant with the applicable BOMA criteria.

This includes, where applicable:

- identity;
- dependency traceability;
- epistemic status;
- injection accounting;
- minimality;
- decision-point traceability;
- branch traceability;
- correction traceability;
- verification status;
- separation between BOMA concepts and backend terminology.

A successful Formal Check does not imply a successful Architectural Check.

## 7. PDCA Operating Loop

Every laboratory cycle follows:

`Plan -> Do -> Check -> Act -> Extract Evidence -> Next Cycle`

### Plan

State the smallest experimental question and the criteria by which the result will be judged.

### Do

Construct only what is required by the plan and record the actual artifacts and decisions.

### Check

Perform both Formal Check and Architectural Check. Record failures as evidence, not as reasons to hide or rewrite the history.

### Act

Correct the construction, the record, or the working architectural hypothesis as justified by the evidence.

### Extract Evidence

Separate observations from interpretations. Record requirements, unresolved questions, and candidate specification changes.

### Next Cycle

Increase complexity only when the previous cycle provides sufficient evidence to justify the increase.

## 8. Progressive Cycle Strategy

The intended progression is incremental rather than predetermined:

1. **Cycle 001:** empty development to the first meaningful Brick candidate.
2. **Cycle 002:** multiple Bricks and explicit dependency.
3. **Cycle 003:** test whether a Block is required and what it contributes.
4. **Cycle 004:** first genuine Decision Point.
5. **Cycle 005:** first Branch and branch-specific development.
6. **Cycle 006:** Injection and Minimal Injection.
7. **Cycle 007:** Correction and traceability of correction.
8. **Cycle 008:** architectural DAG and cross-branch comparison.
9. Later cycles may introduce increasingly substantive mathematics only when justified by evidence.

The sequence is provisional. A Check result may split, reorder, repeat, or cancel a planned cycle.

## 9. Backend Independence Experiment

A key laboratory question is whether the same BOMA unit can preserve its meaning across different backends.

For a BOMA Brick `B_i`, the working model is:

`Meaning(B_i) = M_i`

while a backend-specific payload is:

`Payload(B_i, V) = P_i,V`

where `V` may be Lean, Coq, Agda, Isabelle, or Informal.

A backend may be absent, partially implemented, or unable to express a given aspect. Such a result is recorded explicitly rather than forcing a false equivalence.

The first cycle does not need to implement the Brick in all backends. Cross-backend testing is introduced when the first unit is stable enough to make such a comparison informative.

## 10. Brick-to-Backend Questions

The laboratory must empirically determine whether the relation is:

- one Brick to one backend declaration;
- one Brick to several backend declarations;
- several Bricks to one backend artifact;
- or a more complex mapping.

No one-to-one correspondence is assumed.

## 11. Evidence Discipline

Every important laboratory conclusion should be classified as one of:

- **Proposed** — working hypothesis.
- **Observed** — directly recorded experimental fact.
- **Validated** — survived a defined Check criterion.
- **Corrected** — modified after evidence of deficiency.
- **Deprecated** — retained for traceability but no longer recommended.
- **Normative** — accepted into the BOMA specification after adequate evidence.

The laboratory should prefer recording a missing distinction over inventing an unjustified equivalence.

## 12. Change Control

No experiment may silently change BOMA I or BOMA II.

If an experiment indicates that the baseline needs modification, the laboratory records:

`Observation -> Problem -> Interpretation -> Proposed Change -> Test -> Validation Decision`

Only the final validated decision may be proposed as a normative specification change.

## 13. Success Criterion for the Initial Phase

The initial phase is successful if it demonstrates, with recorded evidence, that BOMA can:

1. start from an empty development;
2. identify and trace a minimal unit of construction;
3. distinguish architectural meaning from backend representation;
4. record dependencies and introduced content without ambiguity;
5. perform separate Formal and Architectural Checks;
6. learn from corrections without losing historical traceability;
7. grow through controlled PDCA cycles;
8. remain sufficiently backend-independent to permit more than one verification/documentation mode.

Producing a substantial mathematical theorem is not, by itself, the success criterion for this phase.

## 14. Immediate Next Step

Before constructing the first mathematical artifact, Cycle 001 must define and test the criteria for what counts as the **first meaningful Brick** in an empty BOMA development.

The result of Cycle 001 should determine the next construction step rather than assuming the answer in advance.

## 15. Related Laboratory Documents

- `LAB/BOMA_UNDERSTANDING_BASELINE.md` — project understanding baseline.
- `LAB/BOMA_TERMINOLOGY.md` — controlled vocabulary and backend mapping registry.
- `LAB/BOMA_LAB_001_PDCA.md` — first PDCA cycle record.
- `LAB/BOMA_LAB_001_BUILD.md` — construction record for Cycle 001.
