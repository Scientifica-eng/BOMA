# N-BLOCK-005 — TCT Realization Bridge

- **Operational Status:** **ACTIVE — V3/V5 PASS**
- **Epistemic Status:** MIXED — REPRESENTATION CHOICE + DERIVED FAITHFULNESS OBLIGATIONS
- **Members:** `N-BR-012`..`N-BR-017`
- **Depends on:** calibrated TCT path, `N-BLOCK-001`

## Export

A scoped certificate connecting the pre-numerical constructional ancestry to the formal carrier:

```text
ε ↦ z
ExtU ↦ s
selected-scope ≈ preservation
identity reflection
coverage/reconstruction
history ↔ constructor ancestry
```

The backend `TCTNF` datatype REPRESENTS selected syntax; it is not the canonical TCT carrier.

## Verification

Written architectural bridge: PASS.  
Claim-level V5: PASS in run `32163771789` under Lean 4.32.1.

The history correspondence is structural rather than numerical:

```text
reify(z)   = eps
reify(s n) = extU(reify n)
```

with realization/reification inverse evidence in the selected scope.
