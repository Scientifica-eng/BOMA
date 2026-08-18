/- Corrected rational gap estimate used by the positive real inverse-product theorem.
Revision 002 preserves revision 001 as a proof-engineering learning artifact. -/
namespace BOMA.R.QReciprocalGap002

open BOMA.Q.Quotient001
open BOMA.Q.Inverse001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.QPositiveMultiplicativeApprox001

/-- Strict followed by non-strict transitivity, with the inequality witness
proved against the correct endpoint equality. -/
theorem qlt_le_trans_gap {x y z : QBOMA}
    (hxy : qLT x y) (hyz : qLE y z) : qLT x z := by
  refine ⟨qle_trans hxy.1 hyz, ?_⟩
  intro hxz
  have hzy : qLE z y := by
    rw [← hxz]
    exact hxy.1
  have hyzEq : y = z := qle_antisymm hyz hzy
  have hxyEq : x = y := hxz.trans hyzEq.symm
  exact hxy.2 hxyEq

/-- q + (1-q) = 1. -/
theorem q_add_one_minus (q : QBOMA) :
    qAdd q (qAdd qOne (qNeg q)) = qOne := by
  calc
    qAdd q (qAdd qOne (qNeg q)) =
        qAdd qOne (qAdd q (qNeg q)) := by
      calc
        qAdd q (qAdd qOne (qNeg q)) =
            qAdd (qAdd q qOne) (qNeg q) :=
          (qAdd_assoc q qOne (qNeg q)).symm
        _ = qAdd (qAdd qOne q) (qNeg q) :=
          congrArg (fun t => qAdd t (qNeg q)) (qAdd_comm q qOne)
        _ = qAdd qOne (qAdd q (qNeg q)) := qAdd_assoc qOne q (qNeg q)
    _ = qAdd qOne qZero := by rw [qAdd_neg_right]
    _ = qOne := qAdd_zero_right qOne

/-- Reconstruct r from a and the additive gap r-a. -/
theorem q_add_gap (a r : QBOMA) :
    qAdd a (qAdd r (qNeg a)) = r := by
  calc
    qAdd a (qAdd r (qNeg a)) =
        qAdd r (qAdd a (qNeg a)) := by
      calc
        qAdd a (qAdd r (qNeg a)) =
            qAdd (qAdd a r) (qNeg a) :=
          (qAdd_assoc a r (qNeg a)).symm
        _ = qAdd (qAdd r a) (qNeg a) :=
          congrArg (fun t => qAdd t (qNeg a)) (qAdd_comm a r)
        _ = qAdd r (qAdd a (qNeg a)) := qAdd_assoc r a (qNeg a)
    _ = qAdd r qZero := by rw [qAdd_neg_right]
    _ = r := qAdd_zero_right r

/-- Small additive boundary gap forces q below the ratio a/r.
This theorem is purely rational. -/
theorem q_lt_mul_inverse_of_small_gap
    {q a0 a r rinv : QBOMA}
    (h0q : qLE qZero q)
    (hq1 : qLT q qOne)
    (h0a0 : qLT qZero a0)
    (ha0a : qLE a0 a)
    (h0r : qLT qZero r)
    (hgapPos : qLT qZero (qAdd r (qNeg a)))
    (hgapSmall :
      qLT (qAdd r (qNeg a))
        (qMul (qAdd qOne (qNeg q)) a0))
    (hrinv : QInvRel r rinv) :
    qLT q (qMul a rinv) := by
  let g := qAdd r (qNeg a)
  let omq := qAdd qOne (qNeg q)
  have homqPos : QPositive omq := by
    unfold omq
    exact positive_difference_of_lt hq1
  have hgapPos' : qLT qZero g := hgapPos
  have hgapSmall' : qLT g (qMul omq a0) := hgapSmall
  have hbound : qLE (qMul omq a0) (qMul omq a) :=
    qmul_mono_left_nonneg ha0a homqPos.1
  have hgapToA : qLT g (qMul omq a) :=
    qlt_le_trans_gap hgapSmall' hbound
  have hqg : qLT (qMul q g) g := by
    have ht := qmul_lt_right_positive hq1 hgapPos'
    rw [qMul_one_left] at ht
    exact ht
  have hqa_qag :
      qLT (qAdd (qMul q a) (qMul q g))
        (qAdd (qMul q a) g) := by
    have ht := qlt_add_right hqg (qMul q a)
    rw [qAdd_comm (qMul q g) (qMul q a),
        qAdd_comm g (qMul q a)] at ht
    exact ht
  have hqag_final :
      qLT (qAdd (qMul q a) g)
        (qAdd (qMul q a) (qMul omq a)) := by
    have ht := qlt_add_right hgapToA (qMul q a)
    rw [qAdd_comm g (qMul q a),
        qAdd_comm (qMul omq a) (qMul q a)] at ht
    exact ht
  have hsumA :
      qAdd (qMul q a) (qMul omq a) = a := by
    calc
      qAdd (qMul q a) (qMul omq a) =
          qMul (qAdd q omq) a := (qMul_add_left q omq a).symm
      _ = qMul qOne a := by rw [q_add_one_minus]
      _ = a := qMul_one_left a
  have hqr : qLT (qMul q r) a := by
    have hqexpand : qMul q r = qAdd (qMul q a) (qMul q g) := by
      have hrag : qAdd a g = r := by
        unfold g
        exact q_add_gap a r
      calc
        qMul q r = qMul q (qAdd a g) := by rw [hrag]
        _ = qAdd (qMul q a) (qMul q g) := qMul_add_right q a g
    rw [hqexpand, ← hsumA]
    exact qlt_trans hqa_qag hqag_final
  have h0rinv : qLT qZero rinv := qlt_zero_inverse h0r hrinv
  have ht := qmul_lt_right_positive hqr h0rinv
  have hleft : qMul (qMul q r) rinv = q := by
    calc
      qMul (qMul q r) rinv = qMul q (qMul r rinv) := qMul_assoc q r rinv
      _ = qMul q qOne := by rw [hrinv]
      _ = q := qMul_one_right q
  rw [hleft] at ht
  exact ht

end BOMA.R.QReciprocalGap002
