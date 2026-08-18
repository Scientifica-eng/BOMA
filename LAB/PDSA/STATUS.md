# PDSA STATUS — Current Research Cycle Index

**Status:** ACTIVE  
**Date:** 2026-08-18

Historical `PDCA` names are provenance only; governing method is PDSA.

## Architecture

| Cycle | Status | Result |
|---|---|---|
| PDSA-ARCH-001 | CLOSED — ADOPTED | canonical DAG / fork / reconvergence rules |

## TCT

`PDSA-TCT-001` through `PDSA-TCT-008` are CLOSED; the calibrated pre-numerical path is active through `TCT-BLOCK-005`.

## Natural-number / formalization cycles

| Cycle | Current Status | Main Result |
|---|---|---|
| PDSA-N-001 | CLOSED | N acceptance specification v1.0 |
| PDSA-N-002 | CLOSED | N-DP-001 selects R-B; alternatives preserved |
| PDSA-N-003 | CLOSED | R-B formalization boundary |
| PDSA-N-004 | producer cycle / candidate retained | monolithic feasibility candidate; mapped into DAG |
| PDSA-N-005 | producer cycle / written bridge result retained | bridge contributions mapped to N-BLOCK-005 |
| PDSA-N-006 | producer cycle / written characterization retained | initiality/standardness mapped to N-BLOCK-004/006 |
| PDSA-N-007 | **ACTIVE — V5 SUBGATE** | pinned-toolchain verification; now mapped unit-by-unit |
| PDSA-N-008 | **CLOSED — PASS** | canonical N-Core DAG extracted: 20 Bricks, 6 Blocks, 2 Junctions |
| PDSA-N-009 | **CLOSED — WRITTEN CROSS-PATH PASS** | no-confusion Route A/Route B reconverge; N-J-001 conditional PASS |

## Current canonical N architecture

Read:

```text
LAB/00_ARCHITECTURE/N_CORE_DAG.md
```

The earlier `TCT-BLOCK-006` and `N-RB-CAND-001` are aggregate/producer records, not the canonical topology.

## Current frontier

```text
N-DAG units created
        ↓
N-J-001 written V4 reconvergence PASS
        ↓
PDSA-N-007 V5 verification of relevant unit claims   ← ACTIVE
        ↓
N-J-001 unqualified PASS if V5 premises succeed
        ↓
N-J-002 N-Core integration audit
        ↓
NAC-15 closure decision
        ↓
BOMA N-Core ACCEPTED only if all gates PASS
```

## Current blockers

```text
1. observed pinned-toolchain V5 checker evidence
2. unit-level mapping of V5 results
3. unqualified closure of N-J-001
4. N-J-002 integration / NAC-01..NAC-14 audit
5. NAC-15 acceptance decision
```

No addition, multiplication, order, integers, rationals, reals, or complex-number work may be promoted before N-Core acceptance.

## Backend

Preferred verification producer:

`LAB/payloads/lean/NCore/NCoreRB001.lean`

It is evidence infrastructure, not the canonical construction graph.
