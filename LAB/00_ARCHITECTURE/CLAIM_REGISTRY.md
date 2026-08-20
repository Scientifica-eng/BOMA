# CLAIM REGISTRY — Accepted-Claim Traceability Index

**Document ID:** `BOMA-CLAIM-REGISTRY-001`  
**Status:** ACTIVE — DECLARED CLAIM CLOSURES MAPPED; Q/R MACHINE-CHECKED TRANSPARENCY PASS ON ARCHITECTURE BRANCH  
**Date:** 2026-08-20  
**Schema:** `LAB/00_ARCHITECTURE/CLAIM_ARCHITECTURE.md`  
**Trusted boundary:** `LAB/00_ARCHITECTURE/TRUSTED_BASE.md`  
**Program:** `PDSA-ARCH-002`

## 1. Purpose

Provide the project-level index from accepted mathematical claims to their stage-specific closure audit and canonical producer families.

The registry is intentionally an **index**, not a duplicate copy of every stage audit. Detailed statements, dependency classifications, evidence, non-claims, and sensitivity belong in the linked claim-closure audit records and canonical unit/evidence files.

```text
Construction Unit ≠ Claim Record ≠ Lean theorem
```

The registry links these layers without collapsing them.

## 2. Accepted export inventory

| Export | Mathematical status | Declared claim closure | Machine transparency | Audit record |
|---|---|---|---|---|
| `N-BLOCK-007` | ACCEPTED / `NAC-15` | COMPLETE | PENDING STAGE-ROOT CERTIFICATION | `LAB/20_FORMALIZATION/N_CORE/N_CORE_CLAIM_CLOSURE_AUDIT_001.md` |
| `N-ARITH-BLOCK-001` | ACCEPTED / `NAA-18` | COMPLETE | PENDING STAGE-ROOT CERTIFICATION | `LAB/20_FORMALIZATION/N_ARITHMETIC/N_ARITH_CLAIM_CLOSURE_AUDIT_001.md` |
| `Z-BLOCK-002` | ACCEPTED / `ZA-21` | COMPLETE | PENDING STAGE-ROOT CERTIFICATION | `LAB/20_FORMALIZATION/Z_STAGE/Z_CLAIM_CLOSURE_AUDIT_001.md` |
| `Q-BLOCK-002` | ACCEPTED / `QA-23` | COMPLETE | **PASS — BRANCH-LOCAL** | `LAB/20_FORMALIZATION/Q_STAGE/Q_TRANSPARENCY_CERTIFICATION_001.md` |
| `R-BLOCK-001` | ACCEPTED / `RA-22` | COMPLETE | **PASS — BRANCH-LOCAL** | `LAB/20_FORMALIZATION/R_STAGE/R_TRANSPARENCY_CERTIFICATION_001.md` |

`COMPLETE` in the declared-closure column means human-readable Claim closure at the current audit granularity. `PASS — BRANCH-LOCAL` is stronger: it is backed by theorem-level dependency extraction, boundary classification, and Claim/producer comparison on `architecture/claim-transparency-001`. It does not retroactively relabel historical commits or merge the branch into `main`.

## 3. N-Core Claim IDs

Detailed mapping: `N_CORE_CLAIM_CLOSURE_AUDIT_001.md`.

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

Formal ownership reference:

`LAB/20_FORMALIZATION/N_CORE/V5_THEOREM_OWNERSHIP.md`.

## 4. N-Arithmetic Claim IDs

Detailed mapping: `N_ARITH_CLAIM_CLOSURE_AUDIT_001.md`.

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

## 5. Z Claim IDs

Detailed mapping: `Z_CLAIM_CLOSURE_AUDIT_001.md`.

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

## 6. Q Claim IDs

Declared-closure mapping: `Q_CLAIM_CLOSURE_AUDIT_001.md`.  
Machine transparency certification: `Q_TRANSPARENCY_CERTIFICATION_001.md`.  
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

Historical canonical Q integration evidence remains:

```text
run             32178326013
result          PASS
```

Current branch-local Q transparency evidence:

```text
run                  32416694028
audited source       87b635a15cb057a517e201f8fbf99b54296533b8
formal extraction    PROTOTYPE_PASS
boundary             CLASSIFICATION_PASS
claim/producer       CLAIM_PRODUCER_PASS
residuals            0
```

