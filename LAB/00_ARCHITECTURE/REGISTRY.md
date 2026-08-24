# REGISTRY — Canonical Construction Unit Registry

**Status:** ACTIVE — Canonical registry  
**Topology:** `CONSTRUCTION_TOPOLOGY.md`  
**N-Core:** `N_CORE_DAG.md`  
**N-Arithmetic:** `N_ARITHMETIC_DAG.md`  
**Q:** `Q_DAG.md`  
**R:** `R_DAG.md`  
**C:** `C_DAG.md`  
**Stage-Two lifecycle:** `ST2-EXP-001..003 CLOSED / PASS / NO ACTIVE EXPERIMENT`

Operational, verification, research, and acceptance status remain separate.

## Pre-numerical TCT

| ID | Type | Role | Status |
|---|---|---|---|
| TCT-BLOCK-001 | Block | Construction Kernel | ACTIVE |
| TCT-BLOCK-002 | Block | Generated Selected Configurations | ACTIVE |
| TCT-BR-010 | Brick | Structural equivalence `≈` | ACTIVE — declared identity specification |
| TCT-BR-009 | Brick | Terminal preservation | ACTIVE — derived under BR-010 |
| TCT-J-001 | Junction | Canonical decomposition gate | PASS |
| TCT-BLOCK-003 | Block | Canonical Decomposition | ACTIVE |
| TCT-BLOCK-004 | Block | Structural Iteration History | ACTIVE |
| TCT-BLOCK-005 | Block | Successor-Like Extension | ACTIVE |
| TCT-BLOCK-006 | provenance aggregate | old monolithic N candidate | DECOMPOSED / PROVENANCE |

## Natural-number core — ACCEPTED

| ID | Role | Status |
|---|---|---|
| N-DP-001 | Stage-One realization regime | RESOLVED — R-B selected |
| N-DP-002 | eliminator / universe scope | RESOLVED |
| N-J-001 | core reconvergence | PASS |
| N-J-002 | final core integration | PASS |
| N-BLOCK-007 | accepted N-Core export | ACTIVE — ACCEPTED |

Canonical detailed units remain `N-BR-001..020` and `N-BLOCK-001..007`.

```text
NAC-01..14 PASS
NAC-15 ACCEPT
V5 32163771789 / Lean 4.32.1
```

## Natural-number arithmetic — ACCEPTED

| Unit | Role | Status |
|---|---|---|
| N-ADD-BLOCK-001 | right-recursive addition route | PASS / V5 |
| N-ADD-BLOCK-002 | left-recursive addition route | PASS / V5 |
| N-ADD-J-001 | addition route convergence | PASS |
| N-ADD-BLOCK-003 | canonical addition + laws | ACTIVE / PASS |
| N-MUL-BLOCK-001 | right-recursive multiplication route | PASS / V5 |
| N-MUL-BLOCK-002 | left-recursive multiplication route | PASS / V5 |
| N-MUL-J-001 | multiplication route convergence | PASS |
| N-MUL-BLOCK-003 | canonical multiplication + laws | ACTIVE / PASS |
| N-ORD-BLOCK-001 | additive-witness order route | PASS / V5 |
| N-ORD-BLOCK-002 | N-Core-only inductive order route | PASS / V5 |
| N-ORD-J-001 | order route equivalence | PASS |
| N-ORD-BLOCK-003 | canonical total order + laws | ACTIVE / PASS |
| N-ORD-BLOCK-004 | arithmetic/order compatibility | ACTIVE / PASS |
| N-ARITH-J-001 | arithmetic integration | PASS / RESOLVED |
| N-ARITH-BLOCK-001 | accepted arithmetic export | ACTIVE — ACCEPTED |

```text
addition V5       32164861155
multiplication V5 32165318266
order V5          32165691581
NAA-01..17 PASS
NAA-18 ACCEPT
```

## Integer stage — ACCEPTED

| Unit | Role | Status |
|---|---|---|
| Z-S-BLOCK-001 | signed normal forms | SELECTED / V5 PASS |
| Z-D-BLOCK-001 | difference pairs + equivalence | RETAINED / V5 PASS |
| Z-J-001 | representation convergence | PASS / RESOLVED |
| Z-DP-001 | canonical representation | RESOLVED — signed selected |
| Z-BLOCK-001 | selected carrier / identity | ACTIVE |
| Z-ARITH-J-001 | arithmetic convergence | PASS / RESOLVED |
| Z-ARITH-BLOCK-003 | commutative-ring package | ACTIVE / PASS |
| Z-ORD-J-001 | order convergence | PASS / RESOLVED |
| Z-ORD-BLOCK-001 | canonical ordered-integer interface | ACTIVE / PASS |
| Z-J-002 | final integer integration | PASS / RESOLVED |
| Z-BLOCK-002 | accepted Stage-One integer export | ACTIVE — ACCEPTED |

```text
representation 32168105466
arithmetic     32169328837
ring laws      32169564747
order          32169832933
ordered ring   32170144944
ZA-01..20 PASS
ZA-21 ACCEPT
```

