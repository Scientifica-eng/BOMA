/- Dedekind-route completeness probe: supremum by union of lower cuts. -/
namespace BOMA.R.DedekindProbe001

open BOMA.Q.Quotient001

/-- Inclusion order between lower-cut representations. -/
def CutLE (A B : LowerCut) : Prop :=
  ∀ q : QBOMA, A.lower q → B.lower q

@[simp] theorem cutLE_refl (A : LowerCut) : CutLE A A := by
  intro q hq
  exact hq

theorem cutLE_trans {A B C : LowerCut}
    (hAB : CutLE A B) (hBC : CutLE B C) : CutLE A C := by
  intro q hq
  exact hBC q (hAB q hq)

/-- A family of lower cuts is bounded above by U when every member is included in U. -/
def FamilyBoundedAbove (F : LowerCut → Prop) (U : LowerCut) : Prop :=
  ∀ A : LowerCut, F A → CutLE A U

/-- Union cut of a nonempty family with an explicit upper bound. -/
def supCut
    (F : LowerCut → Prop)
    (hne : ∃ A : LowerCut, F A)
    (U : LowerCut)
    (hUB : FamilyBoundedAbove F U) : LowerCut where
  lower := fun q => ∃ A : LowerCut, F A ∧ A.lower q
  nonempty := by
    rcases hne with ⟨A, hFA⟩
    rcases A.nonempty with ⟨q, hq⟩
    exact ⟨q, A, hFA, hq⟩
  proper := by
    rcases U.proper with ⟨q, hqU⟩
    refine ⟨q, ?_⟩
    intro hqSup
    rcases hqSup with ⟨A, hFA, hqA⟩
    exact hqU (hUB A hFA q hqA)
  downward := by
    intro a b hb hab
    rcases hb with ⟨A, hFA, hbA⟩
    exact ⟨A, hFA, A.downward hbA hab⟩
  rounded := by
    intro a ha
    rcases ha with ⟨A, hFA, haA⟩
    rcases A.rounded haA with ⟨b, hbA, hab⟩
    exact ⟨b, ⟨A, hFA, hbA⟩, hab⟩

/-- Every family member lies below the union cut. -/
theorem member_le_supCut
    (F : LowerCut → Prop)
    (hne : ∃ A : LowerCut, F A)
    (U : LowerCut)
    (hUB : FamilyBoundedAbove F U)
    {A : LowerCut} (hFA : F A) :
    CutLE A (supCut F hne U hUB) := by
  intro q hq
  exact ⟨A, hFA, hq⟩

/-- The union cut is below every common upper bound, hence is least. -/
theorem supCut_le_of_upper
    (F : LowerCut → Prop)
    (hne : ∃ A : LowerCut, F A)
    (U : LowerCut)
    (hUB : FamilyBoundedAbove F U)
    (B : LowerCut)
    (hB : FamilyBoundedAbove F B) :
    CutLE (supCut F hne U hUB) B := by
  intro q hq
  rcases hq with ⟨A, hFA, hqA⟩
  exact hB A hFA q hqA

/-- Representation-level least-upper-bound certificate. -/
theorem supCut_is_lub
    (F : LowerCut → Prop)
    (hne : ∃ A : LowerCut, F A)
    (U : LowerCut)
    (hUB : FamilyBoundedAbove F U) :
    (∀ A : LowerCut, F A → CutLE A (supCut F hne U hUB)) ∧
    (∀ B : LowerCut, FamilyBoundedAbove F B → CutLE (supCut F hne U hUB) B) := by
  constructor
  · intro A hFA
    exact member_le_supCut F hne U hUB hFA
  · intro B hB
    exact supCut_le_of_upper F hne U hUB B hB

end BOMA.R.DedekindProbe001