The first Q Claim/producer run intentionally remains part of the Learning Graph: it exposed one over-declared producer (`zmul_ne_zero`) that was valid source code but not consumed by the accepted Claim closure. The producer policy was corrected rather than expanding the audit roots merely to obtain a PASS.

## 7. R Claim IDs

Declared-closure calibration: `R_CLAIM_CLOSURE_AUDIT_003.md`.  
Machine transparency certification: `R_TRANSPARENCY_CERTIFICATION_001.md`.  
Learning sequence: `LAB/PDSA/experiments/PDSA-ARCH-002-R-FORMAL-CLOSURE-STUDY-001.md`.  
Reverse classification: `RE-R-001`.

| Claim ID | Role | Primary producer |
|---|---|---|
| `R-CL-CARRIER-001` | real carrier + formal identity | Dedekind identity layer / `R-DP-002` |
| `R-CL-QEMBED-001` | faithful/order-exact Q embedding | principal-cut embedding layer |
| `R-CL-ORDER-001` | total-order interface | constructive order core + `R-LOGIC-BR-001` |
| `R-CL-NONTRIV-001` | `rZero ≠ rOne` | Q strict order + final closure |
| `R-CL-ADD-001` | additive commutative group | `R-ADD-GROUP-BLOCK-001` |
| `R-CL-MUL-001` | ordered commutative-ring multiplication | `R-MUL-BLOCK-001` |
| `R-CL-INV-001` | unique nonzero inverse witness | `R-FIELD-BLOCK-001` |
| `R-CL-FIELD-001` | acceptance-strength ordered-field closure | ordered-field closure payload + producer Blocks |
| `R-CL-COMP-001` | Dedekind LUB completeness | `R-COMP-BLOCK-001` |
| `R-CL-DENSITY-001` | strict rational-image density | `R-DENSITY-BLOCK-001` |
| `R-CL-ARCH-001` | Archimedean upper-bound characterization | `R-ARCH-BLOCK-001` |
| `R-CL-INTEGRATION-001` | same-carrier acceptance integration | `R-J-002` / `RStageIntegration002.lean` |

Historical canonical R integration evidence on the program baseline remains:

```text
run             32385379288
verified source af0a03d83245b1e15e9903df00db89edf3317042
Lean            4.32.1
result          PASS
```

Current branch-local R transparency evidence:

```text
run                  32415977469
audited source       db827c7de13275e55bbe2dcbd320c409f2a1c9ee
formal extraction    PROTOTYPE_PASS
boundary             CLASSIFICATION_PASS
claim/producer       CLAIM_PRODUCER_PASS
residuals            0
```

The canonical integration run and later transparency runs answer different questions and must not be conflated: V5 evidence records mathematical integration at its verified source; architecture runs audit theorem-level dependency/Claim transparency for the feature branch.

## 8. Cross-stage dependency spine

At accepted-export granularity:

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

This spine is only a high-level view. Internal branch/Junction dependencies remain authoritative in their canonical unit graphs.

## 9. Current transparency status

```text
N-Core        DECLARED CLAIM CLOSURE COMPLETE / STAGE-ROOT TRANSPARENCY PENDING
N-Arithmetic  DECLARED CLAIM CLOSURE COMPLETE / STAGE-ROOT TRANSPARENCY PENDING
Z             DECLARED CLAIM CLOSURE COMPLETE / STAGE-ROOT TRANSPARENCY PENDING
Q             MACHINE-CHECKED TRANSPARENCY PASS — BRANCH-LOCAL
R             MACHINE-CHECKED TRANSPARENCY PASS — BRANCH-LOCAL
```

Q and R have independent stage-level machine audits with zero formal-boundary residuals and zero unowned internal declarations. Their different root modes preserve the accepted architecture: R uses its single final integration certificate; Q uses the existing union of integration-package and acceptance-law roots rather than inventing a new theorem.

## 10. Next program step

Continue in reverse dependency order:

```text
Z
N-Arithmetic
N-Core
```

For each remaining stage:

```text
select the accepted theorem surface without fabricating new mathematics;
define a machine-readable Claim producer policy;
extract ActualFormalClosure;
classify the formal boundary;
compare Claim Registry ↔ producers ↔ internal ancestry;
require zero residuals before stage-level transparency promotion.
```

No record in this registry authorizes C. `C NOT STARTED — USER HOLD` remains unchanged.