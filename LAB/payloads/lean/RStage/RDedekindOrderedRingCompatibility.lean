/- Ordered-ring compatibility for the selected Dedekind real operations.
This layer derives multiplication monotonicity from the additive difference
interface and the already-certified signed distributivity. -/
namespace BOMA.R.DedekindOrderedRing001

open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindOrderConstructive001
open BOMA.R.DedekindOrderAdditive001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindAdditionLaws001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindAdditiveInverse001
open BOMA.R.DedekindAdditiveDerived001
open BOMA.R.DedekindNonnegativeMul001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.DedekindSignedMulBasicLaws001
open BOMA.R.DedekindSignedMulSignLaws001
open BOMA.R.DedekindSignedMulAssociativity001
open BOMA.R.DedekindSignedMulDistributivity001

/-- Real order is equivalent to nonnegativity of the additive difference y-x. -/
theorem rle_iff_nonneg_difference (x y : RBOMA) :
    rLE x y ↔ rLE rZero (rAdd y (rNeg x)) := by
  constructor
  · intro hxy
    have ht := rAdd_mono_right hxy (rNeg x)
    have hx0 : rAdd x (rNeg x) = rZero := rAdd_neg_right x
    rw [hx0] at ht
    exact ht
  · intro hdiff
    have ht := rAdd_mono_right hdiff x
    have hleft : rAdd rZero x = x := rAdd_zero_left x
    have hright : rAdd (rAdd y (rNeg x)) x = y := by
      calc
        rAdd (rAdd y (rNeg x)) x = rAdd y (rAdd (rNeg x) x) :=
          rAdd_assoc y (rNeg x) x
        _ = rAdd y rZero := by rw [rAdd_neg_left]
        _ = y := rAdd_zero_right y
    rw [hleft, hright] at ht
    exact ht

/-- The product of two nonnegative selected reals is nonnegative. -/
theorem rMulCandidate_nonneg
    {x y : RBOMA}
    (h0x : rLE rZero x)
    (h0y : rLE rZero y) :
    rLE rZero (rMulCandidate x y) := by
  rw [rMulCandidate_of_nonneg_nonneg h0x h0y]
  exact rMulNonnegEnvelope_nonneg x y

/-- Multiplication of the additive inverse on the right is the additive inverse
of the product. This is derived from distributivity and inverse uniqueness. -/
theorem rMulCandidate_neg_right (x y : RBOMA) :
    rMulCandidate x (rNeg y) = rNeg (rMulCandidate x y) := by
  apply rAdd_inverse_unique (x := rMulCandidate x y)
  calc
    rAdd (rMulCandidate x y) (rMulCandidate x (rNeg y)) =
        rMulCandidate x (rAdd y (rNeg y)) :=
      (rMulCandidate_add_right x y (rNeg y)).symm
    _ = rMulCandidate x rZero := by rw [rAdd_neg_right]
    _ = rZero := rMulCandidate_zero_right x

/-- Left negation compatibility follows from multiplication commutativity. -/
theorem rMulCandidate_neg_left (x y : RBOMA) :
    rMulCandidate (rNeg x) y = rNeg (rMulCandidate x y) := by
  calc
    rMulCandidate (rNeg x) y = rMulCandidate y (rNeg x) :=
      rMulCandidate_comm _ _
    _ = rNeg (rMulCandidate y x) := rMulCandidate_neg_right y x
    _ = rNeg (rMulCandidate x y) :=
      congrArg rNeg (rMulCandidate_comm y x)

/-- A nonnegative left factor preserves formal real order. -/
theorem rMulCandidate_mono_left_nonneg
    {x y c : RBOMA}
    (hxy : rLE x y)
    (h0c : rLE rZero c) :
    rLE (rMulCandidate c x) (rMulCandidate c y) := by
  have hdiff : rLE rZero (rAdd y (rNeg x)) :=
    (rle_iff_nonneg_difference x y).1 hxy
  have hprod :
      rLE rZero (rMulCandidate c (rAdd y (rNeg x))) :=
    rMulCandidate_nonneg h0c hdiff
  have hrepr :
      rMulCandidate c (rAdd y (rNeg x)) =
      rAdd (rMulCandidate c y) (rNeg (rMulCandidate c x)) := by
    calc
      rMulCandidate c (rAdd y (rNeg x)) =
          rAdd (rMulCandidate c y) (rMulCandidate c (rNeg x)) :=
        rMulCandidate_add_right c y (rNeg x)
      _ = rAdd (rMulCandidate c y) (rNeg (rMulCandidate c x)) := by
        rw [rMulCandidate_neg_right]
  rw [hrepr] at hprod
  exact (rle_iff_nonneg_difference
    (rMulCandidate c x) (rMulCandidate c y)).2 hprod

/-- A nonnegative right factor preserves formal real order. -/
theorem rMulCandidate_mono_right_nonneg
    {x y c : RBOMA}
    (hxy : rLE x y)
    (h0c : rLE rZero c) :
    rLE (rMulCandidate x c) (rMulCandidate y c) := by
  rw [rMulCandidate_comm x c, rMulCandidate_comm y c]
  exact rMulCandidate_mono_left_nonneg hxy h0c

/-- Ordered-ring translation form: if a≤b and 0≤c then a*c≤b*c. -/
theorem rMulCandidate_order_compatible
    {a b c : RBOMA}
    (hab : rLE a b)
    (h0c : rLE rZero c) :
    rLE (rMulCandidate a c) (rMulCandidate b c) :=
  rMulCandidate_mono_right_nonneg hab h0c

end BOMA.R.DedekindOrderedRing001
