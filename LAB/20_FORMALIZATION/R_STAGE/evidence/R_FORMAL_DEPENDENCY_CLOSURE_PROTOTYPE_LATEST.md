# R Formal Dependency Closure — Prototype Evidence

**Status:** PROTOTYPE_FAIL  
**Audited source commit:** `92b8afac54a219473a40174d35556b4ad1e9e0da`  
**Workflow run ID:** `32399253014`  
**Pinned toolchain:** `leanprover/lean4:v4.32.1`  
**Root declaration:** `BOMA.R.StageIntegration002.rStageIntegrationCertificate`  
**Accepted assembly manifest:** `LAB/20_FORMALIZATION/R_STAGE/R_INTEGRATION_002_INPUTS.txt`

| Step | Outcome |
|---|---|
| Lean setup | success |
| compile accepted assembly + extract transitive declaration closure | failure |

## Scope boundary

This is a **prototype theorem/declaration-closure measurement**, not yet a BOMA `TRANSPARENCY PASS`.

The extractor recursively traverses type and proof/definition-body constants for declarations owned by the compiled accepted assembly module and records external module dependencies as boundary leaves. Semantic comparison of those declarations/leaves against the Claim Registry and Trusted Base remains a separate gate.

## Extractor log tail

```text
```
