/- Derived strict order on the selected Dedekind quotient carrier.
No new primitive order is introduced: strictness is non-strict order plus inequality. -/
namespace BOMA.R.DedekindStrictOrder001

open BOMA.Q.Quotient001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindOrderConstructive001

/-- Strict real order derived from the accepted quotient non-strict order. -/
def rLT (x y : RBOMA) : Prop := rLE x y ∧ x ≠ y

@[simp] theorem rlt_irrefl (x : RBOMA) : ¬ rLT x x := by
  intro h
  exact h.2 rfl

/-- On explicit cut representatives, strict real order is strict cut inclusion:
inclusion together with failure of extensional cut identity. -/
theorem rlt_mk_iff (A B : LowerCut) :
    rLT (rmk A) (rmk B) ↔ CutLE A B ∧ ¬ CutEquiv A B := by
  constructor
  · intro h
    refine ⟨(rLE_mk_iff A B).1 h.1, ?_⟩
    intro hEq
    exact h.2 (rmk_sound hEq)
  · intro h
    refine ⟨(rLE_mk_iff A B).2 h.1, ?_⟩
    intro hmk
    exact h.2 ((rmk_eq_iff).1 hmk)

/-- The rational embedding preserves and reflects strict order. -/
theorem rOfQ_strict_order (q r : QBOMA) :
    rLT (rOfQ q) (rOfQ r) ↔ qLT q r := by
  constructor
  · intro h
    refine ⟨(rOfQ_order q r).1 h.1, ?_⟩
    intro hqr
    apply h.2
    exact congrArg rOfQ hqr
  · intro h
    refine ⟨(rOfQ_order q r).2 h.1, ?_⟩
    intro hEq
    exact h.2 (rOfQ_injective hEq)

end BOMA.R.DedekindStrictOrder001
