/-
V5 ownership wrapper for N-BLOCK-004 — Recursion / Pointwise Initiality.
-/

import «LAB».payloads.lean.NCore.NCoreRB001

namespace BOMA.NCore.V5.NBLOCK004

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat

universe u

/-- N-BR-008 — nondependent recursor. -/
example {X : Type u} (x0 : X) (step : X → X) : BOMANat → X :=
  fold x0 step

/-- N-BR-009 — base computation equation. -/
example {X : Type u} (x0 : X) (step : X → X) :
    fold x0 step z = x0 :=
  fold_z x0 step

/-- N-BR-009 — successor computation equation. -/
example {X : Type u} (x0 : X) (step : X → X) (n : BOMANat) :
    fold x0 step (s n) = step (fold x0 step n) :=
  fold_s x0 step n

/-- N-BR-010 — pointwise recursion uniqueness. -/
example {X : Type u}
    (x0 : X)
    (step : X → X)
    (h : BOMANat → X)
    (hz : h z = x0)
    (hs : ∀ n, h (s n) = step (h n)) :
    ∀ n, h n = fold x0 step n :=
  fold_unique x0 step h hz hs

/-- N-BR-011 — pointwise initiality. -/
example : PointwiseInitial bomaAlg :=
  boma_pointwise_initial

end BOMA.NCore.V5.NBLOCK004
