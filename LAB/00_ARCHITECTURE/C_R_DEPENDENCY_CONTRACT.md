# C ← R DEPENDENCY CONTRACT — Production Surface and Comparison-Boundary Distinction

**Document ID:** `BOMA-C-R-DEP-001`  
**Status:** **ACTIVE — CANONICAL C PRODUCTION R→C MATHEMATICAL SURFACE / ST2-EXP-001 + ST2-EXP-011 DISTINCTION INTEGRATED**  
**Date:** 2026-08-24  
**C specification:** `BOMA-C-ACCEPT-001`  
**Upstream selected export:** `R-BLOCK-001`  
**Narrow production-interface experiment:** `ST2-EXP-001 / CLOSED / PASS / V5 32593045224`  
**Comparison-interface experiment:** `ST2-EXP-011 / CLOSED / PASS / LESSON INTEGRATED`  
**Accepted C:** `C-BLOCK-001` selected producer; `C-BLOCK-002 / CA-20 ACCEPT`  
**Architecture integration authorities:** `BOMA-ST2-LEARNING-INTEGRATION-001` and `BOMA-ST2-LEARNING-INTEGRATION-002`.

## 1. Purpose

Define the **mathematical production interface** that C is allowed and required
to consume from R, separately from:

1. the larger historical formal package carried by accepted implementation
   assemblies; and
2. the still narrower scalar interface consumed only by the quadratic comparison
   Block.

The governing distinctions are:

```text
selected R producer = R-BLOCK-001 / Dedekind
!=
Dedekind representation internals are premises of C
```

```text
C production mathematical dependency
!=
whole accepted R integration bundle
```

and, after `ST2-EXP-011`:

```text
C production dependency
!=
C quadratic-comparison dependency
```

These are different consumer boundaries and must not be collapsed.

## 2. Canonical C production mathematical dependency surface — ST2-EXP-001

`ST2-EXP-001` established that the selected C Claim meaning survives when the
whole accepted `RStageIntegrationCertificate` is replaced by exactly these
sixteen properties:

```text
orderTrans
orderAntisymm
orderTotal
nontrivial
addComm
addAssoc
addZeroLeft
addInverseRight
addTranslateOrderIff
negOrderReversing
mulComm
mulAssoc
mulOneLeft
distribRight
orderMulNonneg
inverseExists
```

This sixteen-field surface remains the canonical **production mathematical
dependency contract** of `BOMA-C-R-DEP-001`.

Formal witness:

```text
BOMA.C.StageTwo.NarrowRInterface001.NarrowROrderedFieldCertificate
BOMA.C.StageTwo.NarrowRInterface001.narrowRFromAcceptedProducers
```

Source:

`LAB/payloads/lean/CStage/ST2Exp001NarrowRInterface.lean`.

The certificate is assembled directly from accepted R producers rather than by
projecting the oversized accepted-R integration certificate.

## 3. Quadratic comparison uses a different, narrower surface — ST2-EXP-011

`ST2-EXP-011` did not reopen or shrink the sixteen-property **production**
contract. It studied the scalar hard-wiring inside the existing
`C-COMPARE-BLOCK-001` only.

Exact declaration closure established that the direct comparison proof consumes
scalar operations:

```text
zero
one
neg
add
mul
```

plus the quadratic presentation's explicit coordinate interface:

```text
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

This second surface is authoritative inside:

```text
C-COMPARE-BLOCK-001 / C-CL-COMPARE-001
```

and is **not** a replacement definition of `BOMA-C-R-DEP-001`.

Canonical classification:

```text
PRODUCTION C mathematical dependency
  authority = BOMA-C-R-DEP-001
  surface   = exact sixteen properties

QUADRATIC COMPARISON dependency
  authority = C-COMPARE-BLOCK-001
  surface   = zero/one/neg/add/mul + explicit coordinate laws
```

The comparison proof does not directly require scalar order, completeness,
density, Archimedean properties, a general field-law bundle, or scalar
inverse-existence/uniqueness fields. Its inverse-witness theorem transports a
supplied witness rather than selecting one.

## 4. Why the distinction matters

The comparison layer answers a narrower question than production of the whole C
structure. Therefore its smaller closure cannot be extrapolated into the claim:

```text
"C as a whole needs only zero/one/neg/add/mul"
```

which would be false relative to the verified production evidence.

Conversely, the larger sixteen-property production surface cannot be projected
onto `C-COMPARE-BLOCK-001` as mathematical necessity merely because the accepted
formal implementation has those declarations available upstream.

Dependency architecture follows the actual consumer proof closure at each
boundary.

## 5. Accepted semantics and formal provenance

The existing accepted comparison implementation is still built in the selected
`RBOMA / RStageIntegrationCertificate` environment. `ST2-EXP-011` verified a
forgetful/generic factoring and proved its accepted relation semantics are
definitionally preserved (`related_iff_accepted` by `rfl`).

Therefore:

```text
accepted C Claim meaning              unchanged
accepted CQuadraticComparison001      unchanged
accepted C manifests                  unchanged
canonical production R→C contract     unchanged
comparison dependency classification  refined
```

The generic experimental Lean sources remain research-only. A later accepted
source refactor may make the implementation closure match the new architectural
comparison boundary more literally, but that is a separate controlled change.

## 6. Claim-family interpretation of the production surface

The sixteen production properties sit inside these accepted R Claim families:

```text
R-CL-NONTRIV-001
R-CL-ADD-001
R-CL-MUL-001
R-CL-INV-001
R-CL-FIELD-001
R-CL-ORDER-001
R-CL-INTEGRATION-001
```

The following accepted R properties are not mathematical dependencies of the
selected C **production** core contract:

```text
R-CL-COMP-001      Dedekind LUB completeness
R-CL-DENSITY-001   Q density in R
R-CL-ARCH-001      Archimedean characterization
R-CL-QEMBED-001    explicit Q embedding, as a direct C requirement
```

They remain valid accepted R properties and may remain in formal ancestry.

The direct comparison Claim is classified separately:

```text
C-CL-COMPARE-001
  → scalar operations + explicit quadratic coordinate laws
