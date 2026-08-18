/- Convergence fragment: after NCore + all addition + MulRight + MulLeft. -/
namespace BOMA.NArithmetic.Multiplication001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001

/-- Zero on the opposite side of Route R. -/
theorem mulR_z_left (b : BOMANat) : mulR z b = z := by
  induction b with
  | z => rfl
  | s b ih =>
      change add (mulR z b) z = z
      rw [ih]
      exact add_z_right z

/-- Successor on the opposite side of Route R. -/
theorem mulR_s_left (a b : BOMANat) : mulR (s a) b = add (mulR a b) b := by
  induction b with
  | z => rfl
  | s b ih =>
      calc
        mulR (s a) (s b) = add (mulR (s a) b) (s a) := rfl
        _ = add (add (mulR a b) b) (s a) := congrArg (fun x => add x (s a)) ih
        _ = s (add (add (mulR a b) b) a) := add_s_right (add (mulR a b) b) a
        _ = s (add (mulR a b) (add b a)) := congrArg s (add_assoc (mulR a b) b a)
        _ = s (add (mulR a b) (add a b)) := congrArg s (congrArg (fun x => add (mulR a b) x) (add_comm b a))
        _ = s (add (add (mulR a b) a) b) := congrArg s (add_assoc (mulR a b) a b).symm
        _ = add (add (mulR a b) a) (s b) := (add_s_right (add (mulR a b) a) b).symm
        _ = add (mulR a (s b)) (s b) := by rfl

/-- N-MUL-J-001 convergence theorem. -/
theorem mul_routes_converge (a b : BOMANat) : mulL a b = mulR a b := by
  induction a with
  | z =>
      change z = mulR z b
      exact (mulR_z_left b).symm
  | s a ih =>
      change add (mulL a b) b = mulR (s a) b
      rw [mulR_s_left]
      exact congrArg (fun x => add x b) ih

end BOMA.NArithmetic.Multiplication001