## Mandatory post-Z reverse engineering — CLOSED

| Unit | Role | Status |
|---|---|---|
| Z-RE-BLOCK-001 | nonnegative-cone candidate | Z-ONLY V5 PASS |
| Z-RE-BLOCK-002 | successor-reachability candidate | Z-ONLY V5 PASS |
| Z-RE-J-001 | compare reverse N-from-Z with bottom-up N | PASS / RESOLVED |

Classification: **INTERFACE RECONVERGENCE / PROVENANCE DIVERGENCE**.

## Rational stage — ACCEPTED

| Unit | Role | Status |
|---|---|---|
| Q-GATE-BLOCK-001 | nonzero multiplication cancellation | ACTIVE / V5 PASS |
| Q-F-BLOCK-001 | positive-denominator RawFrac + FracEquiv | ACTIVE / V5 PASS |
| Q-F-BLOCK-002 | equivalence-respecting raw arithmetic | ACTIVE / V5 PASS |
| Q-DP-001 | formal identity realization | RESOLVED — quotient/setoid selected |
| Q-BLOCK-001 | quotient carrier / lifted operations | ACTIVE / V5 PASS |
| Q-J-002 | final rational integration | PASS / RESOLVED |
| Q-BLOCK-002 | accepted Stage-One rational export | ACTIVE — ACCEPTED |

```text
full Q integration 32178326013 PASS
QA-01..16 PASS
QA-17 NOT TRIGGERED AS MULTI-CARRIER GATE
QA-18 RESOLVED
QA-19..22 PASS
QA-23 ACCEPT
```

## Real stage — ACCEPTED

### Decisions

| Unit | Role | Status |
|---|---|---|
| R-DP-001 | completion route | RESOLVED — Dedekind selected; Cauchy retained as verified research |
| R-DP-002 | formal real identity | RESOLVED — quotient `cutSetoid` selected |
| R-DP-003 | total-order logical regime | RESOLVED — localized classical comparability selected |
| R-DP-004 | Q Archimedean approximation route | RESOLVED — reusable route selected |
| R-DP-005 | multiplication sign architecture | RESOLVED — positive/negative decomposition selected |
| R-DP-006 | inverse architecture | RESOLVED — direct Dedekind reciprocal selected |

### Canonical construction units

| Unit | Role | Status |
|---|---|---|
| R-COMP-BLOCK-001 | Dedekind LUB completeness | ACTIVE / V5 PASS |
| R-ADD-BLOCK-001 | representative-independent addition | ACTIVE / V5 PASS |
| R-NEG-CANDIDATE-BLOCK-001 | Dedekind negation candidate | ACTIVE / V5 PASS |
| R-QARCH-BLOCK-001 | Q Archimedean/fine-bracketing gateway | ACTIVE / V5 PASS |
| R-ADD-GROUP-BLOCK-001 | additive group | ACTIVE / V5 PASS |
| R-MUL-BLOCK-001 | ordered commutative ring | ACTIVE / V5 PASS |
| R-FIELD-BLOCK-001 | nonzero inverse witness interface | ACTIVE / V5 PASS |
| R-DENSITY-BLOCK-001 | Q image dense in R | ACTIVE / V5 PASS |
| R-ARCH-BLOCK-001 | Archimedean characterization | ACTIVE / V5 PASS |
| R-J-002 | final Stage-One R integration | PASS / RESOLVED |
| R-BLOCK-001 | accepted Stage-One real export | ACTIVE — ACCEPTED |

```text
R final acceptance-strength R-J-002 32374868448 PASS
RA-22 ACCEPT
Lean 4.32.1
```

### Real-stage reverse engineering

| Gate | Role | Status |
|---|---|---|
| RE-R-001 | backward dependency/commitment/branch classification | CLOSED / COMPLETE — PDSA-R-015 |

The reverse audit retains Dedekind route, quotient identity, localized
comparability, multiplication architecture, and reciprocal architecture as
classified choices/commitments rather than universal necessities.

## Complex stage — ACCEPTED / CA-20

