/- Signed integer representation route. Concatenate after NCore only. -/
namespace BOMA.Z.Rep001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat

inductive ZSigned where
  | zero : ZSigned
  | pos : BOMANat → ZSigned
  | neg : BOMANat → ZSigned

open ZSigned

def embedN : BOMANat → ZSigned
  | z => zero
  | s n => pos n

def zneg : ZSigned → ZSigned
  | zero => zero
  | pos n => neg n
  | neg n => pos n

/-- Structural difference without integer subtraction or numeric depth. -/
def diff : BOMANat → BOMANat → ZSigned
  | z, z => zero
  | s a, z => pos a
  | z, s b => neg b
  | s a, s b => diff a b

@[simp] theorem zneg_involutive (x : ZSigned) : zneg (zneg x) = x := by
  cases x <;> rfl

theorem embedN_injective {a b : BOMANat} (h : embedN a = embedN b) : a = b := by
  cases a <;> cases b <;> simp_all [embedN]

end BOMA.Z.Rep001
