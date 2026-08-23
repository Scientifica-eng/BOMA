# REGISTRY — Canonical Construction Unit Registry

**Status:** ACTIVE — Canonical registry  
**Topology:** `CONSTRUCTION_TOPOLOGY.md`  
**N-Core:** `N_CORE_DAG.md`  
**N-Arithmetic:** `N_ARITHMETIC_DAG.md`  
**Q:** `Q_DAG.md`  
**R:** `R_DAG.md`  
**C:** `C_DAG.md`

Operational, verification, and epistemic status remain separate.

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

Formalization decisions:

| ID | Role | Status |
|---|---|---|
| N-DP-001 | Stage-One realization regime | RESOLVED — R-B selected |
| N-DP-002 | eliminator / universe scope | RESOLVED |

Canonical detailed units are `N-BR-001..020`, `N-BLOCK-001..007`, `N-J-001`, `N-J-002`.

```text
N-J-001 PASS
N-J-002 PASS
NAC-01..14 PASS
NAC-15 ACCEPT
N-BLOCK-007 ACTIVE — ACCEPTED N-CORE EXPORT
V5 32163771789 / Lean 4.32.1
```

## Natural-number arithmetic — ACCEPTED

### Addition

| Unit | Role | Status |
|---|---|---|
| N-ADD-BLOCK-001 | right-recursive route | PASS / V5 |
| N-ADD-BLOCK-002 | left-recursive route | PASS / V5 |
| N-ADD-J-001 | route convergence | PASS |
| N-ADD-BLOCK-003 | canonical addition + laws | ACTIVE / PASS |

V5 `32164861155`.

### Multiplication

| Unit | Role | Status |
|---|---|---|
| N-MUL-BLOCK-001 | right-recursive route | PASS / V5 |
| N-MUL-BLOCK-002 | left-recursive route | PASS / V5 |
| N-MUL-J-001 | route convergence | PASS |
| N-MUL-BLOCK-003 | canonical multiplication + laws | ACTIVE / PASS |

V5 `32165318266`.

### Order / integration

| Unit | Role | Status |
|---|---|---|
| N-ORD-BLOCK-001 | additive-witness route | PASS / V5 |
| N-ORD-BLOCK-002 | N-Core-only inductive route | PASS / V5 |
| N-ORD-J-001 | route equivalence | PASS |
| N-ORD-BLOCK-003 | canonical total order + laws | ACTIVE / PASS |
| N-ORD-BLOCK-004 | arithmetic/order compatibility | ACTIVE / PASS |
| N-ARITH-J-001 | arithmetic integration | PASS / RESOLVED |
| N-ARITH-BLOCK-001 | accepted arithmetic export | ACTIVE — ACCEPTED |

```text
order V5 32165691581
NAA-01..17 PASS
NAA-18 ACCEPT
```

## Integer stage — ACCEPTED

Representation:

| Unit | Role | Status |
|---|---|---|
| Z-S-BLOCK-001 | signed normal forms | SELECTED / V5 PASS |
| Z-D-BLOCK-001 | difference pairs + equivalence | RETAINED / V5 PASS |
| Z-J-001 | representation convergence | PASS / RESOLVED |
| Z-DP-001 | canonical representation | RESOLVED — signed selected |
| Z-BLOCK-001 | selected carrier / identity | ACTIVE |

Arithmetic/order/closure:

| Unit | Role | Status |
|---|---|---|
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

```text
Z-only reverse 32170817620 PASS
comparison     32171528363 PASS
classification INTERFACE RECONVERGENCE / PROVENANCE DIVERGENCE
```

## Rational stage — ACCEPTED

Construction/identity:

| Unit | Role | Status |
|---|---|---|
| Q-GATE-BLOCK-001 | nonzero multiplication cancellation | ACTIVE / V5 PASS |
| Q-F-BLOCK-001 | positive-denominator RawFrac + FracEquiv | ACTIVE / V5 PASS |
| Q-F-BLOCK-002 | equivalence-respecting raw arithmetic | ACTIVE / V5 PASS |
| Q-DP-001 | formal identity realization | RESOLVED — quotient/setoid selected |
| Q-BLOCK-001 | quotient carrier / identity / lifted operations | ACTIVE / V5 PASS |
| Q-J-002 | final rational integration | PASS / RESOLVED |
| Q-BLOCK-002 | accepted Stage-One rational export | ACTIVE — ACCEPTED |

Accepted Q interface includes field/order laws, unique nonzero inverse witnesses, faithful Z/coherent N embeddings, integer-fraction generation, translation invariance, negation reversal, nonnegative multiplication monotonicity, and positive inverse behavior.

