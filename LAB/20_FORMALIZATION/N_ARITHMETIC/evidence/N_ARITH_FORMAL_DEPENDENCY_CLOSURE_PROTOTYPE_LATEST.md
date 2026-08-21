# N-Arithmetic Formal Dependency Closure — Matrix Evidence

**Status:** PROTOTYPE_PASS  
**Boundary classification:** CLASSIFICATION_PASS  
**Claim/producer comparison:** CLAIM_PRODUCER_PASS  
**Audited source commit:** `8b169bb226a06aa077713a337c131f426aac3cd6`  
**Workflow run ID:** `32456174410`  
**Pinned toolchain:** `leanprover/lean4:v4.32.1`  
**Root mode:** `producer_union`  
**Accepted assembly manifest:** `LAB/20_FORMALIZATION/N_ARITHMETIC/N_ARITH_ACCEPTED_INPUTS.txt`  
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
        "NAR-CL-ADD-001",
        "NAR-CL-ORDER-001",
        "NAR-CL-ORDERCONV-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.BOMANat.rec",
      "claims": [
        "NAR-CL-ADD-001",
        "NAR-CL-ADDCONV-001",
        "NAR-CL-ADDDEF-001",
        "NAR-CL-MUL-001",
        "NAR-CL-MULCONV-001",
        "NAR-CL-MULDEF-001",
        "NAR-CL-ORDER-001",
        "NAR-CL-ORDERARITH-001",
        "NAR-CL-ORDERCONV-001",
        "NAR-CL-ORDERDEF-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.BOMANat.s",
      "claims": [
        "NAR-CL-ADD-001",
        "NAR-CL-ADDCONV-001",
        "NAR-CL-ADDDEF-001",
        "NAR-CL-MUL-001",
        "NAR-CL-MULCONV-001",
        "NAR-CL-MULDEF-001",
        "NAR-CL-ORDER-001",
        "NAR-CL-ORDERARITH-001",
        "NAR-CL-ORDERCONV-001",
        "NAR-CL-ORDERDEF-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.BOMANat.s.inj",
      "claims": [
        "NAR-CL-ORDER-001",
        "NAR-CL-ORDERCONV-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.BOMANat.s.injEq",
      "claims": [
        "NAR-CL-ORDER-001",
        "NAR-CL-ORDERCONV-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.BOMANat.s.noConfusion",
      "claims": [
        "NAR-CL-ADD-001",
        "NAR-CL-ORDER-001",
        "NAR-CL-ORDERCONV-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.BOMANat.z",
      "claims": [
        "NAR-CL-ADD-001",
        "NAR-CL-ADDCONV-001",
        "NAR-CL-ADDDEF-001",
        "NAR-CL-MUL-001",
        "NAR-CL-MULCONV-001",
        "NAR-CL-MULDEF-001",
        "NAR-CL-ORDER-001",
        "NAR-CL-ORDERARITH-001",
        "NAR-CL-ORDERCONV-001",
        "NAR-CL-ORDERDEF-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.fold",
      "claims": [
        "NAR-CL-ADD-001",
        "NAR-CL-ADDCONV-001",
        "NAR-CL-ADDDEF-001",
        "NAR-CL-MUL-001",
        "NAR-CL-MULCONV-001",
        "NAR-CL-MULDEF-001",
        "NAR-CL-ORDER-001",
        "NAR-CL-ORDERARITH-001",
        "NAR-CL-ORDERCONV-001",
        "NAR-CL-ORDERDEF-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.fold._f",
      "claims": [
        "NAR-CL-ADD-001",
        "NAR-CL-ADDCONV-001",
        "NAR-CL-ADDDEF-001",
        "NAR-CL-MUL-001",
        "NAR-CL-MULCONV-001",
        "NAR-CL-MULDEF-001",
        "NAR-CL-ORDER-001",
        "NAR-CL-ORDERARITH-001",
        "NAR-CL-ORDERCONV-001",
        "NAR-CL-ORDERDEF-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.ind.match_1",
      "claims": [
        "NAR-CL-ADD-001",
        "NAR-CL-ADDCONV-001",
        "NAR-CL-ADDDEF-001",
        "NAR-CL-MUL-001",
        "NAR-CL-MULCONV-001",
        "NAR-CL-MULDEF-001",
        "NAR-CL-ORDER-001",
        "NAR-CL-ORDERARITH-001",
        "NAR-CL-ORDERCONV-001",
        "NAR-CL-ORDERDEF-001"
      ]
    }
  ],
  "residuals": []
}
```
