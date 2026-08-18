/- Pair-mediated arithmetic route on the selected signed normal-form carrier. -/
namespace BOMA.Z.Arithmetic001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001
open BOMA.NArithmetic.Multiplication001
open BOMA.Z.Rep001
open BOMA.Z.Rep001.ZSigned

/-- Add canonical signed integers by translating to retained difference pairs,
performing raw pair addition, then normalizing back. -/
def zaddP (x y : ZSigned) : ZSigned :=
  normalizePair (pairAdd (pairOfSigned x) (pairOfSigned y))

/-- Multiply canonical signed integers by the retained pair product and normalize. -/
def zmulP (x y : ZSigned) : ZSigned :=
  normalizePair (pairMul (pairOfSigned x) (pairOfSigned y))

end BOMA.Z.Arithmetic001
