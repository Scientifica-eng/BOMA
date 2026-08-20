# R_TRANSPARENCY_CERTIFICATION_001 — Machine-Checked Claim/Dependency Closure

**Status:** `R TRANSPARENCY PASS — BRANCH-LOCAL CERTIFICATION`  
**Date:** 2026-08-20  
**Branch:** `architecture/claim-transparency-001`  
**Program:** `PDSA-ARCH-002`  
**Accepted mathematical stage:** `R-BLOCK-001 / RA-22` — unchanged  
**Reverse audit:** `RE-R-001 CLOSED / COMPLETE` — unchanged  
**C:** `NOT STARTED — USER HOLD`

## 1. Certification target

This record certifies theorem-level transparency for the accepted R integration root:

```text
BOMA.R.StageIntegration002.rStageIntegrationCertificate
```

using the ordered accepted source assembly:

```text
LAB/20_FORMALIZATION/R_STAGE/R_INTEGRATION_002_INPUTS.txt
```

and pinned toolchain:

```text
leanprover/lean4:v4.32.1
```

The certification is branch-local until the architecture branch is separately reviewed/merged. It does not rewrite or replace historical R acceptance evidence on `main`.

## 2. Governing invariant

For this certification, `PDSA-ARCH-002` requires:

```text
Actual Formal Dependency Closure
  ⊆
Declared Claim Producers
+ transitive supporting declarations
+ declared logical/formalization commitments
+ Explicit Trusted Base
```

with no unclassified residual dependency.

The Claim layer is not allowed to collapse into the integration certificate itself. `R-CL-INTEGRATION-001` has no transitive ownership privilege; direct theorem dependencies must be assigned to explicit Claim producers.

## 3. Machine evidence

Latest full comparison evidence:

```text
workflow run      32415451960
audited source    6044629aba7b827070c334e274ef14ec4a95e009
Lean              4.32.1
extractor          PROTOTYPE_PASS
boundary policy    CLASSIFICATION_PASS
claim/producer     CLAIM_PRODUCER_PASS
```

Evidence files:

```text
LAB/20_FORMALIZATION/R_STAGE/evidence/R_FORMAL_DEPENDENCY_CLOSURE_PROTOTYPE_LATEST.json
LAB/20_FORMALIZATION/R_STAGE/evidence/R_FORMAL_DEPENDENCY_CLASSIFICATION_PROTOTYPE_LATEST.json
LAB/20_FORMALIZATION/R_STAGE/evidence/R_FORMAL_CLAIM_PRODUCER_COMPARISON_PROTOTYPE_LATEST.json
LAB/20_FORMALIZATION/R_STAGE/evidence/R_FORMAL_DEPENDENCY_CLOSURE_PROTOTYPE_LATEST.md
```

Machine-readable policies/tools:

```text
LAB/00_ARCHITECTURE/FORMAL_DEPENDENCY_POLICY.json
LAB/00_ARCHITECTURE/R_FORMAL_CLAIM_PRODUCER_POLICY.json
LAB/00_ARCHITECTURE/tools/LeanDependencyExtractor.lean
LAB/00_ARCHITECTURE/tools/lean_dependency_audit.py
LAB/00_ARCHITECTURE/tools/formal_dependency_classify.py
LAB/00_ARCHITECTURE/tools/formal_claim_producer_compare.py
.github/workflows/boma-r-formal-dependency-audit-prototype.yml
```

## 4. Formal boundary result

The final boundary classifier reports:

```text
external boundary leaves                    76
classified external leaves                  76
external residuals                           0
internal residuals                           0
total residuals                              0
```

Classification:

```text
TRUSTED_METATHEORY                          65
TRUSTED_FORMALIZATION_INFRASTRUCTURE         9
DECLARED_LOGICAL_COMMITMENT                  2
```

The two logical boundary declarations are:

```text
Classical.em
Classical.byContradiction
```

