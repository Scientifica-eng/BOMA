# REGISTRY — Canonical Construction Unit Registry

**Status:** ACTIVE — Canonical registry / successful Stage-Two lessons integrated  
**Topology:** `CONSTRUCTION_TOPOLOGY.md`  
**N-Core:** `N_CORE_DAG.md`  
**N-Arithmetic:** `N_ARITHMETIC_DAG.md`  
**Q:** `Q_DAG.md`  
**R:** `R_DAG.md`  
**C:** `C_DAG.md`  
**Stage-Two lifecycle:** `ST2-EXP-001..003 CLOSED / PASS / NO ACTIVE EXPERIMENT`  
**Integration authority:** `BOMA-ST2-LEARNING-INTEGRATION-001`.

Operational, verification, research-provenance, selection, and acceptance status remain separate.

## Pre-numerical TCT

| ID | Type | Role | Status |
|---|---|---|---|
| `TCT-BLOCK-001` | Block | Construction Kernel | ACTIVE |
| `TCT-BLOCK-002` | Block | Generated Selected Configurations | ACTIVE |
| `TCT-BR-010` | Brick | Structural equivalence `≈` | ACTIVE — declared identity specification |
| `TCT-BR-009` | Brick | Terminal preservation | ACTIVE — derived under BR-010 |
| `TCT-J-001` | Junction | Canonical decomposition gate | PASS |
| `TCT-BLOCK-003` | Block | Canonical Decomposition | ACTIVE |
| `TCT-BLOCK-004` | Block | Structural Iteration History | ACTIVE |
| `TCT-BLOCK-005` | Block | Successor-Like Extension | ACTIVE |
| `TCT-BLOCK-006` | provenance aggregate | old monolithic N candidate | DECOMPOSED / PROVENANCE |

## Natural-number core — ACCEPTED

| ID | Role | Status |
|---|---|---|
| `N-DP-001` | Stage-One realization regime | RESOLVED — R-B selected |
| `N-DP-002` | eliminator / universe scope | RESOLVED |
| `N-J-001` | core reconvergence | PASS |
| `N-J-002` | final core integration | PASS |
| `N-BLOCK-007` | accepted N-Core export | ACTIVE — ACCEPTED |

Canonical detailed units remain `N-BR-001..020` and `N-BLOCK-001..007`.

## Natural-number arithmetic — ACCEPTED

| Unit | Role | Status |
|---|---|---|
| `N-ADD-BLOCK-001` | right-recursive addition route | PASS / V5 |
| `N-ADD-BLOCK-002` | left-recursive addition route | PASS / V5 |
| `N-ADD-J-001` | addition route convergence | PASS |
| `N-ADD-BLOCK-003` | canonical addition + laws | ACTIVE / PASS |
| `N-MUL-BLOCK-001` | right-recursive multiplication route | PASS / V5 |
| `N-MUL-BLOCK-002` | left-recursive multiplication route | PASS / V5 |
| `N-MUL-J-001` | multiplication route convergence | PASS |
| `N-MUL-BLOCK-003` | canonical multiplication + laws | ACTIVE / PASS |
| `N-ORD-BLOCK-001` | additive-witness order route | PASS / V5 |
| `N-ORD-BLOCK-002` | N-Core-only inductive order route | PASS / V5 |
| `N-ORD-J-001` | order route equivalence | PASS |
| `N-ORD-BLOCK-003` | canonical total order + laws | ACTIVE / PASS |
| `N-ORD-BLOCK-004` | arithmetic/order compatibility | ACTIVE / PASS |
| `N-ARITH-J-001` | arithmetic integration | PASS / RESOLVED |
| `N-ARITH-BLOCK-001` | accepted arithmetic export | ACTIVE — ACCEPTED |

## Integer stage — ACCEPTED

| Unit | Role | Status |
|---|---|---|
| `Z-S-BLOCK-001` | signed normal forms | SELECTED / V5 PASS |
| `Z-D-BLOCK-001` | difference pairs + equivalence | RETAINED / V5 PASS |
| `Z-J-001` | representation convergence | PASS / RESOLVED |
| `Z-DP-001` | canonical representation | RESOLVED — signed selected |
| `Z-BLOCK-001` | selected carrier / identity | ACTIVE |
| `Z-ARITH-J-001` | arithmetic convergence | PASS / RESOLVED |
| `Z-ARITH-BLOCK-003` | commutative-ring package | ACTIVE / PASS |
| `Z-ORD-J-001` | order convergence | PASS / RESOLVED |
| `Z-ORD-BLOCK-001` | canonical ordered-integer interface | ACTIVE / PASS |
| `Z-J-002` | final integer integration | PASS / RESOLVED |
| `Z-BLOCK-002` | accepted Stage-One integer export | ACTIVE — ACCEPTED |

