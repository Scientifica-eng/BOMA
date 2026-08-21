# BOMA Architecture Consistency Evidence — PDSA-ARCH-002

**Status:** REVIEW_REQUIRED  
**Audited source commit:** `91ce0868b55dd2da399be421c1e1ee222a61ce74`  
**Workflow run ID:** `32455874607`

This gate complements the independent theorem-level stage transparency workflows. It checks current evidence freshness, Claim/policy agreement, required architecture/view records, canonical Unit coverage, and Junction/Decision mapping integrity.

## Audit log tail

```text
{
  "status": "REVIEW_REQUIRED",
  "policy_schema": "BOMA-ARCHITECTURE-CONSISTENCY-POLICY-001",
  "stats": {
    "stages": {
      "N-Core": {
        "status": "FAIL",
        "registry_claims": 20,
        "policy_claims": 20,
        "audited_sha": "ad9ec2850373cdd2a94d584d4c6035352d57ec75",
        "stale_inputs": 1
      },
      "N-Arithmetic": {
        "status": "FAIL",
        "registry_claims": 11,
        "policy_claims": 11,
        "audited_sha": "ee082647af0537620716b896d824048a2bca9347",
        "stale_inputs": 1
      },
      "Z": {
        "status": "PASS",
        "registry_claims": 11,
        "policy_claims": 11,
        "audited_sha": "5dc1d9be73c2a931702feb9d2f9cda2ff278daa7",
        "stale_inputs": 0
      },
      "Q": {
        "status": "FAIL",
        "registry_claims": 10,
        "policy_claims": 10,
        "audited_sha": "c4fa19a0d85de0a6f92957315b7e1a1ee565ca2a",
        "stale_inputs": 1
      },
      "R": {
        "status": "PASS",
        "registry_claims": 12,
        "policy_claims": 12,
        "audited_sha": "5dc1d9be73c2a931702feb9d2f9cda2ff278daa7",
        "stale_inputs": 0
      }
    },
    "units": {
      "canonical_total": 143,
      "bricks": 70,
      "blocks": 49,
      "junctions": 14,
      "decisions": 10,
      "orphan_actual_units": 1,
      "stale_mapped_units": 3
    }
  },
  "findings": [
    {
      "level": "ERROR",
      "scope": "N-Core",
      "path": "LAB/20_FORMALIZATION/N_CORE/evidence/N_CORE_FORMAL_DEPENDENCY_CLOSURE_PROTOTYPE_LATEST.md",
      "message": "latest PASS evidence is stale relative to current verification inputs: LAB/00_ARCHITECTURE/CLAIM_REGISTRY.md"
    },
    {
      "level": "ERROR",
      "scope": "N-Arithmetic",
      "path": "LAB/20_FORMALIZATION/N_ARITHMETIC/evidence/N_ARITH_FORMAL_DEPENDENCY_CLOSURE_PROTOTYPE_LATEST.md",
      "message": "latest PASS evidence is stale relative to current verification inputs: LAB/00_ARCHITECTURE/CLAIM_REGISTRY.md"
    },
    {
      "level": "ERROR",
      "scope": "Q",
      "path": "LAB/20_FORMALIZATION/Q_STAGE/evidence/Q_FORMAL_DEPENDENCY_CLOSURE_PROTOTYPE_LATEST.md",
      "message": "latest PASS evidence is stale relative to current verification inputs: LAB/00_ARCHITECTURE/CLAIM_REGISTRY.md"
    },
    {
      "level": "ERROR",
      "scope": "UNITS",
      "path": "LAB/10_CONSTRUCTION/junctions/Z-RE-J-001/UNIT.md",
      "message": "orphan canonical J unit is absent from the current architecture mapping corpus"
    }
  ]
}
```
