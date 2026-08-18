/- Additive-witness order route. Requires accepted addition; independent of LEInd. -/
namespace BOMA.NArithmetic.Order001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001

def LEAdd (a b : BOMANat) : Prop := ∃ k, add a k = b

theorem leAdd_refl (a : BOMANat) : LEAdd a a := ⟨z, rfl⟩

theorem leAdd_trans {a b c : BOMANat} (hab : LEAdd a b) (hbc : LEAdd b c) : LEAdd a c := by
  rcases hab with ⟨k, hk⟩
  rcases hbc with ⟨l, hl⟩
  refine ⟨add k l, ?_⟩
  calc
    add a (add k l) = add (add a k) l := (add_assoc a k l).symm
    _ = add b l := congrArg (fun x => add x l) hk
    _ = c := hl

theorem leAdd_z (b : BOMANat) : LEAdd z b := ⟨b, add_z_left b⟩

theorem leAdd_s {a b : BOMANat} (h : LEAdd a b) : LEAdd (s a) (s b) := by
  rcases h with ⟨k, hk⟩
  refine ⟨k, ?_⟩
  calc
    add (s a) k = s (add a k) := add_s_left a k
    _ = s b := congrArg s hk

end BOMA.NArithmetic.Order001
