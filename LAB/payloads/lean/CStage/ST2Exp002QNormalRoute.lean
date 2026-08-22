/- ST2-EXP-002: independent Route-Q-local quadratic normal-form operations.
This source reuses only Route Q's own NormalForm and accepted real interface. -/
namespace BOMA.C.StageTwo.QNormalRoute002

open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.StageIntegration002
open BOMA.C.RInterfaceNoSquareProbe001

/-- Q-local normalization carrier: never the selected Route P carrier. -/
abbrev NormalForm : Type := BOMA.C.RouteQuadraticQuotientProbe001.NormalForm

theorem normal_ext {u v : NormalForm}
    (hre : u.re = v.re) (him : u.im = v.im) :
    u = v :=
  BOMA.C.RouteQuadraticQuotientProbe001.normal_ext hre him

def zero : NormalForm := BOMA.C.RouteQuadraticQuotientProbe001.nfReal rZero
def one : NormalForm := BOMA.C.RouteQuadraticQuotientProbe001.nfReal rOne
def ofR (a : RBOMA) : NormalForm := BOMA.C.RouteQuadraticQuotientProbe001.nfReal a
def imag : NormalForm := BOMA.C.RouteQuadraticQuotientProbe001.nfImag
def neg (u : NormalForm) : NormalForm := BOMA.C.RouteQuadraticQuotientProbe001.nfNeg u
def add (u v : NormalForm) : NormalForm := BOMA.C.RouteQuadraticQuotientProbe001.nfAdd u v
def mul (u v : NormalForm) : NormalForm := BOMA.C.RouteQuadraticQuotientProbe001.nfMul u v

theorem add_zero_right_from_interface
    (C : RStageIntegrationCertificate) (x : RBOMA) :
    rAdd x rZero = x := by
  calc
    rAdd x rZero = rAdd rZero x := C.addComm x rZero
    _ = x := C.addZeroLeft x

theorem mul_one_right_from_interface
    (C : RStageIntegrationCertificate) (x : RBOMA) :
    rMulCandidate x rOne = x := by
  calc
    rMulCandidate x rOne = rMulCandidate rOne x := C.mulComm x rOne
    _ = x := C.mulOneLeft x

/-- P/Q-03: route-local real embedding is faithful. -/
theorem ofR_injective {a b : RBOMA}
    (h : ofR a = ofR b) : a = b :=
  congrArg BOMA.C.RouteQuadraticQuotientProbe001.NormalForm.re h

/-- Multiplication by the route-local generator extracts an imaginary coefficient. -/
theorem embed_mul_imag
    (C : RStageIntegrationCertificate) (b : RBOMA) :
    mul (ofR b) imag = ⟨rZero, b⟩ := by
  apply normal_ext
  · change
      rAdd (rMulCandidate b rZero)
        (rNeg (rMulCandidate rZero rOne)) = rZero
    rw [mul_zero_right_from_interface C b,
        mul_zero_left_from_interface C rOne,
        neg_zero_from_interface C,
        C.addZeroLeft rZero]
  · change
      rAdd (rMulCandidate b rOne)
        (rMulCandidate rZero rZero) = b
    rw [mul_one_right_from_interface C b,
        mul_zero_left_from_interface C rZero,
        add_zero_right_from_interface C b]

/-- Normal form of a real-plus-imaginary route-local expression. -/
theorem coordinate_expression
    (C : RStageIntegrationCertificate) (a b : RBOMA) :
    add (ofR a) (mul (ofR b) imag) = ⟨a, b⟩ := by
  rw [embed_mul_imag C b]
  apply normal_ext
  · exact add_zero_right_from_interface C a
  · exact C.addZeroLeft b

/-- P/Q-06: the distinguished generator squares to negative one. -/
theorem imag_squared
    (C : RStageIntegrationCertificate) :
    mul imag imag = neg one := by
  apply normal_ext
  · change
      rAdd (rMulCandidate rZero rZero)
        (rNeg (rMulCandidate rOne rOne)) = rNeg rOne
    rw [mul_zero_left_from_interface C rZero,
        C.mulOneLeft rOne,
        C.addZeroLeft (rNeg rOne)]
  · change
      rAdd (rMulCandidate rZero rOne)
        (rMulCandidate rOne rZero) = rNeg rZero
    rw [mul_zero_left_from_interface C rOne,
        C.mulOneLeft rZero,
        C.addZeroLeft rZero,
        neg_zero_from_interface C]

/-- P/Q-07: every route-local candidate has a real/imaginary decomposition. -/
theorem decomposition
    (C : RStageIntegrationCertificate) (z : NormalForm) :
    ∃ a b : RBOMA, z = add (ofR a) (mul (ofR b) imag) := by
  refine ⟨z.re, z.im, ?_⟩
  rw [coordinate_expression C z.re z.im]

/-- P/Q-08: real/imaginary coordinates are unique at Route Q normal-form equality. -/
theorem decomposition_unique
    (C : RStageIntegrationCertificate)
    {a b a' b' : RBOMA}
    (h : add (ofR a) (mul (ofR b) imag) =
      add (ofR a') (mul (ofR b') imag)) :
    a = a' ∧ b = b' := by
  rw [coordinate_expression C a b,
      coordinate_expression C a' b'] at h
  exact ⟨congrArg BOMA.C.RouteQuadraticQuotientProbe001.NormalForm.re h,
         congrArg BOMA.C.RouteQuadraticQuotientProbe001.NormalForm.im h⟩

/-- P/Q-09: the imaginary generator is not in the embedded real line. -/
theorem imag_not_real
    (C : RStageIntegrationCertificate) :
    ¬ ∃ a : RBOMA, imag = ofR a := by
  rintro ⟨a, ha⟩
  have h : rOne = rZero := congrArg BOMA.C.RouteQuadraticQuotientProbe001.NormalForm.im ha
  exact C.nontrivial h.symm

end BOMA.C.StageTwo.QNormalRoute002
