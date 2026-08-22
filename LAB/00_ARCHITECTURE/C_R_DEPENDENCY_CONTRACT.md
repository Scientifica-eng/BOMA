# C ← R DEPENDENCY CONTRACT — Accepted Interface Consumption Before Representation

**Document ID:** `BOMA-C-R-DEP-001`  
**Status:** **ACTIVE — FIRST FORMAL BOUNDARY QUESTION CLOSED / V5 32564789630 PASS**  
**Date:** 2026-08-21  
**C specification:** `BOMA-C-ACCEPT-001`  
**Upstream accepted export:** `R-BLOCK-001`  
**Upstream reverse audit:** `RE-R-001 CLOSED / COMPLETE`  
**Verified boundary experiment:** `PDSA-C-002 — CLOSED / run 32564789630 PASS`  
**Route comparison:** `PDSA-C-003 — CLOSED / both probes V5 32565335033 PASS`  
**Selected route experiment:** `PDSA-C-004 — ACTIVE / user-selected C-ROUTE-P`

## 1. Purpose

Define exactly what C is initially allowed to ask from accepted R before any complex representation is selected.

The governing rule is:

```text
C consumes the accepted R interface
≠
C inherits the selected Dedekind implementation of R
```

The current R producer history may remain relevant as provenance, but a C theorem may cite an R representation detail only when a new explicit dependency record justifies that choice.

---

# 2. Accepted R Claim surface relevant to C

The initial C semantic core requires only the algebraic/order strength needed to form and distinguish a quadratic extension.

## 2.1 Initially required mathematical Claim families

| R Claim | Initial C role | Classification at C boundary |
|---|---|---|
| `R-CL-NONTRIV-001` | establish `0_R ≠ 1_R`; support nondegeneracy | `MATHEMATICAL_CLAIM` — required |
| `R-CL-ADD-001` | coefficients, additive laws, negation | `MATHEMATICAL_CLAIM` — required |
| `R-CL-MUL-001` | coefficient multiplication and ordered-ring interaction | `MATHEMATICAL_CLAIM` — required |
| `R-CL-INV-001` | coefficient division / inverse witnesses when proving C inverse | `MATHEMATICAL_CLAIM` — likely required for future C field closure; **not used by the first nonsquare boundary proof** |
| `R-CL-FIELD-001` | accepted field-strength integration of R algebra/order | `MATHEMATICAL_CLAIM` — required package-level input |
| `R-CL-ORDER-001` | positivity of squares / impossibility of a real square equal to `-1` | `MATHEMATICAL_CLAIM` — required by `C-RL-001/002` |
| `R-CL-INTEGRATION-001` | certifies the preceding accepted R Claims coexist on the accepted R carrier | `MATHEMATICAL_CLAIM` / accepted export gateway |

The table declares the intended acceptance-level dependency surface. The later theorem-level formal closure must measure which specific R declarations are actually consumed.

## 2.2 Not initially required by the Stage-One C semantic core

The following accepted R properties are **not** currently dependencies of `BOMA-C-ACCEPT-001` core algebra:

| R Claim / feature | Current C classification |
|---|---|
| `R-CL-COMP-001` — Dedekind LUB completeness | **NOT REQUIRED BY CORE C CONTRACT; not used by abstract `C-RL-001/002` proof** |
| `R-CL-DENSITY-001` — Q density in R | **NOT REQUIRED BY CORE C CONTRACT; not used by abstract `C-RL-001/002` proof** |
| `R-CL-ARCH-001` — Archimedean characterization | **NOT REQUIRED BY CORE C CONTRACT; not used by abstract `C-RL-001/002` proof** |
| `R-CL-QEMBED-001` — explicit Q embedding into R | **NOT REQUIRED DIRECTLY BY CORE C CONTRACT; not used by abstract `C-RL-001/002` proof**; remains upstream provenance of R |

If a candidate C route later consumes one of these, that use must be classified as one of:

```text
mathematically required by a newly promoted C Claim;
route-specific convenience;
supporting lemma choice;
formalization/proof-engineering choice.
```

It may not be retroactively described as having been necessary to the ex-ante C contract.

---

# 3. Explicitly prohibited implicit dependencies

No C construction may silently depend on the following R realization details merely because they are present in the accepted R source tree:

```text
LowerCut
CutEquiv
cutSetoid
RBOMA := Quotient cutSetoid as a representation fact
principal-cut implementation details
Dedekind union LUB witness
cut membership search
cut bracketing
positive/negative-part multiplication implementation
Dedekind reciprocal construction
localized proof sites used only to establish those route-specific results
```

