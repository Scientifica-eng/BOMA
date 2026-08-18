/- Route R fragment: concatenate after NCoreRB001.lean. -/
namespace BOMA.NArithmetic.Addition001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat

def addR (a b : BOMANat) : BOMANat := fold a s b

@[simp] theorem addR_z (a : BOMANat) : addR a z = a := rfl
@[simp] theorem addR_s (a b : BOMANat) : addR a (s b) = s (addR a b) := rfl

end BOMA.NArithmetic.Addition001
