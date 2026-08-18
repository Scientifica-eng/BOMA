/- Strict positive multiplication and inner approximation on accepted QBOMA.
This is a Q-level contribution used by the selected Dedekind multiplication route. -/
namespace BOMA.R.QPositiveMultiplicativeApprox001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.Inverse001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001

/-- Right cancellation by a nonzero rational, derived from the existential
inverse interface rather than a global inverse selector. -/
theorem qmul_right_cancel_nonzero {x y c : QBOMA}
    (hc : c ≠ qZero)
    (h : qMul x c = qMul y c) : x = y := by
  rcases q_inverse_exists c hc with ⟨cinv, hcinv⟩
  have h' := congrArg (fun t => qMul t cinv) h
  calc
    x = qMul x qOne := (qMul_one_right x).symm
    _ = qMul x (qMul c cinv) :=
      congrArg (fun t => qMul x t) hcinv.symm
    _ = qMul (qMul x c) cinv := (qMul_assoc x c cinv).symm
    _ = qMul (qMul y c) cinv := h'
    _ = qMul y (qMul c cinv) := qMul_assoc y c cinv
    _ = qMul y qOne := congrArg (fun t => qMul y t) hcinv
    _ = y := qMul_one_right y

/-- Left cancellation by a nonzero rational. -/
theorem qmul_left_cancel_nonzero {x y c : QBOMA}
    (hc : c ≠ qZero)
    (h : qMul c x = qMul c y) : x = y := by
  apply qmul_right_cancel_nonzero hc
  rw [qMul_comm x c, qMul_comm y c]
  exact h

/-- Multiplication on the right by a strictly positive rational preserves strict order. -/
theorem qmul_lt_right_positive {x y c : QBOMA}
    (hxy : qLT x y) (hc : qLT qZero c) :
    qLT (qMul x c) (qMul y c) := by
  refine ⟨qmul_mono_right_nonneg hxy.1 hc.1, ?_⟩
  intro heq
  have hcNZ : c ≠ qZero := by
    intro hc0
    exact hc.2 hc0.symm
  exact hxy.2 (qmul_right_cancel_nonzero hcNZ heq)

/-- Multiplication on the left by a strictly positive rational preserves strict order. -/
theorem qmul_lt_left_positive {x y c : QBOMA}
    (hxy : qLT x y) (hc : qLT qZero c) :
    qLT (qMul c x) (qMul c y) := by
  rw [qMul_comm c x, qMul_comm c y]
  exact qmul_lt_right_positive hxy hc

/-- If 0 ≤ u < v, then v is strictly positive. -/
theorem qlt_zero_of_nonneg_lt {u v : QBOMA}
    (h0u : qLE qZero u) (huv : qLT u v) : qLT qZero v := by
  refine ⟨qle_trans h0u huv.1, ?_⟩
  intro h0v
  have hu0 : qLE u qZero := by
    rw [h0v]
    exact huv.1
  have hueq0 : u = qZero := qle_antisymm h0u hu0
  apply huv.2
  calc
    u = qZero := hueq0
    _ = v := h0v

/-- The existential inverse witness of a strictly positive rational is strictly positive. -/
theorem qlt_zero_inverse {q r : QBOMA}
    (hq : qLT qZero q) (hr : QInvRel q r) : qLT qZero r := by
  have hp : QPositive r :=
    inverse_of_positive_is_positive ⟨hq.1, fun hq0 => hq.2 hq0.symm⟩ hr
  exact ⟨hp.1, fun h0r => hp.2 h0r.symm⟩

/-- Dividing a strict inequality x < q*r by positive r on the right. -/
theorem qlt_mul_div_right {x q r rinv : QBOMA}
    (h : qLT x (qMul q r))
    (hr : qLT qZero r)
    (hrinv : QInvRel r rinv) :
    qLT (qMul x rinv) q := by
  have hrinvPos : qLT qZero rinv := qlt_zero_inverse hr hrinv
  have ht := qmul_lt_right_positive h hrinvPos
  have hright : qMul (qMul q r) rinv = q := by
    calc
      qMul (qMul q r) rinv = qMul q (qMul r rinv) := qMul_assoc q r rinv
      _ = qMul q qOne := congrArg (fun t => qMul q t) hrinv
      _ = q := qMul_one_right q
  rw [hright] at ht
  exact ht

