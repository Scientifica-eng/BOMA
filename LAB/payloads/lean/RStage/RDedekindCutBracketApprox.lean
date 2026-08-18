/- Arbitrarily fine inside/outside rational bracketing for selected Dedekind cuts.
Arithmetic Archimedean scaling and finite predicate search remain separate dependencies. -/
namespace BOMA.R.DedekindCutBracket001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.QArchimedeanGrid001
open BOMA.R.DedekindFiniteExit001

/-- Every positive rational epsilon admits an inside/outside bracket around an
arbitrary Dedekind lower cut whose rational width is positive and strictly
smaller than epsilon.

The arithmetic growth is inherited from the constructive Q Archimedean route.
The only predicate-membership search is inherited from the isolated finite-exit theorem. -/
theorem cut_bracket_approx
    (A : LowerCut) (eps : QBOMA)
    (heps : qLT qZero eps) :
    ∃ b r : QBOMA,
      A.lower b ∧
      ¬ A.lower r ∧
      qLT qZero (qAdd r (qNeg b)) ∧
      qLT (qAdd r (qNeg b)) eps := by
  rcases rational_order_dense heps with ⟨delta, h0delta, hdeltaeps⟩
  rcases A.nonempty with ⟨a, ha⟩
  rcases A.proper with ⟨u, hu⟩
  rcases qGrid_eventually_outside A a u delta hu h0delta with ⟨n, hout⟩
  rcases qGrid_first_exit A a delta ha n hout with ⟨b, r, hb, hr, hstep⟩
  have hwidth : qAdd r (qNeg b) = delta := by
    calc
      qAdd r (qNeg b) = qAdd (qAdd b delta) (qNeg b) :=
        congrArg (fun t => qAdd t (qNeg b)) hstep
      _ = qAdd b (qAdd delta (qNeg b)) :=
        qAdd_assoc b delta (qNeg b)
      _ = qAdd b (qAdd (qNeg b) delta) :=
        congrArg (fun t => qAdd b t) (qAdd_comm delta (qNeg b))
      _ = qAdd (qAdd b (qNeg b)) delta :=
        (qAdd_assoc b (qNeg b) delta).symm
      _ = qAdd qZero delta := by rw [qAdd_neg_right]
      _ = delta := qAdd_zero_left delta
  refine ⟨b, r, hb, hr, ?_, ?_⟩
  · rw [hwidth]
    exact h0delta
  · rw [hwidth]
    exact hdeltaeps

end BOMA.R.DedekindCutBracket001
