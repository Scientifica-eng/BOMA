# GRAPH — Transparent Construction Graph

**Status:** ACTIVE — Canonical human-readable graph  
**Detailed topology:** `CONSTRUCTION_TOPOLOGY.md`  
**Detailed N graph:** `N_CORE_DAG.md`

## Pre-numerical trunk

```text
TCT-BLOCK-001  Kernel
      ↓
TCT-BLOCK-002  Generated Selected Configurations
      ↓
TCT-BR-010     Structural Equivalence
      ↓
TCT-BR-009     Terminal Preservation
      ↓
TCT-J-001      PASS
      ↓
TCT-BLOCK-003  Canonical Decomposition
      ↓
TCT-BLOCK-004  Structural Iteration History
      ↓
TCT-BLOCK-005  Successor-Like Extension
      ↓
PDSA-TCT-008   Calibration PASS
      ↓
BOMA-N-ACCEPT-001
      ↓
N-DP-001       selects R-B
```

## Canonical N-Core DAG

```text
                         N-BLOCK-001
                         Formal Unary Kernel
                         /      |       |       \
                        /       |       |        \
                       ▼        ▼       ▼         ▼
                N-BLOCK-002 N-BLOCK-003 N-BLOCK-004 N-BLOCK-005
                No-Confusion Induction/    Recursion/   TCT Bridge
                             Generatedness  Initiality      ▲
                                                           │
                                                   TCT-BLOCK-002..005

TCT-BLOCK-005 + N-BLOCK-005
             ↓
          N-BR-018
 Constructional No-Confusion
             │
N-BLOCK-002 ─┴──────► N-J-001
                      CONDITIONAL PASS
                      written V4 / V5 pending

N-BLOCK-004 ───────► N-BLOCK-006
                     Pointwise Standardness

N-BLOCK-002 ─┐
N-BLOCK-003 ─┤
N-BLOCK-004 ─┤
N-BLOCK-005 ─┼──► N-J-002 — Integration Gate — BLOCKED
N-BLOCK-006 ─┤
N-J-001     ─┘
                       ↓ if PASS
                 NAC-15 decision
                       ↓ if ACCEPT
                BOMA N-Core ACCEPTED
```

## Critical interpretation

The four branches after `N-BLOCK-001` are parallel required contributions, not a Decision Point. `N-J-001` is the first deliberate split/reconvergence verification: two different production histories yield the same no-confusion interface.

`TCT-BLOCK-006` is retained only as the earlier aggregate view and must not be used to bypass this DAG.

## Current frontier

The architecture and first written reconvergence are established. The blocking work is:

```text
PDSA-N-007 pinned-toolchain V5 evidence
unit-level evidence mapping
N-J-002 integration audit
NAC-15 closure decision
```

`ℕ` is not yet accepted.
