/- Convergence fragment: concatenate after NCore + AddRight + AddLeft. -/
namespace BOMA.NArithmetic.Addition001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat

/-- Opposite-side zero equation for Route R, derived rather than definitional. -/
theorem addR_z_left (b : BOMANat) : addR z b = b := by
  induction b with
  | z => rfl
  | s b ih =>
      change s (addR z b) = s b
      exact congrArg s ih

/-- Opposite-side successor equation for Route R. -/
theorem addR_s_left (a b : BOMANat) : addR (s a) b = s (addR a b) := by
  induction b with
  | z => rfl
  | s b ih =>
      change s (addR (s a) b) = s (s (addR a b))
      exact congrArg s ih

/-- N-ADD-J-001 mathematical convergence theorem. -/
theorem add_routes_converge (a b : BOMANat) : addL a b = addR a b := by
  induction a with
  | z =>
      change b = addR z b
      exact (addR_z_left b).symm
  | s a ih =>
      change s (addL a b) = addR (s a) b
      rw [addR_s_left]
      exact congrArg s ih

end BOMA.NArithmetic.Addition001
