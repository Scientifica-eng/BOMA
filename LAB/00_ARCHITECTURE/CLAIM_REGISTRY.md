# CLAIM REGISTRY — Accepted-Claim Traceability Index

**Document ID:** `BOMA-CLAIM-REGISTRY-001`  
**Status:** ACTIVE — ACCEPTED N-CORE THROUGH R; C PROVISIONAL REGISTER OPEN  
**Date:** 2026-08-21  
**Schema:** `LAB/00_ARCHITECTURE/CLAIM_ARCHITECTURE.md`  
**Trusted boundary:** `LAB/00_ARCHITECTURE/TRUSTED_BASE.md`  
**Program lineage:** `PDSA-ARCH-002`; C extension under `PDSA-C-001`

## 1. Purpose

Provide the project-level current-state index from accepted mathematical claims to their stage-specific closure audits, canonical producer families, and machine transparency certifications.

The registry is intentionally an **accepted-export index**, not a duplicate of every stage audit and not a place to pretend provisional claims are already accepted. Detailed statements, dependency classifications, historical evidence, non-claims, sensitivity, and learning sequences remain in the linked records.

```text
Construction Unit ≠ Claim Record ≠ Lean theorem
```

The registry links these layers without collapsing them.

For C, whose acceptance contract is now active but whose carrier is not yet selected, provisional Claim Records live in a separate ex-ante register and are linked from Section 8 below. They are **not counted as accepted claims** here.

## 2. Accepted export inventory

| Export | Mathematical status | Declared claim closure | Machine transparency | Certification |
|---|---|---|---|---|
| `N-BLOCK-007` | ACCEPTED / `NAC-15` | COMPLETE | **PASS — BRANCH-LOCAL** | `LAB/20_FORMALIZATION/N_CORE/N_CORE_TRANSPARENCY_CERTIFICATION_001.md` |
| `N-ARITH-BLOCK-001` | ACCEPTED / `NAA-18` | COMPLETE | **PASS — BRANCH-LOCAL** | `LAB/20_FORMALIZATION/N_ARITHMETIC/N_ARITH_TRANSPARENCY_CERTIFICATION_001.md` |
| `Z-BLOCK-002` | ACCEPTED / `ZA-21` | COMPLETE | **PASS — BRANCH-LOCAL** | `LAB/20_FORMALIZATION/Z_STAGE/Z_TRANSPARENCY_CERTIFICATION_001.md` |
| `Q-BLOCK-002` | ACCEPTED / `QA-23` | COMPLETE | **PASS — BRANCH-LOCAL** | `LAB/20_FORMALIZATION/Q_STAGE/Q_TRANSPARENCY_CERTIFICATION_001.md` |
| `R-BLOCK-001` | ACCEPTED / `RA-22` | COMPLETE | **PASS — BRANCH-LOCAL** | `LAB/20_FORMALIZATION/R_STAGE/R_TRANSPARENCY_CERTIFICATION_001.md` |

`COMPLETE` means the human-readable declared Claim closure is complete at the program's accepted audit granularity. `PASS — BRANCH-LOCAL` records the stage's independent actual Lean dependency extraction, formal-boundary classification, and Claim/producer ancestry comparison with zero residuals on the architecture-program branch before merge.

These certifications do not retroactively relabel historical acceptance commits.

Current C work does not alter the five-row accepted export inventory because:

```text
C accepted export = NONE
```

## 3. N-Core Claim IDs

Declared closure: `LAB/20_FORMALIZATION/N_CORE/N_CORE_CLAIM_CLOSURE_AUDIT_001.md`.  
Machine certification: `LAB/20_FORMALIZATION/N_CORE/N_CORE_TRANSPARENCY_CERTIFICATION_001.md`.  
Historical theorem ownership: `LAB/20_FORMALIZATION/N_CORE/V5_THEOREM_OWNERSHIP.md`.

