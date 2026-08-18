# N-CORE DAG — Canonical Topology for the R-B Stage-One Route

**Document ID:** `BOMA-N-DAG-001`  
**Version:** `1.1`  
**Status:** **ACTIVE — CANONICAL N-CORE TOPOLOGY**  
**PDSA origins:** `PDSA-N-008`, `PDSA-N-009`

## Purpose

The R-B candidate and unified Lean payload are producer/evidence artifacts. The canonical architecture is the DAG below.

```text
N-DP-001 selects R-B
        │
        ▼
N-BLOCK-001  Formal Unary Kernel
        │
        ├────────► N-BLOCK-002  Internal No-Confusion
        ├────────► N-BLOCK-003  Induction / Generatedness
        ├────────► N-BLOCK-004  Recursion / Pointwise Initiality
        └────────► N-BLOCK-005  TCT Realization Bridge
                               ▲
                               │
                    TCT-BLOCK-002..005

TCT-BLOCK-005 + N-BLOCK-005
        │
        ▼
N-BR-018  Constructional No-Confusion Transfer
        │
N-BLOCK-002 ──────┐
                  ├──► N-J-001
N-BR-018 ─────────┘    CONDITIONAL PASS
                       written V4 / V5 pending

N-BLOCK-004 ─────► N-BLOCK-006  Pointwise Standardness

N-BLOCK-002 ─┐
N-BLOCK-003 ─┤
N-BLOCK-004 ─┤
N-BLOCK-005 ─┼──► N-J-002 — N-Core Integration Gate
N-BLOCK-006 ─┤             RESERVED / BLOCKED
N-J-001     ─┘
                    │
                    ▼
             NAC-15 decision
                    │
              if ACCEPT only
                    ▼
             BOMA N-Core ACCEPTED
```

## Topology interpretation

The four branches after `N-BLOCK-001` are parallel required contributions, not a Decision Point.

`N-J-001` is the first deliberate reconvergence experiment. Route A derives no-confusion internally from the inductive formal regime. Route B transfers the pre-formalized constructional invariant through the TCT bridge and coverage/reconstruction. Written comparison shows both produce the same formal interface while retaining different assumptions and provenance.

## Current convergence result

```text
N-J-001
interface match:            PASS
route independence:         PASS
written V4 cross-path:      PASS
V5 relevant premises:       PENDING
operational result:         CONDITIONAL PASS
```

## Canonical rule

```text
backend file structure ≠ construction topology
same downstream contribution ≠ same construction history
```

Every theorem must cite its owning Brick/Block and verification evidence.

## Aggregate provenance

`TCT-BLOCK-006` is retained as the earlier monolithic aggregate view. `N-RB-CAND-001` and `NCoreRB001.lean` remain producer/evidence artifacts and must not bypass this graph.
