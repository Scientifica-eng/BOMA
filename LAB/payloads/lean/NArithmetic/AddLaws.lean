/- Canonical addition laws: concatenate after NCore + both routes + convergence. -/
namespace BOMA.NArithmetic.Addition001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat

/-- Canonical spelling selected after route equivalence. -/
def add : BOMANat → BOMANat → BOMANat := addR

@[simp] theorem add_z_right (a : BOMANat) : add a z = a := rfl
@[simp] theorem add_z_left (a : BOMANat) : add z a = a := addR_z_left a
@[simp] theorem add_s_right (a b : BOMANat) : add a (s b) = s (add a b) := rfl
@[simp] theorem add_s_left (a b : BOMANat) : add (s a) b = s (add a b) := addR_s_left a b

theorem add_comm (a b : BOMANat) : add a b = add b a := by
  change addR a b = addR b a
  simpa [addL, addR] using add_routes_converge b a

theorem add_assoc (a b c : BOMANat) : add (add a b) c = add a (add b c) := by
  induction c with
  | z => rfl
  | s c ih =>
      change s (add (add a b) c) = s (add a (add b c))
      exact congrArg s ih

theorem add_right_cancel (a b c : BOMANat) : add a c = add b c → a = b := by
  induction c with
  | z =>
      intro h
      exact h
  | s c ih =>
      intro h
      apply ih
      exact s_injective h

theorem add_left_cancel (c a b : BOMANat) : add c a = add c b → a = b := by
  intro h
  apply add_right_cancel a b c
  calc
    add a c = add c a := add_comm a c
    _ = add c b := h
    _ = add b c := (add_comm b c).symm

end BOMA.NArithmetic.Addition001
