/- ST2-EXP-011 Gate D: accepted-RBOMA adapter for the scalar-generic
   quadratic comparison core. The accepted CQuadraticComparison001 source is
   consumed unchanged; this file is research-only. -/
namespace BOMA.C.StageTwo.ComparisonInterface011.AcceptedRBOMA

open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.StageIntegration002
open BOMA.C.StageTwo.ComparisonInterface011

/-- The accepted real scalar operations, exposed only as the five operations
    actually occurring in the comparison coordinate formulas. -/
def rbomaScalarOps : ScalarOps where
  carrier := RBOMA
  zero := rZero
  one := rOne
  neg := rNeg
  add := rAdd
  mul := rMulCandidate

/-- Forget the comparison-irrelevant laws from the accepted presentation. -/
def fromAccepted {R : RStageIntegrationCertificate}
    (A : BOMA.C.QuadraticComparison001.QuadraticFieldPresentation R) :
    QuadraticPresentation rbomaScalarOps where
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
  coordinateUnique := A.coordinateUnique
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
    (A B : BOMA.C.QuadraticComparison001.QuadraticFieldPresentation R)
    (x : A.carrier) (y : B.carrier) :
    Related (fromAccepted A) (fromAccepted B) x y ↔
      BOMA.C.QuadraticComparison001.Related A B x y := by
  rfl

/-- Every accepted presentation pair satisfies the generic relation-level
    certificate without changing either accepted source. -/
theorem acceptedGenericComparison {R : RStageIntegrationCertificate}
    (A B : BOMA.C.QuadraticComparison001.QuadraticFieldPresentation R) :
    QuadraticComparisonCertificate (fromAccepted A) (fromAccepted B) :=
  quadraticComparison (fromAccepted A) (fromAccepted B)

/-- Accepted Route P remains a native instance of the generic comparison. -/
theorem acceptedSelectedSelfComparison :
    QuadraticComparisonCertificate
      (fromAccepted
        (BOMA.C.QuadraticComparison001.selectedPresentation
          rStageIntegrationCertificate))
      (fromAccepted
        (BOMA.C.QuadraticComparison001.selectedPresentation
          rStageIntegrationCertificate)) :=
  acceptedGenericComparison
    (BOMA.C.QuadraticComparison001.selectedPresentation
      rStageIntegrationCertificate)
    (BOMA.C.QuadraticComparison001.selectedPresentation
      rStageIntegrationCertificate)

/-- Adapt accepted explicit coordinate extractors without creating any selector. -/
def extractorFromAccepted {R : RStageIntegrationCertificate}
    {A : BOMA.C.QuadraticComparison001.QuadraticFieldPresentation R}
    (E : BOMA.C.QuadraticComparison001.CoordinateExtractor A) :
    CoordinateExtractor (fromAccepted A) where
  re := E.re
  im := E.im
  sound := E.sound

/-- The accepted selected Route-P projections remain explicit constructive
    extractor data in the generic layer. -/
def acceptedSelectedExtractor (R : RStageIntegrationCertificate) :
    CoordinateExtractor
      (fromAccepted
        (BOMA.C.QuadraticComparison001.selectedPresentation R)) :=
  extractorFromAccepted (BOMA.C.QuadraticComparison001.selectedExtractor R)

/-- Functional self-comparison is available for accepted Route P for exactly
    the old reason: its extractor is explicit data. -/
def acceptedSelectedSelfIsomorphism :
    ConstructiveQuadraticIsomorphism
      (fromAccepted
        (BOMA.C.QuadraticComparison001.selectedPresentation
          rStageIntegrationCertificate))
      (fromAccepted
        (BOMA.C.QuadraticComparison001.selectedPresentation
          rStageIntegrationCertificate)) :=
  constructiveQuadraticIsomorphism
    (fromAccepted
      (BOMA.C.QuadraticComparison001.selectedPresentation
        rStageIntegrationCertificate))
    (fromAccepted
      (BOMA.C.QuadraticComparison001.selectedPresentation
        rStageIntegrationCertificate))
    (acceptedSelectedExtractor rStageIntegrationCertificate)
    (acceptedSelectedExtractor rStageIntegrationCertificate)

end BOMA.C.StageTwo.ComparisonInterface011.AcceptedRBOMA
