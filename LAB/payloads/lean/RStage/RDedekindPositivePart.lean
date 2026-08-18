/- Nonnegative envelope for Dedekind reals, built without sign case-splitting. -/
namespace BOMA.R.DedekindPositivePart001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindNegationCandidate001

/-- Positive/nonnegative envelope of a cut: union with the principal zero cut.
This is the cut-level max(A,0), defined without deciding the sign of A. -/
def cutPosPart (A : LowerCut) : LowerCut where
  lower := fun q => A.lower q ∨ qLT q qZero
  nonempty := by
    rcases A.nonempty with ⟨a, ha⟩
    exact ⟨a, Or.inl ha⟩
  proper := by
    rcases A.proper with ⟨u, hu⟩
    rcases qle_total qZero u with h0u | hu0
    · refine ⟨u, ?_⟩
      intro h
      rcases h with huA | huNeg
      · exact hu huA
      · have heq : qZero = u := qle_antisymm h0u huNeg.1
        exact huNeg.2 heq.symm
    · refine ⟨qZero, ?_⟩
      intro h
      rcases h with h0A | h00
      · exact hu (A.downward h0A hu0)
      · exact qlt_irrefl qZero h00
  downward := by
    intro p q hq hpq
    rcases hq with hqA | hq0
    · exact Or.inl (A.downward hqA hpq)
    · exact Or.inr (BOMA.R.DedekindAddition001.qle_lt_trans hpq hq0)
  rounded := by
    intro q hq
    rcases hq with hqA | hq0
    · rcases A.rounded hqA with ⟨r, hrA, hqr⟩
      exact ⟨r, Or.inl hrA, hqr⟩
    · rcases rational_order_dense hq0 with ⟨r, hqr, hr0⟩
      exact ⟨r, Or.inr hr0, hqr⟩

/-- The positive-part construction respects extensional cut identity. -/
theorem cutPosPart_respects {A B : LowerCut} (hAB : CutEquiv A B) :
    CutEquiv (cutPosPart A) (cutPosPart B) := by
  intro q
  constructor
  · intro h
    rcases h with hA | h0
    · exact Or.inl ((hAB q).mp hA)
    · exact Or.inr h0
  · intro h
    rcases h with hB | h0
    · exact Or.inl ((hAB q).mpr hB)
    · exact Or.inr h0

/-- Formal nonnegative envelope lifted to RBOMA. -/
def rPosPart : RBOMA → RBOMA :=
  Quotient.lift
    (fun A => rmk (cutPosPart A))
    (fun _ _ h => rmk_sound (cutPosPart_respects h))

@[simp] theorem rPosPart_mk (A : LowerCut) :
    rPosPart (rmk A) = rmk (cutPosPart A) := rfl

/-- The zero cut is included in every positive-part envelope. -/
theorem cutZero_le_posPart (A : LowerCut) :
    CutLE (principalCut qZero) (cutPosPart A) := by
  intro q hq
  exact Or.inr hq

/-- Every cut is included in its positive-part envelope. -/
theorem cut_le_posPart (A : LowerCut) : CutLE A (cutPosPart A) := by
  intro q hq
  exact Or.inl hq

/-- If a cut is already nonnegative, taking the positive part changes nothing
up to extensional identity. -/
theorem cutPosPart_of_nonneg {A : LowerCut}
    (h0A : CutLE (principalCut qZero) A) :
    CutEquiv (cutPosPart A) A := by
  intro q
  constructor
  · intro h
    rcases h with hA | h0
    · exact hA
    · exact h0A q h0
  · intro hA
    exact Or.inl hA

/-- Formal positive part lies above zero. -/
theorem rZero_le_rPosPart (x : RBOMA) : rLE rZero (rPosPart x) := by
  refine Quotient.inductionOn x ?_
  intro A
  change rLE (rmk (principalCut qZero)) (rmk (cutPosPart A))
  exact (rLE_mk_iff (principalCut qZero) (cutPosPart A)).2
    (cutZero_le_posPart A)

/-- Formal positive part lies above the original real. -/
theorem rLE_rPosPart (x : RBOMA) : rLE x (rPosPart x) := by
  refine Quotient.inductionOn x ?_
  intro A
  change rLE (rmk A) (rmk (cutPosPart A))
  exact (rLE_mk_iff A (cutPosPart A)).2 (cut_le_posPart A)

/-- Negative magnitude candidate, still defined without a sign case split. -/
def rNegPart (x : RBOMA) : RBOMA := rPosPart (rNeg x)

end BOMA.R.DedekindPositivePart001
