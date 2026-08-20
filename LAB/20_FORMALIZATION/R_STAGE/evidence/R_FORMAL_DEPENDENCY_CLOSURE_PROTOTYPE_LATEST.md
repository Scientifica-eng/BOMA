# R Formal Dependency Closure — Prototype Evidence

**Status:** PROTOTYPE_PASS  
**Semantic classification:** CLASSIFICATION_PASS  
**Audited source commit:** `3225acb4aec6fc0e6b03e62f69c6c956383ea66d`  
**Workflow run ID:** `32405080337`  
**Pinned toolchain:** `leanprover/lean4:v4.32.1`  
**Root declaration:** `BOMA.R.StageIntegration002.rStageIntegrationCertificate`  
**Accepted assembly manifest:** `LAB/20_FORMALIZATION/R_STAGE/R_INTEGRATION_002_INPUTS.txt`

| Step | Outcome |
|---|---|
| Lean setup | success |
| compile accepted assembly + extract transitive declaration closure/edges | success |
| classify boundary against explicit dependency policy | success |

## Scope boundary

A `PROTOTYPE_PASS` means the theorem/declaration closure extractor executed successfully. It is **not** by itself a BOMA `TRANSPARENCY PASS`.

The semantic classifier separately compares external leaves and source-attributed direct consumers against `FORMAL_DEPENDENCY_POLICY.json`. A classification status of `CLASSIFICATION_REVIEW_REQUIRED` is a deliberate research result: its residual dependencies must be diagnosed, declared, or removed before any transparency promotion.

## Classifier log tail

```text
          "source": "LAB/payloads/lean/RStage/RDedekindSignedMultiplicationSignLaws.lean",
          "source_resolution": "direct-range"
        },
        {
          "name": "BOMA.Z.Arithmetic001.embedN_add",
          "source": "LAB/payloads/lean/ZStage/ZArithmeticLaws.lean",
          "source_resolution": "direct-range"
        },
        {
          "name": "BOMA.Z.Arithmetic001.embedN_mul",
          "source": "LAB/payloads/lean/ZStage/ZArithmeticLaws.lean",
          "source_resolution": "direct-range"
        },
        {
          "name": "BOMA.Z.Arithmetic001.zadd_routes_converge",
          "source": "LAB/payloads/lean/ZStage/ZArithmeticConvergence.lean",
          "source_resolution": "direct-range"
        },
        {
          "name": "BOMA.Z.Arithmetic001.zmul_one_right",
          "source": "LAB/payloads/lean/ZStage/ZArithmeticLaws.lean",
          "source_resolution": "direct-range"
        },
        {
          "name": "BOMA.Z.Arithmetic001.zmul_routes_converge",
          "source": "LAB/payloads/lean/ZStage/ZArithmeticConvergence.lean",
          "source_resolution": "direct-range"
        },
        {
          "name": "BOMA.Z.Order001.pairLE_neg_flip",
          "source": "LAB/payloads/lean/ZStage/ZOrderLaws.lean",
          "source_resolution": "direct-range"
        },
        {
          "name": "BOMA.Z.Order001.zle_refl",
          "source": "LAB/payloads/lean/ZStage/ZOrderLaws.lean",
          "source_resolution": "direct-range"
        },
        {
          "name": "BOMA.Z.Rep001.canonical_pair_separates",
          "source": "LAB/payloads/lean/ZStage/ZRepresentationConvergence.lean",
          "source_resolution": "direct-range"
        },
        {
          "name": "BOMA.Z.Rep001.pairAdd_assoc",
          "source": "LAB/payloads/lean/ZStage/ZPairArithmetic.lean",
          "source_resolution": "direct-range"
        },
        {
          "name": "BOMA.Z.Rep001.pairAdd_comm",
          "source": "LAB/payloads/lean/ZStage/ZPairArithmetic.lean",
          "source_resolution": "direct-range"
        },
        {
          "name": "BOMA.Z.Rep001.pairMul_add_right",
          "source": "LAB/payloads/lean/ZStage/ZPairArithmetic.lean",
          "source_resolution": "direct-range"
        },
        {
          "name": "BOMA.Z.Rep001.pairMul_assoc",
          "source": "LAB/payloads/lean/ZStage/ZPairArithmetic.lean",
          "source_resolution": "direct-range"
        },
        {
          "name": "BOMA.Z.Rep001.pairMul_comm",
          "source": "LAB/payloads/lean/ZStage/ZPairArithmetic.lean",
          "source_resolution": "direct-range"
        }
      ],
      "out_of_scope_consumers": [],
      "shortest_target_path": [
        "BOMA.R.StageIntegration002.rStageIntegrationCertificate",
        "BOMA.R.DedekindSignedMulAssociativity001.rMulCandidate_assoc",
        "BOMA.R.DedekindSignedMulSignLaws001.rMulCandidate_of_nonneg_nonpos",
        "of_eq_true"
      ],
      "residual": false
    }
  ]
}
```
