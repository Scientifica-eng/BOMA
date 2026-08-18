/-
V5 ownership wrapper for N-BLOCK-002 — Internal No-Confusion Package.
Route A of N-J-001.
-/

import «LAB».payloads.lean.NCore.NCoreRB001

namespace BOMA.NCore.V5.NBLOCK002

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat

/-- N-BR-004 — constructor/base disjointness. -/
example (n : BOMANat) : s n ≠ z :=
  s_ne_z n

/-- N-BR-005 — successor-constructor injectivity. -/
example {a b : BOMANat} (h : s a = s b) : a = b :=
  s_injective h

end BOMA.NCore.V5.NBLOCK002
