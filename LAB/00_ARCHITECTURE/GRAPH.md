# GRAPH — Transparent Construction Graph

**Status:** ACTIVE — Canonical human-readable graph  
**Detailed topology:** `CONSTRUCTION_TOPOLOGY.md`  
**N-Core:** `N_CORE_DAG.md`  
**N-Arithmetic:** `N_ARITHMETIC_DAG.md`  
**Q:** `Q_DAG.md`  
**R:** `R_DAG.md`  
**C:** `C_DAG.md`

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
addition split/reconvergence
   ↓
multiplication split/reconvergence
   ↓
order split/reconvergence
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
                                                          │
                direct arithmetic ───────┐                │
                pair arithmetic   ───────┴─► Z-ARITH-J-001 PASS
                                                          ▼
                                                 commutative ring
                                                          │
                direct order      ───────┐                │
                pair order        ───────┴─► Z-ORD-J-001 PASS
                                                          ▼
                                                  ordered ring
                                                          ▼
                                                   Z-J-002 PASS
                                                          ▼
                                                   ZA-21 ACCEPT
                                                          ▼
                                                   Z-BLOCK-002
                                             Accepted Stage-One Z
```

## Mandatory post-Z reverse engineering

```text
Z-BLOCK-002
   ├──► Z-RE-BLOCK-001 nonnegative cone
   └──► Z-RE-BLOCK-002 successor reachability
                 ↓
         reverse candidates V5 PASS
                 ↓
         compare with bottom-up N
                 ↓
           Z-RE-J-001 PASS
                 ↓
INTERFACE RECONVERGENCE / PROVENANCE DIVERGENCE
```

The extensional Z interface recovers substantial N-like structure but does not recover pre-numerical/TCT/PDSA provenance.

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
reduced/external-setoid alternatives retained
   ↓
Q-BLOCK-001
   ├── field algebra
   ├── unique nonzero inverse witnesses
   ├── faithful Z + coherent N embeddings
   ├── integer-fraction generation
   └── qLE total order
            │
            ├── additive/negation order compatibility
            └── nonnegative multiplication + positive inverse behavior
                         ↓
              QIntegrationCertificate PASS
                         ↓
                    Q-J-002 PASS
                         ↓
                    QA-23 ACCEPT
                         ↓
                    Q-BLOCK-002
              Accepted Stage-One Q
```

## Accepted real path

```text
Q-BLOCK-002 — accepted Q
   ↓
shared Q order / density / approximation contributions
   ↓
R-DP-001
   ├── Dedekind lower cuts SELECTED
   └── Cauchy route RETAINED
   ↓
LowerCut / CutEquiv
   ↓
R-DP-002
quotient identity selected
external CutEquiv identity retained
   ↓
RBOMA := Quotient cutSetoid
   ↓
rOfQ + constructive rLE core
   ↓
R-DP-003
localized classical CutComparability selected
   ↓
R-COMP-BLOCK-001
Dedekind LUB completeness
   ↓
R-ADD-BLOCK-001 + R-NEG-CANDIDATE-BLOCK-001
   ↓
R-DP-004 / R-QARCH-BLOCK-001
   ↓
R-ADD-GROUP-BLOCK-001
   ↓
R-DP-005
positive/negative-part multiplication selected
   ↓
R-MUL-BLOCK-001 ordered commutative ring
   ↓
R-DP-006
direct positive Dedekind reciprocal selected
completeness-level inverse retained
   ↓
R-FIELD-BLOCK-001
unique nonzero inverse witnesses
   ↓
R-DENSITY-BLOCK-001 + R-ARCH-BLOCK-001
   ↓
explicit ordered-field closure
   ↓
R-J-002 PASS
   ↓
RA-22 ACCEPT
   ↓
R-BLOCK-001
Accepted Stage-One R
```

## Post-R reverse engineering — COMPLETED

```text
R-BLOCK-001 ACCEPTED
   ↓
PDSA-R-015 / RE-R-001
   ↓
backward classification
   ├── interface-required properties
   ├── Dedekind-specific realizations
   ├── quotient formalization choice
   ├── localized logical commitments
   ├── reusable Q-level contributions
   ├── proof/CI infrastructure
   └── retained alternative branches
   ↓
RE-R-001 CLOSED / COMPLETE
```

Primary reverse classifications:

