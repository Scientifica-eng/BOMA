# PDSA-Q-002 — Rational Raw Arithmetic / Formal Identity Realization

**CycleID:** `PDSA-Q-002`  
**Status:** **ACTIVE — RAW ARITHMETIC V5 / Q-DP-001 STUDY**  
**Date:** 2026-08-18  
**Inputs:** `Q-GATE-BLOCK-001`, `Q-F-BLOCK-001`

## PLAN

Before selecting a formal rational carrier identity, verify that the intended arithmetic on raw valid fractions respects the already-certified equivalence relation.

Then compare three identity realizations:

```text
A  quotient/setoid carrier
B  canonical reduced fractions
C  raw fraction syntax with external FracEquiv as rational identity
```

The identity Decision Point is `Q-DP-001`.

## DO — raw arithmetic candidate

Created:

`LAB/payloads/lean/QStage/QRawArithmetic.lean`

It defines:

```text
denMul
rawZero
rawOne
rawNeg
rawAdd
rawMul
```

with denominator multiplication remaining positive by syntax.

Required respect theorems:

```text
x~x' → -x ~ -x'
x~x' ∧ y~y' → x*y ~ x'*y'
x~x' ∧ y~y' → x+y ~ x'+y'
```

The proofs are written through explicit four-factor rearrangement and distributivity in accepted Z rather than an external ring normalizer.

## Verification

Workflow:

`.github/workflows/boma-q-raw-arithmetic-001.yml`

Evidence sink:

`LAB/20_FORMALIZATION/Q_STAGE/evidence/Q_RAW_ARITH_V5_LATEST.md`

## Q-DP-001 Study frame

### Candidate A — quotient/setoid carrier

This would convert the already-certified `FracEquiv` into formal carrier equality by an explicit quotient commitment.

New commitment:

```text
quotient/setoid formation + lift/induction principles
```

No gcd infrastructure is required merely to form the carrier.

### Candidate B — canonical reduced fractions

This avoids quotient equality in the exported carrier but requires a new construction family:

```text
divisibility
gcd/reduction
normalization correctness
uniqueness of reduced representation
```

The cost is mathematical, not merely backend complexity.

### Candidate C — external setoid identity

This introduces the least formal machinery, but all downstream field/order/completion statements must remain explicitly modulo `FracEquiv`.

## Decision lock

Do not resolve `Q-DP-001` until the raw arithmetic respect subgate passes and the Study records whether Stage-One should pay quotient cost now or reduction cost now.
