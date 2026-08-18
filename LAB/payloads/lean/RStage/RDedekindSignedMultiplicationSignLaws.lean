/- Sign-quadrant simplifications for the selected signed Dedekind multiplication.
Sign comparison is proof-level; the operation definition remains sign-case-free. -/
namespace BOMA.R.DedekindSignedMulSignLaws001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindAdditionLaws001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindAdditiveInverse001
open BOMA.R.DedekindPositivePart001
open BOMA.R.DedekindPositiveDecomposition001
open BOMA.R.DedekindNonnegativeMul001
open BOMA.R.DedekindNonnegativeMulLaws001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.DedekindSignedMulBasicLaws001

/-- Any nonpositive real factor is annihilated by the nonnegative-envelope kernel. -/
theorem cutMulNonnegEnvelope_left_nonpos
    {A : LowerCut} (B : LowerCut)
    (hA0 : CutLE A (principalCut qZero)) :
    CutEquiv
      (cutMulNonnegEnvelope A B)
      (principalCut qZero) := by
  intro q
  constructor
  · intro hq
    rcases hq with hqNeg | hqProd
    · exact hqNeg
    · rcases hqProd with ⟨a, _b, ha, _hb, h0a, _h0b, _hqab⟩
      have ha0 : qLT a qZero :=
        ((cutPosPart_of_nonpos hA0) a).mp ha
      exact False.elim ((qlt_asymm h0a) ha0)
  · intro hq0
    exact Or.inl hq0

/-- Quotient-level left annihilation for an arbitrary nonpositive real. -/
theorem rMulNonnegEnvelope_left_nonpos
    {x : RBOMA} (y : RBOMA)
    (hx0 : rLE x rZero) :
    rMulNonnegEnvelope x y = rZero := by
  refine Quotient.inductionOn x ?_ hx0
  intro A hA0
  refine Quotient.inductionOn y ?_
  intro B
  change
    rmk (cutMulNonnegEnvelope A B) =
    rmk (principalCut qZero)
  apply rmk_sound
  apply cutMulNonnegEnvelope_left_nonpos B
  change rLE (rmk A) (rmk (principalCut qZero)) at hA0
  exact (rLE_mk_iff A (principalCut qZero)).1 hA0

/-- Right annihilation follows from kernel commutativity. -/
theorem rMulNonnegEnvelope_right_nonpos
    (x : RBOMA) {y : RBOMA}
    (hy0 : rLE y rZero) :
    rMulNonnegEnvelope x y = rZero := by
  rw [rMulNonnegEnvelope_comm]
  exact rMulNonnegEnvelope_left_nonpos x hy0

/-- If x is nonnegative, -x is kernel-nonpositive. -/
theorem rMulNonnegEnvelope_neg_left_of_nonneg
    {x : RBOMA} (y : RBOMA)
    (h0x : rLE rZero x) :
    rMulNonnegEnvelope (rNeg x) y = rZero :=
  rMulNonnegEnvelope_left_nonpos y (rNeg_nonpos_of_nonneg h0x)

/-- If y is nonnegative, -y is kernel-nonpositive on the right. -/
theorem rMulNonnegEnvelope_neg_right_of_nonneg
    (x : RBOMA) {y : RBOMA}
    (h0y : rLE rZero y) :
    rMulNonnegEnvelope x (rNeg y) = rZero :=
  rMulNonnegEnvelope_right_nonpos x (rNeg_nonpos_of_nonneg h0y)

/-- Positive-positive quadrant: signed multiplication is the nonnegative kernel. -/
theorem rMulCandidate_of_nonneg_nonneg
    {x y : RBOMA}
    (h0x : rLE rZero x)
    (h0y : rLE rZero y) :
    rMulCandidate x y = rMulNonnegEnvelope x y := by
  unfold rMulCandidate
  rw [rMulNonnegEnvelope_neg_left_of_nonneg (rNeg y) h0x]
  rw [rMulNonnegEnvelope_neg_right_of_nonneg x h0y]
  rw [rMulNonnegEnvelope_neg_left_of_nonneg y h0x]
  rw [rAdd_zero_right, rAdd_zero_left,
      BOMA.R.DedekindSignedMulCandidate001.rNeg_zero, rAdd_zero_right]

/-- Positive-negative quadrant: signed multiplication is minus the kernel of x and -y. -/
theorem rMulCandidate_of_nonneg_nonpos
    {x y : RBOMA}
    (h0x : rLE rZero x)
    (hy0 : rLE y rZero) :
    rMulCandidate x y = rNeg (rMulNonnegEnvelope x (rNeg y)) := by
  unfold rMulCandidate
  rw [rMulNonnegEnvelope_right_nonpos x hy0]
  rw [rMulNonnegEnvelope_neg_left_of_nonneg (rNeg y) h0x]
  rw [rMulNonnegEnvelope_neg_left_of_nonneg y h0x]
  simp only [rAdd_zero_left, rAdd_zero_right]

/-- Negative-positive quadrant. -/
theorem rMulCandidate_of_nonpos_nonneg
    {x y : RBOMA}
    (hx0 : rLE x rZero)
    (h0y : rLE rZero y) :
    rMulCandidate x y = rNeg (rMulNonnegEnvelope (rNeg x) y) := by
  calc
    rMulCandidate x y = rMulCandidate y x := rMulCandidate_comm x y
    _ = rNeg (rMulNonnegEnvelope y (rNeg x)) :=
      rMulCandidate_of_nonneg_nonpos h0y hx0
    _ = rNeg (rMulNonnegEnvelope (rNeg x) y) := by
      rw [rMulNonnegEnvelope_comm]

/-- Negative-negative quadrant: signed multiplication is the kernel of the negated inputs. -/
theorem rMulCandidate_of_nonpos_nonpos
    {x y : RBOMA}
    (hx0 : rLE x rZero)
    (hy0 : rLE y rZero) :
    rMulCandidate x y = rMulNonnegEnvelope (rNeg x) (rNeg y) := by
  unfold rMulCandidate
  rw [rMulNonnegEnvelope_left_nonpos y hx0]
  rw [rMulNonnegEnvelope_left_nonpos (rNeg y) hx0]
  rw [rMulNonnegEnvelope_right_nonpos (rNeg x) hy0]
  rw [rAdd_zero_left, rAdd_zero_left,
      BOMA.R.DedekindSignedMulCandidate001.rNeg_zero, rAdd_zero_right]

end BOMA.R.DedekindSignedMulSignLaws001
