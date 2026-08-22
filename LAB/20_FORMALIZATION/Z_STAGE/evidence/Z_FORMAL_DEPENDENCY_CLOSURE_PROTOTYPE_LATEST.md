# Z Formal Dependency Closure — Matrix Evidence

**Status:** PROTOTYPE_PASS  
**Boundary classification:** CLASSIFICATION_PASS  
**Claim/producer comparison:** CLAIM_PRODUCER_PASS  
**Audited source commit:** `ff3d18d37492eaeba7019d659704d1d74c15a79f`  
**Workflow run ID:** `32586781546`  
**Pinned toolchain:** `leanprover/lean4:v4.32.1`  
**Root mode:** `producer_union`  
**Accepted assembly manifest:** `LAB/20_FORMALIZATION/Z_STAGE/Z_ACCEPTED_INPUTS.txt`  
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
        "Z-CL-RING-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.pairMul_respects_right",
      "claims": [
        "Z-CL-ORDER-001",
        "Z-CL-RING-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.pairOfSigned",
      "claims": [
        "Z-CL-ARITHCONV-001",
        "Z-CL-ORDER-001",
        "Z-CL-ORDERCONV-001",
        "Z-CL-REPCONV-001",
        "Z-CL-RING-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.pair_roundtrip",
      "claims": [
        "Z-CL-ORDER-001",
        "Z-CL-REPCONV-001",
        "Z-CL-RING-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.representation_converges",
      "claims": [
        "Z-CL-INTEGRATION-001",
        "Z-CL-REPCONV-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.z_add4_swap_last",
      "claims": [
        "Z-CL-ORDER-001",
        "Z-CL-RING-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.z_add4_swap_middle",
      "claims": [
        "Z-CL-ORDER-001",
        "Z-CL-RING-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.z_add_left_comm",
      "claims": [
        "Z-CL-ORDER-001",
        "Z-CL-RING-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.zeq_common_s",
      "claims": [
        "Z-CL-ORDER-001",
        "Z-CL-REPCONV-001",
        "Z-CL-RING-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.zeq_refl",
      "claims": [
        "Z-CL-ALTREP-001",
        "Z-CL-ORDER-001",
        "Z-CL-REPCONV-001",
        "Z-CL-RING-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.zeq_symm",
      "claims": [
        "Z-CL-ALTREP-001",
        "Z-CL-ORDER-001",
        "Z-CL-REPCONV-001",
        "Z-CL-RING-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.zeq_trans",
      "claims": [
        "Z-CL-ALTREP-001",
        "Z-CL-ORDER-001",
        "Z-CL-REPCONV-001",
        "Z-CL-RING-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.zneg",
      "claims": [
        "Z-CL-ARITHCONV-001",
        "Z-CL-CARRIER-001",
        "Z-CL-EMBED-001",
        "Z-CL-GEN-001",
        "Z-CL-ORDER-001",
        "Z-CL-REP-001",
        "Z-CL-RING-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.zneg.match_1",
      "claims": [
        "Z-CL-ARITHCONV-001",
        "Z-CL-CARRIER-001",
        "Z-CL-EMBED-001",
        "Z-CL-GEN-001",
        "Z-CL-ORDER-001",
        "Z-CL-ORDERCONV-001",
        "Z-CL-REP-001",
        "Z-CL-REPCONV-001",
        "Z-CL-RING-001"
      ]
    }
  ],
  "residuals": []
}
```