/-- Recompose after dividing on the right. -/
theorem qlt_mul_recompose_right {x a r rinv : QBOMA}
    (h : qLT (qMul x rinv) a)
    (hr : qLT qZero r)
    (hrinv : QInvRel r rinv) :
    qLT x (qMul a r) := by
  have ht := qmul_lt_right_positive h hr
  have hleft : qMul (qMul x rinv) r = x := by
    have hri : qMul rinv r = qOne := by
      calc
        qMul rinv r = qMul r rinv := qMul_comm rinv r
        _ = qOne := hrinv
    calc
      qMul (qMul x rinv) r = qMul x (qMul rinv r) := qMul_assoc x rinv r
      _ = qMul x qOne := congrArg (fun t => qMul x t) hri
      _ = x := qMul_one_right x
  rw [hleft] at ht
  exact ht

/-- Divide x < a*r by positive a on the left. -/
theorem qlt_mul_div_left {x a r ainv : QBOMA}
    (h : qLT x (qMul a r))
    (ha : qLT qZero a)
    (hainv : QInvRel a ainv) :
    qLT (qMul ainv x) r := by
  have hainvPos : qLT qZero ainv := qlt_zero_inverse ha hainv
  have ht := qmul_lt_left_positive h hainvPos
  have hright : qMul ainv (qMul a r) = r := by
    have hia : qMul ainv a = qOne := by
      calc
        qMul ainv a = qMul a ainv := qMul_comm ainv a
        _ = qOne := hainv
    calc
      qMul ainv (qMul a r) = qMul (qMul ainv a) r := (qMul_assoc ainv a r).symm
      _ = qMul qOne r := congrArg (fun t => qMul t r) hia
      _ = r := qMul_one_left r
  rw [hright] at ht
  exact ht

/-- Recompose after dividing on the left. -/
theorem qlt_mul_recompose_left {x a b ainv : QBOMA}
    (h : qLT (qMul ainv x) b)
    (ha : qLT qZero a)
    (hainv : QInvRel a ainv) :
    qLT x (qMul a b) := by
  have ht := qmul_lt_left_positive h ha
  have hleft : qMul a (qMul ainv x) = x := by
    calc
      qMul a (qMul ainv x) = qMul (qMul a ainv) x := (qMul_assoc a ainv x).symm
      _ = qMul qOne x := congrArg (fun t => qMul t x) hainv
      _ = x := qMul_one_left x
  rw [hleft] at ht
  exact ht

/-- Inner-product approximation for positive rational factors.
If x is nonnegative and x < q*r with q,r positive, then there are positive
strictly interior witnesses a<q and b<r whose product still lies strictly above x. -/
theorem q_positive_product_inner_approx
    {x q r : QBOMA}
    (hx : qLE qZero x)
    (hq : qLT qZero q)
    (hr : qLT qZero r)
    (hprod : qLT x (qMul q r)) :
    ∃ a b : QBOMA,
      qLT qZero a ∧
      qLT a q ∧
      qLT qZero b ∧
      qLT b r ∧
      qLT x (qMul a b) := by
  have hrNZ : r ≠ qZero := by
    intro hr0
    exact hr.2 hr0.symm
  rcases q_inverse_exists r hrNZ with ⟨rinv, hrinv⟩
  have hrinvPos : qLT qZero rinv := qlt_zero_inverse hr hrinv
  have hxdivq : qLT (qMul x rinv) q :=
    qlt_mul_div_right hprod hr hrinv
  have h0xrinv : qLE qZero (qMul x rinv) :=
    qmul_nonneg hx hrinvPos.1
  rcases rational_order_dense hxdivq with ⟨a, hxa, haq⟩
  have haPos : qLT qZero a := qlt_zero_of_nonneg_lt h0xrinv hxa
  have hxar : qLT x (qMul a r) :=
    qlt_mul_recompose_right hxa hr hrinv
  have haNZ : a ≠ qZero := by
    intro ha0
    exact haPos.2 ha0.symm
  rcases q_inverse_exists a haNZ with ⟨ainv, hainv⟩
  have hainvPos : qLT qZero ainv := qlt_zero_inverse haPos hainv
  have hxdivr : qLT (qMul ainv x) r :=
    qlt_mul_div_left hxar haPos hainv
  have h0ainvx : qLE qZero (qMul ainv x) :=
    qmul_nonneg hainvPos.1 hx
  rcases rational_order_dense hxdivr with ⟨b, hxb, hbr⟩
  have hbPos : qLT qZero b := qlt_zero_of_nonneg_lt h0ainvx hxb
  have hxab : qLT x (qMul a b) :=
    qlt_mul_recompose_left hxb haPos hainv
  exact ⟨a, b, haPos, haq, hbPos, hbr, hxab⟩

end BOMA.R.QPositiveMultiplicativeApprox001
