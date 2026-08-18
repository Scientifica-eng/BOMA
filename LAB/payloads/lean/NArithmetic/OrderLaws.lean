/- Canonical order laws after route convergence. Requires accepted arithmetic packages. -/
namespace BOMA.NArithmetic.Order001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001
open BOMA.NArithmetic.Multiplication001

def LE : BOMANat → BOMANat → Prop := LEAdd

theorem le_refl (a : BOMANat) : LE a a := leAdd_refl a

theorem le_trans {a b c : BOMANat} : LE a b → LE b c → LE a c := leAdd_trans

theorem le_antisymm {a b : BOMANat} (hab : LE a b) (hba : LE b a) : a = b :=
  leInd_antisymm (leAdd_to_leInd hab) (leAdd_to_leInd hba)

theorem le_total (a b : BOMANat) : LE a b ∨ LE b a := by
  cases leInd_total a b with
  | inl h => exact Or.inl (leInd_to_leAdd h)
  | inr h => exact Or.inr (leInd_to_leAdd h)

@[simp] theorem z_le (b : BOMANat) : LE z b := leAdd_z b

theorem not_s_le_z (a : BOMANat) : ¬ LE (s a) z := by
  intro h
  have hi := leAdd_to_leInd h
  cases hi

theorem le_s_iff {a b : BOMANat} : LE (s a) (s b) ↔ LE a b := by
  constructor
  · intro h
    have hi := leAdd_to_leInd h
    have hp : LEInd a b := (leInd_s_iff).mp hi
    exact leInd_to_leAdd hp
  · intro h
    exact leAdd_s h

theorem add_mono_right {a b : BOMANat} (h : LE a b) (c : BOMANat) : LE (add a c) (add b c) := by
  rcases h with ⟨k, hk⟩
  refine ⟨k, ?_⟩
  calc
    add (add a c) k = add a (add c k) := add_assoc a c k
    _ = add a (add k c) := congrArg (fun x => add a x) (add_comm c k)
    _ = add (add a k) c := (add_assoc a k c).symm
    _ = add b c := congrArg (fun x => add x c) hk

theorem add_mono_left {a b : BOMANat} (h : LE a b) (c : BOMANat) : LE (add c a) (add c b) := by
  have hr := add_mono_right h c
  simpa [add_comm c a, add_comm c b] using hr

theorem mul_mono_right {a b : BOMANat} (h : LE a b) (c : BOMANat) : LE (mul a c) (mul b c) := by
  rcases h with ⟨k, hk⟩
  refine ⟨mul k c, ?_⟩
  calc
    add (mul a c) (mul k c) = mul (add a k) c := (mul_add_left a k c).symm
    _ = mul b c := congrArg (fun x => mul x c) hk

theorem mul_mono_left {a b : BOMANat} (h : LE a b) (c : BOMANat) : LE (mul c a) (mul c b) := by
  have hr := mul_mono_right h c
  simpa [mul_comm c a, mul_comm c b] using hr

end BOMA.NArithmetic.Order001
