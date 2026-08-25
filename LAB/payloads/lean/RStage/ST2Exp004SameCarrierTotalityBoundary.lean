/- ST2-EXP-004 Gate D: same-carrier totality boundary.

This source does not recover an unconditional totality theorem.  It proves the
exact constructive equivalence between the frozen same-carrier totality target
and `CutComparability`.  The result prevents an explicit CutComparability
assumption from being mistaken for an independent recovery of totality. -/
namespace BOMA.R.StageTwo.TotalOrderRegime004.SameCarrier

open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindOrderConstructive001

/-- The exact accepted order-totality proposition on the frozen RBOMA/rLE pair. -/
def RTotality004 : Prop :=
  ∀ x y : RBOMA, rLE x y ∨ rLE y x

/-- Any same-carrier totality proof yields raw lower-cut comparability. -/
theorem cutComparability_of_rLE_total004
    (hTotal : RTotality004) : CutComparability := by
  intro A B
  rcases hTotal (rmk A) (rmk B) with hAB | hBA
  · exact Or.inl ((rLE_mk_iff A B).1 hAB)
  · exact Or.inr ((rLE_mk_iff B A).1 hBA)

/-- Conversely, the already verified constructive quotient theorem transports
raw cut comparability to totality on the quotient carrier. -/
theorem rLE_total_of_cutComparability004
    (hComp : CutComparability) : RTotality004 := by
  intro x y
  exact rLE_total_of_cutComparability hComp x y

/-- Gate-D boundary theorem: with the frozen carrier and order, totality and
CutComparability are constructively equivalent. -/
theorem rLE_totality_iff_cutComparability004 :
    RTotality004 ↔ CutComparability := by
  constructor
  · exact cutComparability_of_rLE_total004
  · exact rLE_total_of_cutComparability004

end BOMA.R.StageTwo.TotalOrderRegime004.SameCarrier
