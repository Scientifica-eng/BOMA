/- Shared pre-real order/positivity interface over accepted QBOMA. -/
namespace BOMA.R.Gateway001

open BOMA.Q.Quotient001
open BOMA.Q.Order001

/-- Strict rational order derived from the accepted total non-strict order. -/
def qLT (x y : QBOMA) : Prop := qLE x y ∧ x ≠ y

/-- Positive rational in the strict-order sense. -/
def qPos (x : QBOMA) : Prop := qLT qZero x

@[simp] theorem qlt_irrefl (x : QBOMA) : ¬ qLT x x := by
  intro h
  exact h.2 rfl

theorem qlt_of_le_of_ne {x y : QBOMA} (hxy : qLE x y) (hne : x ≠ y) : qLT x y :=
  ⟨hxy, hne⟩

theorem qlt_trans {x y z : QBOMA} (hxy : qLT x y) (hyz : qLT y z) : qLT x z := by
  refine ⟨qle_trans hxy.1 hyz.1, ?_⟩
  intro hxz
  have hzx : qLE z x := by
    rw [hxz]
    exact qle_refl z
  have hyx : qLE y x := qle_trans hyz.1 hzx
  have hy_eq_x : y = x := qle_antisymm hyx hxy.1
  apply hxy.2
  exact hy_eq_x.symm

theorem qlt_asymm {x y : QBOMA} (hxy : qLT x y) : ¬ qLT y x := by
  intro hyx
  have heq := qle_antisymm hxy.1 hyx.1
  exact hxy.2 heq

/-- Total-order trichotomy without adding a separate primitive order.
The equality split is an explicit localized classical commitment rather than an
implicit `by_cases` use of the global proposition-decidability instance. -/
theorem qlt_trichotomy (x y : QBOMA) : qLT x y ∨ x = y ∨ qLT y x := by
  rcases qle_total x y with hxy | hyx
  · rcases Classical.em (x = y) with h | h
    · exact Or.inr (Or.inl h)
    · exact Or.inl ⟨hxy, h⟩
  · rcases Classical.em (x = y) with h | h
    · exact Or.inr (Or.inl h)
    · exact Or.inr (Or.inr ⟨hyx, fun hyxEq => h hyxEq.symm⟩)

/-- Symmetric rational epsilon-closeness expressed without a primitive absolute value. -/
def qClose (eps x y : QBOMA) : Prop :=
  qLE (qNeg eps) (qAdd x (qNeg y)) ∧
  qLE (qAdd x (qNeg y)) eps

end BOMA.R.Gateway001
