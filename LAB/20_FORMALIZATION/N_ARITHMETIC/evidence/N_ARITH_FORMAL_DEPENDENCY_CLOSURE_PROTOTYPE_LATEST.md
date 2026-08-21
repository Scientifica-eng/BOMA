# N-Arithmetic Formal Dependency Closure — Prototype Evidence

**Status:** PROTOTYPE_PASS  
**Boundary classification:** CLASSIFICATION_PASS  
**Claim/producer comparison:** CLAIM_PRODUCER_PASS  
**Audited source commit:** `ee082647af0537620716b896d824048a2bca9347`  
**Workflow run ID:** `32454880229`  
**Pinned toolchain:** `leanprover/lean4:v4.32.1`  
**Root mode:** `producer_union` over accepted addition/multiplication/order targets  
**Accepted assembly manifest:** `LAB/20_FORMALIZATION/N_ARITHMETIC/N_ARITH_ACCEPTED_INPUTS.txt`

| Step | Outcome |
|---|---|
| Lean setup | success |
| compile accepted N-Arithmetic assembly + extract multi-target closure | success |
| classify formal boundary | success |
| compare actual closure against N-Arithmetic Claim producers | success |

 alone is not a transparency certification. Promotion requires both  and  with zero residuals.

## Claim/producer comparison log tail

```text
      "name": "BOMA.NCore.RB001.BOMANat.brecOn.go",
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
      "name": "BOMA.NCore.RB001.BOMANat.casesOn",
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
      "name": "BOMA.NCore.RB001.BOMANat.noConfusion",
      "claims": [
        "NAR-CL-ADD-001",
        "NAR-CL-ORDER-001",
        "NAR-CL-ORDERCONV-001"
      ]
    },
    {
      "name": "BOMA.NCore.RB001.BOMANat.noConfusionType",
      "claims": [
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
