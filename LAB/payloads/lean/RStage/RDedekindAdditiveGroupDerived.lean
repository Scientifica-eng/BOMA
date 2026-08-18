/- Reusable identities derived from the certified additive group on RBOMA. -/
namespace BOMA.R.DedekindAdditiveDerived001

open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindAdditionLaws001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindAdditiveInverse001

/-- Exchange the middle two terms in a four-term additive expression. -/
theorem rAdd_exchange (a b c d : RBOMA) :
    rAdd a (rAdd b (rAdd c d)) =
    rAdd a (rAdd c (rAdd b d)) := by
  apply congrArg (fun t => rAdd a t)
  calc
    rAdd b (rAdd c d) = rAdd (rAdd b c) d := (rAdd_assoc b c d).symm
    _ = rAdd (rAdd c b) d :=
      congrArg (fun t => rAdd t d) (rAdd_comm b c)
    _ = rAdd c (rAdd b d) := rAdd_assoc c b d

/-- Negation distributes over formal real addition. -/
theorem rNeg_add (x y : RBOMA) :
    rNeg (rAdd x y) = rAdd (rNeg x) (rNeg y) := by
  symm
  apply rAdd_inverse_unique (x := rAdd x y)
  calc
    rAdd (rAdd x y) (rAdd (rNeg x) (rNeg y)) =
        rAdd x (rAdd y (rAdd (rNeg x) (rNeg y))) :=
      rAdd_assoc x y (rAdd (rNeg x) (rNeg y))
    _ = rAdd x (rAdd (rNeg x) (rAdd y (rNeg y))) :=
      rAdd_exchange x y (rNeg x) (rNeg y)
    _ = rAdd x (rAdd (rNeg x) rZero) := by rw [rAdd_neg_right]
    _ = rAdd x (rNeg x) := by rw [rAdd_zero_right]
    _ = rZero := rAdd_neg_right x

/-- Cancel a right summand by adding its inverse. -/
theorem rAdd_sub_right (x y : RBOMA) :
    rAdd (rAdd x y) (rNeg y) = x := by
  calc
    rAdd (rAdd x y) (rNeg y) = rAdd x (rAdd y (rNeg y)) :=
      rAdd_assoc x y (rNeg y)
    _ = rAdd x rZero := by rw [rAdd_neg_right]
    _ = x := rAdd_zero_right x

/-- Cancel a left negative translation. -/
theorem rAdd_sub_left (x y : RBOMA) :
    rAdd (rAdd x (rNeg y)) y = x := by
  calc
    rAdd (rAdd x (rNeg y)) y = rAdd x (rAdd (rNeg y) y) :=
      rAdd_assoc x (rNeg y) y
    _ = rAdd x rZero := by rw [rAdd_neg_left]
    _ = x := rAdd_zero_right x

/-- Subtracting a sum from its first summand gives the inverse of the second. -/
theorem rAdd_neg_sum_cancel_left (x y : RBOMA) :
    rAdd x (rNeg (rAdd x y)) = rNeg y := by
  rw [rNeg_add]
  calc
    rAdd x (rAdd (rNeg x) (rNeg y)) =
        rAdd (rAdd x (rNeg x)) (rNeg y) :=
      (rAdd_assoc x (rNeg x) (rNeg y)).symm
    _ = rAdd rZero (rNeg y) := by rw [rAdd_neg_right]
    _ = rNeg y := rAdd_zero_left _

/-- Subtracting a sum from its second summand gives the inverse of the first. -/
theorem rAdd_neg_sum_cancel_right (x y : RBOMA) :
    rAdd y (rNeg (rAdd x y)) = rNeg x := by
  rw [rAdd_comm x y]
  exact rAdd_neg_sum_cancel_left y x

end BOMA.R.DedekindAdditiveDerived001
