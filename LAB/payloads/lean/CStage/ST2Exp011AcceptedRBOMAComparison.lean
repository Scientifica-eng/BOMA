/- ST2-EXP-011 Gate D: accepted-RBOMA adapter for the scalar-generic
   quadratic comparison core. The accepted CQuadraticComparison001 source is
   consumed unchanged; this file is research-only. -/
namespace BOMA.C.StageTwo.ComparisonInterface011.AcceptedRBOMA

open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.StageIntegration002

abbrev Generic := BOMA.C.StageTwo.ComparisonInterface011
abbrev Accepted := BOMA.C.QuadraticComparison001

/-- The accepted real scalar operations, exposed only as the five operations
    actually occurring in the comparison coordinate formulas. -/
def rbomaScalarOps : Generic.ScalarOps where
  carrier := RBOMA
  zero := rZero
  one := rOne
  neg := rNeg
  add := rAdd
  mul := rMulCandidate

/-- Forget the comparison-irrelevant laws from the accepted presentation. -/
def fromAccepted {R : RStageIntegrationCertificate}
    (A : Accepted.QuadraticFieldPresentation R) :
    Generic.QuadraticPresentation rbomaScalarOps where
  carrier := A.carrier
  zero := A.zero
  one := A.one
  neg := A.neg
  add := A.add
  mul := A.mul
  ofScalar := A.ofR
  imag := A.imag
  coord := A.coord
  coordinateGeneration := A.coordinateGeneration
  coordinateUnique := @A.coordinateUnique
  coordinateZero := A.coordinateZero
  coordinateOne := A.coordinateOne
  coordinateReal := A.coordinateReal
  coordinateImag := A.coordinateImag
  coordinateNeg := A.coordinateNeg
  coordinateAdd := A.coordinateAdd
  coordinateMul := A.coordinateMul

/-- Gate-D semantic preservation: after forgetting irrelevant fields, the new
    relation is definitionally the accepted shared-RBOMA coordinate relation. -/
theorem related_iff_accepted {R : RStageIntegrationCertificate}
    (A B : Accepted.QuadraticFieldPresentation R)
    (x : A.carrier) (y : B.carrier) :
    Generic.Related (fromAccepted A) (fromAccepted B) x y ↔
      Accepted.Related A B x y := by
  rfl

/-- Every accepted presentation pair satisfies the generic relation-level
    certificate without changing either accepted source. -/
theorem acceptedGenericComparison {R : RStageIntegrationCertificate}
    (A B : Accepted.QuadraticFieldPresentation R) :
    Generic.QuadraticComparisonCertificate (fromAccepted A) (fromAccepted B) :=
  Generic.quadraticComparison (fromAccepted A) (fromAccepted B)

/-- Accepted Route P remains a native instance of the generic comparison. -/
theorem acceptedSelectedSelfComparison :
    Generic.QuadraticComparisonCertificate
      (fromAccepted
        (Accepted.selectedPresentation rStageIntegrationCertificate))
      (fromAccepted
        (Accepted.selectedPresentation rStageIntegrationCertificate)) :=
  acceptedGenericComparison
    (Accepted.selectedPresentation rStageIntegrationCertificate)
    (Accepted.selectedPresentation rStageIntegrationCertificate)

/-- Adapt accepted explicit coordinate extractors without creating any selector. -/
def extractorFromAccepted {R : RStageIntegrationCertificate}
    {A : Accepted.QuadraticFieldPresentation R}
    (E : Accepted.CoordinateExtractor A) :
    Generic.CoordinateExtractor (fromAccepted A) where
  re := E.re
  im := E.im
  sound := E.sound

/-- The accepted selected Route-P projections remain explicit constructive
    extractor data in the generic layer. -/
def acceptedSelectedExtractor (R : RStageIntegrationCertificate) :
    Generic.CoordinateExtractor
      (fromAccepted (Accepted.selectedPresentation R)) :=
  extractorFromAccepted (Accepted.selectedExtractor R)

/-- Functional self-comparison is available for accepted Route P for exactly
    the old reason: its extractor is explicit data. -/
def acceptedSelectedSelfIsomorphism :
    Generic.ConstructiveQuadraticIsomorphism
      (fromAccepted
        (Accepted.selectedPresentation rStageIntegrationCertificate))
      (fromAccepted
        (Accepted.selectedPresentation rStageIntegrationCertificate)) :=
  Generic.constructiveQuadraticIsomorphism
    (fromAccepted
      (Accepted.selectedPresentation rStageIntegrationCertificate))
    (fromAccepted
      (Accepted.selectedPresentation rStageIntegrationCertificate))
    (acceptedSelectedExtractor rStageIntegrationCertificate)
    (acceptedSelectedExtractor rStageIntegrationCertificate)

end BOMA.C.StageTwo.ComparisonInterface011.AcceptedRBOMA