```

`C-CL-INTEGRATION-001` remains a secondary downstream audit Claim; ST2-EXP-011
did not replace `C-J-001`.

## 7. Explicitly prohibited implicit representation dependencies

No C construction may silently treat the following as mathematical premises
merely because the selected R producer uses them:

```text
LowerCut
CutEquiv
cutSetoid
principal-cut internals
Dedekind union LUB witness
cut membership search / bracketing
positive/negative-part multiplication implementation
Dedekind reciprocal implementation
route-local proof machinery used only to establish accepted R Claims
```

`RBOMA` remains the selected accepted formal carrier. The prohibition concerns
consuming hidden representation history rather than exported mathematical
interfaces.

## 8. Route-neutral and alternative-producer evidence

`PDSA-C-002` established interface-level consequences before C route selection,
including square nonnegativity and non-squareness of `-1` at the accepted-real
boundary.

`ST2-EXP-003` later established an independent Cauchy real producer and explicit
field/order isomorphism with selected Dedekind R. H6 rebuilt seven selected C
core meanings natively over Cauchy R.

`ST2-EXP-011` then strengthened the comparison-specific interpretation by
showing that the H6/RCBOMA research producer can instantiate the generic
quadratic comparison interface **without H5 `cToD` or selected Dedekind
implementation transport**.

This is evidence that the comparison boundary is genuinely interface-level, not
a disguised dependence on Dedekind representation internals. It does not make
Cauchy R selected or accepted.

## 9. Mathematical dependency versus current formal closure

The current classification is:

```text
CANONICAL C PRODUCTION MATHEMATICAL SURFACE
  = sixteen properties from ST2-EXP-001

CANONICAL C COMPARISON MATHEMATICAL SURFACE
  = zero/one/neg/add/mul + coordinate laws from ST2-EXP-011

CURRENT ACCEPTED C FORMALIZATION
  = accepted historical sources/manifests whose actual ancestry may be larger
```

Extra bundled ancestry is formalization/provenance over-bundling, not a license
to enlarge mathematical necessity.

Likewise, architectural recognition of a smaller sufficient interface does not
pretend an accepted implementation refactor has already happened.

## 10. Logical-commitment boundary

Logical cost follows declarations actually consumed by the relevant boundary.

For the production surface, `orderTotal` remains one of the sixteen properties;
the selected accepted producer of totality has localized classical provenance
under `R-DP-003`.

For the generic comparison root, exact ST2-EXP-011 evidence reports no axioms.
The native H6 adapter roots use `[propext, Quot.sound]`, while accepted-RBOMA
adapter roots inherit `[propext, Classical.choice, Quot.sound]` from accepted
formal ancestry.

That inherited Choice cost is not promoted into generic comparison necessity.

## 11. Reopening rule

Reopen the **production** `BOMA-C-R-DEP-001` contract if:

```text
BOMA-C-ACCEPT-001 changes materially;
a newly accepted C production Claim requires an R property outside the sixteen fields;
a selected C implementation consumes a representation-specific R fact as a mathematical premise;
an accepted R Claim used by the sixteen-field surface changes;
a new logical commitment appears in the actual minimal production surface;
a future controlled experiment proves some production fields unnecessary;
a future accepted C route requires a stronger shared production scalar contract.
```

Reopen the **comparison** boundary in `C-COMPARE-BLOCK-001` if:

```text
C-CL-COMPARE-001 changes meaning;
a comparison theorem consumes a scalar property beyond the integrated surface;
a global selector is proposed or introduced;
a future accepted source refactor fails to preserve accepted Related semantics;
a new comparison target cannot instantiate the coordinate interface.
```

Formal bundling changes alone do not automatically change either mathematical
contract.

## 12. Provenance and evidence

```text
PDSA-C-002
  initial accepted-R interface sufficiency probe
  V5 32564789630 PASS

RE-C-001 / PDSA-C-009
  measured accepted C → R dependency closure

ST2-EXP-001
  production dependency experiment
  CLOSED / PASS / V5 32593045224
  integrated by BOMA-ST2-LEARNING-INTEGRATION-001

ST2-EXP-011
  C-COMPARE-BLOCK-001 scalar/interface experiment
  CLOSED / PASS
  final lifecycle-closed head 632a7134f26daf9dd781e3546804941f429a4246
  exact run 32754345656
  artifact 9530261359
  merged by 72394878854aa69e865d17567959bec1daa70e6d
  integrated by BOMA-ST2-LEARNING-INTEGRATION-002
```

Architecture integration records:

```text
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md
LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_002.md
```

## 13. Current boundary summary

```text
upstream selected R export          R-BLOCK-001 / Dedekind
C production R→C dependency         exact sixteen-property interface
comparison scalar dependency        zero/one/neg/add/mul + coordinate laws
comparison Claim owner              C-COMPARE-BLOCK-001
selected C route                    C-ROUTE-P
selected C producer                 C-BLOCK-001
accepted C integration              C-J-001
accepted C export                   C-BLOCK-002 / CA-20
ST2-EXP-001                         CLOSED / PASS / production lesson integrated
ST2-EXP-011                         CLOSED / PASS / comparison lesson integrated
active experiment                   NONE
next owner-sequenced experiment     ST2-EXP-004 / NOT ACTIVE / NO FROZEN PLAN
```
