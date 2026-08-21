# N-Core Formal Dependency Closure — Prototype Evidence

**Status:** PROTOTYPE_PASS  
**Boundary classification:** CLASSIFICATION_PASS  
**Claim/producer comparison:** CLAIM_PRODUCER_PASS  
**Audited source commit:** `ad9ec2850373cdd2a94d584d4c6035352d57ec75`  
**Workflow run ID:** `32455061955`  
**Pinned toolchain:** `leanprover/lean4:v4.32.1`  
**Root mode:** `producer_union` over accepted N-Core formal/bridge/Route-B targets  
**Accepted assembly manifest:** `LAB/20_FORMALIZATION/N_CORE/N_CORE_ACCEPTED_INPUTS.txt`

| Step | Outcome |
|---|---|
| Lean setup | success |
| compile accepted N-Core assembly + extract multi-target closure | success |
| classify formal boundary | success |
| compare actual closure against N-Core Claim producers | success |

 alone is not a transparency certification. Promotion requires both  and  with zero residuals.

## Claim/producer comparison log tail

```text
      ]
    },
    {
      "name": "BOMA.NCore.RB001.ind._f",
      "claims": [
        "N-CL-ELIM-001",
        "N-CL-IND-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.ind.match_1",
      "claims": [
        "N-CL-ELIM-001",
        "N-CL-HIST-001",
        "N-CL-IND-001",
        "N-CL-INITIAL-001",
        "N-CL-NOCONF-B-001",
        "N-CL-REC-001",
        "N-CL-RECUNIQ-001",
        "N-CL-TCTCOVER-001",
        "N-CL-TCTREFL-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.pointwise_initial_unique",
      "claims": [
        "N-CL-COMPARE-001",
        "N-CL-INTEGRATION-001",
        "N-CL-STANDARD-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.realize",
      "claims": [
        "N-CL-NOCONF-B-001",
        "N-CL-TCTBASE-001",
        "N-CL-TCTCOVER-001",
        "N-CL-TCTEXT-001",
        "N-CL-TCTPRES-001",
        "N-CL-TCTREFL-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.realizePlus",
      "claims": [
        "N-CL-NOCONF-B-001",
        "N-CL-TCTBASE-001",
        "N-CL-TCTCOVER-001",
        "N-CL-TCTEXT-001",
        "N-CL-TCTPRES-001",
        "N-CL-TCTREFL-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.realizePlus._f",
      "claims": [
        "N-CL-NOCONF-B-001",
        "N-CL-TCTBASE-001",
        "N-CL-TCTCOVER-001",
        "N-CL-TCTEXT-001",
        "N-CL-TCTPRES-001",
        "N-CL-TCTREFL-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.realizePlus.match_1",
      "claims": [
        "N-CL-NOCONF-B-001",
        "N-CL-TCTBASE-001",
        "N-CL-TCTCOVER-001",
        "N-CL-TCTEXT-001",
        "N-CL-TCTPRES-001",
        "N-CL-TCTREFL-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.realize_extU",
      "claims": [
        "N-CL-NOCONF-B-001",
        "N-CL-TCTCOVER-001",
        "N-CL-TCTEXT-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.realize_injective",
      "claims": [
        "N-CL-NOCONF-B-001",
        "N-CL-TCTREFL-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.realize_reify",
      "claims": [
        "N-CL-INTEGRATION-001",
        "N-CL-NOCONF-B-001",
        "N-CL-TCTCOVER-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.reify",
      "claims": [
        "N-CL-HIST-001",
        "N-CL-NOCONF-B-001",
        "N-CL-TCTCOVER-001",
        "N-CL-TCTREFL-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.reify._f",
      "claims": [
        "N-CL-HIST-001",
        "N-CL-NOCONF-B-001",
        "N-CL-TCTCOVER-001",
        "N-CL-TCTREFL-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.reify.eq_2",
      "claims": [
        "N-CL-NOCONF-B-001",
        "N-CL-TCTCOVER-001",
        "N-CL-TCTREFL-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.reify_realize",
      "claims": [
        "N-CL-NOCONF-B-001",
        "N-CL-TCTCOVER-001",
        "N-CL-TCTREFL-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.reify_realizePlus",
      "claims": [
        "N-CL-NOCONF-B-001",
        "N-CL-TCTCOVER-001",
        "N-CL-TCTREFL-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.s_injective",
      "claims": [
        "N-CL-NOCONF-A-001",
        "N-CL-NOCONF-CONV-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.s_ne_z",
      "claims": [
        "N-CL-NOCONF-A-001",
        "N-CL-NOCONF-CONV-001"
      ]
    },
    {
      "name": "BOMA.NCore.V5.NBLOCK003.all_generated",
      "claims": [
        "N-CL-GEN-001",
        "N-CL-INTEGRATION-001"
      ]
    },
    {
      "name": "BOMA.NCore.V5.NJ001RouteB.constructional_s_injective",
      "claims": [
        "N-CL-INTEGRATION-001",
        "N-CL-NOCONF-B-001",
        "N-CL-NOCONF-CONV-001"
      ]
    },
    {
      "name": "BOMA.NCore.V5.NJ001RouteB.constructional_s_ne_z",
      "claims": [
        "N-CL-INTEGRATION-001",
        "N-CL-NOCONF-B-001",
        "N-CL-NOCONF-CONV-001"
      ]
    }
  ],
  "residuals": []
}
```
