/- PDSA-C-007: same-carrier complex integration and quadratic comparison. -/
namespace BOMA.C.StageTwo.NarrowIntegration001

open BOMA.R.DedekindQuotient001
open BOMA.C.StageTwo.NarrowRInterface001
open BOMA.C.StageTwo.NarrowPairCore001
open BOMA.C.StageTwo.NarrowPairNormInverse001
open BOMA.C.StageTwo.NarrowQuadraticComparison001

/-- CA-19 packages every required component on the one selected complex carrier. -/
structure CNarrowStageIntegrationCertificate where
  field : CPairFieldCertificate
  generatorSquared : cMul cI cI = cNeg cOne
  realGeneration : ∀ z : CBOMA,
    ∃ a b : RBOMA, z = cAdd (cOfR a) (cMul (cOfR b) cI)
  coordinateUnique : ∀ {a b c d : RBOMA},
    cAdd (cOfR a) (cMul (cOfR b) cI) =
      cAdd (cOfR c) (cMul (cOfR d) cI) → a = c ∧ b = d
  imaginaryNotReal : ¬ ∃ a : RBOMA, cI = cOfR a
  comparison : ∀ (B : QuadraticFieldPresentation narrowRFromAcceptedProducers),
    QuadraticComparisonCertificate
      (selectedPresentation narrowRFromAcceptedProducers) B
  functionalComparison : ∀ (B : QuadraticFieldPresentation narrowRFromAcceptedProducers),
    CoordinateExtractor B →
      ConstructiveQuadraticIsomorphism
        (selectedPresentation narrowRFromAcceptedProducers) B

/-- Final certificate adds no carrier, operation, inverse selector, or logical commitment. -/
def cNarrowStageIntegrationCertificate : CNarrowStageIntegrationCertificate where
  field := cPairFieldCertificateFromNarrowR
  generatorSquared := c_i_squared narrowRFromAcceptedProducers
  realGeneration := c_generation narrowRFromAcceptedProducers
  coordinateUnique := @c_coordinate_unique narrowRFromAcceptedProducers
  imaginaryNotReal := c_i_not_real narrowRFromAcceptedProducers
  comparison := selectedQuadraticComparison narrowRFromAcceptedProducers
  functionalComparison :=
    selectedConstructiveQuadraticIsomorphism narrowRFromAcceptedProducers


/-- Branch and accepted carriers are judgmentally identical. -/
theorem sameAcceptedCarrier : CBOMA = BOMA.C.PairCore001.CBOMA := rfl

/-- The branch reuses exactly the original accepted addition. -/
theorem sameAcceptedAddition (z w : CBOMA) :
    cAdd z w = BOMA.C.PairCore001.cAdd z w := rfl

/-- The branch reuses exactly the original accepted multiplication. -/
theorem sameAcceptedMultiplication (z w : CBOMA) :
    cMul z w = BOMA.C.PairCore001.cMul z w := rfl

end BOMA.C.StageTwo.NarrowIntegration001
