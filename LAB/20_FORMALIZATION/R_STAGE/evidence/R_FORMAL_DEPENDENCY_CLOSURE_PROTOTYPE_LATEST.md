# R Formal Dependency Closure — Prototype Evidence

**Status:** PROTOTYPE_PASS  
**Audited source commit:** `5af2100612d9e4bca61ecb06541a659214814791`  
**Workflow run ID:** `32403006953`  
**Pinned toolchain:** `leanprover/lean4:v4.32.1`  
**Root declaration:** `BOMA.R.StageIntegration002.rStageIntegrationCertificate`  
**Accepted assembly manifest:** `LAB/20_FORMALIZATION/R_STAGE/R_INTEGRATION_002_INPUTS.txt`

| Step | Outcome |
|---|---|
| Lean setup | success |
| compile accepted assembly + extract transitive declaration closure | success |

## Scope boundary

This is a **prototype theorem/declaration-closure measurement**, not yet a BOMA `TRANSPARENCY PASS`.

The extractor recursively traverses type and proof/definition-body constants for declarations owned by the compiled accepted assembly module and records external module dependencies as boundary leaves. Semantic comparison of those declarations/leaves against the Claim Registry and Trusted Base remains a separate gate.

## Extractor log tail

```text
      "kind": "theorem",
      "module": "Init.Prelude"
    },
    {
      "name": "congrArg",
      "kind": "theorem",
      "module": "Init.Prelude"
    },
    {
      "name": "congrFun'",
      "kind": "theorem",
      "module": "Init.Prelude"
    },
    {
      "name": "dite",
      "kind": "definition",
      "module": "Init.Prelude"
    },
    {
      "name": "eq_of_heq",
      "kind": "theorem",
      "module": "Init.Prelude"
    },
    {
      "name": "id",
      "kind": "definition",
      "module": "Init.Prelude"
    },
    {
      "name": "instTransEq",
      "kind": "definition",
      "module": "Init.Prelude"
    },
    {
      "name": "noConfusion_of_Nat",
      "kind": "theorem",
      "module": "Init.Prelude"
    },
    {
      "name": "of_decide_eq_false",
      "kind": "theorem",
      "module": "Init.Prelude"
    },
    {
      "name": "rfl",
      "kind": "definition",
      "module": "Init.Prelude"
    },
    {
      "name": "eq_false",
      "kind": "theorem",
      "module": "Init.SimpLemmas"
    },
    {
      "name": "eq_false'",
      "kind": "theorem",
      "module": "Init.SimpLemmas"
    },
    {
      "name": "eq_self",
      "kind": "theorem",
      "module": "Init.SimpLemmas"
    },
    {
      "name": "eq_true",
      "kind": "theorem",
      "module": "Init.SimpLemmas"
    },
    {
      "name": "iff_self",
      "kind": "theorem",
      "module": "Init.SimpLemmas"
    },
    {
      "name": "of_eq_true",
      "kind": "theorem",
      "module": "Init.SimpLemmas"
    }
  ]
}
```
