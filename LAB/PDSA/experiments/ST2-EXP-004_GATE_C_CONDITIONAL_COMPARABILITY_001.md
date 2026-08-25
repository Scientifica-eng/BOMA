# ST2-EXP-004 Gate C — Conditional Comparability 001

**Experiment:** `ST2-EXP-004`  
**Gate:** `C — conditional comparability interface isolation`  
**Disposition:** `PASS / CONDITIONAL INTERFACE ISOLATED / GATE D NEXT`  
**Frozen accepted reference:** `50f3031b8d2657cbe0710e73e5935d997d40e49b`  
**Frozen Plan commit:** `89c9dc9154e7ca469e5c94c177be223205ee9dbd`  
**Verified exact head:** `b03419c300e8ffce62a0dfec62faed54923781d4`

## 1. Result

A research-only source recovers the measured totality consumers from an explicitly supplied narrow hypothesis:

```text
hComp : CutComparability
```

without importing or naming the selected concrete F-04 witness.

Verified roots:

```text
BOMA.R.StageTwo.TotalOrderRegime004.Conditional.rLE_total_conditional
BOMA.R.StageTwo.TotalOrderRegime004.Conditional.rPosNeg_decomposition_conditional
BOMA.R.StageTwo.TotalOrderRegime004.Conditional.conditionalComparabilityCertificate
```

All are classified:

```text
CONDITIONAL_ON_CUT_COMPARABILITY
```

This is interface isolation, not constructive totality recovery.

## 2. Exact evidence

```text
head      b03419c300e8ffce62a0dfec62faed54923781d4
run       32833676190
job       97757862592
artifact  9557786428
sha256    6d7a667925e0c381d3ec821df7fbb75b35f365b2fa1a83e0e3d4b0f2946d395e
result    SUCCESS / GATE_C_PASS
```

Dependency audit:

```text
internal declarations       453
external boundary            75
dependency edges           5256
unresolved                    0
unmapped internal ranges      0
internal axioms               0
selected F-04 present      false
CutComparability present    true
```

The closure still contains another `Classical.em` from unchanged accepted ancestry. Therefore Gate C does not establish full constructivity.

## 3. Axiom evidence

```text
rLE_total_conditional
  [propext, Quot.sound]

rPosNeg_decomposition_conditional
  [propext, Classical.choice, Quot.sound]

conditionalComparabilityCertificate
  [propext, Classical.choice, Quot.sound]
```

The `Classical.choice` cost is inherited through unchanged non-F-04 accepted ancestry used by the sign-decomposition support, not introduced by a selected F-04 witness in this research source.

## 4. Source firewall

`ST2Exp004ConditionalComparability.lean` contains no:

```text
Classical.em
Classical.byContradiction
Classical.choose
axiom
sorry
cutComparability_classical
rLE_total_classical
```

The accepted `LowerCut`, `CutEquiv`, `RBOMA`, `CutLE`, `rLE`, and accepted Q/R/C sources remain unchanged.

## 5. Interpretation

Gate C establishes that the downstream consumers measured here depend on the **shape** of the narrow comparability interface. It does not establish an independent inhabitant of that interface.

Hence:

```text
explicit hComp assumption
!= constructive CutComparability proof
conditional totality
!= accepted F-04 replacement
conditional consumer recovery
!= accepted R producer
```

Historical Gate-C failures 005 and 006 remain preserved and immutable.

## 6. Final disposition

**Gate C final disposition:** `PASS / CONDITIONAL INTERFACE ISOLATED / GATE D NEXT`.

Gate D must now ask the distinct question whether same-carrier disjunctive totality itself can be recovered without a concrete F-04 provider, without an abstract `CutComparability` assumption in the final theorem, and without strengthening the accepted representation contract.