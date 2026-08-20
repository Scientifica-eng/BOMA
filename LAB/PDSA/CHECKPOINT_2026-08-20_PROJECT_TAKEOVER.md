# CHECKPOINT 2026-08-20 — Project Takeover and Stabilization

**Status:** ACTIVE HANDOFF CHECKPOINT — NO MATHEMATICAL FRONTIER CHANGE  
**Date:** 2026-08-20  
**Takeover baseline:** `main@833e54c781a9a670eae295b76a2f6c2f47fe6065`  
**Maintenance branch:** `maintenance/takeover-stabilization-001`  
**Governing method:** PDSA — Plan → Do → Study → Act

## Purpose

This checkpoint records the technical and research handoff of BOMA after Stage-One real acceptance and the post-R reverse-engineering closure. It exists to prevent future collaborators or AI agents from reconstructing project state from stale onboarding documents or from treating historical records as the current frontier.

This checkpoint does **not** create a new mathematical unit, revise an accepted theorem, reopen any accepted gate, or authorize the complex-number stage.

## Canonical state at takeover

```text
framework-neutral pre-numerical layer   CALIBRATED
N-Core                                  ACCEPTED
N-Arithmetic                            ACCEPTED
Z                                       ACCEPTED
post-Z reverse N                        CLOSED
Q                                       ACCEPTED
R                                       ACCEPTED — RA-22
RE-R-001                                CLOSED / COMPLETE
C                                       NOT STARTED — USER HOLD
```

The explicit hold remains controlling:

```text
DO NOT START C UNTIL A NEW EXPLICIT USER ORDER IS GIVEN.
```

Eligibility after R closure is not authorization.

## Accepted real baseline

The accepted Stage-One real realization is the selected Dedekind route:

```text
LowerCut over QBOMA
CutEquiv A B := ∀q, A.lower q ↔ B.lower q
RBOMA := Quotient cutSetoid
```

The final acceptance-strength integration evidence is:

```text
R-J-002                 PASS / RESOLVED
workflow run            32374868448
verified commit         f07363c22b049a3fae028a927df74d4fb28a0680
Lean                    4.32.1
RA-22                   ACCEPT
R-BLOCK-001             ACTIVE — ACCEPTED
```

The current repository head at takeover is later than the verified commit because acceptance closure, evidence recording, reverse engineering, and documentation synchronization were committed afterward. The accepted Lean dependency closure itself was not silently redefined by those documentary closure commits.

## Repository inspection result

At takeover inspection:

```text
open Issues              none detected
open Pull Requests       none detected
work/re-r-001-close      identical to main
older retained branches  behind main; no unmerged active work detected
external Lake packages   none
Lean toolchain            leanprover/lean4:v4.32.1
```

Older branches and failed/superseded artifacts are not automatically disposable. BOMA treats scientifically meaningful failures, alternatives, and provenance as Learning-Graph evidence. Cleanup must therefore distinguish operational debris from research provenance.

## Documentary drift found

Three active onboarding/execution documents were materially stale at takeover:

1. `README.md` still declared the real-number stage as next and stopped the accepted chain at Q.
2. `AGENTS.md` still described N-Core acceptance and `N-J-002` as pending.
3. `LAB/PDSA/BOMA_STAGE_ONE_PDSA_EXECUTION_PLAN.md` still labelled its 2026-08-18 starting sequence as the active sequence from the present repository state.

These are synchronization defects, not mathematical defects. The stabilization branch updates them without rewriting the historical starting baseline.

## CI provenance risk found

`.github/workflows/boma-r-integration-002.yml` verifies `GITHUB_SHA` but historically checked out the latest `origin/main` before recording evidence. A concurrent or intervening push could therefore place an evidence commit on a newer main head without first checking that the verified dependency closure remained unchanged.

The stabilization action hardens this path by:

```text
serializing evidence-recording runs
fetching current main after verification
checking that all R-J-002 verification inputs are unchanged between GITHUB_SHA and origin/main
refusing evidence promotion if those inputs drifted
recording only after that provenance guard passes
```

This changes CI provenance handling only. It does not change any accepted mathematical theorem or Lean payload.

## Source-of-truth order after takeover

When status records disagree, use the following authority order unless a later explicit governance record supersedes it:

```text
LAB/PDSA/STATUS.md
LAB/00_ARCHITECTURE/REGISTRY.md
LAB/00_ARCHITECTURE/GRAPH.md
relevant current DAG / acceptance / closure records
claim-level V5 evidence
README.md / AGENTS.md onboarding summaries
historical PDSA / checkpoint / branch artifacts
```

Historical documents remain authoritative for what they record about their own time, but not for the current frontier when a synchronized later status record exists.

## Required continuation protocol

Before any future canonical work:

1. read `README.md`, `AGENTS.md`, `LAB/PDSA/STATUS.md`, and this checkpoint;
2. inspect `REGISTRY.md`, `GRAPH.md`, and the DAG/acceptance records relevant to the requested stage;
3. verify that the repository head has not introduced a newer conflicting status record;
4. preserve accepted-stage provenance and claim-level evidence;
5. open no C artifact unless a new explicit user instruction authorizes C.

## Takeover conclusion

The project is technically and epistemically handed over at a closed R frontier. The immediate maintenance objective is synchronization and provenance hardening only. No new mathematical construction is authorized by this checkpoint.
