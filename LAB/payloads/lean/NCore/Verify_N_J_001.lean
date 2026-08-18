/-
V5 convergence fragment for N-J-001.

The workflow concatenates:

NCoreRB001.lean + Verify_N_J_001_RouteB.lean + this fragment

and checks that the two preserved production witnesses export the same formal
No-Confusion contribution interface.
-/

namespace BOMA.NCore.V5.NJ001

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat

/-- Route A witness for the disjointness interface. -/
example (n : BOMANat) : s n ≠ z :=
  s_ne_z n

/-- Route B witness for the same disjointness interface. -/
example (n : BOMANat) : s n ≠ z :=
  BOMA.NCore.V5.NJ001RouteB.constructional_s_ne_z n

/-- Route A witness for the injectivity interface. -/
example {a b : BOMANat} (h : s a = s b) : a = b :=
  s_injective h

/-- Route B witness for the same injectivity interface. -/
example {a b : BOMANat} (h : s a = s b) : a = b :=
  BOMA.NCore.V5.NJ001RouteB.constructional_s_injective h

end BOMA.NCore.V5.NJ001
