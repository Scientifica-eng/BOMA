# C ← R DEPENDENCY CONTRACT — Minimal Mathematical Interface, Preserved Formal Provenance

**Document ID:** `BOMA-C-R-DEP-001`  
**Status:** **ACTIVE — CANONICAL R→C MATHEMATICAL DEPENDENCY SURFACE / ST2-EXP-001 INTEGRATED**  
**Date:** 2026-08-24  
**C specification:** `BOMA-C-ACCEPT-001`  
**Upstream selected export:** `R-BLOCK-001`  
**Upstream reverse audit:** `RE-R-001 CLOSED / COMPLETE`  
**Initial boundary evidence:** `PDSA-C-002 / V5 32564789630 PASS`  
**Narrow-interface experiment:** `ST2-EXP-001 / CLOSED / PASS / V5 32593045224`  
**Accepted C:** `C-BLOCK-001` selected producer; `C-BLOCK-002 / CA-20 ACCEPT`  
**Architecture integration authority:** `BOMA-ST2-LEARNING-INTEGRATION-001`.

## 1. Purpose

Define the **mathematical interface** that C is allowed and required to consume
from R, separately from the larger historical formal package currently carried
by accepted implementation assemblies.

The governing distinction is:

```text
C consumes a minimal accepted R mathematical interface
≠
C mathematically depends on every theorem/proof/representation bundled in R-BLOCK-001
```

and:

```text
selected upstream producer = R-BLOCK-001 / Dedekind
≠
Dedekind representation internals are premises of C
```

## 2. Current canonical mathematical dependency surface

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

This sixteen-field surface is now the canonical **mathematical dependency
contract** of `BOMA-C-R-DEP-001`.

Formal witness produced by `ST2-EXP-001`:

```text
BOMA.C.StageTwo.NarrowRInterface001.NarrowROrderedFieldCertificate
BOMA.C.StageTwo.NarrowRInterface001.narrowRFromAcceptedProducers
```

Source:

`LAB/payloads/lean/CStage/ST2Exp001NarrowRInterface.lean`.

The certificate is assembled directly from accepted R producers rather than by
projecting the oversized accepted-R integration certificate.

## 3. Claim-family interpretation

The sixteen properties sit inside these accepted R Claim families:

```text
R-CL-NONTRIV-001
R-CL-ADD-001
R-CL-MUL-001
R-CL-INV-001
R-CL-FIELD-001
R-CL-ORDER-001
R-CL-INTEGRATION-001
```

They are sufficient for the selected C core and its nine accepted Claim
meanings under the verified ST2-EXP-001 assembly.

The following accepted R properties are **not mathematical dependencies of the
C core contract**:

```text
R-CL-COMP-001      Dedekind LUB completeness
R-CL-DENSITY-001   Q density in R
R-CL-ARCH-001      Archimedean characterization
R-CL-QEMBED-001    explicit Q embedding, as a direct C requirement
```

They remain valid accepted R properties and may remain in formal ancestry, but
they are not promoted into mathematical necessity for C.

## 4. Explicitly prohibited implicit representation dependencies

No C construction may silently treat the following as mathematical premises
merely because the selected R producer uses them:

```text
LowerCut
CutEquiv
cutSetoid
RBOMA := Quotient cutSetoid as a representation fact
principal-cut internals
Dedekind union LUB witness
cut membership search / bracketing
positive/negative-part multiplication implementation
Dedekind reciprocal implementation
route-local proof machinery used only to establish accepted R Claims
```

`RBOMA` remains the selected accepted formal carrier. The prohibition concerns
consuming its hidden representation history rather than its exported
mathematical interface.

## 5. Route-neutral consequences at the boundary

The original `PDSA-C-002` probe established interface-level consequences before
C route selection, including:

```text
C-RL-001   square nonnegativity
C-RL-002   -1 is not a real square
```

Historical source:

`LAB/payloads/lean/CStage/CRInterfaceNoSquareProbe001.lean`.

`ST2-EXP-001` then strengthened the architecture result by rebuilding the
selected C path against the narrower sixteen-field package rather than the
whole accepted R integration certificate.

