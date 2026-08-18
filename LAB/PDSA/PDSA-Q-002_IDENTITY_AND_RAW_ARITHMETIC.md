# PDSA-Q-002 — Rational Raw Arithmetic / Formal Identity Realization

**CycleID:** `PDSA-Q-002`  
**Status:** **CLOSED — RAW ARITHMETIC PASS / Q-DP-001 RESOLVED / QUOTIENT CARRIER V5 PASS**  
**Date:** 2026-08-18  
**Inputs:** `Q-GATE-BLOCK-001`, `Q-F-BLOCK-001`, `Q-F-BLOCK-002`

## PLAN

Before selecting a formal rational carrier identity, verify that intended arithmetic on raw valid fractions respects the already-certified equivalence relation.

Then compare:

```text
A  quotient/setoid carrier
B  canonical reduced fractions
C  raw syntax + external FracEquiv
```

## DO — raw arithmetic

`LAB/payloads/lean/QStage/QRawArithmetic.lean`

constructs:

```text
denMul
rawZero
rawOne
rawNeg
rawAdd
rawMul
```

and proves:

```text
x~x' → -x ~ -x'
x~x' ∧ y~y' → x*y ~ x'*y'
x~x' ∧ y~y' → x+y ~ x'+y'
```

### First V5 Study

Run `32172739356` failed in proof engineering only:

```text
one reversed factor-rearrangement equality in multiplication respect
one four-factor ordering path in addition respect
unavailable congrArg₂ helper syntax in the bare backend
```

No raw operation definition changed.

Corrections replaced the proof orientations/order and used sequential ordinary `congrArg` applications.

### Final raw-arithmetic V5

```text
workflow run: 32173010564
Lean:         4.32.1
result:       PASS
```

Canonical unit:

`Q-F-BLOCK-002`.

---

# STUDY — formal identity candidates

## Candidate A — quotient/setoid carrier

The project already possesses exactly the prerequisites quotient lifting consumes:

```text
verified equivalence relation
verified negation respect
verified addition respect
verified multiplication respect
faithful Z raw embedding
```

New accepted commitment:

```text
Setoid packaging
Quotient carrier formation
quotient soundness/exactness
quotient lift/induction infrastructure
```

This is the first quotient-like carrier commitment in the accepted BOMA number-domain chain.

## Candidate B — reduced fractions

Would require a new construction family before identity can be canonical:

```text
divisibility
gcd
reduction algorithm
normalization correctness
reduced-form uniqueness
operation normalization
```

This route remains retained for Stage-II / later comparison because its cost is mathematically substantive.

## Candidate C — external setoid identity

Has the smallest formal machinery but leaves every downstream field/order/completion theorem stated modulo an external relation rather than carrier equality.

## Decision

`Q-DP-001` is **RESOLVED — Candidate A selected**.

Rationale:

```text
all mathematical quotient prerequisites are already verified
carrier equality can reflect the certified representation relation
no gcd infrastructure is needed merely to form Stage-One Q
quotient cost is explicit rather than hidden
reduced-fraction route remains preserved
```

Selection is methodological/formalization-dependent, not mathematical necessity.

---

# DO — quotient carrier realization

`LAB/payloads/lean/QStage/QQuotientCarrier.lean`

constructs:

```text
fracSetoid : Setoid RawFrac
Q_BOMA := Quotient fracSetoid
qmk
qNeg
qAdd
qMul
qZero
qOne
qOfZ
```

with:

```text
qmk(x)=qmk(y) ↔ FracEquiv(x,y)
qOfZ injective
representative computation equations
```

## Quotient V5 Study lineage

### Run `32173336344`

The bare assembled environment did not expose the higher-level `Quotient.map/map₂` helpers used by the first spelling. Core quotient formation/soundness/exactness had already elaborated.

### Run `32173821831`

An attempted explicit helper-module import was itself invalid in the pinned environment and stopped before the BOMA quotient source. The import was removed; it is not a project commitment.

### Run `32173496433`

The `Quotient.map₂` spelling also exposed output-setoid inference friction in the bare verification environment.

### Final design

The source was rewritten to the direct codomain-oriented primitives:

```text
Quotient.lift
Quotient.lift₂
```

with well-definedness discharged by the already-verified raw respect theorems and `qmk_sound`.

This avoids both output-setoid inference and any need to introduce function extensionality merely to define binary operations.

### Final quotient-carrier V5

```text
workflow run:    32174050137
verified commit: 0b18b225c258ff873e36d26c15a10f8117c499fe
Lean:            4.32.1
result:          PASS
```

Canonical carrier unit:

`Q-BLOCK-001`.

---

# STUDY — commitment result

The successful quotient realization requires exactly the currently recorded quotient machinery:

```text
Setoid
Quotient formation
Quotient.sound / Quotient.exact
Quotient.lift / Quotient.lift₂
```

The construction has not established a need for:

```text
Classical
choice
function extensionality
built-in Rat
```

Those remain unintroduced unless a later theorem actually consumes them.

A backend API/import failure is therefore not to be reclassified as a mathematical or logical commitment.

---

# ACT

Promote:

```text
Q-F-BLOCK-002   PASS / V5
Q-DP-001        RESOLVED — quotient selected
Q-BLOCK-001     carrier/identity/lifted operations V5 PASS
```

Close this cycle.

Open the next construction family on:

```text
raw additive/multiplicative laws modulo FracEquiv
lifting those laws to Q_BOMA
nonzero multiplicative inverse
rational order
field/order integration
```

Do not infer field laws or QA-23 acceptance merely from quotient carrier success.