## Mandatory post-Z reverse engineering — CLOSED

| Unit | Role | Status |
|---|---|---|
| `Z-RE-BLOCK-001` | nonnegative-cone candidate | Z-ONLY V5 PASS |
| `Z-RE-BLOCK-002` | successor-reachability candidate | Z-ONLY V5 PASS |
| `Z-RE-J-001` | compare reverse N-from-Z with bottom-up N | PASS / RESOLVED |

Classification: **INTERFACE RECONVERGENCE / PROVENANCE DIVERGENCE**.

## Rational stage — ACCEPTED

| Unit | Role | Status |
|---|---|---|
| `Q-GATE-BLOCK-001` | nonzero multiplication cancellation | ACTIVE / V5 PASS |
| `Q-F-BLOCK-001` | positive-denominator RawFrac + FracEquiv | ACTIVE / V5 PASS |
| `Q-F-BLOCK-002` | equivalence-respecting raw arithmetic | ACTIVE / V5 PASS |
| `Q-DP-001` | formal identity realization | RESOLVED — quotient/setoid selected |
| `Q-BLOCK-001` | quotient carrier / lifted operations | ACTIVE / V5 PASS |
| `Q-J-002` | final rational integration | PASS / RESOLVED |
| `Q-BLOCK-002` | accepted Stage-One rational export | ACTIVE — ACCEPTED |

## Real stage — ACCEPTED + PERMANENT VERIFIED ALTERNATIVE

### Decisions and selected units

| Unit | Role | Status |
|---|---|---|
| `R-DP-001` | completion route | RESOLVED — Dedekind selected; Cauchy permanent verified alternative |
| `R-DP-002` | formal real identity | RESOLVED — quotient `cutSetoid` selected |
| `R-DP-003` | total-order logical regime | RESOLVED — localized classical comparability selected |
| `R-DP-004` | Q approximation route | RESOLVED |
| `R-DP-005` | multiplication architecture | RESOLVED |
| `R-DP-006` | inverse architecture | RESOLVED |
| `R-COMP-BLOCK-001` | Dedekind LUB completeness | ACTIVE / V5 PASS |
| `R-ADD-BLOCK-001` | representative-independent addition | ACTIVE / V5 PASS |
| `R-NEG-CANDIDATE-BLOCK-001` | Dedekind negation candidate | ACTIVE / V5 PASS |
| `R-QARCH-BLOCK-001` | Q approximation gateway | ACTIVE / V5 PASS |
| `R-ADD-GROUP-BLOCK-001` | additive group | ACTIVE / V5 PASS |
| `R-MUL-BLOCK-001` | ordered commutative ring | ACTIVE / V5 PASS |
| `R-FIELD-BLOCK-001` | nonzero inverse witness interface | ACTIVE / V5 PASS |
| `R-DENSITY-BLOCK-001` | Q image dense in R | ACTIVE / V5 PASS |
| `R-ARCH-BLOCK-001` | Archimedean characterization | ACTIVE / V5 PASS |
| `R-J-002` | selected Stage-One R integration | PASS / RESOLVED / ACCEPTANCE JUNCTION |
| `R-BLOCK-001` | accepted Stage-One real export | ACTIVE — ACCEPTED |
| `RE-R-001` | backward dependency/commitment classification | CLOSED / COMPLETE |

### Permanent verified alternative-construction records

| Unit / route | Role | Status |
|---|---|---|
| `R-ROUTE-C` | independent rational Cauchy completion | PERMANENT VERIFIED ALTERNATIVE / NON-SELECTED / NOT ACCEPTED EXPORT |
| `ST2-EXP-003-R-J-001` | Dedekind/Cauchy reconvergence | PERMANENT VERIFIED ALTERNATIVE-CONSTRUCTION JUNCTION / R-FIELD-ISOMORPHISM / NON-ACCEPTANCE |
| H6 Cauchy-native C core | downstream robustness witness over Cauchy R | RETAINED VERIFIED EVIDENCE / NON-ACCEPTED |

The alternative records have Stage-Two research provenance but are now permanent
members of the human-readable Construction DAG. Their permanence does not change `R-DP-001 SELECTS`.

