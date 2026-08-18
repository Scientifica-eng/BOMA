/- Route R fragment: concatenate after NCore + accepted addition fragments. -/
namespace BOMA.NArithmetic.Multiplication001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001

def mulR (a b : BOMANat) : BOMANat := fold z (fun x => add x a) b

@[simp] theorem mulR_z (a : BOMANat) : mulR a z = z := rfl
@[simp] theorem mulR_s (a b : BOMANat) : mulR a (s b) = add (mulR a b) a := rfl

end BOMA.NArithmetic.Multiplication001