| Claim ID | Role | Primary canonical owner/producer |
|---|---|---|
| `N-CL-CARRIER-001` | fresh unary carrier/base/successor | `N-BR-001` / `N-BLOCK-001` |
| `N-CL-ID-001` | formal identity interface | `N-BR-002` |
| `N-CL-ELIM-001` | dependent eliminator interface | `N-BR-003` |
| `N-CL-NOCONF-A-001` | internal no-confusion route | `N-BR-004..005` |
| `N-CL-IND-001` | induction adequacy | `N-BR-006` |
| `N-CL-GEN-001` | generatedness/no-junk | `N-BR-007` |
| `N-CL-REC-001` | recursion + computation | `N-BR-008..009` |
| `N-CL-RECUNIQ-001` | recursion uniqueness | `N-BR-010` |
| `N-CL-INITIAL-001` | pointwise initiality | `N-BR-011` |
| `N-CL-TCTBASE-001` | TCT base realization | `N-BR-012` |
| `N-CL-TCTEXT-001` | TCT extension realization | `N-BR-013` |
| `N-CL-TCTPRES-001` | structural-equivalence preservation | `N-BR-014` |
| `N-CL-TCTREFL-001` | formal identity reflection | `N-BR-015` |
| `N-CL-TCTCOVER-001` | bridge reconstruction/coverage | `N-BR-016` |
| `N-CL-HIST-001` | TCT history/constructor ancestry | `N-BR-017` |
| `N-CL-NOCONF-B-001` | constructional no-confusion route | `N-BR-018` |
| `N-CL-NOCONF-CONV-001` | no-confusion reconvergence | `N-J-001` |
| `N-CL-COMPARE-001` | pointwise-initial comparison maps | `N-BR-019` |
| `N-CL-STANDARD-001` | pointwise inverse/standardness | `N-BR-020` |
| `N-CL-INTEGRATION-001` | accepted N-Core integration | `N-BLOCK-007` / `N-J-002` |

Current branch-local machine evidence:

```text
run                  32455061955
audited source       ad9ec2850373cdd2a94d584d4c6035352d57ec75
formal extraction    PROTOTYPE_PASS
boundary             CLASSIFICATION_PASS
claim/producer       CLAIM_PRODUCER_PASS
registry claims      20
producers            34
audit targets        21
internal             97 / 97 owned
formal residuals     0
claim residuals      0
```

The certification preserves the central boundary:

```text
pre-numerical TCT ≠ backend TCTNF ≠ fresh R-B formal carrier BOMANat
```

and retains independent constructional no-confusion Route B rather than collapsing it into datatype-internal Route A.

## 4. N-Arithmetic Claim IDs

Declared closure: `LAB/20_FORMALIZATION/N_ARITHMETIC/N_ARITH_CLAIM_CLOSURE_AUDIT_001.md`.  
Machine certification: `LAB/20_FORMALIZATION/N_ARITHMETIC/N_ARITH_TRANSPARENCY_CERTIFICATION_001.md`.

| Claim ID | Role | Primary producer |
|---|---|---|
| `NAR-CL-ADDDEF-001` | dual addition definitions | `N-ADD-BLOCK-001..002` |
| `NAR-CL-ADDCONV-001` | addition reconvergence | `N-ADD-J-001` |
| `NAR-CL-ADD-001` | canonical addition + laws | `N-ADD-BLOCK-003` |
| `NAR-CL-MULDEF-001` | dual multiplication definitions | `N-MUL-BLOCK-001..002` |
| `NAR-CL-MULCONV-001` | multiplication reconvergence | `N-MUL-J-001` |
| `NAR-CL-MUL-001` | canonical multiplication + laws | `N-MUL-BLOCK-003` |
| `NAR-CL-ORDERDEF-001` | dual order routes | `N-ORD-BLOCK-001..002` |
| `NAR-CL-ORDERCONV-001` | order reconvergence | `N-ORD-J-001` |
| `NAR-CL-ORDER-001` | canonical natural order | `N-ORD-BLOCK-003` |
| `NAR-CL-ORDERARITH-001` | arithmetic/order compatibility | `N-ORD-BLOCK-004` |
| `NAR-CL-INTEGRATION-001` | accepted N-Arithmetic integration | `N-ARITH-J-001` / `N-ARITH-BLOCK-001` |

Current branch-local machine evidence:

