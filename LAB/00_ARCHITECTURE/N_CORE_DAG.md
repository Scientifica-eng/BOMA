# N-CORE DAG — Canonical Topology for the R-B Stage-One Route

**Document ID:** `BOMA-N-DAG-001`  
**Version:** `1.0`  
**Status:** **ACTIVE — CANONICAL N-CORE TOPOLOGY**  
**PDSA origin:** `PDSA-N-008`

## Purpose

This document replaces the misleading reading of `N-RB-CAND-001` as one monolithic construction. The candidate and unified Lean payload remain experimental/formal evidence; the canonical architecture is the DAG below.

## Topology

```text
N-DP-001 selects R-B
        │
        ▼
N-BLOCK-001  Formal Unary Kernel
        │
        ├──────────────► N-BLOCK-002  Internal No-Confusion
        │
        ├──────────────► N-BLOCK-003  Induction / Generatedness
        │
        ├──────────────► N-BLOCK-004  Recursion / Pointwise Initiality
        │
        └──────────────► N-BLOCK-005  TCT Realization Bridge
                               ▲
                               │
                    TCT-BLOCK-002..005

N-BLOCK-005 + TCT-BLOCK-005
        │
        ▼
N-BR-018  Constructional No-Confusion Transfer
        │
        ├──────────────────────────────┐
        │                              │
N-BLOCK-002                            │
Internal route                         │
        │                              │
        └────────► N-J-001 ◄───────────┘
                  No-Confusion
                  Dual-Route Convergence

N-BLOCK-004
        │
        ▼
N-BLOCK-006  Pointwise Standardness

N-BLOCK-002 ─┐
N-BLOCK-003 ─┤
N-BLOCK-004 ─┤
N-BLOCK-005 ─┼──► N-J-002 — N-Core Integration Gate
N-BLOCK-006 ─┤
N-J-001     ─┘
                    │
                    ▼
          NAC-15 closure decision
                    │
             only if all PASS
                    ▼
             BOMA N-Core ACCEPTED
```

## Interpretation

The four branches after `N-BLOCK-001` are not a Decision Point: they are parallel required contributions. `N-J-001` is a deliberate cross-route reconvergence experiment. It asks whether the same formal no-confusion contribution is obtained both internally from the inductive regime and constructionally through the faithful TCT ancestry route.

`N-J-002` is the integration gate. It must not PASS merely because a unified Lean file contains all definitions.

## Canonical rule

```text
backend file structure ≠ construction topology
```

Every N-Core theorem must cite the Brick/Block that owns the contribution and the evidence that verifies it.

## Current status

The DAG is canonical. Most mathematical/formal units have written candidate evidence inherited from PDSA-N-004..006, but V5 verification remains pending. `N-J-001` and `N-J-002` are not resolved.
