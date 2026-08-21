# N-Core Formal Dependency Closure — Matrix Evidence

**Status:** PROTOTYPE_PASS  
**Boundary classification:** CLASSIFICATION_PASS  
**Claim/producer comparison:** CLAIM_PRODUCER_PASS  
**Audited source commit:** `8b169bb226a06aa077713a337c131f426aac3cd6`  
**Workflow run ID:** `32456174410`  
**Pinned toolchain:** `leanprover/lean4:v4.32.1`  
**Root mode:** `producer_union`  
**Accepted assembly manifest:** `LAB/20_FORMALIZATION/N_CORE/N_CORE_ACCEPTED_INPUTS.txt`  
**Execution:** canonical cross-stage transparency matrix

| Step | Return code |
|---|---:|
| dependency extraction | 0 |
| formal boundary classification | 0 |
| Claim/producer comparison | 0 |

## Scope

The cross-stage workflow serializes execution and evidence promotion only. The mathematical/formal closure for this stage remains independently defined by its own accepted manifest and Claim-producer policy.

## Audit log tail

```text
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
