/- Structural order route. Concatenate after NCore only; no arithmetic dependency. -/
namespace BOMA.NArithmetic.Order001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat

inductive LEInd : BOMANat → BOMANat → Prop where
  | z (b : BOMANat) : LEInd z b
  | s {a b : BOMANat} : LEInd a b → LEInd (s a) (s b)

theorem leInd_refl : ∀ a : BOMANat, LEInd a a
  | z => LEInd.z z
  | s a => LEInd.s (leInd_refl a)

theorem leInd_succ_right {a b : BOMANat} : LEInd a b → LEInd a (s b)
  | LEInd.z _ => LEInd.z _
  | LEInd.s h => LEInd.s (leInd_succ_right h)

theorem leInd_trans {a b c : BOMANat} (hab : LEInd a b) (hbc : LEInd b c) : LEInd a c := by
  induction hab generalizing c with
  | z b => exact LEInd.z c
  | s hab ih =>
      cases hbc with
      | s hbc' => exact LEInd.s (ih hbc')

theorem leInd_antisymm {a b : BOMANat} (hab : LEInd a b) (hba : LEInd b a) : a = b := by
  induction a generalizing b with
  | z =>
      cases b with
      | z => rfl
      | s b => cases hba
  | s a ih =>
      cases b with
      | z => cases hab
      | s b =>
          cases hab with
          | s hab' =>
              cases hba with
              | s hba' => exact congrArg s (ih hab' hba')

theorem leInd_total (a b : BOMANat) : LEInd a b ∨ LEInd b a := by
  induction a generalizing b with
  | z => exact Or.inl (LEInd.z b)
  | s a ih =>
      cases b with
      | z => exact Or.inr (LEInd.z (s a))
      | s b =>
          cases ih b with
          | inl h => exact Or.inl (LEInd.s h)
          | inr h => exact Or.inr (LEInd.s h)

theorem leInd_s_iff {a b : BOMANat} : LEInd (s a) (s b) ↔ LEInd a b := by
  constructor
  · intro h
    cases h with
    | s h' => exact h'
  · exact LEInd.s

end BOMA.NArithmetic.Order001
