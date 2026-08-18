/- Positive representative witnesses for nonzero nonnegative selected reals. -/
namespace BOMA.R.DedekindPositiveRepresentative001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindPositiveReciprocal001

/-- A cut containing one positive rational contains the entire principal zero cut. -/
theorem cut_zero_le_of_has_positive
    {A : LowerCut}
    (hApos : CutHasPositive A) :
    CutLE (principalCut qZero) A := by
  rcases hApos with ⟨a, haA, h0a⟩
  intro q hq0
  exact A.downward haA (qlt_trans hq0 h0a).1

/-- A nonnegative cut that is not extensionally zero must contain a positive rational.
The witness extraction uses Classical.byContradiction explicitly. -/
theorem cut_has_positive_of_nonneg_ne_zero
    {A : LowerCut}
    (h0A : CutLE (principalCut qZero) A)
    (hne : ¬ CutEquiv A (principalCut qZero)) :
    CutHasPositive A := by
  apply Classical.byContradiction
  intro hNoPos
  apply hne
  intro q
  constructor
  · intro hqA
    rcases qlt_trichotomy q qZero with hq0 | heq | h0q
    · exact hq0
    · rcases A.rounded hqA with ⟨b, hbA, hqb⟩
      have h0b : qLT qZero b := by
        rw [heq] at hqb
        exact hqb
      exact False.elim (hNoPos ⟨b, hbA, h0b⟩)
    · exact False.elim (hNoPos ⟨q, hqA, h0q⟩)
  · intro hq0
    exact h0A q hq0

/-- Every nonzero nonnegative formal real has a representative with an explicit
positive rational inside witness. -/
theorem r_nonneg_nonzero_positive_rep
    {x : RBOMA}
    (h0x : rLE rZero x)
    (hx0 : x ≠ rZero) :
    ∃ A : LowerCut, ∃ hApos : CutHasPositive A,
      x = rmk A := by
  refine Quotient.inductionOn x ?_ h0x hx0
  intro A h0A hAne
  have h0Acut : CutLE (principalCut qZero) A := by
    change rLE (rmk (principalCut qZero)) (rmk A) at h0A
    exact (rLE_mk_iff (principalCut qZero) A).1 h0A
  have hneCut : ¬ CutEquiv A (principalCut qZero) := by
    intro hEq
    apply hAne
    exact rmk_sound hEq
  have hApos : CutHasPositive A :=
    cut_has_positive_of_nonneg_ne_zero h0Acut hneCut
  exact ⟨A, hApos, rfl⟩

end BOMA.R.DedekindPositiveRepresentative001
