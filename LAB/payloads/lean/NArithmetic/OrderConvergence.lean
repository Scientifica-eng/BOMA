/- Convergence: after NCore + addition + OrderAdditive + OrderInductive. -/
namespace BOMA.NArithmetic.Order001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001

theorem leInd_to_leAdd {a b : BOMANat} (h : LEInd a b) : LEAdd a b := by
  induction h with
  | z b => exact ⟨b, add_z_left b⟩
  | s h ih =>
      rcases ih with ⟨k, hk⟩
      refine ⟨k, ?_⟩
      simpa using congrArg s hk

theorem leInd_add_right (a k : BOMANat) : LEInd a (add a k) := by
  induction k with
  | z => simpa using leInd_refl a
  | s k ih =>
      change LEInd a (s (add a k))
      exact leInd_succ_right ih

theorem leAdd_to_leInd {a b : BOMANat} (h : LEAdd a b) : LEInd a b := by
  rcases h with ⟨k, hk⟩
  have hi : LEInd a (add a k) := leInd_add_right a k
  rw [hk] at hi
  exact hi

theorem order_routes_converge (a b : BOMANat) : LEAdd a b ↔ LEInd a b :=
  ⟨leAdd_to_leInd, leInd_to_leAdd⟩

end BOMA.NArithmetic.Order001
