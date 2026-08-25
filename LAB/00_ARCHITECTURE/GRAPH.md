# GRAPH — Transparent Construction Graph

**Status:** ACTIVE — Canonical human-readable graph  
**Detailed topology:** `CONSTRUCTION_TOPOLOGY.md`  
**N-Core:** `N_CORE_DAG.md`  
**N-Arithmetic:** `N_ARITHMETIC_DAG.md`  
**Q:** `Q_DAG.md`  
**R:** `R_DAG.md`  
**C:** `C_DAG.md`  
**Learning integration:** `ST2-EXP-001..004 + ST2-EXP-011 CLOSED / PASS / VERIFIED LESSONS INTEGRATED`  
**Active experiment:** `NONE`.

This file is a current topology view, not a replacement for typed unit, Claim, Decision, Junction, origin, or evidence records.

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

## Accepted integer and rational path

```text
N-ARITH-BLOCK-001
   ↓
Z-DP-001 / signed selected; pair route retained
   ↓
Z-J-002 PASS → Z-BLOCK-002 ACCEPTED Z
   ↓
post-Z reverse N study / Z-RE-J-001 PASS
   ↓
Q-GATE-BLOCK-001
   ↓
RawFrac + FracEquiv + operation respect
   ↓
Q-DP-001 quotient/setoid identity selected
   ↓
Q-J-002 PASS → Q-BLOCK-002 ACCEPTED Q
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
   │             R-DP-002 → RBOMA
   │                 ↓
   │             constructive rLE partial-order core
   │                 ↓
   │             R-DP-003
   │             SELECTS localized classical F-04 CutComparability
   │             integrated boundary: RTotality ↔ CutComparability
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

`R-DP-001` still selects Dedekind. The Cauchy branch is permanent, verified, non-selected, and not an accepted export.

## R-DP-003 logical-regime boundary — ST2-EXP-004 integrated

The accepted Stage-I decision remains:

```text
constructive rLE partial-order core
+
localized classical F-04 CutComparability witness
+
constructive totality-from-CutComparability bridge
```

`ST2-EXP-004` changed only the F-04 provider in research assemblies while preserving the accepted carrier, quotient identity, order relation, operations, accepted Q/R/C manifests, and independent F-05/F-06/F-07 logical providers.

Permanent same-carrier fact:

```text
RTotality ↔ CutComparability
```

No unconditional constructive `CutComparability` was recovered from the frozen `LowerCut` interface. Therefore:

```text
conditional CutComparability interface ≠ constructive recovery
NO F-04 dependency                  ≠ fully constructive R
formal ancestry                     ≠ mathematical necessity
```

Gate-A measured current declaration impact:

```text
F04_DIRECT 8
F04_TRANSITIVE 7
F04_FREE 22
OTHER_CLASSICAL_ONLY 18
```

Gate B retained `77 / 88` accepted-manifest R files in a research-only whole-source no-F04 survivor assembly. This is source-packaging evidence, not an impossibility theorem.

A located-cut redesign would change the representation and is only a separately authorized future candidate.

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

`ST2-EXP-001` proved the selected C Claim meaning survives over this exact sixteen-property production interface.

`ST2-EXP-004` subsequently removed exactly `orderTotal` in a controlled C sensitivity probe. Seven accepted C Claim families survived; current `C-CL-FIELD-001` and `C-CL-INTEGRATION-001` proof closures did not. The measured non-survival is transitive through the current square/nonnegative → norm → field path and is not a mathematical-necessity theorem.

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

```text
C PRODUCTION surface
  = sixteen-property BOMA-C-R-DEP-001

C COMPARISON surface
  = zero/one/neg/add/mul + explicit coordinate laws
  = C-COMPARE-BLOCK-001 / C-CL-COMPARE-001
```

The accepted RBOMA adapter preserves the old `Related` semantics definitionally. The generic comparison interface also instantiates directly over the verified RCBOMA/H6 research producer without H5 `cToD` or selected Dedekind implementation transport.

This does not replace accepted comparison sources and does not create a new Block, Decision Point, or Junction.

Gate E of `ST2-EXP-004` confirms `C-CL-COMPARE-001` remains in the survivor set when only production `orderTotal` is removed.

## Learning Graph provenance

```text
ST2-EXP-001  DEPENDENCY_EDGE / BOMA-C-R-DEP-001
             → exact sixteen-property production R→C surface

ST2-EXP-002  DECISION_POINT / C-DP-001
             → complete Route Q + ST2-EXP-002-PQ-J-001

ST2-EXP-003  DECISION_POINT / R-DP-001
             → complete Cauchy R + ST2-EXP-003-R-J-001 + H6 evidence

ST2-EXP-011  BLOCK / C-COMPARE-BLOCK-001
             → scalar-generic comparison boundary
             → relation/function firewall

ST2-EXP-004  DECISION_POINT / R-DP-003
             → exact F-04 proof/package impact
             → RTotality ↔ CutComparability on unchanged representation
             → no unconditional constructive totality recovered
             → orderTotal downstream C sensitivity classified
             → F-05/F-06/F-07 remain independent controls
```

Frozen Plans, failures, exact CI evidence, Study/Act, lifecycle, and merge records remain historical provenance.

## Current frontier

```text
Pre-numerical layer          CALIBRATED
BOMA N-Core                  ACCEPTED
BOMA N-Arithmetic            ACCEPTED
BOMA Z                       ACCEPTED
post-Z reverse N             CLOSED / COMPLETE
BOMA Q                       ACCEPTED
R-DP-001                     SELECTS DEDEKIND
R-DP-003                     SELECTS LOCALIZED CLASSICAL COMPARABILITY / LESSON INTEGRATED
BOMA R                       R-BLOCK-001 ACCEPTED
R permanent alternative      CAUCHY VERIFIED / NON-SELECTED
R alternative Junction       ST2-EXP-003-R-J-001
BOMA-C-R-DEP-001             EXACT 16-PROPERTY PRODUCTION SURFACE
C-DP-001                     SELECTS C-ROUTE-P
C comparison surface         5 scalar ops + coordinate laws / INTEGRATED
BOMA C                       C-BLOCK-002 / CA-20 ACCEPTED
C permanent alternative      C-ROUTE-Q VERIFIED / NON-SELECTED
C alternative Junction       ST2-EXP-002-PQ-J-001
ST2-EXP-001..004 + 011       CLOSED / PASS / LESSONS INTEGRATED
ACTIVE EXPERIMENT            NONE
NEXT EXPERIMENT              NOT AUTHORIZED
REQUIRED NEXT ACT            STOP / OWNER AUTHORIZATION REQUIRED
```

Integration authorities:

```text
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_002.md
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_003.md
```