/- Direct arithmetic route on the selected signed normal-form carrier. -/
namespace BOMA.Z.Arithmetic001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001
open BOMA.NArithmetic.Multiplication001
open BOMA.Z.Rep001
open BOMA.Z.Rep001.ZSigned

/-- Structural difference of equal naturals is canonical integer zero. -/
theorem diff_self (n : BOMANat) : diff n n = zero := by
  induction n with
  | z => rfl
  | s n ih => exact ih

/-- Difference against zero is exactly the natural embedding. -/
theorem diff_nat_zero (n : BOMANat) : diff n z = embedN n := by
  cases n <;> rfl

/-- Zero minus a natural is the negation of the natural embedding. -/
theorem diff_zero_nat (n : BOMANat) : diff z n = zneg (embedN n) := by
  cases n <;> rfl

/-- Direct sign-case addition. Cross-sign cases use only the already-defined
structural natural difference, not any external integer subtraction. -/
def zaddD : ZSigned → ZSigned → ZSigned
  | zero, y => y
  | x, zero => x
  | pos a, pos b => pos (add a (s b))
  | neg a, neg b => neg (add a (s b))
  | pos a, neg b => diff (s a) (s b)
  | neg a, pos b => diff (s b) (s a)

/-- Direct sign-case multiplication. Magnitudes use accepted N multiplication. -/
def zmulD : ZSigned → ZSigned → ZSigned
  | zero, _ => zero
  | _, zero => zero
  | pos a, pos b => embedN (mul (s a) (s b))
  | pos a, neg b => zneg (embedN (mul (s a) (s b)))
  | neg a, pos b => zneg (embedN (mul (s a) (s b)))
  | neg a, neg b => embedN (mul (s a) (s b))

@[simp] theorem zaddD_zero_left (x : ZSigned) : zaddD zero x = x := rfl
@[simp] theorem zaddD_zero_right (x : ZSigned) : zaddD x zero = x := by
  cases x <;> rfl

@[simp] theorem zmulD_zero_left (x : ZSigned) : zmulD zero x = zero := rfl
@[simp] theorem zmulD_zero_right (x : ZSigned) : zmulD x zero = zero := by
  cases x <;> rfl

end BOMA.Z.Arithmetic001
