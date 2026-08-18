/- Anchored fine bracketing for positive Dedekind lower cuts.
This strengthens the accepted CutBracketApprox by preserving a chosen positive
inside anchor as a lower bound on the returned inside endpoint. -/
namespace BOMA.R.DedekindAnchoredBracket001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindCutBracket001

/-- If a0 is inside A and a0≤b, keep b; otherwise use a0.
The resulting inside endpoint remains below the same outside r and its gap
is no larger than the original bracket gap. -/
theorem cut_bracket_approx_anchored
    (A : LowerCut)
    (a0 eps : QBOMA)
    (ha0 : A.lower a0)
    (heps : qLT qZero eps) :
    ∃ a r : QBOMA,
      A.lower a ∧
      ¬ A.lower r ∧
      qLE a0 a ∧
      qLT qZero (qAdd r (qNeg a)) ∧
      qLT (qAdd r (qNeg a)) eps := by
  rcases cut_bracket_approx A eps heps with
    ⟨b, r, hbA, hrOut, hgapPos, hgapSmall⟩
  rcases qle_total a0 b with h0b | hb0
  · exact ⟨b, r, hbA, hrOut, h0b, hgapPos, hgapSmall⟩
  · have ha0r : qLT a0 r := by
      rcases qle_total a0 r with h0r | hr0
      · refine ⟨h0r, ?_⟩
        intro heq
        apply hrOut
        rw [← heq]
        exact ha0
      · exact False.elim (hrOut (A.downward ha0 hr0))
    have hnewPos : qLT qZero (qAdd r (qNeg a0)) := by
      exact (qle_iff_nonneg_difference a0 r).1 ha0r.1 |> fun hle =>
        ⟨hle, by
          intro hzero
          have heq : r = a0 := by
            apply qAdd_left_cancel (a := qNeg a0)
            calc
              qAdd (qNeg a0) r = qAdd r (qNeg a0) := qAdd_comm _ _
              _ = qZero := hzero
              _ = qAdd (qNeg a0) a0 := (qAdd_neg_left a0).symm
          exact ha0r.2 heq.symm⟩
    have hgapLE :
        qLE (qAdd r (qNeg a0)) (qAdd r (qNeg b)) := by
      have hneg : qLE (qNeg a0) (qNeg b) := qneg_reverses hb0
      have ht := qadd_mono_left hneg r
      exact ht
    have hnewSmall : qLT (qAdd r (qNeg a0)) eps :=
      qle_lt_trans_recip hgapLE hgapSmall
    exact ⟨a0, r, ha0, hrOut, qle_refl a0, hnewPos, hnewSmall⟩

end BOMA.R.DedekindAnchoredBracket001
