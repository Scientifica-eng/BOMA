/-
V5 verification fragment for N-BLOCK-003 — Induction / Generatedness.

Generated is a backend verification predicate only; it is not a new canonical
object-layer definition of number or numerical depth. The workflow concatenates
this fragment after NCoreRB001.lean.
-/

namespace BOMA.NCore.V5.NBLOCK003

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat

/-- N-BR-006 — proposition-valued induction adequacy. -/
example (P : BOMANat → Prop)
    (hz : P z)
    (hs : ∀ n, P n → P (s n)) :
    ∀ n, P n :=
  induction_adequacy P hz hs

/-- Backend witness predicate for N-BR-007 generatedness/no-junk. -/
inductive Generated : BOMANat → Prop where
  | base : Generated z
  | step {n : BOMANat} : Generated n → Generated (s n)

/-- N-BR-007 — every inhabitant is constructor-generated. -/
theorem all_generated : ∀ n : BOMANat, Generated n := by
  intro n
  induction n with
  | z => exact Generated.base
  | s n ih => exact Generated.step ih

end BOMA.NCore.V5.NBLOCK003
