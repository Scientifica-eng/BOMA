/- Final Stage-One rational integration certificate before QA-23 closure. -/
namespace BOMA.Q.Integration001

open BOMA.Z.Rep001
open BOMA.Z.Arithmetic001
open BOMA.Z.Order001
open BOMA.Q.Fraction001
open BOMA.Q.Quotient001
open BOMA.Q.Inverse001
open BOMA.Q.Embedding001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.Q.Generation001

/-- The selected rational carrier is nontrivial. -/
theorem q_nontrivial : qZero ≠ qOne := by
  intro h
  exact qone_ne_zero h.symm

/-- Additive-group integration witness. -/
theorem q_additive_package (x y w : QBOMA) :
    qAdd (qAdd x y) w = qAdd x (qAdd y w) ∧
    qAdd x y = qAdd y x ∧
    qAdd x (qNeg x) = qZero := by
  exact ⟨qAdd_assoc x y w, qAdd_comm x y, qAdd_neg_right x⟩

/-- Multiplicative/distributive integration witness. -/
theorem q_ring_package (x y w : QBOMA) :
    qMul (qMul x y) w = qMul x (qMul y w) ∧
    qMul x y = qMul y x ∧
    qMul x (qAdd y w) = qAdd (qMul x y) (qMul x w) := by
  exact ⟨qMul_assoc x y w, qMul_comm x y, qMul_add_right x y w⟩

/-- Every nonzero rational has a unique multiplicative-inverse witness. -/
theorem q_inverse_package (q : QBOMA) (hq : q ≠ qZero) :
    ∃ r : QBOMA, QInvRel q r ∧ ∀ s : QBOMA, QInvRel q s → s = r :=
  q_inverse_exists_unique q hq

/-- The accepted integer embedding is faithful and arithmetic-preserving. -/
theorem q_integer_embedding_package (a b : BOMA.Z.Rep001.ZSigned) :
    qOfZ (zadd a b) = qAdd (qOfZ a) (qOfZ b) ∧
    qOfZ (zmul a b) = qMul (qOfZ a) (qOfZ b) := by
  exact ⟨qOfZ_add a b, qOfZ_mul a b⟩

/-- Rational order is total and exactly extends the accepted integer order. -/
theorem q_order_package (x y : QBOMA) (a b : BOMA.Z.Rep001.ZSigned) :
    (qLE x y ∨ qLE y x) ∧
    (qLE (qOfZ a) (qOfZ b) ↔ zLE a b) := by
  exact ⟨qle_total x y, qOfZ_order a b⟩

/-- Ordered-field compatibility required by QA-15. -/
theorem q_ordered_field_package {x y c : QBOMA}
    (hxy : qLE x y) (hc : qLE qZero c) :
    qLE (qAdd x c) (qAdd y c) ∧
    qLE (qNeg y) (qNeg x) ∧
    qLE (qMul x c) (qMul y c) := by
  exact ⟨qadd_mono_right hxy c, qneg_reverses hxy,
    qmul_mono_right_nonneg hxy hc⟩

/-- Positive inverse behavior is part of the integrated ordered-field interface. -/
theorem q_positive_inverse_package {q r : QBOMA}
    (hq : QPositive q) (hr : QInvRel q r) : QPositive r :=
  inverse_of_positive_is_positive hq hr

/-- Every formal rational has an explicit integer / positive-natural-denominator representative. -/
theorem q_generation_package (q : QBOMA) :
    ∃ a : BOMA.Z.Rep001.ZSigned, ∃ d : PosDen, q = qmk ⟨a, d⟩ :=
  every_q_has_integer_fraction q

end BOMA.Q.Integration001
