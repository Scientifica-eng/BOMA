# Z-RE-BLOCK-001 — Nonnegative-Cone Reverse N Candidate

- **Operational Status:** **ACTIVE / Z-ONLY V5 PASS**
- **Epistemic Status:** **DERIVED FROM ACCEPTED Z ORDERED-RING INTERFACE**
- **PDSA:** `PDSA-Z-RE-001`
- **Depends on:** `Z-BLOCK-002`

## Carrier

```text
N_Cone(Z) := { x : Z_BOMA | 0 ≤ x }
```

The carrier definition does not mention `N_BOMA` and does not use `embedN` as its definition.

## Z-derived structure

Constructed by restriction/closure from accepted Z:

```text
coneZero
coneSucc(x) := x + 1
coneAdd
coneMul
coneLE
```

with closure under successor, addition, and multiplication and inherited total-order behavior.

## Verification

Z-only reverse-core workflow:

```text
run:  32170817620
Lean: 4.32.1
PASS
```

Evidence:

`LAB/20_FORMALIZATION/Z_STAGE/evidence/Z_TO_N_REVERSE_CORE_V5_LATEST.md`

## Boundary

This Block alone does not establish that the cone has the original bottom-up N induction/recursion/initiality package. Exact comparison with `N_BOMA` belongs to the later comparison layer.
