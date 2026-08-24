# ST2-EXP-011 — Gate A Declaration-Closure Record 001

**Experiment:** `ST2-EXP-011`  
**Frozen accepted reference:** `b49826e58261a71634cd12756e8afda28920088f`  
**Frozen Plan commit:** `5cc05ef1bea8e88787041c3bc30dd0aecf5412d4`  
**Source root inspected:** `BOMA.C.QuadraticComparison001.quadraticComparison`  
**Source:** `LAB/payloads/lean/CStage/CQuadraticComparison001.lean`  
**Status:** `GATE-A SOURCE DECLARATION CLOSURE EXTRACTED / KERNEL AUDIT PENDING`

## Exact source-level closure

The comparison certificate is built from these proof roots:

```text
related_total_left       <- coordinateGeneration
related_total_right      <- coordinateGeneration
related_right_unique     <- coordinateUnique
related_left_unique      <- coordinateUnique
related_zero             <- coordinateZero
related_one              <- coordinateOne
related_real             <- coordinateReal
related_imag             <- coordinateImag
related_neg              <- coordinateNeg
related_add              <- coordinateAdd
related_mul              <- coordinateMul
related_inverse_witness  <- related_mul + related_right_unique + related_one
```

The relation itself uses only the common scalar carrier and `coord` fields.
The scalar operations needed to state the coordinate preservation laws are:

```text
zero
one
neg
add
mul
```

The complex-side data needed by this comparison closure are:

```text
carrier
zero
one
neg
add
mul
ofScalar
imag
coord
coordinateGeneration
coordinateUnique
coordinateZero
coordinateOne
coordinateReal
coordinateImag
coordinateNeg
coordinateAdd
coordinateMul
```

Notably absent from the direct comparison proof closure are the current full
presentation fields `nontrivial`, all additive/multiplicative ring-law fields,
`inverseExists`, `inverseUnique`, embedding injectivity/homomorphism laws,
`imagSquared`, and `coordinateExpression`. `related_inverse_witness` transports
a supplied inverse equation; it neither requires `inverseExists` nor selects an
inverse.

## Frozen interpretation

This is the actual source-declaration closure used to choose the experimental
interface, not a field-interface guess. The Do workflow must run the repository
Lean dependency auditor and `#print axioms` on the generic roots. If the formal
closure exposes a dependency not represented above, that discrepancy is a
Gate-A finding and must be recorded before any interface widening.

No accepted source was changed to obtain this record.
