# Z-ARITH-BLOCK-001 — Direct Signed Arithmetic Route

- **Operational Status:** **ACTIVE / V5 PASS**
- **Epistemic Status:** **CONSTRUCTED FROM SELECTED SIGNED CARRIER + ACCEPTED N-ARITHMETIC**
- **Depends on:** `Z-BLOCK-001`, `N-ARITH-BLOCK-001`

## Purpose

Construct integer addition and multiplication directly by case analysis on the selected signed normal-form carrier.

This is one production route only. Its successful verification does not by itself make these operations canonical.

## Export

```text
zaddD : Z_BOMA → Z_BOMA → Z_BOMA
zmulD : Z_BOMA → Z_BOMA → Z_BOMA
```

Addition uses direct sign cases and structural natural difference for mixed signs. Multiplication uses accepted natural multiplication plus sign parity.

No built-in integer carrier or built-in integer arithmetic is used.

## Verification

In workflow run `32169025968` under Lean 4.32.1:

```text
direct signed arithmetic route = PASS
```

The same route had already passed in the preceding run `32168880441`.

## Boundary

This Block proves construction/elaboration of the direct operations only. Associativity, commutativity, additive inverses, distributivity, and ring integration are separate obligations.
