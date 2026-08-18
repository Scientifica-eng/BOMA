# PDSA-Q-002 — Rational Raw Arithmetic / Formal Identity Realization

**CycleID:** `PDSA-Q-002`  
**Status:** **ACTIVE — RAW ARITHMETIC PASS / Q-DP-001 RESOLVED / QUOTIENT V5 RECHECK**  
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

The project already possesses exactly the prerequisites quotient lifting should consume:

```text
verified equivalence relation
verified negation respect
verified addition respect
verified multiplication respect
faithful Z raw embedding
```

New accepted commitment if selected:

```text
Setoid packaging
Quotient carrier formation
quotient soundness/exactness
quotient map/lift/induction infrastructure
```

This is the first quotient-like carrier commitment in the accepted number-domain chain.

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

This route is retained for Stage-II / later comparison because its cost is mathematically substantive.

## Candidate C — external setoid identity

Has the smallest formal machinery but leaves every downstream field/order/completion theorem stated modulo an external relation rather than carrier equality.

## Decision

`Q-DP-001` is **RESOLVED — Candidate A selected**.

Rationale:

```text
all mathematical quotient prerequisites are already verified
carrier equality can now reflect the certified representation relation
no gcd infrastructure is needed merely to form Stage-One Q
quotient cost is explicit rather than hidden
reduced-fraction route remains preserved
```

Selection is methodological/formalization-dependent, not mathematical necessity.

---

# DO — quotient carrier candidate

Created:

`LAB/payloads/lean/QStage/QQuotientCarrier.lean`

Candidate interface:

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

with quotient equality reflection and injective Z embedding.

## First quotient V5 Study

Run `32173336344` failed because the concatenated backend assembly did not import the helper layer defining `Quotient.map` / `Quotient.map₂`.

This was a **backend assembly limitation**, not a mathematical quotient failure:

```text
Setoid formation compiled
Quotient formation compiled
Quotient.sound compiled
Quotient.exact compiled
```

The workflow was corrected to prepend an explicit:

```text
import Init.Data.Quot
```

before concatenating the BOMA verification fragments.

The source was also kept on direct quotient binary lifting and does not introduce `funext` merely to define binary operations.

## ACT

Current action:

```text
KEEP Q-DP-001 RESOLVED — quotient selected
KEEP Q_BOMA as CANDIDATE until fresh V5 PASS
DO NOT infer field laws/inverse/order from carrier formation
KEEP reduced-fraction route as retained alternative
```

Once quotient V5 passes, close this cycle and open the field/inverse/order construction family.