```text
run                  32454880229
audited source       ee082647af0537620716b896d824048a2bca9347
formal extraction    PROTOTYPE_PASS
boundary             CLASSIFICATION_PASS
claim/producer       CLAIM_PRODUCER_PASS
registry claims      11
producers            56
audit targets        40
internal             97 / 97 owned
formal residuals     0
claim residuals      0
```

The formal root surface explicitly retains recurse-right/recurse-left computation equations and additive-witness/inductive order routes. First theorem-level comparison passed without residuals, informed by earlier Q/Z/R calibration.

## 5. Z Claim IDs

Declared closure: `LAB/20_FORMALIZATION/Z_STAGE/Z_CLAIM_CLOSURE_AUDIT_001.md`.  
Machine certification: `LAB/20_FORMALIZATION/Z_STAGE/Z_TRANSPARENCY_CERTIFICATION_001.md`.  
Learning sequence: `LAB/PDSA/experiments/PDSA-ARCH-002-Z-FORMAL-CLOSURE-STUDY-001.md`.

| Claim ID | Role | Primary producer |
|---|---|---|
| `Z-CL-REP-001` | signed normal-form route | `Z-S-BLOCK-001` |
| `Z-CL-ALTREP-001` | difference-pair route | `Z-D-BLOCK-001` |
| `Z-CL-REPCONV-001` | representation convergence | `Z-REP-BR-001..005` / `Z-J-001` |
| `Z-CL-CARRIER-001` | accepted selected integer carrier/identity | `Z-DP-001` / `Z-BLOCK-001` |
| `Z-CL-ARITHCONV-001` | direct/pair arithmetic convergence | `Z-ARITH-J-001` |
| `Z-CL-RING-001` | commutative-ring interface | `Z-ARITH-BLOCK-003` |
| `Z-CL-EMBED-001` | faithful N embedding | Z representation/arithmetic/order chain |
| `Z-CL-GEN-001` | natural-difference generation | `Z-ARITH-BLOCK-003` |
| `Z-CL-ORDERCONV-001` | order-route convergence | `Z-ORD-J-001` |
| `Z-CL-ORDER-001` | total ordered-ring interface | `Z-ORD-BLOCK-001` |
| `Z-CL-INTEGRATION-001` | accepted integer integration | `Z-J-002` / `Z-BLOCK-002` |

Current branch-local machine evidence:

```text
run                  32454713809
audited source       8558fb5bf50a0cef07b3124bf882df03f56141e0
formal extraction    PROTOTYPE_PASS
boundary             CLASSIFICATION_PASS
claim/producer       CLAIM_PRODUCER_PASS
registry claims      11
producers            48
audit targets        29
internal             203 / 203 owned
formal residuals     0
claim residuals      0
```

The first Z run preserved in the Learning Graph exposed **audit-root undercoverage**, not hidden mathematics: `signed_roundtrip`, `embedN_zero`, and `embedN_one` were explicit accepted properties omitted from the initial root set. They were added as roots rather than deleted from Claim ownership.

## 6. Q Claim IDs

Declared closure: `LAB/20_FORMALIZATION/Q_STAGE/Q_CLAIM_CLOSURE_AUDIT_001.md`.  
Machine certification: `LAB/20_FORMALIZATION/Q_STAGE/Q_TRANSPARENCY_CERTIFICATION_001.md`.  
Learning sequence: `LAB/PDSA/experiments/PDSA-ARCH-002-Q-FORMAL-CLOSURE-STUDY-001.md`.

| Claim ID | Role | Primary producer |
|---|---|---|
| `Q-CL-GATE-001` | Z nonzero cancellation gateway | `Q-GATE-BLOCK-001` |
| `Q-CL-REP-001` | raw positive-denominator fractions + equivalence | `Q-F-BLOCK-001` |
| `Q-CL-RAWOPS-001` | raw operations respect equivalence | `Q-F-BLOCK-002` |
| `Q-CL-CARRIER-001` | quotient carrier/identity | `Q-DP-001` / `Q-BLOCK-001` |
| `Q-CL-ALG-001` | accepted additive/multiplicative algebra | Q algebra proof layers |
| `Q-CL-INV-001` | unique nonzero inverse witness | Q inverse-witness layer |
| `Q-CL-EMBED-001` | faithful Z/N embeddings | Q embedding layer |
| `Q-CL-GEN-001` | fraction generation/characterization | Q generation layer |
| `Q-CL-ORDER-001` | total ordered rational interface | Q order/compatibility layers |
| `Q-CL-INTEGRATION-001` | accepted Q integration | `Q-J-002` / `Q-BLOCK-002` |

