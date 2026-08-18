/- Logical sensitivity probe for total order on selected Dedekind quotient reals. -/
namespace BOMA.R.DedekindOrderLogic001

open BOMA.Q.Quotient001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001

/-- Opposite cut inclusions give extensional cut identity constructively. -/
theorem cutLE_antisymm_equiv {A B : LowerCut}
    (hAB : CutLE A B) (hBA : CutLE B A) : CutEquiv A B := by
  intro q
  constructor
  · exact hAB q
  · exact hBA q

/-- Reflexivity of quotient cut order requires no classical principle. -/
theorem rLE_refl_constructive (x : RBOMA) : rLE x x := by
  refine Quotient.inductionOn x ?_
  intro A
  exact (rLE_mk_iff A A).2 (cutLE_refl A)

/-- Transitivity of quotient cut order requires no classical principle. -/
theorem rLE_trans_constructive {x y z : RBOMA}
    (hxy : rLE x y) (hyz : rLE y z) : rLE x z := by
  refine Quotient.inductionOn x ?_ hxy hyz
  intro A hAy hYz
  refine Quotient.inductionOn y ?_ hAy hYz
  intro B hAB hBz
  refine Quotient.inductionOn z ?_ hAB hBz
  intro C hAB' hBC'
  apply (rLE_mk_iff A C).2
  exact cutLE_trans ((rLE_mk_iff A B).1 hAB') ((rLE_mk_iff B C).1 hBC')

/-- Antisymmetry of quotient cut order requires no classical principle. -/
theorem rLE_antisymm_constructive {x y : RBOMA}
    (hxy : rLE x y) (hyx : rLE y x) : x = y := by
  refine Quotient.inductionOn x ?_ hxy hyx
  intro A hAy hYA
  refine Quotient.inductionOn y ?_ hAy hYA
  intro B hAB hBA
  exact rmk_sound (cutLE_antisymm_equiv
    ((rLE_mk_iff A B).1 hAB) ((rLE_mk_iff B A).1 hBA))

/-- Architectural interface isolating the exact missing disjunctive property. -/
def CutComparability : Prop :=
  ∀ A B : LowerCut, CutLE A B ∨ CutLE B A

/-- Quotient totality follows from the isolated cut-comparability interface. -/
theorem rLE_total_of_cutComparability
    (hComp : CutComparability) (x y : RBOMA) : rLE x y ∨ rLE y x := by
  refine Quotient.inductionOn x ?_
  intro A
  refine Quotient.inductionOn y ?_
  intro B
  rcases hComp A B with hAB | hBA
  · exact Or.inl ((rLE_mk_iff A B).2 hAB)
  · exact Or.inr ((rLE_mk_iff B A).2 hBA)

/-- Classical reasoning supplies CutComparability for lower sets of the accepted
linearly ordered rational carrier. The classical commitment is deliberately
localized to this theorem. -/
theorem cutComparability_classical : CutComparability := by
  classical
  intro A B
  by_cases hAB : CutLE A B
  · exact Or.inl hAB
  · apply Or.inr
    intro q hqB
    by_contra hqA
    apply hAB
    intro r hrA
    rcases BOMA.Q.Order001.qle_total r q with hrq | hqr
    · exact B.downward hqB hrq
    · exact False.elim (hqA (A.downward hrA hqr))

/-- Stage-One totality candidate under the explicitly isolated classical witness. -/
theorem rLE_total_classical (x y : RBOMA) : rLE x y ∨ rLE y x :=
  rLE_total_of_cutComparability cutComparability_classical x y

end BOMA.R.DedekindOrderLogic001
