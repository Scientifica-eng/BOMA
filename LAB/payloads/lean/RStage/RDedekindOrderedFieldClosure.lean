/- Explicit ordered-field closure laws required by the Stage-One R acceptance contract.
These are derived from already-certified RBOMA additive/order/multiplicative/inverse interfaces. -/
namespace BOMA.R.DedekindOrderedFieldClosure001

open BOMA.Q.Quotient001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindOrderConstructive001
open BOMA.R.DedekindStrictOrder001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindAdditionLaws001
open BOMA.R.DedekindOrderAdditive001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindAdditiveInverse001
open BOMA.R.DedekindAdditiveDerived001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.DedekindSignedMulBasicLaws001
open BOMA.R.DedekindPositiveReciprocal001
open BOMA.R.DedekindPositiveInverseRelation003
open BOMA.R.DedekindNonzeroInverse004

/-- Nontriviality of the selected real zero and one is inherited from the
accepted rational strict order through the faithful principal-cut embedding. -/
theorem rZero_ne_rOne_field : rZero ≠ rOne := by
  have hlt : rLT rZero rOne := by
    change rLT (rOfQ qZero) (rOfQ qOne)
    exact (rOfQ_strict_order qZero qOne).2 qzero_lt_one
  exact hlt.2

/-- Addition by a common right translate is an order equivalence, not merely
one-way monotonicity. -/
theorem rLE_add_right_iff (x y c : RBOMA) :
    rLE (rAdd x c) (rAdd y c) ↔ rLE x y := by
  constructor
  · intro h
    have h' := rAdd_mono_right h (rNeg c)
    rw [rAdd_sub_right x c, rAdd_sub_right y c] at h'
    exact h'
  · intro h
    exact rAdd_mono_right h c

/-- Addition by a common left translate is likewise an order equivalence. -/
theorem rLE_add_left_iff (x y c : RBOMA) :
    rLE (rAdd c x) (rAdd c y) ↔ rLE x y := by
  rw [rAdd_comm c x, rAdd_comm c y]
  exact rLE_add_right_iff x y c

/-- Negation reverses the selected real order. -/
theorem rNeg_order_reversing {x y : RBOMA}
    (hxy : rLE x y) :
    rLE (rNeg y) (rNeg x) := by
  let c : RBOMA := rAdd (rNeg x) (rNeg y)
  have h := rAdd_mono_right hxy c
  have hx : rAdd x c = rNeg y := by
    unfold c
    calc
      rAdd x (rAdd (rNeg x) (rNeg y)) =
          rAdd (rAdd x (rNeg x)) (rNeg y) :=
        (rAdd_assoc x (rNeg x) (rNeg y)).symm
      _ = rAdd rZero (rNeg y) := by rw [rAdd_neg_right]
      _ = rNeg y := rAdd_zero_left _
  have hy : rAdd y c = rNeg x := by
    unfold c
    calc
      rAdd y (rAdd (rNeg x) (rNeg y)) =
          rAdd y (rAdd (rNeg y) (rNeg x)) := by
        rw [rAdd_comm (rNeg x) (rNeg y)]
      _ = rAdd (rAdd y (rNeg y)) (rNeg x) :=
        (rAdd_assoc y (rNeg y) (rNeg x)).symm
      _ = rAdd rZero (rNeg x) := by rw [rAdd_neg_right]
      _ = rNeg x := rAdd_zero_left _
  rw [hx, hy] at h
  exact h

/-- The selected positive reciprocal relation yields a strictly positive inverse,
not merely a nonnegative one. -/
theorem rPositiveInvRel_strict_positive
    {x y : RBOMA}
    (hxy : RPositiveInvRel x y) :
    rLT rZero y := by
  have hprod : rMulCandidate x y = rOne :=
    rPositiveInvRel_product_one hxy
  have hy0 : y ≠ rZero := by
    intro hy0
    rw [hy0, rMulCandidate_zero_right] at hprod
    exact rZero_ne_rOne_field hprod
  rcases hxy with ⟨A, hApos, hxA, hyA⟩
  have h0y : rLE rZero y := by
    rw [hyA]
    change rLE (rmk (principalCut qZero)) (rmk (cutRecipPos A hApos))
    exact (rLE_mk_iff (principalCut qZero) (cutRecipPos A hApos)).2
      (cut_zero_le_recipPos A hApos)
  exact ⟨h0y, fun h0yEq => hy0 h0yEq.symm⟩

/-- Any multiplicative inverse witness of a strictly positive real is strictly
positive. Uniqueness transports positivity from the direct positive reciprocal
witness to an arbitrary accepted inverse witness. -/
theorem rInverse_positive_of_positive
    {x y : RBOMA}
    (h0x : rLT rZero x)
    (hxy : rMulCandidate x y = rOne) :
    rLT rZero y := by
  have hx0 : x ≠ rZero := by
    intro hx0
    exact h0x.2 hx0.symm
  rcases rPositiveInvRel_exists h0x.1 hx0 with ⟨z, hz⟩
  have hzprod : rMulCandidate x z = rOne :=
    rPositiveInvRel_product_one hz
  have hyz : y = z := r_inverse_witness_unique hxy hzprod
  rw [hyz]
  exact rPositiveInvRel_strict_positive hz

end BOMA.R.DedekindOrderedFieldClosure001
