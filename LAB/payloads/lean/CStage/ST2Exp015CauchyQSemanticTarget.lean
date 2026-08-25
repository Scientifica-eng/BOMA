/- ST2-EXP-015 Gate D: complete research-only C semantic target over the
independently closed Cauchy Route-Q producer.

This source packages the native Route-Q carrier/field evidence and instantiates
the already verified scalar-generic ST2-EXP-011 comparison interface using only
Route-Q canonical coordinates. It does not consume H6/Route-P, ST2-EXP-014, or
accepted C producers, and it introduces no representative or inverse selector. -/
namespace BOMA.C.StageTwo.CauchyQSemantic015

open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyAdditive003
open BOMA.R.StageTwo.CauchyMultiplicative003
open BOMA.C.StageTwo.CauchyQRoute015
open BOMA.C.StageTwo.CauchyQField015
open BOMA.C.StageTwo.ComparisonInterface011

/-- Scalar operation package for the Route-Q research presentation. -/
def cauchyQScalarOps : ScalarOps where
  carrier := RCBOMA
  zero := rCZero
  one := rCOne
  neg := rCNeg
  add := rCAdd
  mul := rCMul

theorem q_coord_zero : qCoord rCZero rCZero = qZero := by
  apply q_ext
  rw [q_normal_coord, q_normal_zero]
  rfl

theorem q_coord_one : qCoord rCOne rCZero = qOne := by
  apply q_ext
  rw [q_normal_coord, q_normal_one]
  rfl

theorem q_coord_real (a : RCBOMA) : qCoord a rCZero = qOfR a := by
  apply q_ext
  rw [q_normal_coord, q_normal_ofR]
  rfl

theorem q_coord_imag : qCoord rCZero rCOne = qI := by
  apply q_ext
  rw [q_normal_coord, q_normal_imag]
  rfl

theorem q_coord_neg (a b : RCBOMA) :
    qNeg (qCoord a b) = qCoord (rCNeg a) (rCNeg b) := by
  apply q_ext
  rw [q_normal_neg, q_normal_coord, q_normal_coord]
  rfl

theorem q_coord_add (a b c d : RCBOMA) :
    qAdd (qCoord a b) (qCoord c d) =
      qCoord (rCAdd a c) (rCAdd b d) := by
  apply q_ext
  rw [q_normal_add, q_normal_coord, q_normal_coord, q_normal_coord]
  rfl

theorem q_coord_mul (a b c d : RCBOMA) :
    qMul (qCoord a b) (qCoord c d) =
      qCoord
        (rCAdd (rCMul a c) (rCNeg (rCMul b d)))
        (rCAdd (rCMul a d) (rCMul b c)) := by
  apply q_ext
  rw [q_normal_mul, q_normal_coord, q_normal_coord, q_normal_coord]
  rfl

/-- Route-Q presentation required by the comparison Claim family. -/
def cauchyRouteQPresentation : QuadraticPresentation cauchyQScalarOps where
  carrier := CauchyQBOMA
  zero := qZero
  one := qOne
  neg := qNeg
  add := qAdd
  mul := qMul
  ofScalar := qOfR
  imag := qI
  coord := qCoord
  coordinateGeneration := q_generation
  coordinateUnique := @q_coordinate_unique
  coordinateZero := q_coord_zero
  coordinateOne := q_coord_one
  coordinateReal := q_coord_real
  coordinateImag := q_coord_imag
  coordinateNeg := q_coord_neg
  coordinateAdd := q_coord_add
  coordinateMul := q_coord_mul

/-- Canonical normalization supplies explicit functional coordinate data. -/
def cauchyRouteQExtractor : CoordinateExtractor cauchyRouteQPresentation where
  re := qRe
  im := qIm
  sound := q_extract_sound

/-- Relation-level comparison surface; totality/uniqueness remains relational. -/
theorem cauchyRouteQComparison
    (B : QuadraticPresentation cauchyQScalarOps) :
    QuadraticComparisonCertificate cauchyRouteQPresentation B :=
  quadraticComparison cauchyRouteQPresentation B

/-- Functional comparison requires explicit target extractor data. -/
def cauchyRouteQFunctionalComparison
    (B : QuadraticPresentation cauchyQScalarOps)
    (E : CoordinateExtractor B) :
    ConstructiveQuadraticIsomorphism cauchyRouteQPresentation B :=
  constructiveQuadraticIsomorphism
    cauchyRouteQPresentation B cauchyRouteQExtractor E

/-- Research-only Gate-D package covering the nine target C Claim meanings. -/
structure CauchyQFullCCertificate where
  route : CauchyQRouteCertificate
  field : CauchyQFieldCertificate
  generatorSquared : qMul qI qI = qNeg qOne
  realGeneration : ∀ z : CauchyQBOMA, ∃ a b : RCBOMA, z = qCoord a b
  coordinateUnique : ∀ {a b c d : RCBOMA},
    qCoord a b = qCoord c d → a = c ∧ b = d
  imaginaryNotReal : ¬ ∃ a : RCBOMA, qI = qOfR a
  comparison : ∀ (B : QuadraticPresentation cauchyQScalarOps),
    QuadraticComparisonCertificate cauchyRouteQPresentation B
  functionalComparison : ∀ (B : QuadraticPresentation cauchyQScalarOps),
    CoordinateExtractor B →
      ConstructiveQuadraticIsomorphism cauchyRouteQPresentation B

/-- Full research-only nine-Claim closure root for the Cauchy Route-Q corner. -/
def cauchyQFullCCertificate : CauchyQFullCCertificate where
  route := cauchyQRouteCertificate
  field := cauchyQFieldCertificate
  generatorSquared := q_i_squared
  realGeneration := q_generation
  coordinateUnique := @q_coordinate_unique
  imaginaryNotReal := q_i_not_real
  comparison := cauchyRouteQComparison
  functionalComparison := cauchyRouteQFunctionalComparison

/-- Explicit Claim-root aliases for exact Gate-D auditing. -/
def claim_carrier : Type := CauchyQBOMA

theorem claim_rembed_injective {a b : RCBOMA}
    (h : qOfR a = qOfR b) : a = b := q_ofR_injective h

theorem claim_i_squared : qMul qI qI = qNeg qOne := q_i_squared

theorem claim_generated (z : CauchyQBOMA) :
    ∃ a b : RCBOMA, z = qCoord a b := q_generation z

theorem claim_coordinate_unique {a b c d : RCBOMA}
    (h : qCoord a b = qCoord c d) : a = c ∧ b = d :=
  q_coordinate_unique h

theorem claim_imaginary_not_real : ¬ ∃ a : RCBOMA, qI = qOfR a :=
  q_i_not_real

end BOMA.C.StageTwo.CauchyQSemantic015
