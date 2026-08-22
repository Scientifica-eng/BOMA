/- PDSA-C-003 Route P: noncanonical rank-two coordinate probe.

This file is an exploratory producer candidate. It does not select C-DP-001,
create an accepted C Claim, construct a full field inverse, or use the Route Q
candidate.
-/
namespace BOMA.C.RoutePairProbe001

open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.StageIntegration002
open BOMA.C.RInterfaceNoSquareProbe001

/-- Route-local coordinate carrier; not the canonical BOMA complex carrier. -/
structure PairCandidate where
  re : RBOMA
  im : RBOMA

def zero : PairCandidate := ⟨rZero, rZero⟩
def one : PairCandidate := ⟨rOne, rZero⟩
def ofR (a : RBOMA) : PairCandidate := ⟨a, rZero⟩
def imag : PairCandidate := ⟨rZero, rOne⟩

def neg (z : PairCandidate) : PairCandidate :=
  ⟨rNeg z.re, rNeg z.im⟩

def add (z w : PairCandidate) : PairCandidate :=
  ⟨rAdd z.re w.re, rAdd z.im w.im⟩

def mul (z w : PairCandidate) : PairCandidate :=
  ⟨rAdd (rMulCandidate z.re w.re) (rNeg (rMulCandidate z.im w.im)),
   rAdd (rMulCandidate z.re w.im) (rMulCandidate z.im w.re)⟩

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
  congrArg PairCandidate.re h

/-- Multiplication by the route-local generator extracts an imaginary coefficient. -/
theorem embed_mul_imag
    (C : RStageIntegrationCertificate) (b : RBOMA) :
    mul (ofR b) imag = ⟨rZero, b⟩ := by
  apply PairCandidate.ext
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
  apply PairCandidate.ext
  · exact add_zero_right_from_interface C a
  · exact C.addZeroLeft b

/-- P/Q-06: the distinguished generator squares to negative one. -/
theorem imag_squared
    (C : RStageIntegrationCertificate) :
    mul imag imag = neg one := by
  apply PairCandidate.ext
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
    (C : RStageIntegrationCertificate) (z : PairCandidate) :
    ∃ a b : RBOMA, z = add (ofR a) (mul (ofR b) imag) := by
  refine ⟨z.re, z.im, ?_⟩
  rw [coordinate_expression C z.re z.im]
  cases z
  rfl

/-- P/Q-08: real/imaginary coordinates are unique at Route P equality. -/
theorem decomposition_unique
    (C : RStageIntegrationCertificate)
    {a b a' b' : RBOMA}
    (h : add (ofR a) (mul (ofR b) imag) =
      add (ofR a') (mul (ofR b') imag)) :
    a = a' ∧ b = b' := by
  rw [coordinate_expression C a b,
      coordinate_expression C a' b'] at h
  exact ⟨congrArg PairCandidate.re h,
         congrArg PairCandidate.im h⟩

/-- P/Q-09: the imaginary generator is not in the embedded real line. -/
theorem imag_not_real
    (C : RStageIntegrationCertificate) :
    ¬ ∃ a : RBOMA, imag = ofR a := by
  rintro ⟨a, ha⟩
  have h : rOne = rZero := congrArg PairCandidate.im ha
  exact C.nontrivial h.symm

end BOMA.C.RoutePairProbe001