```text
R-DP-001 Dedekind             ROUTE-SPECIFIC / branch candidate
R-DP-002 quotient identity    FORMALIZATION CHOICE / branch candidate
R-DP-003 CutComparability     LOGICAL COMMITMENT / branch candidate
R-COMP LUB property           acceptance-required
R-COMP union realization      Dedekind-specific
R-DP-004 Q arithmetic         reusable; cut search route-specific
R-DP-005 multiplication       selected architecture / branch candidate
R-DP-006 reciprocal           Dedekind-specific / branch candidate
RA-12 / RA-13 properties      acceptance-required with route-specific proofs
```

Canonical reverse matrix:

```text
LAB/PDSA/experiments/PDSA-R-015-RE-R-001-DEPENDENCY-CLASSIFICATION.md
```

No accepted R theorem was changed by the reverse audit.

## Complex stage — STARTED / REPRESENTATION UNSELECTED

The prior C hold was explicitly lifted by the user on 2026-08-21. Current C work begins at the acceptance layer:

```text
R-BLOCK-001 ACCEPTED
   ↓
RE-R-001 CLOSED / COMPLETE
   ↓
BOMA-C-ACCEPT-001
ex-ante representation-neutral contract
   ↓
BOMA-C-R-DEP-001
accepted-R dependency boundary
   ↓
PDSA-C-001
acceptance discriminant CLOSED
   ├──► PDSA-C-002 CLOSED — accepted-R interface V5 32564789630 PASS
   │      C-RL-001 / C-RL-002 verified supporting theorems
   │      C-RQ-001 CLOSED / PASS
   └──► PDSA-C-003 CLOSED — V5 32565335033 PASS
          C-DP-001 OPEN — DECISION-READY
          ├──► C-ROUTE-P V5 PASS / RECOMMENDED
          ├──► C-ROUTE-Q V5 PASS / RETAINED
          └──► C-ROUTE-A only if genuinely independent

run = 32565335033 at 3f670372a022d1eb95109d36cde255b3504dda12
C-DP-001 = OPEN / user ratification pending
SELECTS = NONE
```

The accepted semantic target is:

```text
faithful R field embedding
+
distinguished I with I²=-1
+
every C element has a unique a+bI decomposition over R
```

The following are **not** yet canonical graph nodes because no independently reviewable construction unit exists for them:

```text
C-ROUTE-P as a Block
C-ROUTE-Q as a Block
any C Brick
any C Junction
any accepted C aggregate Block
```

Algebraic closure is explicitly deferred from the Stage-One acceptance contract rather than silently imported as a carrier-defining obligation.

## Verification evidence

```text
N-Core                         32163771789
N addition                     32164861155
N multiplication               32165318266
N order                        32165691581
Z representation               32168105466
Z arithmetic convergence       32169328837
Z ring laws                    32169564747
Z order convergence            32169832933
Z ordered-ring laws            32170144944
Z→N reverse core               32170817620
Z→N bottom-up comparison       32171528363
Q cancellation                 32172230166
Q fraction equivalence         32172543345
Q raw arithmetic               32173010564
Q quotient carrier             32174050137
Q additive laws                32174565823
Q multiplicative laws          32176289914
Q distributivity               32176439510
Q inverse witness              32176692789
Q embeddings                   32177123730
Q generation                   32177245619
Q order core                   32177345921
Q order additive compatibility 32177896509
Q order multiplicative compat  32178098823
Q full integration             32178326013
R identity / Q embedding       32180783725
R order logic split            32181726522
R Dedekind completeness        32182056311
R additive inverse             32186543211
R signed multiplication        32189753112
R ordered ring                 32192653931
R nonzero inverse              32356513408
R rational density             32359834460
R Archimedean                  32359869558
R final integration            32374868448
Lean                           4.32.1
C boundary supporting V5       32564789630 PASS
```

No C proof result is inferred from the historical N→R evidence.

## Current frontier

```text
Pre-numerical layer     CALIBRATED
BOMA N-Core             ACCEPTED
BOMA N-Arithmetic       ACCEPTED
BOMA Z                  ACCEPTED
post-Z reverse N        CLOSED
BOMA Q                  ACCEPTED
BOMA R                  ACCEPTED
RE-R-001                CLOSED / COMPLETE
BOMA C                  STARTED — ACCEPTANCE SPEC ACTIVE
C-DP-001                OPEN — NO ROUTE SELECTED
C accepted export       NONE
```

The current graph therefore extends into C only through acceptance, dependency, learning, and Decision layers. It does not draw a representation-selection arrow that has not been earned by evidence.