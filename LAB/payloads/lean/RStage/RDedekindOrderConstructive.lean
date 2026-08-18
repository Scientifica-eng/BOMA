/- Constructive core of the selected Dedekind quotient order. -/
namespace BOMA.R.DedekindOrderConstructive001

open BOMA.Q.Quotient001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001

/-- Opposite cut inclusions give extensional cut identity constructively. -/
theorem cutLE_antisymm_equiv {A B : LowerCut}
    (hAB : CutLE A B) (hBA : CutLE B A) : CutEquiv A B := by
  intro q
  constructor
  · intro hq
    exact hAB q hq
  · intro hq
    exact hBA q hq

/-- Reflexivity of quotient cut order. -/
theorem rLE_refl (x : RBOMA) : rLE x x := by
  refine Quotient.inductionOn x ?_
  intro A
  exact (rLE_mk_iff A A).2 (cutLE_refl A)

/-- Transitivity of quotient cut order. -/
theorem rLE_trans {x y z : RBOMA}
    (hxy : rLE x y) (hyz : rLE y z) : rLE x z := by
  refine Quotient.inductionOn x ?_ hxy hyz
  intro A hAy hYz
  refine Quotient.inductionOn y ?_ hAy hYz
  intro B hAB hBz
  refine Quotient.inductionOn z ?_ hAB hBz
  intro C hAB' hBC'
  apply (rLE_mk_iff A C).2
  exact cutLE_trans ((rLE_mk_iff A B).1 hAB') ((rLE_mk_iff B C).1 hBC')

/-- Antisymmetry of quotient cut order. -/
theorem rLE_antisymm {x y : RBOMA}
    (hxy : rLE x y) (hyx : rLE y x) : x = y := by
  refine Quotient.inductionOn x ?_ hxy hyx
  intro A hAy hYA
  refine Quotient.inductionOn y ?_ hAy hYA
  intro B hAB hBA
  exact rmk_sound (cutLE_antisymm_equiv
    ((rLE_mk_iff A B).1 hAB) ((rLE_mk_iff B A).1 hBA))

/-- Exact isolated interface needed for disjunctive totality. -/
def CutComparability : Prop :=
  ∀ A B : LowerCut, CutLE A B ∨ CutLE B A

/-- Totality follows from the isolated comparability interface, without using
Classical inside this theorem. -/
theorem rLE_total_of_cutComparability
    (hComp : CutComparability) (x y : RBOMA) : rLE x y ∨ rLE y x := by
  refine Quotient.inductionOn x ?_
  intro A
  refine Quotient.inductionOn y ?_
  intro B
  rcases hComp A B with hAB | hBA
  · exact Or.inl ((rLE_mk_iff A B).2 hAB)
  · exact Or.inr ((rLE_mk_iff B A).2 hBA)

end BOMA.R.DedekindOrderConstructive001
