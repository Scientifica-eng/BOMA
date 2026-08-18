/-
V5 ownership wrapper for N-BLOCK-001 — Formal Unary Kernel.
This file verifies the declared carrier/constructor/identity/eliminator interfaces
without promoting the whole N-Core candidate.
-/

import «LAB».payloads.lean.NCore.NCoreRB001

namespace BOMA.NCore.V5.NBLOCK001

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat

universe u

#check BOMANat
#check z
#check s

/-- N-BR-002: the selected formal identity interface is available on N_BOMA. -/
example (n : BOMANat) : n = n := rfl

/-- N-BR-003: dependent eliminator interface. -/
example {P : BOMANat → Type u}
    (hz : P z)
    (hs : ∀ n, P n → P (s n)) :
    ∀ n, P n :=
  BOMA.NCore.RB001.ind hz hs

end BOMA.NCore.V5.NBLOCK001
