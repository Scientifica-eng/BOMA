/- Shared Q-density gateway for real completion routes. -/
namespace BOMA.R.Gateway001

open BOMA.Q.Quotient001
open BOMA.Q.Inverse001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001

/-- Strict order is preserved by a common additive translate. -/
theorem qlt_add_right {x y : QBOMA} (hxy : qLT x y) (c : QBOMA) :
    qLT (qAdd x c) (qAdd y c) := by
  refine ⟨qadd_mono_right hxy.1 c, ?_⟩
  intro heq
  have hleft : qAdd c x = qAdd c y := by
    calc
      qAdd c x = qAdd x c := qAdd_comm c x
      _ = qAdd y c := heq
      _ = qAdd c y := qAdd_comm y c
  exact hxy.2 (qAdd_left_cancel hleft)

/-- Multiplicative cancellation by a nonzero left factor, derived from the
constructive unique-inverse witness interface. -/
theorem qMul_left_cancel_nonzero {a b c : QBOMA}
    (ha : a ≠ qZero) (h : qMul a b = qMul a c) : b = c := by
  rcases q_inverse_exists a ha with ⟨r, hr⟩
  unfold QInvRel at hr
  calc
    b = qMul qOne b := (qMul_one_left b).symm
    _ = qMul (qMul a r) b := congrArg (fun t => qMul t b) hr.symm
    _ = qMul r (qMul a b) := by
      calc
        qMul (qMul a r) b = qMul a (qMul r b) := qMul_assoc a r b
        _ = qMul a (qMul b r) := congrArg (fun t => qMul a t) (qMul_comm r b)
        _ = qMul (qMul a b) r := (qMul_assoc a b r).symm
        _ = qMul r (qMul a b) := qMul_comm _ _
    _ = qMul r (qMul a c) := congrArg (fun t => qMul r t) h
    _ = qMul (qMul a r) c := by
      calc
        qMul r (qMul a c) = qMul (qMul r a) c := (qMul_assoc r a c).symm
        _ = qMul (qMul a r) c := congrArg (fun t => qMul t c) (qMul_comm r a)
    _ = qMul qOne c := congrArg (fun t => qMul t c) hr
    _ = c := qMul_one_left c

/-- Product of two nonzero rationals is nonzero. -/
theorem qMul_ne_zero {a b : QBOMA} (ha : a ≠ qZero) (hb : b ≠ qZero) :
    qMul a b ≠ qZero := by
  intro hab
  have hzero : qMul a b = qMul a qZero := by
    rw [qMul_zero_right]
    exact hab
  exact hb (qMul_left_cancel_nonzero ha hzero)

/-- Strict multiplication monotonicity by a positive left factor. -/
theorem qlt_mul_left_positive {x y c : QBOMA}
    (hxy : qLT x y) (hc : QPositive c) :
    qLT (qMul c x) (qMul c y) := by
  refine ⟨qmul_mono_left_nonneg hxy.1 hc.1, ?_⟩
  intro heq
  exact hxy.2 (qMul_left_cancel_nonzero hc.2 heq)

/-- Rational two. -/
def qTwo : QBOMA := qAdd qOne qOne

/-- Zero is strictly below one. -/
theorem qzero_lt_one : qLT qZero qOne :=
  ⟨qzero_le_one, fun h => qone_ne_zero h.symm⟩

/-- One is strictly below two. -/
theorem qone_lt_two : qLT qOne qTwo := by
  have h := qlt_add_right qzero_lt_one qOne
  change qLT (qAdd qZero qOne) qTwo at h
  rw [qAdd_zero_left] at h
  exact h

/-- Two is positive and nonzero. -/
theorem qtwo_positive : QPositive qTwo := by
  have h02 : qLT qZero qTwo := qlt_trans qzero_lt_one qone_lt_two
  exact ⟨h02.1, fun h => h02.2 h.symm⟩

