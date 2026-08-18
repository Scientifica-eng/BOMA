/- Isolated logical search over a finite rational grid.
The arithmetic grid and eventual crossing are proved constructively elsewhere. -/
namespace BOMA.R.DedekindFiniteExit001

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.Q.Quotient001
open BOMA.R.DedekindProbe001
open BOMA.R.QArchimedeanGrid001

/-- Given an inside base point and a finite grid endpoint known outside,
there is an adjacent inside/outside pair along the grid.

The only nonconstructive ingredient is the explicit proposition-level
`Classical.em` used to decide membership of the predecessor grid point. -/
theorem qGrid_first_exit
    (A : LowerCut) (a delta : QBOMA)
    (ha : A.lower a) :
    ∀ n : BOMANat,
      ¬ A.lower (qGrid a delta n) →
      ∃ b r : QBOMA,
        A.lower b ∧
        ¬ A.lower r ∧
        r = qAdd b delta := by
  intro n
  induction n with
  | z =>
      intro hout
      have hbase : A.lower (qGrid a delta z) := by
        simpa using ha
      exact False.elim (hout hbase)
  | s n ih =>
      intro hout
      rcases Classical.em (A.lower (qGrid a delta n)) with hprev | hprev
      · refine ⟨qGrid a delta n, qGrid a delta (s n), hprev, hout, ?_⟩
        exact qGrid_succ a delta n
      · exact ih hprev

end BOMA.R.DedekindFiniteExit001
