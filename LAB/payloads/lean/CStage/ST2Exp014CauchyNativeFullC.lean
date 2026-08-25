/- ST2-EXP-014: full nine-Claim C meaning assembled natively over RCBOMA.

This source does not rebuild the H6 mathematics. It packages the already
verified H6 Cauchy quadratic field content together with the ST2-EXP-011 native
comparison interface, producing a research-only full C Claim-surface
certificate. No H5/Dedekind implementation transport or global selector is
introduced here. -/
namespace BOMA.C.StageTwo.CauchyNativeFullC014

open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyAdditive003
open BOMA.R.StageTwo.CauchyMultiplicative003
open BOMA.C.StageTwo.CauchyQuadratic003
open BOMA.C.StageTwo.ComparisonInterface011
open BOMA.C.StageTwo.ComparisonInterface011.NativeCauchy

/-- Relation-level comparison from the native H6 presentation to any other
    quadratic presentation over the same Cauchy scalar operations. -/
theorem cauchyNativeComparison
    (B : QuadraticPresentation cauchyScalarOps) :
    QuadraticComparisonCertificate h6Presentation B :=
  quadraticComparison h6Presentation B

/-- Functional comparison remains conditional on explicit target coordinate
    extractor data. The source extractor is explicit pair projection data from
    H6, not a selected global witness. -/
def cauchyNativeFunctionalComparison
    (B : QuadraticPresentation cauchyScalarOps)
    (E : CoordinateExtractor B) :
    ConstructiveQuadraticIsomorphism h6Presentation B :=
  constructiveQuadraticIsomorphism
    h6Presentation B h6Extractor E

/-- Research-only full C Claim-surface package over the independent Cauchy real
    producer. It mirrors the accepted Stage-One C integration *meaning* while
    preserving the narrower ST2-EXP-011 comparison interface. -/
structure CauchyNativeFullCCertificate where
  field : CauchyQuadraticFieldCertificate
  generatorSquared : ccMul ccI ccI = ccNeg ccOne
  realGeneration : ∀ z : CCBOMA,
    ∃ a b : RCBOMA, z = ccAdd (ccOfR a) (ccMul (ccOfR b) ccI)
  coordinateUnique : ∀ {a b c d : RCBOMA},
    ccAdd (ccOfR a) (ccMul (ccOfR b) ccI) =
      ccAdd (ccOfR c) (ccMul (ccOfR d) ccI) → a = c ∧ b = d
  imaginaryNotReal : ¬ ∃ a : RCBOMA, ccI = ccOfR a
  comparison : ∀ (B : QuadraticPresentation cauchyScalarOps),
    QuadraticComparisonCertificate h6Presentation B
  functionalComparison : ∀ (B : QuadraticPresentation cauchyScalarOps),
    CoordinateExtractor B →
      ConstructiveQuadraticIsomorphism h6Presentation B

/-- Full research-only nine-Claim closure root for ST2-EXP-014. -/
def cauchyNativeFullCCertificate : CauchyNativeFullCCertificate where
  field := cauchyQuadraticFieldCertificate
  generatorSquared := cc_i_squared
  realGeneration := cc_generation
  coordinateUnique := @cc_coordinate_unique
  imaginaryNotReal := cc_i_not_real
  comparison := cauchyNativeComparison
  functionalComparison := cauchyNativeFunctionalComparison

/-- Explicit Claim-root aliases make the nine-family audit independent of
    incidental structure-field projection names. -/
theorem claim_rembed_injective {a b : RCBOMA}
    (h : ccOfR a = ccOfR b) : a = b :=
  cc_ofR_injective h

theorem claim_i_squared : ccMul ccI ccI = ccNeg ccOne :=
  cc_i_squared

theorem claim_generated (z : CCBOMA) :
    ∃ a b : RCBOMA, z = ccAdd (ccOfR a) (ccMul (ccOfR b) ccI) :=
  cc_generation z

theorem claim_coordinate_unique {a b c d : RCBOMA}
    (h : ccAdd (ccOfR a) (ccMul (ccOfR b) ccI) =
      ccAdd (ccOfR c) (ccMul (ccOfR d) ccI)) : a = c ∧ b = d :=
  cc_coordinate_unique h

theorem claim_imaginary_not_real : ¬ ∃ a : RCBOMA, ccI = ccOfR a :=
  cc_i_not_real

end BOMA.C.StageTwo.CauchyNativeFullC014
