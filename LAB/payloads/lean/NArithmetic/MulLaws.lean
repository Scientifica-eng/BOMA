/- Canonical multiplication laws: after routes + convergence. -/
namespace BOMA.NArithmetic.Multiplication001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001

def one : BOMANat := s z
def mul : BOMANat → BOMANat → BOMANat := mulR

@[simp] theorem mul_z_right (a : BOMANat) : mul a z = z := rfl
@[simp] theorem mul_z_left (a : BOMANat) : mul z a = z := mulR_z_left a
@[simp] theorem mul_s_right (a b : BOMANat) : mul a (s b) = add (mul a b) a := rfl
@[simp] theorem mul_s_left (a b : BOMANat) : mul (s a) b = add (mul a b) b := mulR_s_left a b

theorem mul_comm (a b : BOMANat) : mul a b = mul b a := by
  change mulR a b = mulR b a
  simpa [mulL, mulR] using mul_routes_converge b a

@[simp] theorem mul_one_right (a : BOMANat) : mul a one = a := by
  change add z a = a
  exact add_z_left a

@[simp] theorem mul_one_left (a : BOMANat) : mul one a = a := by
  calc
    mul one a = mul a one := mul_comm one a
    _ = a := mul_one_right a

/-- Right distributivity over addition in the recursive multiplier argument. -/
theorem mul_add_right (a b c : BOMANat) :
    mul a (add b c) = add (mul a b) (mul a c) := by
  induction c with
  | z => rfl
  | s c ih =>
      change add (mul a (add b c)) a = add (mul a b) (add (mul a c) a)
      rw [ih]
      exact add_assoc (mul a b) (mul a c) a

/-- Left distributivity follows by multiplication commutativity. -/
theorem mul_add_left (a b c : BOMANat) :
    mul (add a b) c = add (mul a c) (mul b c) := by
  calc
    mul (add a b) c = mul c (add a b) := mul_comm (add a b) c
    _ = add (mul c a) (mul c b) := mul_add_right c a b
    _ = add (mul a c) (mul b c) := by rw [mul_comm c a, mul_comm c b]

theorem mul_assoc (a b c : BOMANat) : mul (mul a b) c = mul a (mul b c) := by
  induction c with
  | z => rfl
  | s c ih =>
      change add (mul (mul a b) c) (mul a b) = mul a (add (mul b c) b)
      rw [mul_add_right]
      rw [ih]

end BOMA.NArithmetic.Multiplication001
