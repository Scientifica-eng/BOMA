/- Rational inverse-order interface used by the real reciprocal route. -/
namespace BOMA.R.QInverseOrder001

open BOMA.Q.Quotient001
open BOMA.Q.Inverse001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.QPositiveMultiplicativeApprox001

/-- Existential inverse witnesses reverse strict order on positive rationals. -/
theorem q_inverse_strict_antitone
    {a b ainv binv : QBOMA}
    (h0a : qLT qZero a)
    (hab : qLT a b)
    (hainv : QInvRel a ainv)
    (hbinv : QInvRel b binv) :
    qLT binv ainv := by
  have h0b : qLT qZero b := qlt_trans h0a hab
  have h0ainv : qLT qZero ainv := qlt_zero_inverse h0a hainv
  have h0binv : qLT qZero binv := qlt_zero_inverse h0b hbinv
  have h1raw := qmul_lt_right_positive hab h0ainv
  have h1 : qLT qOne (qMul b ainv) := by
    unfold QInvRel at hainv
    rw [hainv] at h1raw
    exact h1raw
  have h2 := qmul_lt_left_positive h1 h0binv
  have hright : qMul binv (qMul b ainv) = ainv := by
    unfold QInvRel at hbinv
    calc
      qMul binv (qMul b ainv) = qMul (qMul binv b) ainv :=
        (qMul_assoc binv b ainv).symm
      _ = qMul (qMul b binv) ainv := by rw [qMul_comm binv b]
      _ = qMul qOne ainv := by rw [hbinv]
      _ = ainv := qMul_one_left ainv
  rw [qMul_one_right, hright] at h2
  exact h2

end BOMA.R.QInverseOrder001
