# Q Formal Dependency Closure — Prototype Evidence

**Status:** PROTOTYPE_PASS  
**Boundary classification:** CLASSIFICATION_PASS  
**Claim/producer comparison:** CLAIM_PRODUCER_REVIEW_REQUIRED  
**Audited source commit:** `3fb2979996d7436050831b0c01e688f81114c4df`  
**Workflow run ID:** `32416480087`  
**Pinned toolchain:** `leanprover/lean4:v4.32.1`  
**Root mode:** `producer_union` over accepted Q integration/law targets  
**Accepted assembly manifest:** `LAB/20_FORMALIZATION/Q_STAGE/Q_ACCEPTED_INPUTS.txt`

| Step | Outcome |
|---|---|
| Lean setup | success |
| compile Q accepted assembly + extract multi-target transitive closure | success |
| classify boundary against explicit dependency policy | success |
| compare actual closure against Q Claim/producer policy | failure |

## Scope boundary

This prototype does not invent a new Q mathematical certificate. It audits the existing accepted Q integration-package theorems plus acceptance-level laws omitted from the package file.  alone is not a Q transparency certification.

 requires zero unclassified formal boundary residuals.  requires exact Q Claim-registry agreement, declared producers in the actual closure, audit roots that are themselves declared Claim producers, and zero internal declarations without producer ancestry.

## Claim/producer comparison log tail

```text
        "Q-CL-INV-001",
        "Q-CL-ORDER-001",
        "Q-CL-RAWOPS-001",
        "Q-CL-REP-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.z_add4_swap_middle",
      "claims": [
        "Q-CL-ALG-001",
        "Q-CL-CARRIER-001",
        "Q-CL-EMBED-001",
        "Q-CL-GATE-001",
        "Q-CL-GEN-001",
        "Q-CL-INV-001",
        "Q-CL-ORDER-001",
        "Q-CL-RAWOPS-001",
        "Q-CL-REP-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.z_add_left_comm",
      "claims": [
        "Q-CL-ALG-001",
        "Q-CL-CARRIER-001",
        "Q-CL-EMBED-001",
        "Q-CL-GATE-001",
        "Q-CL-GEN-001",
        "Q-CL-INV-001",
        "Q-CL-ORDER-001",
        "Q-CL-RAWOPS-001",
        "Q-CL-REP-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.z_mul_left_comm",
      "claims": [
        "Q-CL-ALG-001",
        "Q-CL-CARRIER-001",
        "Q-CL-EMBED-001",
        "Q-CL-GEN-001",
        "Q-CL-INV-001",
        "Q-CL-ORDER-001",
        "Q-CL-RAWOPS-001",
        "Q-CL-REP-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.zeq_common_s",
      "claims": [
        "Q-CL-ALG-001",
        "Q-CL-CARRIER-001",
        "Q-CL-EMBED-001",
        "Q-CL-GATE-001",
        "Q-CL-GEN-001",
        "Q-CL-INV-001",
        "Q-CL-ORDER-001",
        "Q-CL-RAWOPS-001",
        "Q-CL-REP-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.zeq_refl",
      "claims": [
        "Q-CL-ALG-001",
        "Q-CL-CARRIER-001",
        "Q-CL-EMBED-001",
        "Q-CL-GATE-001",
        "Q-CL-GEN-001",
        "Q-CL-INV-001",
        "Q-CL-ORDER-001",
        "Q-CL-RAWOPS-001",
        "Q-CL-REP-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.zeq_symm",
      "claims": [
        "Q-CL-ALG-001",
        "Q-CL-CARRIER-001",
        "Q-CL-EMBED-001",
        "Q-CL-GATE-001",
        "Q-CL-GEN-001",
        "Q-CL-INV-001",
        "Q-CL-ORDER-001",
        "Q-CL-RAWOPS-001",
        "Q-CL-REP-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.zeq_trans",
      "claims": [
        "Q-CL-ALG-001",
        "Q-CL-CARRIER-001",
        "Q-CL-EMBED-001",
        "Q-CL-GATE-001",
        "Q-CL-GEN-001",
        "Q-CL-INV-001",
        "Q-CL-ORDER-001",
        "Q-CL-RAWOPS-001",
        "Q-CL-REP-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.zneg",
      "claims": [
        "Q-CL-ALG-001",
        "Q-CL-CARRIER-001",
        "Q-CL-EMBED-001",
        "Q-CL-GATE-001",
        "Q-CL-GEN-001",
        "Q-CL-INV-001",
        "Q-CL-ORDER-001",
        "Q-CL-RAWOPS-001",
        "Q-CL-REP-001"
      ]
    },
    {
      "name": "BOMA.Z.Rep001.zneg.match_1",
      "claims": [
        "Q-CL-ALG-001",
        "Q-CL-CARRIER-001",
        "Q-CL-EMBED-001",
        "Q-CL-GATE-001",
        "Q-CL-GEN-001",
        "Q-CL-INV-001",
        "Q-CL-ORDER-001",
        "Q-CL-RAWOPS-001",
        "Q-CL-REP-001"
      ]
    }
  ],
  "residuals": [
    {
      "type": "declared_producer_not_internal",
      "claim": "Q-CL-GATE-001",
      "producer": "BOMA.Q.Gateway001.zmul_ne_zero"
    }
  ]
}
```
