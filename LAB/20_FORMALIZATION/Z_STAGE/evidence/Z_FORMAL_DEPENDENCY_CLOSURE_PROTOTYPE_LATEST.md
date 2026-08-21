# Z Formal Dependency Closure — Prototype Evidence

**Status:** PROTOTYPE_PASS  
**Boundary classification:** CLASSIFICATION_PASS  
**Claim/producer comparison:** CLAIM_PRODUCER_REVIEW_REQUIRED  
**Audited source commit:** `4e68b81039b3b5f7e6c56ace4a1f56bf475a2a28`  
**Workflow run ID:** `32454624498`  
**Pinned toolchain:** `leanprover/lean4:v4.32.1`  
**Root mode:** `producer_union` over accepted Z representation/ring/order targets  
**Accepted assembly manifest:** `LAB/20_FORMALIZATION/Z_STAGE/Z_ACCEPTED_INPUTS.txt`

| Step | Outcome |
|---|---|
| Lean setup | success |
| compile Z accepted assembly + extract multi-target transitive closure | success |
| classify boundary against explicit dependency policy | success |
| compare actual closure against Z Claim/producer policy | failure |

## Scope boundary

This prototype audits the existing accepted Z representation/reconvergence/ring/order surface without introducing a quotient carrier, new theorem statement, or synthetic integration certificate.  alone is not a Z transparency certification.

 requires zero unclassified formal boundary residuals.  requires exact Z Claim-registry agreement, declared producers in the actual closure, audit roots that are themselves declared Claim producers, and zero internal declarations without producer ancestry.

## Claim/producer comparison log tail

```text
      "name": "BOMA.Z.Rep001.pairMul_add_right",
      "claims": [
        "Z-CL-ORDER-001",
        "Z-CL-RING-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.pairMul_comm",
      "claims": [
        "Z-CL-ORDER-001",
        "Z-CL-RING-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.pairMul_respects",
      "claims": [
        "Z-CL-ORDER-001",
        "Z-CL-RING-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.pairMul_respects_left",
      "claims": [
        "Z-CL-ORDER-001",
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
  "residuals": [
    {
      "type": "declared_producer_not_internal",
      "claim": "Z-CL-REPCONV-001",
      "producer": "BOMA.Z.Rep001.signed_roundtrip"
    },
    {
      "type": "declared_producer_not_internal",
      "claim": "Z-CL-EMBED-001",
      "producer": "BOMA.Z.Arithmetic001.embedN_zero"
    },
    {
      "type": "declared_producer_not_internal",
      "claim": "Z-CL-EMBED-001",
      "producer": "BOMA.Z.Arithmetic001.embedN_one"
    }
  ]
}
```
