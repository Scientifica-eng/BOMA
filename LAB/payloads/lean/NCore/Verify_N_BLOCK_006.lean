/-
V5 ownership wrapper for N-BLOCK-006 — Pointwise Standardness Package.
-/

import «LAB».payloads.lean.NCore.NCoreRB001

namespace BOMA.NCore.V5.NBLOCK006

open BOMA.NCore.RB001

/-- N-BR-019 / N-BR-020 — comparison maps and pointwise inverse laws
for admissible pointwise-initial unary algebras. -/
example (A B : UnaryAlgebra)
    (hA : PointwiseInitial A)
    (hB : PointwiseInitial B) :
    ∃ f : Hom A B, ∃ g : Hom B A,
      (∀ x, g.toFun (f.toFun x) = x) ∧
      (∀ y, f.toFun (g.toFun y) = y) :=
  pointwise_initial_unique A B hA hB

end BOMA.NCore.V5.NBLOCK006
