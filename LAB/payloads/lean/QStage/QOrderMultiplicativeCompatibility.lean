/- Multiplicative compatibility of the Stage-One rational order. -/
namespace BOMA.Q.OrderedField001

open BOMA.Z.Arithmetic001
open BOMA.Z.Order001
open BOMA.Q.Fraction001
open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.Inverse001

/-- A negated left factor produces the additive inverse of the product. -/
theorem qMul_neg_left (x c : QBOMA) :
    qMul (qNeg x) c = qNeg (qMul x c) := by
  apply qAdd_inverse_unique (x := qMul x c)
  calc
    qAdd (qMul x c) (qMul (qNeg x) c) =
        qMul (qAdd x (qNeg x)) c :=
      (qMul_add_left x (qNeg x) c).symm
    _ = qMul qZero c := congrArg (fun t => qMul t c) (qAdd_neg_right x)
    _ = qZero := qMul_zero_left c

/-- Product of two nonnegative rationals is nonnegative. -/
theorem qmul_nonneg {x y : QBOMA}
    (hx : qLE qZero x) (hy : qLE qZero y) : qLE qZero (qMul x y) := by
  refine Quotient.inductionOn x ?_ hx
  intro a hxa
  refine Quotient.inductionOn y ?_ hy
  intro b hyb
  have ha : zLE zzero a.num := (qNonNeg_mk_iff a).1 hxa
  have hb : zLE zzero b.num := (qNonNeg_mk_iff b).1 hyb
  apply (qNonNeg_mk_iff (rawMul a b)).2
  change zLE zzero (zmul a.num b.num)
  have hm := zmul_mono_right_nonneg ha hb
  rw [zmul_zero_left] at hm
  exact hm

/-- Multiplication by a nonnegative rational preserves order. -/
theorem qmul_mono_right_nonneg {x y c : QBOMA}
    (hxy : qLE x y) (hc : qLE qZero c) :
    qLE (qMul x c) (qMul y c) := by
  apply (qle_iff_nonneg_difference (qMul x c) (qMul y c)).2
  have hd := (qle_iff_nonneg_difference x y).1 hxy
  have hp := qmul_nonneg hd hc
  have hEq :
      qAdd (qMul y c) (qNeg (qMul x c)) =
      qMul (qAdd y (qNeg x)) c := by
    calc
      qAdd (qMul y c) (qNeg (qMul x c)) =
          qAdd (qMul y c) (qMul (qNeg x) c) :=
        congrArg (fun t => qAdd (qMul y c) t) (qMul_neg_left x c).symm
      _ = qMul (qAdd y (qNeg x)) c :=
        (qMul_add_left y (qNeg x) c).symm
  rw [hEq]
  exact hp

/-- Multiplication by a nonnegative rational on the left. -/
theorem qmul_mono_left_nonneg {x y c : QBOMA}
    (hxy : qLE x y) (hc : qLE qZero c) :
    qLE (qMul c x) (qMul c y) := by
  rw [qMul_comm c x, qMul_comm c y]
  exact qmul_mono_right_nonneg hxy hc

/-- Rational one is nonnegative. -/
theorem qzero_le_one : qLE qZero qOne := by
  change qLE (qOfZ zzero) (qOfZ zone)
  apply (qOfZ_order zzero zone).2
  exact (embedN_order BOMA.NCore.RB001.BOMANat.z
    (BOMA.NCore.RB001.BOMANat.s BOMA.NCore.RB001.BOMANat.z)).2
    (BOMA.NArithmetic.Order001.z_le _)

/-- Rational one is distinct from zero by faithful Z embedding. -/
theorem qone_ne_zero : qOne ≠ qZero := by
  intro h
  change qOfZ zone = qOfZ zzero at h
  have hz : zone = zzero := qOfZ_injective h
  cases hz

/-- A positive rational is nonnegative and nonzero; no separate strict-order
primitive is required solely for this acceptance gate. -/
def QPositive (q : QBOMA) : Prop := qLE qZero q ∧ q ≠ qZero

/-- The unique multiplicative inverse witness of a positive rational is positive. -/
theorem inverse_of_positive_is_positive {q r : QBOMA}
    (hq : QPositive q) (hr : QInvRel q r) : QPositive r := by
  constructor
  · rcases qle_total qZero r with h0r | hr0
    · exact h0r
    · have hm := qmul_mono_right_nonneg hr0 hq.1
      have hleft : qMul r q = qOne := by
        calc
          qMul r q = qMul q r := qMul_comm r q
          _ = qOne := hr
      have hright : qMul qZero q = qZero := qMul_zero_left q
      rw [hleft, hright] at hm
      have heq : qOne = qZero := qle_antisymm hm qzero_le_one
      exact False.elim (qone_ne_zero heq)
  · intro hrzero
    unfold QInvRel at hr
    rw [hrzero, qMul_zero_right] at hr
    exact qone_ne_zero hr.symm

end BOMA.Q.OrderedField001
