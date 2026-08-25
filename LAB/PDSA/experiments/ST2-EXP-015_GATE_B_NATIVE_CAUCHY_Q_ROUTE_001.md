# ST2-EXP-015 — Gate B Native Cauchy Route-Q Construction 001

**Status:** `DO EVIDENCE / IMPLEMENTED / EXACT-HEAD V5 REQUIRED`  
**Program:** `ST2-RP-001`  
**Frozen main:** `2a6c38af70e596c840ef2db4733421bde38f3ee5`  
**Frozen Plan commit:** `1accee613630ae876b6ca9dcf820737ab89a168c`  
**Single changed factor:** `C realization Route P → Route Q with RCBOMA fixed`.

## Implemented Gate-B surface

The new source `LAB/payloads/lean/CStage/ST2Exp015CauchyQRoute.lean` builds the
frozen Route-Q representation natively over `RCBOMA`:

```text
CauchyQNormal { re : RCBOMA, im : RCBOMA }
Expr = coeff | generator | neg | add | mul
normalize : Expr -> CauchyQNormal
exprSetoid : equality of canonical normal forms
CauchyQBOMA := Quotient exprSetoid
qNeg / qAdd / qMul
qOfR / qZero / qOne / qI
qNormal / qRe / qIm
```

It also supplies source-level proofs for:

```text
faithful RCBOMA embedding
I^2 = -1 at quotient equality
generation by embedded RCBOMA and I
coordinate uniqueness
I not real
constructive canonical extractor soundness
nontriviality
```

These declarations are packaged in
`BOMA.C.StageTwo.CauchyQRoute015.cauchyQRouteCertificate`.

## Independent implementation manifest

`LAB/20_FORMALIZATION/C_STAGE/ST2_EXP_015_CAUCHY_Q_INDEPENDENT_INPUTS.txt`
is the exact ST2-EXP-003 independent Cauchy-real manifest followed by only the
new Gate-B source. It intentionally excludes:

```text
Dedekind completion sources / RStageIntegration002
all ST2-EXP-002 Q producers
ST2Exp003DedekindCauchyFieldIsomorphism / H5 transport
ST2Exp003CauchyQuadraticRebuild / Route-P field
ST2Exp011 comparison adapters
ST2Exp014 full-C package
```

The later comparison manifest required by Gate E is not created here.

## Representation and selector firewall

The carrier is a genuine syntax quotient, not an alias of `CCBOMA`. Canonical
coordinates come from the defined `normalize` function descending through the
quotient. No arbitrary representative selector, `Classical.choose`, global
coordinate selector, or global inverse selector is introduced.

Lean `Setoid`/`Quotient` operations are used only as the trusted formalization
infrastructure already permitted by the Frozen Plan.

## Verification contract

The dedicated 015 V5 workflow checks on the exact head:

```text
baseline ancestry and Frozen Plan byte identity
program/state authority
accepted Q/R/C immutability
Gate-A nine-Claim / four-corner inventory
independent-manifest exact prefix and forbidden-source firewall
pinned Lean elaboration of the Gate-B manifest
#print axioms for the important Gate-B roots
declaration closure with forbidden producer rejection
autonomous-program and architecture regressions
artifact preservation
```

This record does not declare Gate B PASS by itself. Gate B becomes verified only
when the exact commit containing this implementation passes that workflow. Any
failure must be classified under the immutable 015 Plan before repair.