```text
full Q integration 32178326013 PASS
QA-01..16 PASS
QA-17 NOT TRIGGERED AS MULTI-CARRIER GATE
QA-18 RESOLVED
QA-19..22 PASS
QA-23 ACCEPT
```

## Real stage — ACCEPTED

### Completion / identity / logical decisions

| Unit | Role | Status |
|---|---|---|
| R-DP-001 | completion route | RESOLVED — Dedekind selected; Cauchy retained |
| R-DP-002 | formal real identity | RESOLVED — quotient `cutSetoid` selected |
| R-DP-003 | total-order logical regime | RESOLVED — localized classical comparability selected |
| R-DP-004 | rational Archimedean approximation route | RESOLVED — reusable Route A selected |
| R-DP-005 | multiplication sign architecture | RESOLVED — positive/negative decomposition selected |
| R-DP-006 | multiplicative-inverse architecture | RESOLVED — direct Dedekind reciprocal selected |

### Canonical R construction Blocks

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

Key evidence:

```text
identity / Q embedding             32180783725 PASS
order logical split                32181726522 PASS
Dedekind completeness              32182056311 PASS
addition                           32183597094 PASS
Q-addition preservation            32183864915 PASS
additive laws                      32184188077 PASS
negation                           32184767097 PASS
additive inverse                   32186543211 PASS
signed multiplication              32189753112 PASS
multiplication basic laws          32191203164 PASS
multiplication associativity       32191975377 PASS
distributivity                     32192506728 PASS
ordered ring                       32192653931 PASS
positive inverse product           32355681924 PASS
positive inverse relation          32356254961 PASS
nonzero inverse                    32356513408 PASS
Q density in R                     32359834460 PASS
R Archimedean                      32359869558 PASS
final acceptance-strength R-J-002 32374868448 PASS
Lean                               4.32.1
```

Acceptance:

```text
RA-01..15 PASS / RA-15 RESOLVED
RA-16 NOT TRIGGERED — correctly discharged
RA-17..20 PASS
RA-21 PASS / R-J-002 RESOLVED
RA-22 ACCEPT
```

Closure:

`LAB/PDSA/PDSA-R-014_STAGE_ONE_REAL_CLOSURE.md`

### Real-stage reverse engineering — CLOSED

| Gate | Role | Status |
|---|---|---|
| RE-R-001 | backward dependency/commitment/branch classification | CLOSED / COMPLETE — `PDSA-R-015` |

Canonical matrix:

`LAB/PDSA/experiments/PDSA-R-015-RE-R-001-DEPENDENCY-CLASSIFICATION.md`

Principal classifications:

```text
Dedekind route            ROUTE-SPECIFIC / branch candidate
quotient identity         FORMALIZATION CHOICE / branch candidate
classical comparability   LOGICAL COMMITMENT / branch candidate
LUB property              acceptance-required; union proof Dedekind-specific
Q arithmetic gateways     reusable certified contributions
multiplication route      selected architecture / branch candidate
direct reciprocal route  Dedekind-specific / branch candidate
R density + Archimedean   acceptance-required properties with route-specific proofs
```

The reverse audit does not revoke or weaken `RA-22`.

## Complex stage — ACCEPTED / CA-20

### Ex-ante acceptance and dependency architecture

