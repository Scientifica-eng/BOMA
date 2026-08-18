/-
V5 verification fragment for N-J-001 Route B — constructional no-confusion transfer.

Independence discipline:
This fragment does NOT invoke the internal Route-A theorems `s_ne_z` or
`s_injective`. The workflow concatenates it after NCoreRB001.lean and derives
the same formal interface using the selected TCT representation, bridge
reflection, and coverage/reconstruction.
-/

namespace BOMA.NCore.V5.NJ001RouteB

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NCore.RB001.TCTNF

/-- Backend representation of the TCT empty-exclusion contribution. -/
theorem tct_extU_ne_eps (a : TCTNF) : extU a ≠ eps := by
  cases a <;> simp [extU]

/-- Backend representation of the TCT extension-injectivity contribution. -/
theorem tct_extU_injective {a b : TCTNF} (h : extU a = extU b) : a = b := by
  cases a <;> cases b <;> simp [extU] at h ⊢

/-- N-BR-018, Route-B clause 1:
formal constructor/base disjointness transferred through constructional ancestry. -/
theorem constructional_s_ne_z (n : BOMANat) : s n ≠ z := by
  intro h
  have hreal : realize (extU (reify n)) = realize eps := by
    calc
      realize (extU (reify n)) = s (realize (reify n)) := realize_extU (reify n)
      _ = s n := by rw [realize_reify]
      _ = z := h
      _ = realize eps := by rfl
  have hp : extU (reify n) = eps :=
    bridge_reflects_formal_identity hreal
  exact tct_extU_ne_eps (reify n) hp

/-- N-BR-018, Route-B clause 2:
formal successor injectivity transferred through constructional ancestry. -/
theorem constructional_s_injective {a b : BOMANat} (h : s a = s b) : a = b := by
  have hreal : realize (extU (reify a)) = realize (extU (reify b)) := by
    calc
      realize (extU (reify a)) = s (realize (reify a)) := realize_extU (reify a)
      _ = s a := by rw [realize_reify]
      _ = s b := h
      _ = s (realize (reify b)) := by rw [realize_reify]
      _ = realize (extU (reify b)) := by
        symm
        exact realize_extU (reify b)
  have hp : extU (reify a) = extU (reify b) :=
    bridge_reflects_formal_identity hreal
  have hr : reify a = reify b := tct_extU_injective hp
  have hf := congrArg realize hr
  simpa using hf

end BOMA.NCore.V5.NJ001RouteB