The type name `RBOMA` is, of course, the accepted formal carrier exported by R. The prohibition concerns treating its **internal Dedekind representation/quotient provenance** as a mathematical premise of C.

`PDSA-C-002` strengthens this boundary by proving the first C-support theorems against an explicit abstract `RStageIntegrationCertificate` parameter before instantiating the accepted certificate.

---

# 4. Route-neutral downstream lemmas expected from R

The C stage may prove ordinary algebraic/order consequences from the accepted R interface without reopening R, provided the proof depends only on accepted Claims.

## C-RL-001 — square nonnegativity

Target interface theorem:

```text
∀ x : R_BOMA, 0_R ≤ x * x.
```

Current implementation:

```text
square_nonnegative_of_interface
  (C : RStageIntegrationCertificate)

square_nonnegative_from_accepted_R
```

Source:

```text
LAB/payloads/lean/CStage/CRInterfaceNoSquareProbe001.lean
```

Current classification:

```text
SOURCE-LEVEL DERIVATION WRITTEN FROM ACCEPTED R INTERFACE
V5 CERTIFICATION PASS — RUN 32564789630 / SOURCE a6c894e62c48919712341cea1c0ea588590f9e5f
```

No Dedekind-specific representation theorem occurs in the abstract proof body.

## C-RL-002 — minus one is not a real square

Target interface theorem:

```text
¬ ∃ x : R_BOMA, x * x = -1_R.
```

Current implementation:

```text
minus_one_not_square_of_interface
  (C : RStageIntegrationCertificate)

minus_one_not_square_from_accepted_R
```

The abstract proof uses only the ordered-ring/nontriviality interface required to derive square nonnegativity, `0 ≤ 1`, negation reversal, and antisymmetry.

Current classification:

```text
SOURCE-LEVEL DERIVATION WRITTEN FROM ACCEPTED R INTERFACE
V5 CERTIFICATION PASS — RUN 32564789630 / SOURCE a6c894e62c48919712341cea1c0ea588590f9e5f
```

This result is expected to support:

```text
I not collapsing to the real image
coordinate independence
nonzero denominator a²+b² for coordinate inverse formulas
```

but those downstream uses remain unconstructed.

## C-RL-003 — sum of two squares vanishes only trivially

Potential target:

```text
a*a + b*b = 0_R → a = 0_R ∧ b = 0_R.
```

Expected status:

```text
DERIVABLE DOWNSTREAM FROM ACCEPTED R ORDER/FIELD CLAIMS
```

This is likely useful to the ordered-pair/rank-two inverse route, but it is not yet classified as required for every C representation. If only one route consumes it, it remains a route-specific supporting lemma rather than a universal C Claim.

---

# 5. Dependency questions and closure state

## C-RQ-001 — Formal sufficiency of accepted R interface

**Question:** Can `C-RL-001` and `C-RL-002` be proved in Lean using only declarations belonging to the accepted R Claim surface plus Trusted Base, without importing Dedekind representation-specific proof interfaces as mathematical premises?

**Current status:**

```text
CLOSED / PASS — ACCEPTED-R INTERFACE SUFFICIENT FOR C-RL-001/002
FORMAL PAYLOAD VERIFIED AT a6c894e62c48919712341cea1c0ea588590f9e5f
V5 RUN 32564789630 COMPLETED / SUCCESS
```

Current experiment:

```text
PDSA-C-002
LAB/payloads/lean/CStage/CRInterfaceNoSquareProbe001.lean
LAB/20_FORMALIZATION/C_STAGE/C_R_INTERFACE_PROBE_001_INPUTS.txt
.github/workflows/boma-c-r-interface-probe-001.yml
```

The abstract proof is parameterized by `RStageIntegrationCertificate`; the accepted-R corollary is a separate instantiation. Source inspection shows use of:

```text
orderTotal
orderAntisymm
nontrivial
addComm
addAssoc
addZeroLeft
addInverseRight
negOrderReversing
mulComm
mulOneLeft
distribRight
orderMulNonneg
```

and no use in the abstract proof of:

```text
qEmbeddingInjective
qOrderExact
strictIrrefl
addTranslateOrderIff
inverseExists
inverseUnique
positiveInverse
dedekindLUB
rationalDensity
archimedeanUpper
```

The final formal PASS criterion remains:

