/- Nonzero multiplicative inverse existence revision 003.
Consumes the representative-independent positive inverse relation 003. -/
namespace BOMA.R.DedekindNonzeroInverse003

open BOMA.Q.Quotient001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindOrderClassical001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindAdditiveInverse001
open BOMA.R.DedekindPositiveDecomposition001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.DedekindSignedMulBasicLaws001
open BOMA.R.DedekindSignedMulAssociativity001
open BOMA.R.DedekindOrderedRing001
open BOMA.R.DedekindPositiveInverseRelation003

 theorem rNeg_ne_zero {x : RBOMA}
    (hx0 : x ≠ rZero) :
    rNeg x ≠ rZero := by
  intro hneg0
  apply hx0
  have h := congrArg rNeg hneg0
  rw [rNeg_involutive, rNeg_zero] at h
  exact h

 theorem r_inverse_exists_nonzero
    (x : RBOMA)
    (hx0 : x ≠ rZero) :
    ∃ y : RBOMA, rMulCandidate x y = rOne := by
  rcases rLE_total_classical rZero x with h0x | hxle0
  · rcases rPositiveInvRel_exists h0x hx0 with ⟨y, hyRel⟩
    exact ⟨y, rPositiveInvRel_product_one hyRel⟩
  · have h0nx : rLE rZero (rNeg x) := rNeg_nonneg_of_nonpos hxle0
    have hnx0 : rNeg x ≠ rZero := rNeg_ne_zero hx0
    rcases rPositiveInvRel_exists h0nx hnx0 with ⟨y, hyRel⟩
    have hprod : rMulCandidate (rNeg x) y = rOne :=
      rPositiveInvRel_product_one hyRel
    refine ⟨rNeg y, ?_⟩
    calc
      rMulCandidate x (rNeg y) = rNeg (rMulCandidate x y) :=
        rMulCandidate_neg_right x y
      _ = rMulCandidate (rNeg x) y :=
        (rMulCandidate_neg_left x y).symm
      _ = rOne := hprod

 theorem r_inverse_exists_nonzero_left
    (x : RBOMA)
    (hx0 : x ≠ rZero) :
    ∃ y : RBOMA, rMulCandidate y x = rOne := by
  rcases r_inverse_exists_nonzero x hx0 with ⟨y, hy⟩
  refine ⟨y, ?_⟩
  rw [rMulCandidate_comm]
  exact hy

 theorem r_inverse_witness_unique
    {x y z : RBOMA}
    (hy : rMulCandidate x y = rOne)
    (hz : rMulCandidate x z = rOne) :
    y = z := by
  calc
    y = rMulCandidate y rOne := (rMulCandidate_one_right y).symm
    _ = rMulCandidate y (rMulCandidate x z) :=
      congrArg (fun t => rMulCandidate y t) hz.symm
    _ = rMulCandidate (rMulCandidate y x) z :=
      (rMulCandidate_assoc y x z).symm
    _ = rMulCandidate (rMulCandidate x y) z := by
      rw [rMulCandidate_comm y x]
    _ = rMulCandidate rOne z := by rw [hy]
    _ = z := rMulCandidate_one_left z

end BOMA.R.DedekindNonzeroInverse003
