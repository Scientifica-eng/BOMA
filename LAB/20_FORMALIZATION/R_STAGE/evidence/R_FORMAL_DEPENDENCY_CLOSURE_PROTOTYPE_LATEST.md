# R Formal Dependency Closure — Prototype Evidence

**Status:** PROTOTYPE_PASS  
**Boundary classification:** CLASSIFICATION_PASS  
**Claim/producer comparison:** CLAIM_PRODUCER_PASS  
**Audited source commit:** `2c2926b3567cb11fa93a3a4bea4464fdd86f79ce`  
**Workflow run ID:** `32417221728`  
**Pinned toolchain:** `leanprover/lean4:v4.32.1`  
**Root declaration:** `BOMA.R.StageIntegration002.rStageIntegrationCertificate`  
**Accepted assembly manifest:** `LAB/20_FORMALIZATION/R_STAGE/R_INTEGRATION_002_INPUTS.txt`

| Step | Outcome |
|---|---|
| Lean setup | success |
| compile accepted assembly + extract transitive declaration closure/edges | success |
| classify boundary against explicit dependency policy | success |
| compare actual closure against R Claim/producer policy | success |

## Scope boundary

A `PROTOTYPE_PASS` means the theorem/declaration closure extractor executed successfully. It is **not** by itself a BOMA `TRANSPARENCY PASS`.

`CLASSIFICATION_PASS` means no external/internal formal dependency remains unclassified under `FORMAL_DEPENDENCY_POLICY.json`.

`CLAIM_PRODUCER_PASS` additionally requires the R Claim Registry and machine-readable producer policy to agree, every declared producer to occur in and be reachable through the actual Lean closure, every direct internal dependency of the integration certificate to be explicitly declared or integration-local, and every internal declaration to have producer ancestry. Only the conjunction of these results is eligible for a later transparency-promotion decision.

## Claim/producer comparison log tail

```text
        "R-CL-FIELD-001",
        "R-CL-INV-001",
        "R-CL-MUL-001",
        "R-CL-NONTRIV-001",
        "R-CL-ORDER-001",
        "R-CL-QEMBED-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.zeq_common_s",
      "claims": [
        "R-CL-ADD-001",
        "R-CL-ARCH-001",
        "R-CL-CARRIER-001",
        "R-CL-COMP-001",
        "R-CL-DENSITY-001",
        "R-CL-FIELD-001",
        "R-CL-INV-001",
        "R-CL-MUL-001",
        "R-CL-NONTRIV-001",
        "R-CL-ORDER-001",
        "R-CL-QEMBED-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.zeq_refl",
      "claims": [
        "R-CL-ADD-001",
        "R-CL-ARCH-001",
        "R-CL-CARRIER-001",
        "R-CL-COMP-001",
        "R-CL-DENSITY-001",
        "R-CL-FIELD-001",
        "R-CL-INV-001",
        "R-CL-MUL-001",
        "R-CL-NONTRIV-001",
        "R-CL-ORDER-001",
        "R-CL-QEMBED-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.zeq_symm",
      "claims": [
        "R-CL-ADD-001",
        "R-CL-ARCH-001",
        "R-CL-CARRIER-001",
        "R-CL-COMP-001",
        "R-CL-DENSITY-001",
        "R-CL-FIELD-001",
        "R-CL-INV-001",
        "R-CL-MUL-001",
        "R-CL-NONTRIV-001",
        "R-CL-ORDER-001",
        "R-CL-QEMBED-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.zeq_trans",
      "claims": [
        "R-CL-ADD-001",
        "R-CL-ARCH-001",
        "R-CL-CARRIER-001",
        "R-CL-COMP-001",
        "R-CL-DENSITY-001",
        "R-CL-FIELD-001",
        "R-CL-INV-001",
        "R-CL-MUL-001",
        "R-CL-NONTRIV-001",
        "R-CL-ORDER-001",
        "R-CL-QEMBED-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.zneg",
      "claims": [
        "R-CL-ADD-001",
        "R-CL-ARCH-001",
        "R-CL-CARRIER-001",
        "R-CL-COMP-001",
        "R-CL-DENSITY-001",
        "R-CL-FIELD-001",
        "R-CL-INV-001",
        "R-CL-MUL-001",
        "R-CL-NONTRIV-001",
        "R-CL-ORDER-001",
        "R-CL-QEMBED-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.zneg.match_1",
      "claims": [
        "R-CL-ADD-001",
        "R-CL-ARCH-001",
        "R-CL-CARRIER-001",
        "R-CL-COMP-001",
        "R-CL-DENSITY-001",
        "R-CL-FIELD-001",
        "R-CL-INV-001",
        "R-CL-MUL-001",
        "R-CL-NONTRIV-001",
        "R-CL-ORDER-001",
        "R-CL-QEMBED-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.zneg_involutive",
      "claims": [
        "R-CL-ADD-001",
        "R-CL-ARCH-001",
        "R-CL-DENSITY-001",
        "R-CL-FIELD-001",
        "R-CL-INV-001",
        "R-CL-MUL-001",
        "R-CL-NONTRIV-001",
        "R-CL-QEMBED-001"
      ]
    }
  ],
  "residuals": []
}
```
