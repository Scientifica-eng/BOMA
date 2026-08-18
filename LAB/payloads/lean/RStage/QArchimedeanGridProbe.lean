/- Constructive rational grid consequences of the accepted Archimedean scaling theorem. -/
namespace BOMA.R.QArchimedeanGrid001

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001
open BOMA.Q.Quotient001
open BOMA.Q.Embedding001
open BOMA.Q.Order001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.QArchimedeanScaling001

/-- Successor compatibility of the accepted N -> Q embedding. -/
theorem qOfN_succ (n : BOMANat) :
    qOfN (s n) = qAdd (qOfN n) qOne := by
  have h := qOfN_add n (s z)
  simpa using h

/-- Rational grid based at a with positive step delta. -/
def qGrid (a delta : QBOMA) (n : BOMANat) : QBOMA :=
  qAdd a (qMul (qOfN n) delta)

@[simp] theorem qGrid_zero (a delta : QBOMA) : qGrid a delta z = a := by
  unfold qGrid
  rw [qOfN_zero, qMul_zero_left, qAdd_zero_right]

/-- Advancing the natural index advances the grid by exactly one delta. -/
theorem qGrid_succ (a delta : QBOMA) (n : BOMANat) :
    qGrid a delta (s n) = qAdd (qGrid a delta n) delta := by
  unfold qGrid
  rw [qOfN_succ, qMul_add_left, qMul_one_left]
  exact (qAdd_assoc a (qMul (qOfN n) delta) delta).symm

/-- A bound on the translated gap u-a gives a bound of u by the corresponding grid point. -/
theorem qle_grid_of_gap_bound {a u delta : QBOMA} {n : BOMANat}
    (h : qLE (qAdd u (qNeg a)) (qMul (qOfN n) delta)) :
    qLE u (qGrid a delta n) := by
  have ht := qadd_mono_right h a
  have hleft : qAdd (qAdd u (qNeg a)) a = u := by
    calc
      qAdd (qAdd u (qNeg a)) a = qAdd u (qAdd (qNeg a) a) :=
        qAdd_assoc u (qNeg a) a
      _ = qAdd u qZero := by rw [qAdd_neg_left]
      _ = u := qAdd_zero_right u
  have hright : qAdd (qMul (qOfN n) delta) a = qGrid a delta n := by
    unfold qGrid
    exact qAdd_comm (qMul (qOfN n) delta) a
  rw [hleft, hright] at ht
  exact ht

/-- Starting from any member a of a proper lower cut and any known outside point u,
a positive rational step eventually reaches a grid point outside the cut.
No membership decision or Classical.em is used here. -/
theorem qGrid_eventually_outside
    (A : LowerCut) (a u delta : QBOMA)
    (ha : A.lower a) (hu : ¬ A.lower u)
    (hdelta : qLT qZero delta) :
    ∃ n : BOMANat, ¬ A.lower (qGrid a delta n) := by
  rcases q_archimedean_scale (qAdd u (qNeg a)) delta hdelta with ⟨n, hn⟩
  refine ⟨n, ?_⟩
  intro hgrid
  apply hu
  exact A.downward hgrid (qle_grid_of_gap_bound hn)

end BOMA.R.QArchimedeanGrid001
