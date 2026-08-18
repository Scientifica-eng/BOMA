# BOMA PDSA Research Record

## Status

**ACTIVE — cumulative research-process record**

## Purpose

`LAB/PDSA/` records the successive **Plan–Do–Study–Act** cycles used to develop BOMA.

This directory is not a second canonical mathematical registry. Its purpose is to preserve the research process and the learning that changes later work.

BOMA maintains two cross-linked records:

```text
CONSTRUCTION GRAPH
LAB/00_ARCHITECTURE/ + LAB/10_CONSTRUCTION/
Tracks mathematical units, dependencies, constraints, gates, and status.

LEARNING GRAPH
LAB/PDSA/
Tracks questions, experiments, observations, errors, successes, corrections,
human–AI contributions, lessons, decisions, and inheritance between cycles.
```

## Governing documents

- `LAB/BOMA_PDSA_GOVERNANCE_AND_PDCA_LEGACY_CORRECTION_2026-08-18.md`
- `LAB/PDSA/BOMA_STAGE_ONE_PDSA_EXECUTION_PLAN.md`
- `LAB/BOMA_PROJECT_INTAKE_AND_RESEARCH_ROADMAP_2026-08-18.md`
- `LAB/BOMA_SCIENTIFIC_HISTORICAL_REVIEW_2026-08-18.md`

## Naming

New cycle IDs use:

```text
PDSA-<TRACK>-<SEQUENCE>
```

Examples:

```text
PDSA-TCT-001
PDSA-TCT-002
PDSA-N-001
PDSA-Z-001
PDSA-R-001
```

Historical repository identifiers containing `PDCA` remain unchanged as legacy provenance. They do not determine current methodology.

## Minimum cycle schema

Every cycle must record at least:

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

A section may state `NONE OBSERVED` or `NOT APPLICABLE`; it should not be silently omitted when the distinction matters.

## Cycle-status vocabulary

Recommended cycle statuses:

```text
PLANNED
ACTIVE
STUDY
ACT
CLOSED
PAUSED
BRANCHED
REJECTED
```

These are PDSA-process statuses and must not be confused with canonical mathematical unit status.

## Additive-correction rule

A scientifically relevant error, failed hypothesis, or earlier interpretation should not be silently erased.

When later learning corrects an earlier cycle:

1. preserve the historical record;
2. add an explicit correction/follow-up cycle or amendment;
3. identify what changed and why;
4. update canonical units only when justified by the new evidence;
5. preserve the learning edge between the old and new state.

## Human–AI record

The project is explicitly studying sustained human–AI research collaboration.

Where materially relevant, cycle records distinguish:

```text
Human-originated question / constraint / correction / decision
AI-originated proposal / analysis / objection / draft / error
Independent verification evidence
Final research-authority decision
```

The goal is not conversational transcription. The goal is reusable knowledge about how the collaboration affected the research.

## Current cycle index

```text
PDSA-TCT-001  Baseline Stabilization
PDSA-TCT-002  Pre-Numerical Metatheory Contract
PDSA-TCT-003  Structural Equivalence ≈
PDSA-TCT-004  Terminal Recovery Theorem / Countermodel
PDSA-TCT-005  Canonical Decomposition
PDSA-TCT-006  Structural Iteration / Depth
PDSA-TCT-007  Successor-Like Structure
PDSA-TCT-008  Pre-Numerical Calibration Gate
PDSA-N-001    Natural-Number Acceptance Specification
```

Only cycles with an actual record should be treated as opened or executed. The execution-plan list does not imply completion.
