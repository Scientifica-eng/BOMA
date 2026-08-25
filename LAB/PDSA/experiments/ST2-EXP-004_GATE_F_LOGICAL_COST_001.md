# ST2-EXP-004 — Gate F Logical-Cost Comparison 001

**Experiment:** `ST2-EXP-004 / R Total-Order Logical Regime`  
**Architectural origin:** `DECISION_POINT / R-DP-003`  
**Immutable Frozen Plan:** `LAB/PDSA/PDSA-ST2-EXP-004_R_TOTAL_ORDER_LOGICAL_REGIME.md`  
**Frozen Plan commit:** `89c9dc9154e7ca469e5c94c177be223205ee9dbd`  
**Frozen accepted reference:** `50f3031b8d2657cbe0710e73e5935d997d40e49b`  
**Gate-F verified head:** `79d58471566df7a11ab73b2436fdd85a007ee87c`  
**Workflow run:** `32834768942`  
**Artifact:** `9558205572`  
**Artifact SHA256:** `eb568cf04971351b80954ee93245bcb9034408477c2cb0e9102e3ebc6db7f543`  
**Disposition:** `PASS / LOGICAL COSTS CLASSIFIED / STUDY-ACT NEXT`

## 1. Purpose

Gate F consolidates the logical-cost evidence from Gates A–E. It adds no new
mathematics and changes no accepted producer. The comparison separates:

- the selected F-04 provider;
- other inherited classical declarations;
- kernel-level `propext`, `Classical.choice`, and `Quot.sound` ancestry;
- the explicit Gate-C hypothesis `CutComparability`;
- new internal axioms, of which there are none.

## 2. Baseline classification reproduced

The Gate-A matrix was regenerated on the exact Gate-F head and again reported:

```text
rows                 55
unique targets       50
F04_DIRECT            8
F04_TRANSITIVE        7
F04_FREE             22
OTHER_CLASSICAL_ONLY 18
unresolved            0
internal axioms       0
```

The Gate-B no-F04 whole-source assembly was regenerated and again reported:

```text
accepted manifest entries  88
survivor manifest entries  77
measured R roots surviving 16
measured R roots not       18
selected F-04 leaks         0
```

Failure to survive whole-source pruning is not automatically mathematical
necessity: packaging and source co-location are recorded separately from
per-declaration dependence.

## 3. Conditional comparability cost

The Gate-C alternative has:

```text
new hypothesis:          CutComparability
selected F-04 present:   NO
internal axioms:         NONE
```

The conditional `rLE_total_conditional` closure reports
`[propext, Quot.sound]`; the conditional sign-decomposition closure additionally
inherits `Classical.choice` from other already-retained real infrastructure.
Therefore an abstract `CutComparability` argument is a narrower logical
interface than the selected F-04 witness, but it is not itself a constructive
proof of comparability.

## 4. Same-carrier boundary cost

The Gate-D theorem

`rLE_totality_iff_cutComparability004`

has no new hypothesis, no selected F-04 dependency, no `Classical.*`
declaration in its measured closure, and no internal axiom. Its printed kernel
surface is `[propext, Quot.sound]`.

Thus, on the unchanged `LowerCut / CutEquiv / RBOMA / rLE` representation,
proving disjunctive real totality is exactly equivalent to supplying cut
comparability. Gate D did not produce an unconditional inhabitant of that
proposition from the frozen cut interface.

## 5. C without `orderTotal`

Gate E removes exactly one of the sixteen ST2-EXP-001 production-interface
properties:

```text
orderTotal
```

No replacement hypothesis is added. The Gate-F replay confirms no selected
F-04 dependency and no internal axiom in the seven-family survivor package.
Other classical ancestry remains in the retained real field machinery and must
not be conflated with F-04.

Seven accepted C Claim families survive in the measured alternative:

- `C-CL-CARRIER-001`
- `C-CL-REMBED-001`
- `C-CL-I-001`
- `C-CL-GEN-001`
- `C-CL-COORDUNIQ-001`
- `C-CL-NONREAL-001`
- `C-CL-COMPARE-001`

The current ST2-EXP-001 proof closure for these two does not survive removal of
`orderTotal`:

- `C-CL-FIELD-001`
- `C-CL-INTEGRATION-001`

The dependency is transitive through the current square/nonnegative → norm →
field path. This is a statement about the measured proof architecture, not a
claim that no alternative proof can exist.

## 6. Representative kernel evidence

Gate F printed:

```text
accepted rLE_total_classical
  [propext, Classical.choice, Quot.sound]

conditional rLE_total_conditional
  [propext, Quot.sound]

conditional rPosNeg_decomposition_conditional
  [propext, Classical.choice, Quot.sound]

same-carrier totality/comparability equivalence
  [propext, Quot.sound]

C survivor certificate without orderTotal
  [propext, Classical.choice, Quot.sound]

C comparison without orderTotal
  [propext, Classical.choice, Quot.sound]

ST2-EXP-011 generic quadraticComparison
  no axioms
```

## 7. Interpretation firewall

The final interpretation is constrained as follows:

1. removing F-04 does not mean all classical commitments are absent;
2. formal ancestry does not equal mathematical necessity;
3. conditional `CutComparability` is not constructive recovery;
4. failure of totality does not imply failure of the partial-order core;
5. source-level pruning failure does not by itself prove theorem-level
   dependence;
6. stronger locatedness/cut data would change the frozen representation and is
   therefore outside ST2-EXP-004.

**Gate F final disposition:** `PASS / LOGICAL COST MATRIX VERIFIED / FINAL STUDY-ACT NEXT`.
