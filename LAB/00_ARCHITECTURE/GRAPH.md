# GRAPH — Transparent Construction Graph

**Status:** ACTIVE — Canonical human-readable graph  
**Detailed topology:** `CONSTRUCTION_TOPOLOGY.md`  
**N-Core:** `N_CORE_DAG.md`  
**N-Arithmetic:** `N_ARITHMETIC_DAG.md`  
**Q:** `Q_DAG.md`  
**R:** `R_DAG.md`  
**C:** `C_DAG.md`  
**Learning integration:** `ST2-EXP-001..003 + ST2-EXP-011 CLOSED / PASS / VERIFIED LESSONS INTEGRATED`  
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

## R → C production boundary — ST2-EXP-001 integrated

```text
R-BLOCK-001
   ↓
BOMA-C-R-DEP-001
   ↓
EXACT PRODUCTION MATHEMATICAL SURFACE USED BY C
  orderTrans / orderAntisymm / orderTotal / nontrivial
  addComm / addAssoc / addZeroLeft / addInverseRight
  addTranslateOrderIff / negOrderReversing
  mulComm / mulAssoc / mulOneLeft / distribRight
  orderMulNonneg / inverseExists
   ↓
C construction
```

`ST2-EXP-001` proved the selected C Claim meaning survives over this exact
sixteen-property production interface.

## Complex stage — selected spine, generic comparison boundary, and permanent alternative

```text
BOMA-C-R-DEP-001 — exact sixteen-property PRODUCTION boundary
   ↓
BOMA-C-ACCEPT-001
   ↓
C-DP-001 — RESOLVED / USER-RATIFIED
   ├── SELECTS ──► C-ROUTE-P
   │                 ↓
   │             C-BLOCK-001 selected witness-field producer
   │                 ↓
   │             C-COMPARE-BLOCK-001
   │             canonical COMPARISON scalar boundary:
   │               zero / one / neg / add / mul
   │               + explicit quadratic coordinate laws
   │             [ST2-EXP-011 integrated]
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

Permanent verified C-route reconvergence:

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

## ST2-EXP-011 comparison genericity — permanent architectural fact

The comparison-specific dependency question is now resolved:

```text
C PRODUCTION surface
  = sixteen-property BOMA-C-R-DEP-001

C COMPARISON surface
  = zero/one/neg/add/mul + explicit coordinate laws
  = C-COMPARE-BLOCK-001 / C-CL-COMPARE-001
```

The accepted RBOMA adapter preserves the old `Related` semantics definitionally.
The generic comparison interface also instantiates directly over the verified
RCBOMA/H6 research producer without H5 `cToD` or selected Dedekind implementation
transport.

This does not replace accepted comparison sources and does not create a new
Block, Decision Point, or Junction.

## Cross-stage robustness evidence from Cauchy R

```text
R-ROUTE-C / completed Cauchy R
   ↓
H6 Cauchy-native C rebuild
   ↓
seven selected C-BLOCK-001 core Claim meanings rebuilt
   ↓
ST2-EXP-011 generic comparison interface instantiable directly
```

H6 is permanent robustness evidence but is not an accepted C producer.

## Relation/function firewall

Permanent comparison architecture records:

```text
relation-level totality + uniqueness
!=
chosen functional comparison
```

Actual comparison functions require explicit `CoordinateExtractor` data. No
global coordinate or inverse selector is implied by the generic relation.

## Learning Graph provenance

The permanent graph facts above were learned through controlled Stage-Two cycles:

```text
ST2-EXP-001  DEPENDENCY_EDGE / BOMA-C-R-DEP-001
             → exact sixteen-property production R→C surface

ST2-EXP-002  DECISION_POINT / C-DP-001
             → complete Route Q + ST2-EXP-002-PQ-J-001

ST2-EXP-003  DECISION_POINT / R-DP-001
             → complete Cauchy R + ST2-EXP-003-R-J-001 + H6 evidence

ST2-EXP-011  BLOCK / C-COMPARE-BLOCK-001
             → scalar-generic comparison boundary
             → accepted semantics preserved
             → native H6 comparison without H5 transport
             → relation/function firewall preserved
```

Their Frozen Plans, failures, exact V5 evidence, Study/Act, lifecycle, and merge
records remain historical provenance.

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
BOMA-C-R-DEP-001             EXACT 16-PROPERTY PRODUCTION SURFACE
C-DP-001                     SELECTS C-ROUTE-P
C comparison surface         5 scalar ops + coordinate laws / INTEGRATED
BOMA C                       C-BLOCK-002 / CA-20 ACCEPTED
C permanent alternative      C-ROUTE-Q VERIFIED / NON-SELECTED
C alternative Junction       ST2-EXP-002-PQ-J-001
ST2-EXP-001..003 + 011       CLOSED / PASS / LESSONS INTEGRATED
ACTIVE EXPERIMENT            NONE
NEXT OWNER-SEQUENCED         ST2-EXP-004 / NOT ACTIVE / NO FROZEN PLAN
```

Integration authorities:

```text
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_002.md
```