| Unit / record | Role | Status |
|---|---|---|
| `BOMA-C-ACCEPT-001` | representation-neutral Stage-One C acceptance specification | ACTIVE |
| `BOMA-C-R-DEP-001` | accepted-R dependency contract | ACTIVE |
| `PDSA-C-001` | acceptance-contract discriminant | CLOSED |
| `PDSA-C-002` | route-neutral accepted-R interface sufficiency probe | CLOSED — V5 32564789630 PASS |
| `PDSA-C-003` | independently assembled comparable candidate-route probes | CLOSED — both routes V5 32565335033 PASS |
| `PDSA-C-004` | selected Route P carrier and commutative-ring core | CLOSED — V5 32574270735 PASS |
| `PDSA-C-005` | conjugate, norm, and witness-based complex field closure | CLOSED — axiom-audited V5 32574920935 PASS |
| `PDSA-C-006` | representation-neutral quadratic-field comparison | CLOSED — V5 32575465002 PASS |
| `PDSA-C-007` | final C integration and Claim-level transparency | CLOSED — V5 32585583815 PASS / zero residuals |
| `PDSA-C-008` | separate Stage-One complex acceptance decision | CLOSED — CA-20 ACCEPT / run 32586145793 PASS |
| `PDSA-C-009` | mandatory accepted-complex reverse dependency audit | CLOSED — RE-C-001 COMPLETE |
| `PDSA-STAGE1-001` | global accepted number-chain reverse dependency audit | CLOSED — RE-STAGE1-001 COMPLETE |
| `STAGE-TWO-LAB` | controlled single-change branch experiment register and typed architectural origins | ACTIVE — TWO CLOSED / ST2-EXP-003 ACTIVE / 10 UNSELECTED |
| `ST2-EXP-001` | dependency-edge experiment on `BOMA-C-R-DEP-001` | CLOSED / V5 32593045224 PASS |
| `ST2-EXP-002` | `C-DP-001` Route P / independent quotient Route Q experiment | CLOSED / V5 32597346281 PASS |
| `ST2-EXP-003` | `R-DP-001` accepted Dedekind / independent retained Cauchy real route | ACTIVE / TOTAL-ORDER V5 32634079706 PASS / ORDER-COMPATIBILITY+INVERSE+COMPLETION OPEN / RESEARCH ONLY |
| `ST2-EXP-002-PQ-J-001` | explicit P/Q R-field isomorphism preserving R and I | VERIFIED RESEARCH JUNCTION / NOT CANONICAL ACCEPTANCE |
| `C-J-001` | selected same-carrier integration and nine-Claim formal closure | PASS — V5 32585583815 |
| `C-COMPARE-BLOCK-001` | universal quadratic graph / constructive functional comparison | ACTIVE / V5 32575465002 PASS |
| `C-BLOCK-001` | selected accepted-export Route P witness-based commutative-field producer | ACTIVE / V5 PASS / ACCEPTED PRODUCER |
| `C-BLOCK-002` | final downstream Stage-One complex export | ACTIVE — ACCEPTED / CA-20 |
| `C-DP-001` | Stage-One construction realization route | RESOLVED — USER-SELECTED C-ROUTE-P; C-ROUTE-Q RETAINED |

`C-DP-001` currently retains:

```text
C-ROUTE-P  SELECTED ordered-pair / rank-two Stage-One producer
C-ROUTE-Q  VERIFIED INDEPENDENT RESEARCH FIELD / NOT AN ACCEPTED EXPORT
C-ROUTE-A  conditional genuinely independent alternative
```

`C-BLOCK-001` is the user-selected canonical Route P **witness-based field producer**, verified at ring strength in run `32574270735` and field/inherited-axiom strength in run `32574920935`; it is an accepted internal producer; the separately accepted export is `C-BLOCK-002`. `C-J-001` passes exact run `32585583815` with zero Claim/producer residuals. The route-neutral C supporting source passed run `32564789630`; independent Route P and Route Q exploratory sources passed run `32565335033`. `ST2-EXP-002` independently completed Route Q as a formal-expression
normalization quotient field, then verified the explicit research-only
`ST2-EXP-002-PQ-J-001` field isomorphism. Route Q remains unselected and is not
an accepted export or canonical Block. `PDSA-STAGE1-001 / RE-STAGE1-001` and
mandatory `RE-C-001` are both closed. `ST2-EXP-001` and `ST2-EXP-002` are
closed; owner-approved `ST2-EXP-003` is active at `R-DP-001 / Q-BLOCK-002`,
and ten alternatives remain unselected.
Typed origins are recorded in `LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json`.

The nine accepted C Claim records are maintained in:

`LAB/20_FORMALIZATION/C_STAGE/C_CLAIM_REGISTER_001.md`.

Current acceptance semantics require a faithful real field extension with a distinguished `I`, `I²=-1`, and unique representation of every element as `a+bI`. Full algebraic closure is explicitly deferred from Stage-One acceptance.

## Current frontier

```text
Pre-numerical       CALIBRATED
N-Core              ACCEPTED
N-Arithmetic        ACCEPTED
Z                   ACCEPTED
post-Z reverse N    CLOSED
Q                   ACCEPTED
R                   ACCEPTED
RE-R-001            CLOSED / COMPLETE
C                   ACCEPTED — CA-20 / C-BLOCK-002
RE-C-001            CLOSED / COMPLETE
RE-STAGE1-001       CLOSED / COMPLETE
STAGE-TWO-LAB       ACTIVE / TWO CLOSED / ST2-EXP-003 ACTIVE / 10 UNSELECTED
C representation    C-ROUTE-P USER-SELECTED / C-ROUTE-Q VERIFIED RESEARCH FIELD
C research Junction ST2-EXP-002-PQ-J-001 / R-FIELD-ISOMORPHISM / NOT ACCEPTANCE
C accepted export   C-BLOCK-002 / CA-20 ACCEPT
```

The previous C hold remains historical provenance in earlier records. It was explicitly lifted by the user on 2026-08-21. No merge to `main` is implied by this branch state.