Their consumption is source-attributed and linked to already declared R logical commitments. No `propext`, `Classical.propDecidable`, hidden internal axiom, unresolved declaration, or unmapped generated declaration remains in the residual set.

## 5. Claim/producer result

The machine-readable R producer policy matches the R Claim Registry exactly:

```text
registry Claim IDs                           12
policy Claim IDs                             12
```

The formal producer comparison reports:

```text
declared producers                           29
internal declarations                       606
owned internal declarations                 606
unowned internal declarations                 0
target direct internal dependencies          27
undeclared target direct dependencies         0
residual groups                               0
```

Internal declarations by source stage:

```text
N-Core          19
N-Arithmetic    59
Z              113
Q              136
R              279
TOTAL          606
```

Shared support may legitimately belong to several Claim ancestries. Multiple ownership therefore records dependency reuse; it is not treated as ambiguity or duplication.

## 6. Accepted R Claim coverage

The certified producer policy covers exactly:

```text
R-CL-CARRIER-001
R-CL-QEMBED-001
R-CL-ORDER-001
R-CL-NONTRIV-001
R-CL-ADD-001
R-CL-MUL-001
R-CL-INV-001
R-CL-FIELD-001
R-CL-COMP-001
R-CL-DENSITY-001
R-CL-ARCH-001
R-CL-INTEGRATION-001
```

Each declared producer must exist in the actual internal closure and be reachable from the R integration target. Every direct internal dependency of the target must be either one of those producers or integration-local structure/constructor packaging.

## 7. Relationship to accepted R evidence

This certification does not create a new mathematical acceptance decision. `RA-22` remains the R acceptance decision.

Historical canonical R integration evidence remains tied to the source commit it actually verified, including:

```text
run 32385379288 — PASS
verified source af0a03d83245b1e15e9903df00db89edf3317042
```

During transparency work, proof bodies were refactored to expose or remove hidden proof-engineering dependencies while preserving the accepted interfaces. The transparency workflow independently compiles the full accepted ordered assembly under the same Lean 4.32.1 toolchain before extracting its dependency graph. Thus this branch-local certification applies to the current audited branch source, while historical V5 evidence remains historical rather than being retroactively relabeled.

## 8. Learning/provenance qualification

The final zero-residual graph was not assumed. It was reached through observed failures and residual classification, including:

```text
workspace/package-root execution defect
Classical.propDecidable discovered in proof terms
propext discovered through proposition rewriting/generated simp
host Nat/no-confusion/generated match artifacts requiring provenance classification
```

The full sequence is retained in:

```text
LAB/PDSA/experiments/PDSA-ARCH-002-R-FORMAL-CLOSURE-PROTOTYPE-FAILURE-001.md
LAB/PDSA/experiments/PDSA-ARCH-002-R-FORMAL-CLOSURE-STUDY-001.md
```

The certification therefore records the clean current closure without erasing the Learning Graph that produced it.

## 9. Certification statement

For the branch-local audited R integration certificate at commit

```text
6044629aba7b827070c334e274ef14ec4a95e009
```

BOMA has machine-checked that:

```text
formal extraction succeeds;
all formal boundary leaves are classified;
the R Claim Registry and producer policy agree;
all declared Claim producers occur and are reachable;
all target direct internal dependencies are declared/integration-local;
all internal declarations have declared producer ancestry;
no residual dependency remains.
```

Therefore:

```text
R TRANSPARENCY PASS — BRANCH-LOCAL CERTIFICATION
```

under `PDSA-ARCH-002`.

## 10. Non-claims

This certification does not imply:

```text
the Trusted Base is formally proved by BOMA;
Dedekind cuts are the uniquely necessary real construction;
quotient identity is mathematically necessary;
localized classical commitments are unavoidable in every R route;
Cauchy and retained alternatives are certified by this producer graph;
N-Core/N-Arithmetic/Z/Q have independent stage-root transparency PASS yet;
C has started.
```

The next architectural task is to reuse the now-calibrated machinery on Q, Z, N-Arithmetic, and N-Core with stage-specific integration roots and producer policies.
