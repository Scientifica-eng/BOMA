# PDSA-Q-001 — Pre-Rational Cancellation / Denominator Gateway

**CycleID:** `PDSA-Q-001`  
**Status:** **ACTIVE — QG-01 V5 / QG-02 STUDY NEXT**  
**Date:** 2026-08-18  
**Source:** `Z-BLOCK-002`  
**Target specification:** `BOMA-Q-ACCEPT-001 v1.0`

## PLAN

Before constructing a rational representation, discharge the mathematical assumptions normally hidden inside the phrase “fractions modulo cross multiplication.”

Primary questions:

```text
QG-01  Can accepted Z cancel a common nonzero multiplicative factor?
QG-02  What denominator discipline should Stage-One fraction syntax use?
```

No fraction-equivalence relation is promoted before QG-01 passes.

## DO — QG-01 candidate

Created:

`LAB/payloads/lean/QStage/QGatewayCancellation.lean`

The proof route is internal to accepted BOMA N/Z:

```text
N addition zero characterization
   ↓
N multiplication no-zero-divisor
   ↓
product of natural successors nonzero
   ↓
Z multiplication no-zero-divisor by signed cases
   ↓
additive cancellation / inverse uniqueness in accepted Z group
   ↓
negation-multiplication compatibility
   ↓
nonzero multiplicative cancellation in Z
```

Target interface:

```text
c ≠ 0 ∧ a*c = b*c → a=b
c ≠ 0 ∧ c*a = c*b → a=b

a ≠ 0 ∧ b ≠ 0 → a*b ≠ 0
```

No built-in integer-domain cancellation theorem is imported.

## Verification

Workflow:

`.github/workflows/boma-q-gateway-001.yml`

Evidence sink:

`LAB/20_FORMALIZATION/Q_STAGE/evidence/Q_GATEWAY_V5_LATEST.md`

QG-01 remains pending until the pinned-toolchain run is observed.

## QG-02 candidates for Study

### D1 — positive natural denominator

```text
numerator   : Z_BOMA
denominator : N_BOMA with 0 < denominator
```

Advantages:
- sign belongs only to numerator;
- order comparison has positive denominator orientation;
- no signed denominator normalization needed.

Costs:
- requires a clean positive-natural subtype/interface;
- multiplication/addition must repeatedly embed denominators into Z.

### D2 — nonzero natural denominator + sign convention

Similar to D1 but denominator validity is `d ≠ 0`; positivity is then automatic for naturals but may need an explicit bridge theorem.

### D3 — nonzero integer denominator

Advantages:
- fraction operations stay entirely inside Z.

Costs:
- duplicate sign representations;
- must normalize denominator sign or absorb it into equivalence/canonicalization;
- order cross multiplication requires sign control.

## Initial Study preference — not yet Act

For the first pair/equivalence route, **positive/nonzero natural denominators** appear structurally cleaner because accepted N already provides a canonical nonnegative magnitude domain and avoids denominator-sign duplication.

This is a hypothesis to test after QG-01 verification, not yet a canonical Decision Point.

## ACT rule

Only after QG-01 PASS may the cycle:

1. select an experimental denominator discipline for Route F;
2. construct raw valid fractions;
3. prove cross-product equivalence is an equivalence relation using explicit cancellation;
4. open a separate representation comparison against a canonical/reduced route.
