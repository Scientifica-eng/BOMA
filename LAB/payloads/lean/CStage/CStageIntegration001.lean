/- PDSA-C-007: same-carrier complex integration and quadratic comparison. -/
namespace BOMA.C.StageIntegration001

open BOMA.R.DedekindQuotient001
open BOMA.R.StageIntegration002
open BOMA.C.PairCore001
open BOMA.C.PairNormInverse001
open BOMA.C.QuadraticComparison001

/-- CA-19 packages every required component on the one selected complex carrier. -/
structure CStageIntegrationCertificate where
  field : CPairFieldCertificate
  generatorSquared : cMul cI cI = cNeg cOne
  realGeneration : ∀ z : CBOMA,
    ∃ a b : RBOMA, z = cAdd (cOfR a) (cMul (cOfR b) cI)
  coordinateUnique : ∀ {a b c d : RBOMA},
    cAdd (cOfR a) (cMul (cOfR b) cI) =
      cAdd (cOfR c) (cMul (cOfR d) cI) → a = c ∧ b = d
  imaginaryNotReal : ¬ ∃ a : RBOMA, cI = cOfR a
  comparison : ∀ (B : QuadraticFieldPresentation rStageIntegrationCertificate),
    QuadraticComparisonCertificate
      (selectedPresentation rStageIntegrationCertificate) B
  functionalComparison : ∀ (B : QuadraticFieldPresentation rStageIntegrationCertificate),
    CoordinateExtractor B →
      ConstructiveQuadraticIsomorphism
        (selectedPresentation rStageIntegrationCertificate) B

/-- Final certificate adds no carrier, operation, inverse selector, or axiom. -/
def cStageIntegrationCertificate : CStageIntegrationCertificate where
  field := cPairFieldCertificateFromAcceptedR
  generatorSquared := c_i_squared rStageIntegrationCertificate
  realGeneration := c_generation rStageIntegrationCertificate
  coordinateUnique := @c_coordinate_unique rStageIntegrationCertificate
  imaginaryNotReal := c_i_not_real rStageIntegrationCertificate
  comparison := selectedQuadraticComparison rStageIntegrationCertificate
  functionalComparison :=
    selectedConstructiveQuadraticIsomorphism rStageIntegrationCertificate

end BOMA.C.StageIntegration001
