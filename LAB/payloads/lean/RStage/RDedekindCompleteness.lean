/- Formal-carrier Dedekind completeness for the selected RBOMA quotient. -/
namespace BOMA.R.DedekindCompleteness001

open BOMA.Q.Quotient001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001

/-- U is an upper bound of a formal real family F. -/
def RUpperBound (F : RBOMA → Prop) (U : RBOMA) : Prop :=
  ∀ x : RBOMA, F x → rLE x U

/-- Raw lower cut formed from all rational members occurring in representatives
of a nonempty formal-real family. An explicit representative of one upper bound
is used only to prove properness; no representative selector for family elements
is introduced. -/
def supCutFromFamily
    (F : RBOMA → Prop)
    (hne : ∃ x : RBOMA, F x)
    (U : LowerCut)
    (hUB : RUpperBound F (rmk U)) : LowerCut where
  lower := fun q =>
    ∃ x : RBOMA, F x ∧ ∃ A : LowerCut, x = rmk A ∧ A.lower q
  nonempty := by
    rcases hne with ⟨x, hxF⟩
    refine Quotient.inductionOn x ?_ hxF
    intro A hAF
    rcases A.nonempty with ⟨q, hqA⟩
    exact ⟨q, rmk A, hAF, A, rfl, hqA⟩
  proper := by
    rcases U.proper with ⟨q, hqU⟩
    refine ⟨q, ?_⟩
    intro hqSup
    rcases hqSup with ⟨x, hxF, A, hxA, hqA⟩
    have hxU : rLE x (rmk U) := hUB x hxF
    rw [hxA] at hxU
    have hAU : CutLE A U := (rLE_mk_iff A U).1 hxU
    exact hqU (hAU q hqA)
  downward := by
    intro a b hb hab
    rcases hb with ⟨x, hxF, A, hxA, hbA⟩
    exact ⟨x, hxF, A, hxA, A.downward hbA hab⟩
  rounded := by
    intro a ha
    rcases ha with ⟨x, hxF, A, hxA, haA⟩
    rcases A.rounded haA with ⟨b, hbA, hab⟩
    exact ⟨b, ⟨x, hxF, A, hxA, hbA⟩, hab⟩

/-- Every member of F lies below the formal class of the union cut. -/
theorem member_le_supFamily
    (F : RBOMA → Prop)
    (hne : ∃ x : RBOMA, F x)
    (U : LowerCut)
    (hUB : RUpperBound F (rmk U))
    (x : RBOMA) (hxF : F x) :
    rLE x (rmk (supCutFromFamily F hne U hUB)) := by
  refine Quotient.inductionOn x ?_ hxF
  intro A hAF
  apply (rLE_mk_iff A (supCutFromFamily F hne U hUB)).2
  intro q hqA
  exact ⟨rmk A, hAF, A, rfl, hqA⟩

/-- The formal union cut lies below every common upper bound. -/
theorem supFamily_le_of_upper
    (F : RBOMA → Prop)
    (hne : ∃ x : RBOMA, F x)
    (U : LowerCut)
    (hUB : RUpperBound F (rmk U))
    (B : RBOMA) (hB : RUpperBound F B) :
    rLE (rmk (supCutFromFamily F hne U hUB)) B := by
  refine Quotient.inductionOn B ?_ hB
  intro C hC
  apply (rLE_mk_iff (supCutFromFamily F hne U hUB) C).2
  intro q hqSup
  rcases hqSup with ⟨x, hxF, A, hxA, hqA⟩
  have hxC : rLE x (rmk C) := hC x hxF
  rw [hxA] at hxC
  have hAC : CutLE A C := (rLE_mk_iff A C).1 hxC
  exact hAC q hqA

/-- Formal-carrier Dedekind least-upper-bound theorem.
Every nonempty family having an explicit upper bound has a least upper bound in
RBOMA. The theorem is proved without choosing representatives for the family. -/
theorem rDedekind_lub_exists
    (F : RBOMA → Prop)
    (hne : ∃ x : RBOMA, F x)
    (U : RBOMA)
    (hUB : RUpperBound F U) :
    ∃ s : RBOMA,
      (∀ x : RBOMA, F x → rLE x s) ∧
      (∀ B : RBOMA, RUpperBound F B → rLE s B) := by
  refine Quotient.inductionOn U ?_ hUB
  intro Ucut hU
  let S : RBOMA := rmk (supCutFromFamily F hne Ucut hU)
  refine ⟨S, ?_, ?_⟩
  · intro x hxF
    exact member_le_supFamily F hne Ucut hU x hxF
  · intro B hB
    exact supFamily_le_of_upper F hne Ucut hU B hB

end BOMA.R.DedekindCompleteness001