This later experiment is the reason the sixteen-property surface is now a
canonical architecture fact rather than merely a future refactor candidate.

## 6. Mathematical dependency versus current formal closure

A critical distinction remains:

```text
CANONICAL MATHEMATICAL DEPENDENCY SURFACE
  = the sixteen properties above

CURRENT ACCEPTED C FORMALIZATION
  = historical accepted source/manifests that may still pass a larger R bundle
```

`RE-C-001` measured the historical accepted C source closure and found exactly
sixteen accepted-real certificate projections directly consumed by C, while the
whole `rStageIntegrationCertificate` caused unrelated LUB/density/Archimedean
and representation history to appear in actual formal ancestry.

Before `ST2-EXP-001`, that was classified as a candidate for narrowing.
After exact ST2-EXP-001 PASS, the architectural interpretation is now:

```text
extra bundled ancestry = FORMALIZATION / PROVENANCE OVER-BUNDLING
not mathematical necessity
```

This Act does **not** rewrite the accepted C source files or claim that their
existing Lean dependency closure has already become minimal. The narrow
research assembly is the exact witness that the smaller mathematical contract
is sufficient.

A later implementation cleanup may make the accepted formal assembly match this
contract more literally, but such cleanup is not required to recognize the
mathematical dependency boundary established by the experiment.

## 7. Logical-commitment boundary

Logical cost follows declarations actually consumed, not the whole historical
ancestry of `R-BLOCK-001`.

The sixteen-field interface still includes `orderTotal`; the selected accepted
producer of totality has localized classical provenance under `R-DP-003`.
Therefore C does not become constructively independent of that selected
producer merely because unrelated R classical paths are removed from the
minimal contract.

Conversely, unrelated classical sites carried only by completeness/density or
other unused bundled components are not mathematical C requirements.

## 8. Relation to the accepted and alternative R producers

Current accepted dependency:

```text
R-DP-001
   └── SELECTS R-ROUTE-D / Dedekind
            ↓
       R-BLOCK-001
            ↓
       BOMA-C-R-DEP-001
       [sixteen-property mathematical surface]
            ↓
       selected C construction
```

`ST2-EXP-003` later established an independent Cauchy real producer and a field
isomorphism to the selected Dedekind producer. H6 additionally rebuilt seven
selected C core meanings natively over the Cauchy producer.

Those results strengthen the interpretation that this boundary should be read
as an interface contract rather than a Dedekind-internal dependency. They do
not yet prove that every accepted C comparison/integration component is generic
over an arbitrary scalar carrier; that unresolved genericity question is the
separate `ST2-EXP-011` candidate.

## 9. Reopening rule

Reopen `BOMA-C-R-DEP-001` if:

```text
BOMA-C-ACCEPT-001 changes materially;
a newly accepted C Claim requires an R property outside the sixteen fields;
a selected C implementation consumes a representation-specific R fact as a mathematical premise;
an accepted R Claim used by the sixteen-field surface changes;
a new logical commitment appears in the actual minimal dependency surface;
a future generic scalar interface proves that some of the sixteen fields are unnecessary;
a future accepted C route requires a genuinely stronger shared scalar contract.
```

A change in formal bundling alone does not automatically change the mathematical contract.

## 10. Provenance and evidence

Historical records remain authoritative for how this contract was learned:

```text
PDSA-C-002
  initial accepted-R interface sufficiency probe
  V5 32564789630 PASS

RE-C-001 / PDSA-C-009
  measured accepted C → R dependency closure
  identified exactly sixteen direct certificate projections plus bundled ancestry

ST2-EXP-001
  independently rebuilt the selected C adequacy over the exact sixteen-field package
  CLOSED / PASS
  V5 32593045224
```

Architecture integration authority:

`LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_001.md`.

## 11. Current boundary summary

```text
upstream selected R export        R-BLOCK-001 / Dedekind
mathematical R→C dependency       exact sixteen-property interface
selected C route                  C-ROUTE-P
selected C producer               C-BLOCK-001
accepted C integration            C-J-001
accepted C export                 C-BLOCK-002 / CA-20
ST2-EXP-001                       CLOSED / PASS / lesson integrated
ST2-EXP-011                       candidate only / not authorized
```
