/- Reusable Archimedean scaling consequence on accepted QBOMA. -/
namespace BOMA.R.QArchimedeanScaling001

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.Q.Quotient001
open BOMA.Q.Embedding001
open BOMA.Q.Order001
open BOMA.Q.Inverse001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.QArchimedeanUpperBound001

/-- Every rational gap is bounded above by a natural multiple of any positive
rational step. The inverse is consumed as an existential witness; no global
inverse selector or Choice principle is introduced. -/
theorem q_archimedean_scale (gap delta : QBOMA) (hdelta : qLT qZero delta) :
    ∃ n : BOMANat, qLE gap (qMul (qOfN n) delta) := by
  have hdeltaNZ : delta ≠ qZero := hdelta.2.symm
  rcases q_inverse_exists delta hdeltaNZ with ⟨rinv, hrinv⟩
  have hdeltaPos : QPositive delta := ⟨hdelta.1, hdeltaNZ⟩
  have hrinvPos : QPositive rinv :=
    inverse_of_positive_is_positive hdeltaPos hrinv
  rcases q_le_natural_upper (qMul gap rinv) with ⟨n, hn⟩
  have hm := qmul_mono_left_nonneg hn hdelta.1
  have hleft : qMul delta (qMul gap rinv) = gap := by
    calc
      qMul delta (qMul gap rinv) = qMul (qMul delta gap) rinv :=
        (qMul_assoc delta gap rinv).symm
      _ = qMul (qMul gap delta) rinv :=
        congrArg (fun t => qMul t rinv) (qMul_comm delta gap)
      _ = qMul gap (qMul delta rinv) := qMul_assoc gap delta rinv
      _ = qMul gap qOne := congrArg (fun t => qMul gap t) hrinv
      _ = gap := qMul_one_right gap
  have hright : qMul delta (qOfN n) = qMul (qOfN n) delta :=
    qMul_comm delta (qOfN n)
  rw [hleft, hright] at hm
  exact ⟨n, hm⟩

end BOMA.R.QArchimedeanScaling001
