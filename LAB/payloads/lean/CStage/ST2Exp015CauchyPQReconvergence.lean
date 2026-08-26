/- ST2-EXP-015 Gate E: post-completion Cauchy Route-P ↔ Route-Q reconvergence.

This source is intentionally downstream of independent Route-Q Gates B-D. It
uses the verified H6 Route-P presentation/extractor and the native 015 Route-Q
presentation/extractor only after both constructions are complete. No field law
is transported through this comparison and no representative selector is added. -/
namespace BOMA.C.StageTwo.CauchyPQReconvergence015

open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.C.StageTwo.ComparisonInterface011
open BOMA.C.StageTwo.ComparisonInterface011.NativeCauchy
open BOMA.C.StageTwo.CauchyQSemantic015

/-- Relation-level post-completion P↔Q comparison. -/
theorem cauchyPQComparison :
    QuadraticComparisonCertificate h6Presentation cauchyRouteQPresentation :=
  quadraticComparison h6Presentation cauchyRouteQPresentation

/-- Constructive P↔Q isomorphism, licensed by explicit extractors on both sides. -/
def cauchyPQIsomorphism :
    ConstructiveQuadraticIsomorphism h6Presentation cauchyRouteQPresentation :=
  constructiveQuadraticIsomorphism
    h6Presentation cauchyRouteQPresentation h6Extractor cauchyRouteQExtractor

/-- The forward map is exactly the frozen coordinate formula (a,b) ↦ qCoord a b. -/
theorem forward_coordinate_formula (z : h6Presentation.carrier) :
    cauchyPQIsomorphism.forward z =
      cauchyRouteQPresentation.coord (h6Extractor.re z) (h6Extractor.im z) := rfl

/-- The backward map is exactly the canonical Q coordinates reassembled in P. -/
theorem backward_coordinate_formula (z : cauchyRouteQPresentation.carrier) :
    cauchyPQIsomorphism.backward z =
      h6Presentation.coord (cauchyRouteQExtractor.re z) (cauchyRouteQExtractor.im z) := rfl

/-- Explicit inverse evidence required by Gate E. -/
theorem pq_left_inverse (z : h6Presentation.carrier) :
    cauchyPQIsomorphism.backward (cauchyPQIsomorphism.forward z) = z :=
  cauchyPQIsomorphism.leftInverse z

theorem pq_right_inverse (z : cauchyRouteQPresentation.carrier) :
    cauchyPQIsomorphism.forward (cauchyPQIsomorphism.backward z) = z :=
  cauchyPQIsomorphism.rightInverse z

/-- Required operation preservation surface. -/
theorem pq_preserve_real (a : RCBOMA) :
    cauchyPQIsomorphism.forward (h6Presentation.ofScalar a) =
      cauchyRouteQPresentation.ofScalar a :=
  cauchyPQIsomorphism.preserveReal a

theorem pq_preserve_i :
    cauchyPQIsomorphism.forward h6Presentation.imag = cauchyRouteQPresentation.imag :=
  cauchyPQIsomorphism.preserveImag

theorem pq_preserve_add (x y : h6Presentation.carrier) :
    cauchyPQIsomorphism.forward (h6Presentation.add x y) =
      cauchyRouteQPresentation.add
        (cauchyPQIsomorphism.forward x) (cauchyPQIsomorphism.forward y) :=
  cauchyPQIsomorphism.preserveAdd x y

theorem pq_preserve_mul (x y : h6Presentation.carrier) :
    cauchyPQIsomorphism.forward (h6Presentation.mul x y) =
      cauchyRouteQPresentation.mul
        (cauchyPQIsomorphism.forward x) (cauchyPQIsomorphism.forward y) :=
  cauchyPQIsomorphism.preserveMul x y

end BOMA.C.StageTwo.CauchyPQReconvergence015
