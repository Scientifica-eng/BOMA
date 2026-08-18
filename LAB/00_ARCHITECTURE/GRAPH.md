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
      ↓
N-DP-002       declares eliminator/universe scope
```

## Accepted N-Core DAG

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
N-BLOCK-002 ─┴──────► N-J-001  PASS / V4+V5

N-BLOCK-004 ───────► N-BLOCK-006  Pointwise Standardness

N-BLOCK-002 ─┐
N-BLOCK-003 ─┤
N-BLOCK-004 ─┤
N-BLOCK-005 ─┼──► N-J-002  PASS / RESOLVED
N-BLOCK-006 ─┤
N-J-001     ─┘
                       │
                       ▼
                 NAC-15 ACCEPT
                       │
                       ▼
                N-BLOCK-007
          Accepted Natural-Number Core
                       │
                       ▼
               N-Arithmetic — NEXT
```

## Verification

```text
claim-level V5 run: 32163771789
Lean:               4.32.1
N-BLOCK-001..006:   mapped formal claims PASS
N-J-001:            PASS
N-J-002:            PASS
NAC-15:             ACCEPT
```

## Critical interpretation

The accepted N-Core was not a linear construction. The branches after `N-BLOCK-001` are parallel contributions. `N-J-001` preserves two independent production witnesses for no-confusion. `N-J-002` integrates the whole package only after V5 and preservation/commitment audits.

`TCT-BLOCK-006` remains provenance only; `N-BLOCK-007` is the canonical downstream N-Core interface.

## Current frontier

```text
BOMA Stage-One R-B N-Core: ACCEPTED
addition:                      NOT YET CONSTRUCTED
multiplication:                NOT YET CONSTRUCTED
order:                         NOT YET CONSTRUCTED
integers:                      NOT YET REACHED
```

The next work is a separate auditable N-Arithmetic DAG; acceptance of the carrier must not silently create arithmetic operations.
