# Q-BLOCK-001 — Verified Rational Quotient Carrier / Identity Interface

- **Operational Status:** **ACTIVE — CARRIER / IDENTITY / LIFTED OPERATIONS V5 PASS**
- **Epistemic Status:** **MIXED — EXPLICIT QUOTIENT FORMALIZATION COMMITMENT + DERIVED REPRESENTATION EQUALITY**
- **Depends on:** `Q-F-BLOCK-001`, `Q-F-BLOCK-002`, `Q-DP-001`

## Carrier

```text
fracSetoid : Setoid RawFrac
Q_BOMA := Quotient fracSetoid
```

This is the first BOMA Stage-One number-domain candidate whose formal carrier identity explicitly uses quotient formation.

## Equality interface

For raw valid representatives:

```text
qmk(x) = qmk(y) ↔ FracEquiv(x,y).
```

Thus formal `Q_BOMA` equality reflects exactly the cross-product representation equivalence already verified before quotient formation.

## Lifted operations

Already constructed and V5 checked:

```text
qNeg
qAdd
qMul
qZero
qOne
qOfZ : Z_BOMA → Q_BOMA
```

with representative computation equations and injectivity of `qOfZ`.

The lifts use:

```text
Quotient.lift
Quotient.lift₂
Quotient.sound
Quotient.exact
```

against the previously verified raw operation-respect proofs.

## Verification

Final quotient-carrier V5:

```text
workflow run:    32174050137
verified commit: 0b18b225c258ff873e36d26c15a10f8117c499fe
Lean:            4.32.1
result:          PASS
```

Evidence:

`LAB/20_FORMALIZATION/Q_STAGE/evidence/Q_QUOTIENT_V5_LATEST.md`

## Study lineage

Earlier failed quotient runs were backend/API studies, not mathematical failures:

1. an invalid explicit helper-module import stopped before the source;
2. `Quotient.map₂` output-setoid inference was unsuitable for this bare assembled environment;
3. the final design uses direct `Quotient.lift/lift₂` into `Q_BOMA` and passes without introducing function extensionality.

## Commitment boundary

This Block introduces and records:

```text
Setoid packaging
Quotient carrier formation
quotient soundness / exactness
quotient lifting / induction infrastructure as needed downstream
```

It does **not** by itself introduce or imply:

```text
Classical
choice
function extensionality
proof irrelevance as a new axiom
built-in Rat
field laws
multiplicative inverse
rational order
QA-23 acceptance
```

Those must be separately evidenced if they appear.
