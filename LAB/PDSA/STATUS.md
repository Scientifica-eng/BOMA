# PDSA STATUS — Current Research Cycle Index

**Status:** ACTIVE — current-state navigation index  
**Date:** 2026-08-18

## Purpose

Provide one current-state index for BOMA PDSA cycles.

Individual cycle documents preserve their creation history and may contain intermediate/opening-state wording. This index records the current cycle state and points to closure/evidence records.

Historical `PDCA` identifiers elsewhere remain legacy provenance only; the governing method is PDSA.

## Architecture / governance cycles

| Cycle | Current Status | Main Result |
|---|---|---|
| PDSA-ARCH-001 | CLOSED — ADOPTED | canonical DAG topology; serial/parallel/fork/reconvergence rules; README + AGENTS handoff |

Canonical topology reference:

```text
LAB/00_ARCHITECTURE/CONSTRUCTION_TOPOLOGY.md
```

Mandatory handoff entry points:

```text
README.md
AGENTS.md
```

## TCT cycles

| Cycle | Current Status | Main Result |
|---|---|---|
| PDSA-TCT-001 | CLOSED | baseline stabilization; operational/epistemic status separation |
| PDSA-TCT-002 | CLOSED | pre-numerical metatheory contract |
| PDSA-TCT-003 | CLOSED | BR-010 structural equivalence selected |
| PDSA-TCT-004 | CLOSED — PASS | terminal recovery/cancellation; J-001 resolved |
| PDSA-TCT-005 | CLOSED — PASS | TCT-BLOCK-003 canonical decomposition |
| PDSA-TCT-006 | CLOSED — PASS | TCT-BLOCK-004 Structural Iteration History |
| PDSA-TCT-007 | CLOSED — PASS | TCT-BLOCK-005 Successor-Like Extension |
| PDSA-TCT-008 | CLOSED — PASS WITH REFINEMENTS | whole-path pre-numerical calibration |

## Natural-number / formalization cycles

| Cycle | Current Status | Main Result |
|---|---|---|
| PDSA-N-001 | CLOSED | BOMA-N-ACCEPT-001 v1.0 active |
| PDSA-N-002 | CLOSED | N-DP-001 selects R-B for Stage One; alternatives preserved |
| PDSA-N-003 | CLOSED | BOMA-RB-FORMAL-001 v1.0 active |
| PDSA-N-004 | ACTIVE / CANDIDATE CONSTRUCTED | N-RB-CAND-001 + unified Lean payload; V5 pending |
| PDSA-N-005 | ACTIVE / WRITTEN BRIDGE PASS | faithful TCT bridge passes written/V3 audit; V5 pending |
| PDSA-N-006 | ACTIVE / WRITTEN CHARACTERIZATION PASS | pointwise initiality/standardness route passes written audit; V5 pending |
| PDSA-N-007 | ACTIVE — CURRENT GATE | pinned-toolchain V5 verification and final evidence consolidation |

## Current mathematical/formal frontier

```text
CALIBRATED PRE-NUMERICAL CORE
TCT-BLOCK-001 .. TCT-BLOCK-005
        ↓
BOMA-N-ACCEPT-001 v1.0
        ↓
N-DP-001 selects R-B
        ↓
BOMA-RB-FORMAL-001 v1.0
        ↓
N-RB-CAND-001 / TCT-BLOCK-006 candidate
        ↓
PDSA-N-007 V5 GATE  ← CURRENT
        ↓
FINAL NAC-01..NAC-14 AUDIT
        ↓
NAC-15 N-Core closure decision
```

## Topology constraint on current N-Core work

The formal candidate/payload is **not** the canonical architecture by itself.

Before N-Core acceptance, the candidate must be decomposed/read according to the actual construction DAG described in:

```text
LAB/00_ARCHITECTURE/CONSTRUCTION_TOPOLOGY.md
```

Do not force the N-Core into a single vertical chain. Identify genuine:

```text
serial dependencies
horizontal independent units
parallel contributors
Decision Point branches
Junctions
scientifically meaningful branch → reconvergence patterns
```

Reconvergence must preserve branch provenance.

## Current blockers

```text
1. observed successful Lean checker evidence for unified candidate
2. final post-checker preservation/commitment re-audit
3. topology-aware canonical N-Core Brick/Block/Junction decomposition
4. NAC-15 closure decision
```

No addition, multiplication, order, integers, or later number-domain work may be promoted before the N-Core gate is legitimately closed.

## Preferred current backend payload

```text
LAB/payloads/lean/NCore/NCoreRB001.lean
```

Earlier payloads remain provenance / exploratory implementations and are not the preferred unified verification target.

The preferred payload remains a **backend verification candidate**, not a substitute for Brick/Block architecture.

## Current proof status summary

```text
Architectural / written mathematical evidence: substantial PASS
Formal V5 checker evidence:               PENDING OBSERVATION
Topology-aware canonical N decomposition: PENDING
Accepted N-Core / ℕ:                       NOT YET
```