## R → C dependency contract — ST2-EXP-001 LESSON INTEGRATED

| Record | Role | Status |
|---|---|---|
| `BOMA-C-R-DEP-001` | mathematical dependency boundary from selected R export into C | ACTIVE — EXACT SIXTEEN-PROPERTY SURFACE |
| `ST2-EXP-001` | experiment that verified the smaller interface against selected C Claim meaning | CLOSED / PASS / V5 32593045224 / LESSON INTEGRATED |

Canonical mathematical surface:

```text
orderTrans, orderAntisymm, orderTotal, nontrivial,
addComm, addAssoc, addZeroLeft, addInverseRight,
addTranslateOrderIff, negOrderReversing,
mulComm, mulAssoc, mulOneLeft, distribRight,
orderMulNonneg, inverseExists
```

This refines the dependency contract; it does not create a fabricated Block or Junction.

## Complex stage — ACCEPTED + PERMANENT VERIFIED ALTERNATIVE

| Unit / record | Role | Status |
|---|---|---|
| `BOMA-C-ACCEPT-001` | representation-neutral C acceptance specification | ACTIVE |
| `BOMA-C-R-DEP-001` | exact R→C mathematical dependency contract | ACTIVE / ST2-EXP-001 INTEGRATED |
| `C-DP-001` | Stage-One realization route | RESOLVED — USER-SELECTED C-ROUTE-P |
| `C-BLOCK-001` | selected Route P witness-field producer | ACTIVE / V5 PASS / ACCEPTED PRODUCER |
| `C-COMPARE-BLOCK-001` | representation-neutral quadratic comparison on selected scalar realization | ACTIVE / V5 PASS |
| `C-J-001` | selected same-carrier integration | PASS / ACCEPTANCE JUNCTION |
| `C-BLOCK-002` | final Stage-One complex export | ACTIVE — ACCEPTED / CA-20 |
| `C-ROUTE-Q` | independent expression-normalization quotient field | PERMANENT VERIFIED ALTERNATIVE / NON-SELECTED / NOT ACCEPTED EXPORT |
| `ST2-EXP-002-PQ-J-001` | Route P / Route Q reconvergence | PERMANENT VERIFIED ALTERNATIVE-CONSTRUCTION JUNCTION / R-FIELD-ISOMORPHISM / NON-ACCEPTANCE |

`C-J-001` and `ST2-EXP-002-PQ-J-001` have different roles and must not be conflated.

## Closed Stage-Two provenance records

| Record | Architectural origin | Lifecycle / integrated lesson |
|---|---|---|
| `STAGE-TWO-LAB` | controlled single-change experiment register | THREE CLOSED / NO ACTIVE EXPERIMENT / NEXT SLOT OPEN |
| `ST2-EXP-001` | `DEPENDENCY_EDGE / BOMA-C-R-DEP-001` | CLOSED / PASS — minimal R→C dependency lesson integrated |
| `ST2-EXP-002` | `DECISION_POINT / C-DP-001` | CLOSED / PASS — Route Q + P/Q Junction integrated as permanent alternative architecture |
| `ST2-EXP-003` | `DECISION_POINT / R-DP-001` | CLOSED / PASS / H1-H6 EXACT — Cauchy + R Junction integrated as permanent alternative architecture |

The experiment records remain Learning-Graph provenance even when their verified
results become permanent Construction-DAG knowledge.

## Current frontier

```text
Pre-numerical                    CALIBRATED
N-Core                           ACCEPTED
N-Arithmetic                     ACCEPTED
Z                                ACCEPTED
post-Z reverse N                 CLOSED / COMPLETE
Q                                ACCEPTED
R-DP-001                         SELECTS R-ROUTE-D / DEDEKIND
R accepted                       R-BLOCK-001
R permanent alternative          R-ROUTE-C / Cauchy
R alternative Junction           ST2-EXP-003-R-J-001
R→C mathematical dependency      BOMA-C-R-DEP-001 / exact 16-property surface
C-DP-001                         SELECTS C-ROUTE-P
C accepted                       C-BLOCK-002 / CA-20
C permanent alternative          C-ROUTE-Q
C alternative Junction           ST2-EXP-002-PQ-J-001
ST2-EXP-001..003                 CLOSED / PASS / LESSONS INTEGRATED
NO ACTIVE EXPERIMENT
NEXT EXPERIMENT SLOT             OPEN / OWNER SELECTION REQUIRED
```

`ST2-EXP-011` remains a candidate only. Architecture integration of past results
does not authorize it.
