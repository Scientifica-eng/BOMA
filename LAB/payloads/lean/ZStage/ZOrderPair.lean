/- Pair cross-sum order route. -/
namespace BOMA.Z.Order001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001
open BOMA.NArithmetic.Order001
open BOMA.Z.Rep001

/-- Order of represented differences: p-n ≤ q-m iff p+m ≤ q+n. -/
def pairLE (x y : ZPair) : Prop :=
  LE (add x.p y.n) (add y.p x.n)

/-- Pull the pair order back to the selected signed carrier. -/
def zLEp (x y : ZSigned) : Prop :=
  pairLE (pairOfSigned x) (pairOfSigned y)

end BOMA.Z.Order001
