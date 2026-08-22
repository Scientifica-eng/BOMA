/- ST2-EXP-002: post-completion comparison of independently verified Route Q
   with accepted Route P. The independent Q assembly never contains this file. -/
namespace BOMA.C.StageTwo.PQJunction002

open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.StageIntegration002
open BOMA.C.PairCore001
open BOMA.C.QuadraticComparison001
open BOMA.C.StageTwo.QQuotientField002

/-- Route Q's completed quotient field instantiates the unchanged common contract. -/
def quotientPresentation
    (R : RStageIntegrationCertificate) :
    QuadraticFieldPresentation R where
  carrier := QBOMA
  zero := qZero
  one := qOne
  neg := qNeg
  add := qAdd
  mul := qMul
  ofR := qOfR
  imag := qI
  coord := qCoord
  nontrivial := q_zero_ne_one R
  addComm := q_add_comm R
  addAssoc := q_add_assoc R
  addZeroLeft := q_add_zero_left R
  addInverseRight := q_add_neg_right R
  mulComm := q_mul_comm R
  mulAssoc := q_mul_assoc R
  mulOneLeft := q_mul_one_left R
  distribRight := q_mul_add_right R
  inverseExists := q_inverse_exists R
  inverseUnique := @q_inverse_unique R
  embeddingInjective := @q_ofR_injective
  embeddingZero := q_ofR_zero
  embeddingOne := q_ofR_one
  embeddingNeg := q_ofR_neg R
  embeddingAdd := q_ofR_add R
  embeddingMul := q_ofR_mul R
  imagSquared := q_i_squared R
  coordinateExpression := by intro a b; rfl
  coordinateGeneration := q_generation R
  coordinateUnique := @q_coordinate_unique R
  coordinateZero := q_coordinate_zero R
  coordinateOne := q_coordinate_one R
  coordinateReal := q_coordinate_real R
  coordinateImag := q_coordinate_imag R
  coordinateNeg := q_coordinate_neg R
  coordinateAdd := q_coordinate_add R
  coordinateMul := q_coordinate_mul R

/-- Normalization descends to the quotient without selecting a representative. -/
def quotientExtractor (R : RStageIntegrationCertificate) :
    CoordinateExtractor (quotientPresentation R) where
  re := qRe
  im := qIm
  sound := q_extract_sound R

/-- Actual mutually inverse R-algebra maps, only after independent Q closure. -/
def pqIsomorphism (R : RStageIntegrationCertificate) :
    ConstructiveQuadraticIsomorphism
      (selectedPresentation R) (quotientPresentation R) :=
  constructiveQuadraticIsomorphism
    (selectedPresentation R) (quotientPresentation R)
    (selectedExtractor R) (quotientExtractor R)

def pairToQuotient (R : RStageIntegrationCertificate) (z : CBOMA) : QBOMA :=
  (pqIsomorphism R).forward z

def quotientToPair (R : RStageIntegrationCertificate) (z : QBOMA) : CBOMA :=
  (pqIsomorphism R).backward z

theorem pairToQuotient_formula
    (R : RStageIntegrationCertificate) (z : CBOMA) :
    pairToQuotient R z = qCoord z.re z.im := rfl

theorem quotientToPair_formula
    (R : RStageIntegrationCertificate) (z : QBOMA) :
    quotientToPair R z = ⟨qRe z, qIm z⟩ := rfl

theorem pair_quotient_inverse_left
    (R : RStageIntegrationCertificate) (z : CBOMA) :
    quotientToPair R (pairToQuotient R z) = z :=
  (pqIsomorphism R).leftInverse z

theorem pair_quotient_inverse_right
    (R : RStageIntegrationCertificate) (z : QBOMA) :
    pairToQuotient R (quotientToPair R z) = z :=
  (pqIsomorphism R).rightInverse z

theorem pair_to_quotient_real
    (R : RStageIntegrationCertificate) (a : RBOMA) :
    pairToQuotient R (cOfR a) = qOfR a :=
  (pqIsomorphism R).preserveReal a

theorem pair_to_quotient_imag
    (R : RStageIntegrationCertificate) :
    pairToQuotient R cI = qI :=
  (pqIsomorphism R).preserveImag

theorem pair_to_quotient_add
    (R : RStageIntegrationCertificate) (z w : CBOMA) :
    pairToQuotient R (cAdd z w) =
      qAdd (pairToQuotient R z) (pairToQuotient R w) :=
  (pqIsomorphism R).preserveAdd z w

theorem pair_to_quotient_mul
    (R : RStageIntegrationCertificate) (z w : CBOMA) :
    pairToQuotient R (cMul z w) =
      qMul (pairToQuotient R z) (pairToQuotient R w) :=
  (pqIsomorphism R).preserveMul z w

/-- Explicit post-field CA-14 research reconvergence; CA-20 remains unchanged. -/
structure QPairJunctionCertificate where
  qField : QFieldCertificate
  universalComparison :
    QuadraticComparisonCertificate
      (selectedPresentation rStageIntegrationCertificate)
      (quotientPresentation rStageIntegrationCertificate)
  isomorphism :
    ConstructiveQuadraticIsomorphism
      (selectedPresentation rStageIntegrationCertificate)
      (quotientPresentation rStageIntegrationCertificate)
  forwardFormula :
    ∀ z : CBOMA, pairToQuotient rStageIntegrationCertificate z = qCoord z.re z.im
  backwardFormula :
    ∀ z : QBOMA,
      quotientToPair rStageIntegrationCertificate z = ⟨qRe z, qIm z⟩

def qPairJunctionCertificate : QPairJunctionCertificate where
  qField := qFieldCertificateFromAcceptedR
  universalComparison :=
    quadraticComparison
      (selectedPresentation rStageIntegrationCertificate)
      (quotientPresentation rStageIntegrationCertificate)
  isomorphism := pqIsomorphism rStageIntegrationCertificate
  forwardFormula := pairToQuotient_formula rStageIntegrationCertificate
  backwardFormula := quotientToPair_formula rStageIntegrationCertificate

end BOMA.C.StageTwo.PQJunction002
