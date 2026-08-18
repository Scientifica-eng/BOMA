/-
V5 verification fragment for N-BLOCK-001 — Formal Unary Kernel.

The evidence-producing workflow concatenates this fragment after
NCoreRB001.lean. It is intentionally not a standalone Lean module; this avoids
inventing a repository-wide module root merely for verification plumbing.
-/

namespace BOMA.NCore.V5.NBLOCK001

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat

universe u

#check BOMANat
#check z
#check s

/-- N-BR-002: the selected formal identity interface is available on N_BOMA. -/
example (n : BOMANat) : n = n := rfl

/-- N-BR-003: dependent eliminator interface, including Type-valued motives. -/
example {P : BOMANat → Type u}
    (hz : P z)
    (hs : ∀ n, P n → P (s n)) :
    ∀ n, P n :=
  BOMA.NCore.RB001.ind hz hs

end BOMA.NCore.V5.NBLOCK001