| Unit / record | Role | Status |
|---|---|---|
| BOMA-C-ACCEPT-001 | representation-neutral Stage-One C acceptance specification | ACTIVE |
| BOMA-C-R-DEP-001 | accepted-R dependency contract | ACTIVE |
| PDSA-C-001 | acceptance-contract discriminant | CLOSED |
| PDSA-C-002 | accepted-R interface sufficiency probe | CLOSED — V5 32564789630 PASS |
| PDSA-C-003 | comparable candidate-route probes | CLOSED — V5 32565335033 PASS |
| PDSA-C-004 | selected Route P ring core | CLOSED — V5 32574270735 PASS |
| PDSA-C-005 | conjugate/norm/witness field closure | CLOSED — V5 32574920935 PASS |
| PDSA-C-006 | representation-neutral quadratic comparison | CLOSED — V5 32575465002 PASS |
| PDSA-C-007 | final C integration and Claim transparency | CLOSED — V5 32585583815 PASS |
| PDSA-C-008 | final Stage-One C acceptance decision | CLOSED — CA-20 ACCEPT / 32586145793 PASS |
| PDSA-C-009 | accepted-complex reverse audit | CLOSED — RE-C-001 COMPLETE |
| PDSA-STAGE1-001 | global accepted-chain reverse audit | CLOSED — RE-STAGE1-001 COMPLETE |
| C-DP-001 | Stage-One realization route | RESOLVED — USER-SELECTED C-ROUTE-P; C-ROUTE-Q RETAINED |
| C-BLOCK-001 | selected Route P witness-field producer | ACTIVE / V5 PASS / ACCEPTED PRODUCER |
| C-COMPARE-BLOCK-001 | universal quadratic comparison | ACTIVE / V5 PASS |
| C-J-001 | selected same-carrier integration and nine-Claim closure | PASS — V5 32585583815 |
| C-BLOCK-002 | final downstream Stage-One complex export | ACTIVE — ACCEPTED / CA-20 |

Route state:

```text
C-ROUTE-P  SELECTED ordered-pair / rank-two Stage-One producer
C-ROUTE-Q  VERIFIED INDEPENDENT RESEARCH FIELD / NOT AN ACCEPTED EXPORT
C-ROUTE-A  conditional genuinely independent alternative
```

## Stage-Two controlled research — CLOSED FRONTIER

| Unit / record | Architectural origin | Status |
|---|---|---|
| STAGE-TWO-LAB | controlled single-change experiment register | THREE CLOSED / NO ACTIVE EXPERIMENT / NEXT SLOT OPEN |
| ST2-EXP-001 | `DEPENDENCY_EDGE / BOMA-C-R-DEP-001` | CLOSED / PASS — V5 32593045224 |
| ST2-EXP-002 | `DECISION_POINT / C-DP-001` | CLOSED / PASS — final V5 32597346281 |
| ST2-EXP-002-PQ-J-001 | Route P / independent Route Q reconvergence | VERIFIED RESEARCH JUNCTION / NOT A CANONICAL ACCEPTANCE JUNCTION |
| ST2-EXP-003 | `DECISION_POINT / R-DP-001` above `Q-BLOCK-002` | CLOSED / PASS / H1-H6 EXACT PASS |
| ST2-EXP-003-DEDEKIND-CAUCHY-R-JUNCTION-001 | accepted Dedekind / independent Cauchy reconvergence | VERIFIED RESEARCH JUNCTION / NOT A CANONICAL ACCEPTANCE JUNCTION |

ST2-EXP-003 final exact-verified head:

`3d4ed58e5d88b2a0bd84b3958cac2c8572385152`.

Critical final runs:

```text
Independent Cauchy Real Route              32727267231 PASS
Dedekind-Cauchy Comparison / Research R J  32727267177 PASS
Cauchy Quadratic Rebuild                    32727267183 PASS
```

PR #8 merged the exact-verified tree into `main` as
`5431ac81e7327f5bf4b06b3ab7fdb2bcb5b69efd`; lifecycle closure was explicitly
owner-authorized on 2026-08-24.

The Cauchy real producer and H6 C core remain research-only. Accepted
`R-BLOCK-001`, `C-BLOCK-001`, `C-BLOCK-002`, `C-ROUTE-P`, and `CA-20` are
unchanged.

Typed origin/lifecycle authority:

```text
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json
LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.md
LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md
LAB/PDSA/experiments/ST2-EXP-003_LIFECYCLE_CLOSURE_001.md
```

## Current frontier

```text
Pre-numerical       CALIBRATED
N-Core              ACCEPTED
N-Arithmetic        ACCEPTED
Z                   ACCEPTED
post-Z reverse N    CLOSED / COMPLETE
Q                   ACCEPTED
R                   ACCEPTED — R-BLOCK-001 / DEDEKIND
RE-R-001            CLOSED / COMPLETE
C                   ACCEPTED — C-BLOCK-002 / CA-20
RE-C-001            CLOSED / COMPLETE
RE-STAGE1-001       CLOSED / COMPLETE
ST2-EXP-001         CLOSED / PASS
ST2-EXP-002         CLOSED / PASS
ST2-EXP-003         CLOSED / PASS
NO ACTIVE EXPERIMENT
NEXT EXPERIMENT SLOT OPEN / OWNER SELECTION REQUIRED
C representation    C-ROUTE-P USER-SELECTED / C-ROUTE-Q VERIFIED RESEARCH FIELD
C research Junction ST2-EXP-002-PQ-J-001 / R-FIELD-ISOMORPHISM / NOT ACCEPTANCE
C accepted export   C-BLOCK-002 / CA-20 ACCEPT
```

The previous C hold remains historical provenance in earlier dated records. It
was explicitly lifted on 2026-08-21. Candidate registration does not authorize
a new Stage-Two experiment.