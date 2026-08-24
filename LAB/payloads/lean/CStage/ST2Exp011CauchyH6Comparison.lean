/- ST2-EXP-011 Gate E: native Cauchy/H6 instantiation of the scalar-generic
   quadratic comparison core.

This source is intended to be assembled only after the independent Cauchy real
manifest and the H6 Cauchy quadratic rebuild. It contains no Dedekind/H5
transport and does not consume the accepted RBOMA comparison adapter. -/
namespace BOMA.C.StageTwo.ComparisonInterface011.NativeCauchy

open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyAdditive003
open BOMA.R.StageTwo.CauchyMultiplicative003
open BOMA.C.StageTwo.CauchyQuadratic003
open BOMA.C.StageTwo.ComparisonInterface011

/-- Native alternative-real scalar operations. -/
def cauchyScalarOps : ScalarOps where
  carrier := RCBOMA
  zero := rCZero
  one := rCOne
  neg := rCNeg
  add := rCAdd
  mul := rCMul

/-- H6 itself is directly a minimal comparison presentation over RCBOMA.
    Coordinate laws are definitional for the H6 pair carrier. -/
def h6Presentation : QuadraticPresentation cauchyScalarOps where
  carrier := CCBOMA
  zero := ccZero
  one := ccOne
  neg := ccNeg
  add := ccAdd
  mul := ccMul
  ofScalar := ccOfR
  imag := ccI
  coord := fun a b => ⟨a, b⟩
  coordinateGeneration := by
    intro z
    exact ⟨z.re, z.im, by cases z; rfl⟩
  coordinateUnique := by
    intro a b c d h
    exact ⟨congrArg CCBOMA.re h, congrArg CCBOMA.im h⟩
  coordinateZero := rfl
  coordinateOne := rfl
  coordinateReal := by intro a; rfl
  coordinateImag := rfl
  coordinateNeg := by intro a b; rfl
  coordinateAdd := by intro a b c d; rfl
  coordinateMul := by intro a b c d; rfl

/-- Gate E: relation-level comparison elaborates natively over RCBOMA/H6. -/
theorem h6NativeSelfComparison :
    QuadraticComparisonCertificate h6Presentation h6Presentation :=
  quadraticComparison h6Presentation h6Presentation

/-- H6 has explicit pair projections, hence explicit extractor data; no choice
    principle is introduced by the generic comparison layer. -/
def h6Extractor : CoordinateExtractor h6Presentation where
  re := fun z => z.re
  im := fun z => z.im
  sound := by intro z; cases z; rfl

/-- Functional comparison is available only because h6Extractor is supplied. -/
def h6NativeSelfIsomorphism :
    ConstructiveQuadraticIsomorphism h6Presentation h6Presentation :=
  constructiveQuadraticIsomorphism
    h6Presentation h6Presentation h6Extractor h6Extractor

end BOMA.C.StageTwo.ComparisonInterface011.NativeCauchy
