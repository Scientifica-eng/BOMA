/- PDSA-C-003 Route P: noncanonical rank-two coordinate probe.

This file is an exploratory producer candidate. It does not select C-DP-001,
create an accepted C Claim, construct a full field inverse, or use the Route Q
candidate.
-/
namespace BOMA.C.StageTwo.NarrowRoutePair001

open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.C.StageTwo.NarrowRInterface001
open BOMA.C.StageTwo.NarrowNoSquare001

/-- This experimental branch retains the exact accepted pair carrier. -/
abbrev PairCandidate : Type := BOMA.C.RoutePairProbe001.PairCandidate

theorem pair_ext {z w : PairCandidate}
    (hre : z.re = w.re) (him : z.im = w.im) :
    z = w :=
  BOMA.C.RoutePairProbe001.pair_ext hre him

abbrev zero : PairCandidate := BOMA.C.RoutePairProbe001.zero
abbrev one : PairCandidate := BOMA.C.RoutePairProbe001.one
abbrev ofR (a : RBOMA) : PairCandidate := BOMA.C.RoutePairProbe001.ofR a
abbrev imag : PairCandidate := BOMA.C.RoutePairProbe001.imag
abbrev neg (z : PairCandidate) : PairCandidate := BOMA.C.RoutePairProbe001.neg z
abbrev add (z w : PairCandidate) : PairCandidate := BOMA.C.RoutePairProbe001.add z w
abbrev mul (z w : PairCandidate) : PairCandidate := BOMA.C.RoutePairProbe001.mul z w

theorem add_zero_right_from_interface
    (C : NarrowROrderedFieldCertificate) (x : RBOMA) :
    rAdd x rZero = x := by
  calc
    rAdd x rZero = rAdd rZero x := C.addComm x rZero
    _ = x := C.addZeroLeft x

theorem mul_one_right_from_interface
    (C : NarrowROrderedFieldCertificate) (x : RBOMA) :
    rMulCandidate x rOne = x := by
  calc
    rMulCandidate x rOne = rMulCandidate rOne x := C.mulComm x rOne
    _ = x := C.mulOneLeft x

/-- P/Q-03: route-local real embedding is faithful. -/
theorem ofR_injective {a b : RBOMA}
    (h : ofR a = ofR b) : a = b :=
  congrArg BOMA.C.RoutePairProbe001.PairCandidate.re h

/-- Multiplication by the route-local generator extracts an imaginary coefficient. -/
theorem embed_mul_imag
    (C : NarrowROrderedFieldCertificate) (b : RBOMA) :
    mul (ofR b) imag = ⟨rZero, b⟩ := by
  apply pair_ext
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
    (C : NarrowROrderedFieldCertificate) (a b : RBOMA) :
    add (ofR a) (mul (ofR b) imag) = ⟨a, b⟩ := by
  rw [embed_mul_imag C b]
  apply pair_ext
  · exact add_zero_right_from_interface C a
  · exact C.addZeroLeft b

/-- P/Q-06: the distinguished generator squares to negative one. -/
theorem imag_squared
    (C : NarrowROrderedFieldCertificate) :
    mul imag imag = neg one := by
  apply pair_ext
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
    (C : NarrowROrderedFieldCertificate) (z : PairCandidate) :
    ∃ a b : RBOMA, z = add (ofR a) (mul (ofR b) imag) := by
  refine ⟨z.re, z.im, ?_⟩
  rw [coordinate_expression C z.re z.im]

/-- P/Q-08: real/imaginary coordinates are unique at Route P equality. -/
theorem decomposition_unique
    (C : NarrowROrderedFieldCertificate)
    {a b a' b' : RBOMA}
    (h : add (ofR a) (mul (ofR b) imag) =
      add (ofR a') (mul (ofR b') imag)) :
    a = a' ∧ b = b' := by
  rw [coordinate_expression C a b,
      coordinate_expression C a' b'] at h
  exact ⟨congrArg BOMA.C.RoutePairProbe001.PairCandidate.re h,
         congrArg BOMA.C.RoutePairProbe001.PairCandidate.im h⟩

/-- P/Q-09: the imaginary generator is not in the embedded real line. -/
theorem imag_not_real
    (C : NarrowROrderedFieldCertificate) :
    ¬ ∃ a : RBOMA, imag = ofR a := by
  rintro ⟨a, ha⟩
  have h : rOne = rZero := congrArg BOMA.C.RoutePairProbe001.PairCandidate.im ha
  exact C.nontrivial h.symm

end BOMA.C.StageTwo.NarrowRoutePair001
