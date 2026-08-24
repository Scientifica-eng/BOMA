# GRAPH — Transparent Construction Graph

**Status:** ACTIVE — Canonical human-readable graph  
**Detailed topology:** `CONSTRUCTION_TOPOLOGY.md`  
**N-Core:** `N_CORE_DAG.md`  
**N-Arithmetic:** `N_ARITHMETIC_DAG.md`  
**Q:** `Q_DAG.md`  
**R:** `R_DAG.md`  
**C:** `C_DAG.md`  
**Learning integration:** `ST2-EXP-001..003 CLOSED / PASS / VERIFIED LESSONS INTEGRATED`  
**Active experiment:** `NONE`.

This file is a current topology view, not a replacement for typed unit, Claim,
Decision, Junction, origin, or evidence records.

## Pre-numerical trunk

```text
TCT-BLOCK-001 → TCT-BLOCK-002 → TCT-BR-010 → TCT-BR-009
       → TCT-J-001 PASS → TCT-BLOCK-003 → TCT-BLOCK-004
       → TCT-BLOCK-005 → PDSA-TCT-008 calibration PASS
```

## Accepted natural-number path

```text
BOMA-N-ACCEPT-001
   ↓
N-DP-001 R-B + N-DP-002 scope
   ↓
parallel N-Core DAG
   ↓
N-J-001 PASS → N-J-002 PASS
   ↓
NAC-15 ACCEPT
   ↓
N-BLOCK-007 Accepted N-Core
   ↓
addition / multiplication / order split and reconvergence
   ↓
N-ARITH-J-001 PASS
   ↓
NAA-18 ACCEPT
   ↓
N-ARITH-BLOCK-001 Accepted N-Arithmetic
```

## Accepted integer path

```text
N-ARITH-BLOCK-001
      │
      ├────────► Z-S-BLOCK-001 signed normal forms ───────┐
      └────────► Z-D-BLOCK-001 difference pairs + ~ ─────┤
                                                          ▼
                                                   Z-J-001 PASS
                                                          ▼
                                                   Z-DP-001
                                         signed export selected
                                         pair route retained
                                                          ▼
                                                   Z-BLOCK-001
                                                          ↓
                                            arithmetic/order reconvergence
                                                          ↓
                                                   Z-J-002 PASS
                                                          ↓
                                                   ZA-21 ACCEPT
                                                          ↓
                                                   Z-BLOCK-002
```

## Mandatory post-Z reverse engineering

```text
Z-BLOCK-002
   ├──► Z-RE-BLOCK-001 nonnegative cone
   └──► Z-RE-BLOCK-002 successor reachability
                 ↓
           Z-RE-J-001 PASS
                 ↓
INTERFACE RECONVERGENCE / PROVENANCE DIVERGENCE
```

## Accepted rational path

```text
Z-BLOCK-002
   ↓
Q-GATE-BLOCK-001
   ↓
Q-F-BLOCK-001 RawFrac + FracEquiv
   ↓
Q-F-BLOCK-002 operation respect
   ↓
Q-DP-001 — quotient/setoid identity selected
   ↓
Q-BLOCK-001
   ↓
Q-J-002 PASS
   ↓
QA-23 ACCEPT
   ↓
Q-BLOCK-002 Accepted Stage-One Q
```

## Real stage — selected spine plus permanent verified alternative

```text
Q-BLOCK-002
   ↓
R-DP-001 — RESOLVED
   ├── SELECTS ──► R-ROUTE-D / Dedekind
   │                 ↓
   │             LowerCut / CutEquiv
   │                 ↓
   │             R-DP-002
   │                 ↓
   │             RBOMA
   │                 ↓
   │             R-DP-003 / order
   │                 ↓
   │             R-COMP-BLOCK-001
   │             R-ADD-GROUP-BLOCK-001
   │             R-DP-004 / R-DP-005
   │             R-MUL-BLOCK-001
   │             R-DP-006
   │             R-FIELD-BLOCK-001
   │             R-DENSITY-BLOCK-001
   │             R-ARCH-BLOCK-001
   │                 ↓
   │             R-J-002 PASS
   │                 ↓
   │             RA-22 ACCEPT
   │                 ↓
   │             R-BLOCK-001 Accepted R
   │
   └── ALTERNATIVE_TO ──► R-ROUTE-C / Cauchy
                            ↓
                      independent ordered field
                      + Cauchy completeness
                      + exact LUB completeness
                            ↓
                      VERIFIED ALTERNATIVE R PRODUCER
```

Permanent verified reconvergence:

```text
R-BLOCK-001 / Dedekind ─────────────┐
                                    ▼
                           ST2-EXP-003-R-J-001
                           R-FIELD-ISOMORPHISM
                                    ▲
                                    │
completed Cauchy R producer ────────┘
```

`R-DP-001` still selects Dedekind. The Cauchy branch is permanent, verified,
non-selected, and not an accepted export.

## R → C dependency boundary — ST2-EXP-001 lesson integrated

```text
R-BLOCK-001
   ↓
BOMA-C-R-DEP-001
   ↓
EXACT MATHEMATICAL SURFACE USED BY C
  orderTrans / orderAntisymm / orderTotal / nontrivial
  addComm / addAssoc / addZeroLeft / addInverseRight
  addTranslateOrderIff / negOrderReversing
  mulComm / mulAssoc / mulOneLeft / distribRight
  orderMulNonneg / inverseExists
   ↓
C construction
```

`ST2-EXP-001` proved the selected C Claim meaning survives over this exact
sixteen-property interface. No new Block or Junction is fabricated; the result
refines the existing dependency contract.

## Complex stage — selected spine plus permanent verified alternative

```text
BOMA-C-R-DEP-001 — exact sixteen-property mathematical boundary
   ↓
BOMA-C-ACCEPT-001
   ↓
C-DP-001 — RESOLVED / USER-RATIFIED
   ├── SELECTS ──► C-ROUTE-P
   │                 ↓
   │             C-BLOCK-001 selected witness-field producer
   │                 ↓
   │             C-COMPARE-BLOCK-001
   │                 ↓
   │             C-J-001 PASS / SAME-CARRIER-INTEGRATION
   │                 ↓
   │             C-BLOCK-002 / CA-20 ACCEPT
   │
   └── ALTERNATIVE_TO ──► C-ROUTE-Q
                            ↓
                      independent expression-normalization quotient field
                            ↓
                      VERIFIED ALTERNATIVE C PRODUCER
```

Permanent verified reconvergence:

```text
C-ROUTE-P completed field ───────────┐
                                     ▼
                            ST2-EXP-002-PQ-J-001
                            R-FIELD-ISOMORPHISM
                                     ▲
                                     │
C-ROUTE-Q completed field ───────────┘
```

`ST2-EXP-002-PQ-J-001` does not replace accepted `C-J-001`.

## Cross-stage robustness evidence from Cauchy R

```text
R-ROUTE-C / completed Cauchy R
   ↓
H6 Cauchy-native C rebuild
   ↓
seven selected C-BLOCK-001 core Claim meanings rebuilt
```

H6 is permanent robustness evidence but is not an accepted C producer.
The remaining scalar-generic comparison question is `ST2-EXP-011`, candidate
only and not authorized.

## Learning Graph provenance

The permanent graph facts above were learned through controlled Stage-Two cycles:

```text
ST2-EXP-001  dependency-edge experiment
             → exact sixteen-property R→C surface

ST2-EXP-002  C-DP-001 alternative-route experiment
             → complete Route Q + ST2-EXP-002-PQ-J-001

ST2-EXP-003  R-DP-001 alternative-route experiment
             → complete Cauchy R + ST2-EXP-003-R-J-001 + H6 evidence
```

Their Frozen Plans, failures, exact V5 evidence, Study/Act records, and lifecycle
records remain historical provenance. Integration does not rewrite the past.

## Current frontier

```text
Pre-numerical layer          CALIBRATED
BOMA N-Core                  ACCEPTED
BOMA N-Arithmetic            ACCEPTED
BOMA Z                       ACCEPTED
post-Z reverse N             CLOSED / COMPLETE
BOMA Q                       ACCEPTED
R-DP-001                     SELECTS DEDEKIND
BOMA R                       R-BLOCK-001 ACCEPTED
R permanent alternative      CAUCHY VERIFIED / NON-SELECTED
R alternative Junction       ST2-EXP-003-R-J-001
BOMA-C-R-DEP-001             EXACT SIXTEEN-PROPERTY MATHEMATICAL SURFACE
C-DP-001                     SELECTS C-ROUTE-P
BOMA C                       C-BLOCK-002 / CA-20 ACCEPTED
C permanent alternative      C-ROUTE-Q VERIFIED / NON-SELECTED
C alternative Junction       ST2-EXP-002-PQ-J-001
ST2-EXP-001..003             CLOSED / PASS / LESSONS INTEGRATED
NO ACTIVE EXPERIMENT
NEXT EXPERIMENT SLOT         OPEN / OWNER SELECTION REQUIRED
```

Integration authority:

`LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md`.
