# GRAPH — Transparent Construction Graph

**Status:** ACTIVE — Canonical human-readable graph  
**Detailed topology:** `CONSTRUCTION_TOPOLOGY.md`  
**N-Core:** `N_CORE_DAG.md`  
**N-Arithmetic:** `N_ARITHMETIC_DAG.md`  
**Q:** `Q_DAG.md`  
**R:** `R_DAG.md`  
**C:** `C_DAG.md`  
**Stage-Two lifecycle:** `ST2-EXP-001..003 CLOSED / PASS / NO ACTIVE EXPERIMENT`

This file is a current topology view, not a replacement for the typed unit,
Claim, Decision, Junction, or origin ledgers.

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
Q-GATE-BLOCK-001 cancellation
   ↓
Q-F-BLOCK-001 RawFrac + FracEquiv
   ↓
Q-F-BLOCK-002 operation respect
   ↓
Q-DP-001
quotient/setoid identity selected
   ↓
Q-BLOCK-001
   ├── field algebra
   ├── unique nonzero inverse witnesses
   ├── faithful Z + coherent N embeddings
   ├── integer-fraction generation
   └── qLE total order
            ↓
QIntegrationCertificate PASS
            ↓
Q-J-002 PASS
            ↓
QA-23 ACCEPT
            ↓
Q-BLOCK-002 Accepted Stage-One Q
```

## Accepted real path

```text
Q-BLOCK-002 — accepted Q
   ↓
R-DP-001
   ├── R-ROUTE-D / Dedekind lower cuts SELECTED
   └── R-ROUTE-C / Cauchy RETAINED / VERIFIED RESEARCH
   ↓ selected canonical path
LowerCut / CutEquiv
   ↓
R-DP-002 quotient identity selected
   ↓
RBOMA := Quotient cutSetoid
   ↓
rOfQ + constructive rLE core
   ↓
R-DP-003 localized classical CutComparability selected
   ↓
R-COMP-BLOCK-001 Dedekind LUB completeness
   ↓
R-ADD-GROUP-BLOCK-001
   ↓
R-DP-004 Q approximation architecture
   ↓
R-DP-005 positive/negative multiplication architecture
   ↓
R-MUL-BLOCK-001 ordered commutative ring
   ↓
R-DP-006 direct Dedekind reciprocal selected
   ↓
R-FIELD-BLOCK-001 unique nonzero inverse witnesses
   ↓
R-DENSITY-BLOCK-001 + R-ARCH-BLOCK-001
   ↓
R-J-002 PASS
   ↓
RA-22 ACCEPT
   ↓
R-BLOCK-001 Accepted Stage-One R
   ↓
PDSA-R-015 / RE-R-001 CLOSED / COMPLETE
```

Reverse engineering preserves the distinction between acceptance-required R
properties, selected Dedekind realization, formal identity, localized logical
commitments, reusable Q infrastructure, and retained branch alternatives.

## Accepted complex path

```text
R-BLOCK-001 ACCEPTED
   ↓
BOMA-C-ACCEPT-001 representation-neutral contract
   ↓
BOMA-C-R-DEP-001 accepted-R dependency boundary
   ↓
C-DP-001 RESOLVED / USER-RATIFIED
   ├──SELECTS──► C-ROUTE-P / C-BLOCK-001
   └───────────► C-ROUTE-Q / retained research field
                       │
                       └── ST2-EXP-002-PQ-J-001
                           VERIFIED RESEARCH R-FIELD-ISOMORPHISM
   ↓ selected path
C-BLOCK-001 witness-field producer
   ↓
C-COMPARE-BLOCK-001 representation-neutral comparison
   ↓
C-J-001 PASS / SAME-CARRIER-INTEGRATION
   ↓
C-BLOCK-002 / CA-20 ACCEPT
   ↓
RE-C-001 CLOSED / COMPLETE
   ↓
RE-STAGE1-001 CLOSED / COMPLETE
```

Route Q status remains exactly:

`VERIFIED INDEPENDENT RESEARCH FIELD / NOT AN ACCEPTED EXPORT`.

`ST2-EXP-002-PQ-J-001` is not a canonical acceptance Junction and does not
replace `C-J-001`.

## Stage-Two controlled research graph — all approved experiments closed

### ST2-EXP-001

```text
R-BLOCK-001
   -- BOMA-C-R-DEP-001 --> C-BLOCK-001
             │
             └── branch: narrow real-interface packaging
                   ↓
             same downstream C adequacy
                   ↓
             ST2-EXP-001 CLOSED / PASS
```

No accepted export changed.

### ST2-EXP-002

```text
R-BLOCK-001
   ↓
C-DP-001
   ├── selected C-ROUTE-P / C-BLOCK-001
   └── independent C-ROUTE-Q research field
                 │
                 ▼
       ST2-EXP-002-PQ-J-001
       research R-field isomorphism PASS
                 │
                 ▼
       ST2-EXP-002 CLOSED / PASS
```

Accepted `C-BLOCK-002 / CA-20` remains unchanged.

### ST2-EXP-003

```text
Q-BLOCK-002
   ↓
R-DP-001
   ├── accepted R-ROUTE-D / Dedekind / R-BLOCK-001
   └── independent R-ROUTE-C / Cauchy
          ↓
      ordered field + Cauchy/LUB completeness
          ↓
      H5 Dedekind/Cauchy field isomorphism
          ↓
      ST2-EXP-003-DEDEKIND-CAUCHY-R-JUNCTION-001
          ↓
      H6 Cauchy-native seven-Claim C core rebuild
          ↓
      ST2-EXP-003 CLOSED / PASS / H1-H6 EXACT PASS
```

The Cauchy producer, research R Junction, and H6 C core remain research-only.
Canonical R remains Dedekind; canonical C remains `C-ROUTE-P`; accepted
`R-BLOCK-001 / C-BLOCK-001 / C-BLOCK-002 / CA-20` remain unchanged.

Final exact-verified pre-merge head:

`3d4ed58e5d88b2a0bd84b3958cac2c8572385152`.

PR #8 merge to `main`:

`5431ac81e7327f5bf4b06b3ab7fdb2bcb5b69efd`.

Lifecycle closure authority:

`LAB/PDSA/experiments/ST2-EXP-003_LIFECYCLE_CLOSURE_001.md`.

## Current frontier

```text
Pre-numerical layer     CALIBRATED
BOMA N-Core             ACCEPTED
BOMA N-Arithmetic       ACCEPTED
BOMA Z                  ACCEPTED
post-Z reverse N        CLOSED / COMPLETE
BOMA Q                  ACCEPTED
BOMA R                  ACCEPTED — R-BLOCK-001 / DEDEKIND
RE-R-001                CLOSED / COMPLETE
BOMA C                  ACCEPTED — C-BLOCK-002 / CA-20
C-DP-001                RESOLVED — C-ROUTE-P SELECTED / C-ROUTE-Q RETAINED
RE-C-001                CLOSED / COMPLETE
RE-STAGE1-001           CLOSED / COMPLETE
ST2-EXP-001             CLOSED / PASS
ST2-EXP-002             CLOSED / PASS
ST2-EXP-003             CLOSED / PASS
NO ACTIVE EXPERIMENT
NEXT EXPERIMENT SLOT    OPEN / OWNER SELECTION REQUIRED
```

Typed experiment origin and lifecycle authority is maintained in:

```text
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.md
LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md
```

Future candidates are proposals only until explicitly owner-selected and
frozen in a new PDSA Plan.