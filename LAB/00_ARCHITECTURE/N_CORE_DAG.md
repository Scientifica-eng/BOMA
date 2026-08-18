# N-CORE DAG — Canonical Topology for the R-B Stage-One Route

**Document ID:** `BOMA-N-DAG-001`  
**Version:** `1.2`  
**Status:** **ACTIVE — N-CORE ACCEPTED**  
**PDSA origins:** `PDSA-N-008` through `PDSA-N-012`

## Canonical graph

```text
N-DP-001 selects R-B
        │
N-DP-002 declares Sort/universe scope
        │
        ▼
N-BLOCK-001  Formal Unary Kernel
        │
        ├────────► N-BLOCK-002  Internal No-Confusion ─────┐
        ├────────► N-BLOCK-003  Induction / Generatedness  │
        ├────────► N-BLOCK-004  Recursion / Initiality ─► N-BLOCK-006
        └────────► N-BLOCK-005  TCT Realization Bridge     │
                               ▲                            │
                    TCT-BLOCK-002..005                      │
                               │                            │
TCT-BLOCK-005 + N-BLOCK-005   │                            │
        │                      │                            │
        ▼                      │                            │
N-BR-018 Constructional No-Confusion                       │
        │                                                   │
N-BLOCK-002 ──────┐                                        │
                  ├──► N-J-001  PASS / V4+V5               │
N-BR-018 ─────────┘                                        │
                                                            │
N-BLOCK-002 ─┐                                              │
N-BLOCK-003 ─┤                                              │
N-BLOCK-004 ─┤                                              │
N-BLOCK-005 ─┼──► N-J-002  PASS / RESOLVED ◄───────────────┘
N-BLOCK-006 ─┤
N-J-001     ─┘
                    │
                    ▼
             NAC-15 = ACCEPT
                    │
                    ▼
N-BLOCK-007 — Accepted Natural-Number Core Interface
                    │
                    ▼
             N-Arithmetic — NEXT
```

## Verification state

```text
claim-level V5 run: 32163771789
Lean:               4.32.1
N-BLOCK-001..006:   mapped formal claims PASS
N-J-001:            PASS / RESOLVED
N-J-002:            PASS / RESOLVED
NAC-01..14:         PASS
NAC-15:             ACCEPT
```

## Accepted export

`N-BLOCK-007` is the canonical downstream interface for the accepted Stage-One R-B natural-number core.

It exports the carrier/base/successor, induction/generatedness, recursion/pointwise initiality, no-confusion, TCT ancestry bridge, and scoped standardness certificate.

It does **not** yet export addition, multiplication, order, or arithmetic structure.

## Topology learning

The accepted result was not produced as a single vertical chain. Four parallel branches were integrated, and the no-confusion contribution was independently produced by two routes and reconverged at `N-J-001`.

```text
same accepted contribution ≠ same production history
```

Both histories remain provenance.

## Scope

Acceptance is relative to the explicitly selected R-B formalization and `N-DP-002` universe/sort policy. Alternative realization regimes remain preserved for later controlled branch experiments.

## Aggregate provenance

`TCT-BLOCK-006`, `N-RB-CAND-001`, and `NCoreRB001.lean` remain historical/producer/evidence artifacts. They do not replace the canonical DAG.
