/- Route L fragment: concatenate after NCoreRB001.lean. Independent of AddRight. -/
namespace BOMA.NArithmetic.Addition001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat

def addL (a b : BOMANat) : BOMANat := fold b s a

@[simp] theorem addL_z (b : BOMANat) : addL z b = b := rfl
@[simp] theorem addL_s (a b : BOMANat) : addL (s a) b = s (addL a b) := rfl

end BOMA.NArithmetic.Addition001