/-- There exists a positive rational half strictly between zero and one, obtained
from the already-accepted unique inverse witness for two. -/
theorem rational_half_exists :
    ∃ h : QBOMA, QInvRel qTwo h ∧ qLT qZero h ∧ qLT h qOne := by
  rcases q_inverse_exists qTwo qtwo_positive.2 with ⟨h, hh⟩
  have hpos : QPositive h := inverse_of_positive_is_positive qtwo_positive hh
  have h0h : qLT qZero h := ⟨hpos.1, fun hz => hpos.2 hz.symm⟩
  have hsum : qAdd h h = qOne := by
    unfold QInvRel at hh
    calc
      qAdd h h = qAdd (qMul qOne h) h :=
        congrArg (fun t => qAdd t h) (qMul_one_left h).symm
      _ = qAdd (qMul qOne h) (qMul qOne h) :=
        congrArg (fun t => qAdd (qMul qOne h) t) (qMul_one_left h).symm
      _ = qMul (qAdd qOne qOne) h := (qMul_add_left qOne qOne h).symm
      _ = qMul qTwo h := rfl
      _ = qOne := hh
  have hlt1 : qLT h qOne := by
    have ht := qlt_add_right h0h h
    rw [qAdd_zero_left, hsum] at ht
    exact ht
  exact ⟨h, hh, h0h, hlt1⟩

/-- If x<y then the ordered-field difference y-x is positive. -/
theorem positive_difference_of_lt {x y : QBOMA} (hxy : qLT x y) :
    QPositive (qAdd y (qNeg x)) := by
  constructor
  · exact (qle_iff_nonneg_difference x y).1 hxy.1
  · intro hd0
    have hleft : qAdd (qNeg x) y = qZero := by
      calc
        qAdd (qNeg x) y = qAdd y (qNeg x) := qAdd_comm _ _
        _ = qZero := hd0
    have hright : qAdd (qNeg x) x = qZero := qAdd_neg_left x
    have hyx : y = x := qAdd_left_cancel (hleft.trans hright.symm)
    exact hxy.2 hyx.symm

/-- The accepted rational order is internally dense. This theorem is a shared
pre-real gateway and does not depend on either the Dedekind or Cauchy carrier. -/
theorem rational_order_dense {x y : QBOMA} (hxy : qLT x y) :
    ∃ m : QBOMA, qLT x m ∧ qLT m y := by
  rcases rational_half_exists with ⟨half, hhalfInv, h0half, hhalf1⟩
  let d := qAdd y (qNeg x)
  have hdpos : QPositive d := positive_difference_of_lt hxy
  let p := qMul d half
  have hhalfPos : QPositive half :=
    ⟨h0half.1, fun h => h0half.2 h.symm⟩
  have hpNonNeg : qLE qZero p := by
    unfold p
    exact qmul_nonneg hdpos.1 hhalfPos.1
  have hpNe : p ≠ qZero := by
    unfold p
    exact qMul_ne_zero hdpos.2 hhalfPos.2
  have h0p : qLT qZero p := ⟨hpNonNeg, fun h => hpNe h.symm⟩
  have hpd : qLT p d := by
    have hm := qlt_mul_left_positive hhalf1 hdpos
    unfold p
    rw [qMul_one_right] at hm
    exact hm
  let m := qAdd x p
  have hxm : qLT x m := by
    have ht := qlt_add_right h0p x
    change qLT (qAdd qZero x) (qAdd p x) at ht
    rw [qAdd_zero_left, qAdd_comm p x] at ht
    exact ht
  have hmy : qLT m y := by
    have ht := qlt_add_right hpd x
    have hdx : qAdd d x = y := by
      unfold d
      calc
        qAdd (qAdd y (qNeg x)) x = qAdd y (qAdd (qNeg x) x) :=
          qAdd_assoc y (qNeg x) x
        _ = qAdd y qZero := by rw [qAdd_neg_left]
        _ = y := qAdd_zero_right y
    change qLT (qAdd p x) (qAdd d x) at ht
    rw [qAdd_comm p x, hdx] at ht
    exact ht
  exact ⟨m, hxm, hmy⟩

end BOMA.R.Gateway001