Historical mathematical integration evidence remains:

```text
run             32178326013
result          PASS
```

Branch-local machine transparency reached zero residuals in run `32416694028`, source `87b635a15cb057a517e201f8fbf99b54296533b8`; the later concurrency-guard regression run `32417291894` also passed.

The first Q comparison remains preserved because it exposed one over-declared producer (`zmul_ne_zero`): valid source code, but not an acceptance producer actually consumed by the accepted Claim closure. It was removed from producer ownership rather than artificially promoted to an audit root.

## 7. R Claim IDs

Declared closure: `LAB/20_FORMALIZATION/R_STAGE/R_CLAIM_CLOSURE_AUDIT_003.md`.  
Machine certification: `LAB/20_FORMALIZATION/R_STAGE/R_TRANSPARENCY_CERTIFICATION_001.md`.  
Learning sequence: `LAB/PDSA/experiments/PDSA-ARCH-002-R-FORMAL-CLOSURE-STUDY-001.md`.  
Reverse classification: `RE-R-001`.

| Claim ID | Role | Primary producer |
|---|---|---|
| `R-CL-CARRIER-001` | real carrier + formal identity | Dedekind identity layer / `R-DP-002` |
| `R-CL-QEMBED-001` | faithful/order-exact Q embedding | principal-cut embedding layer |
| `R-CL-ORDER-001` | total-order interface | constructive order core + localized classical witness |
| `R-CL-NONTRIV-001` | `rZero ≠ rOne` | Q strict order + final closure |
| `R-CL-ADD-001` | additive commutative group | `R-ADD-GROUP-BLOCK-001` |
| `R-CL-MUL-001` | ordered commutative-ring multiplication | `R-MUL-BLOCK-001` |
| `R-CL-INV-001` | unique nonzero inverse witness | `R-FIELD-BLOCK-001` |
| `R-CL-FIELD-001` | acceptance-strength ordered-field closure | ordered-field closure payload + producer Blocks |
| `R-CL-COMP-001` | Dedekind LUB completeness | `R-COMP-BLOCK-001` |
| `R-CL-DENSITY-001` | strict rational-image density | `R-DENSITY-BLOCK-001` |
| `R-CL-ARCH-001` | Archimedean upper-bound characterization | `R-ARCH-BLOCK-001` |
| `R-CL-INTEGRATION-001` | same-carrier acceptance integration | `R-J-002` / `RStageIntegration002.lean` |

Historical canonical R integration evidence remains:

```text
run             32385379288
verified source af0a03d83245b1e15e9903df00db89edf3317042
Lean            4.32.1
result          PASS
```

The theorem-level transparency calibration reached zero residuals after the preserved learning sequence `5 → 2 → 1 → 0`, followed by Claim/producer ancestry PASS. A later concurrency-fix regression run `32417221728` also passed.

The R boundary continues to expose localized logical commitments rather than hide them:

```text
Classical.em
Classical.byContradiction
```

This does not make the Dedekind route, quotient identity, or localized classical choices mathematically necessary.

## 8. C provisional Claim frontier — NOT PART OF ACCEPTED INVENTORY

`C-DP-001` is user-ratified as `C-ROUTE-P`; `C-ROUTE-Q` remains a retained
verified probe. Eight families already have exact V5-verified producers; the
ninth integration family is under final audit. No C Claim is accepted.

Detailed register: `LAB/20_FORMALIZATION/C_STAGE/C_CLAIM_REGISTER_001.md`.

