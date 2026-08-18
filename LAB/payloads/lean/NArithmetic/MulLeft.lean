/- Route L fragment: independent of MulRight. -/
namespace BOMA.NArithmetic.Multiplication001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001

def mulL (a b : BOMANat) : BOMANat := fold z (fun x => add x b) a

@[simp] theorem mulL_z (b : BOMANat) : mulL z b = z := rfl
@[simp] theorem mulL_s (a b : BOMANat) : mulL (s a) b = add (mulL a b) b := rfl

end BOMA.NArithmetic.Multiplication001