```text
PASS if the verified theorem elaborates at the declared accepted R interface
and no required mathematical dependency reaches representation-specific R machinery.
```

Until an exact retrievable workflow run is available:

```text
PASS is not claimed
FAIL is not claimed
```

A later failure is not automatically a mathematical obstruction. Study must distinguish:

```text
missing exported lemma
from
actual need to strengthen R
from
proof-engineering visibility
from
route-specific overreach
from
syntax/elaboration failure in the staged probe.
```

## C-RQ-002 — Polynomial infrastructure belongs to C, not R

If the polynomial-quotient candidate is probed, polynomial syntax/ring/evaluation/ideal or congruence infrastructure is **new C-route infrastructure** unless already exported independently elsewhere.

It must not be described as an R acceptance dependency merely because its coefficients are real.

**Status:** `OPEN / ROUTE-CONDITIONAL`.

## C-RQ-003 — Global inverse selection

Accepted R exports unique inverse witnesses rather than forcing a global Choice-backed inverse selector.

A C route that wants a function-valued real inverse for convenience must choose among:

```text
consume explicit witnesses locally;
derive a selector using an explicitly declared logical/formalization commitment;
construct the needed C inverse by a route that avoids a global R selector.
```

It may not silently strengthen the R interface.

**Status:** `OPEN / ROUTE-CONDITIONAL`.

---

# 6. Logical-commitment boundary

`RE-R-001` showed that the accepted R producer path contains localized classical commitments. C must not inherit those commitments merely by ancestry.

For every C proof:

```text
logical cost follows the declarations actually consumed
not the full historical ancestry of R-BLOCK-001.
```

`PDSA-C-002` illustrates the required distinction precisely:

```text
C probe source introduces no new explicit Classical/Choice call
≠
proof is therefore independent of all upstream logical choices
```

The abstract proof consumes `orderTotal`, and the currently accepted producer of R total comparability carries localized classical provenance under `R-DP-003`. Thus the downstream Claim must retain that dependency at the accepted R Claim/producer boundary unless a future alternative total-order producer reconverges with a different logical profile.

Conversely, C must not inherit unrelated classical sites merely because they occur elsewhere in the R construction history.

---

# 7. Representation-commitment boundary

The following distinction is mandatory for every candidate route:

```text
R_BOMA as the accepted upstream carrier
  = legitimate accepted input

Dedekind lower-cut realization of R_BOMA
  = upstream producer history, not automatically a C premise
```

A C carrier may be constructed from values of `R_BOMA` without thereby becoming Dedekind-specific. Representation dependence exists only if the C construction/proof opens or consumes the upstream representation internals rather than the accepted interface.

The current abstract nonsquare proof is deliberately written against `RStageIntegrationCertificate` and does not inspect `LowerCut`, `CutEquiv`, quotient representatives, cut membership, or reciprocal/multiplication internals.

---

# 8. Current minimal dependency hypothesis

Before route probes, the C core retains the following high-level dependency shape:

```text
R-CL-NONTRIV-001
R-CL-ADD-001
R-CL-MUL-001
R-CL-INV-001   [future field-closure need; not C-RL-001/002]
R-CL-FIELD-001
R-CL-ORDER-001
R-CL-INTEGRATION-001
        ↓
route-neutral R consequences
  square ≥ 0       [V5 32564789630 PASS]
  -1 not a square  [V5 32564789630 PASS]
        ↓
C quadratic-extension construction routes
```

Not currently in that core:

```text
R-CL-COMP-001
R-CL-DENSITY-001
R-CL-ARCH-001
Dedekind representation internals
```

`PDSA-C-002` verifies this separation at source/interface level through exact V5 run `32564789630` on commit `a6c894e62c48919712341cea1c0ea588590f9e5f`. The result remains supporting-theorem evidence; it is not an accepted C Claim or an extracted theorem-level dependency-closure certificate.

---

# 9. Reopening rule

Reopen this contract if any of the following occurs:

```text
BOMA-C-ACCEPT-001 changes materially;
C-DP-001 selects a route with additional R requirements;
the formal boundary probe finds a necessary undeclared R dependency;
an accepted R Claim used by C is revised;
a route begins consuming Dedekind-specific internals;
a new logical commitment appears in actual formal closure;
V5 elaboration of the staged abstract probe exposes a dependency or packaging assumption not visible in source inspection.
```

The corrective action must update the current classification without erasing the PDSA record of the earlier hypothesis and what falsified or refined it.