| Provisional Claim | Producer unit | Formal producer | Evidence |
| --- | --- | --- | --- |
| `C-CL-CARRIER-001` | `C-BLOCK-001` | `CBOMA / c_ext` | 32574270735 PASS |
| `C-CL-REMBED-001` | `C-BLOCK-001` | `c_ofR_injective / preservation` | 32574270735 PASS |
| `C-CL-FIELD-001` | `C-BLOCK-001` | `cPairFieldCertificateFromAcceptedR` | 32574920935 PASS |
| `C-CL-I-001` | `C-BLOCK-001` | `cI / c_i_squared` | 32574270735 PASS |
| `C-CL-GEN-001` | `C-BLOCK-001` | `c_generation` | 32574270735 PASS |
| `C-CL-COORDUNIQ-001` | `C-BLOCK-001` | `c_coordinate_unique` | 32574270735 PASS |
| `C-CL-NONREAL-001` | `C-BLOCK-001` | `c_i_not_real` | 32574270735 PASS |
| `C-CL-COMPARE-001` | `C-COMPARE-BLOCK-001` | `selected graph / extractor-scoped isomorphism` | 32575465002 PASS |
| `C-CL-INTEGRATION-001` | `C-J-001` | `cStageIntegrationCertificate` | V5 PENDING — NOT ACCEPTED |

Formal policy: `LAB/00_ARCHITECTURE/C_FORMAL_CLAIM_PRODUCER_POLICY.json`.
`C_ACCEPTED_INPUTS.txt` is a PREACCEPTANCE assembly, not proof of acceptance.
Algebraic closure remains outside the Stage-One contract.

## 9. Cross-stage dependency spine

At **accepted-export** granularity the current spine remains:

```text
N-CL-INTEGRATION-001
  ↓
NAR-CL-INTEGRATION-001
  ↓
Z-CL-INTEGRATION-001
  ↓
Q-CL-INTEGRATION-001
  ↓
R-CL-INTEGRATION-001
```

The current **construction frontier** now continues provisionally:

```text
R-CL-INTEGRATION-001
  ↓
BOMA-C-R-DEP-001
  ↓
provisional C Claim targets
```

There is deliberately no accepted `R → C-CL-INTEGRATION-001` spine edge yet because C has no accepted integration Claim.

Internal branches, retained alternatives, Junction contracts, Decision Points, and historical learning paths remain authoritative in their canonical records.

## 10. Current transparency status

```text
N-Core        MACHINE-CHECKED TRANSPARENCY PASS — accepted historical certification
N-Arithmetic  MACHINE-CHECKED TRANSPARENCY PASS — accepted historical certification
Z             MACHINE-CHECKED TRANSPARENCY PASS — accepted historical certification
Q             MACHINE-CHECKED TRANSPARENCY PASS — accepted historical certification
R             MACHINE-CHECKED TRANSPARENCY PASS — accepted historical certification
C             PREACCEPTANCE PRODUCERS MAPPED — FINAL AUDIT PENDING
```

Each accepted stage has an independent stage-level machine audit. A downstream stage traversing upstream declarations never substitutes for the upstream stage's own certification.

Root modes preserve accepted architecture rather than forcing uniform packaging:

```text
R             single_target final integration certificate
Q             producer_union over existing accepted integration/law roots
Z             producer_union over representation/reconvergence/ring/order roots
N-Arithmetic  producer_union over independent routes, convergence, and canonical laws
N-Core        producer_union over formal carrier/bridge/Route-B/standardness witnesses
```

C uses a provisional `single_target` audit; this does not accept C.

## 11. Program continuation

`PDSA-ARCH-002` is closed for the accepted N-Core→R frontier and its read-only guards remain governing. C must apply the same transparency architecture during construction rather than waiting for a post-hoc cleanup.

Current C transparency obligations are:

```text
provisional Claim register before carrier selection
explicit R dependency contract
C-DP-001 open with no SELECTS edge
future producer ownership per Claim
future actual formal closure/classification
future comparison of declared vs actual dependencies
future source-surface and integration audits
Learning Graph preservation of failed probes
```

The previous C hold recorded in older architecture-closure documents is historical provenance. It was explicitly lifted by the user on 2026-08-21; this registry now reflects the authorized but unaccepted C frontier.
