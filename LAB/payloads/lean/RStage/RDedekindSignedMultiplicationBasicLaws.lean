/- Basic laws for the selected sign-case-free signed Dedekind multiplication.
These laws do not require the positive/negative decomposition theorem. -/
namespace BOMA.R.DedekindSignedMulBasicLaws001

open BOMA.R.DedekindAddition001
open BOMA.R.DedekindAdditionLaws001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindAdditiveInverse001
open BOMA.R.DedekindNonnegativeMul001
open BOMA.R.DedekindNonnegativeMulLaws001
open BOMA.R.DedekindSignedMulCandidate001

/-- The selected signed multiplication is commutative before any distributive law is used. -/
theorem rMulCandidate_comm (x y : RBOMA) :
    rMulCandidate x y = rMulCandidate y x := by
  unfold rMulCandidate
  have hPP : rMulNonnegEnvelope x y = rMulNonnegEnvelope y x :=
    rMulNonnegEnvelope_comm x y
  have hNN :
      rMulNonnegEnvelope (rNeg x) (rNeg y) =
      rMulNonnegEnvelope (rNeg y) (rNeg x) :=
    rMulNonnegEnvelope_comm (rNeg x) (rNeg y)
  have hPN :
      rMulNonnegEnvelope x (rNeg y) =
      rMulNonnegEnvelope (rNeg y) x :=
    rMulNonnegEnvelope_comm x (rNeg y)
  have hNP :
      rMulNonnegEnvelope (rNeg x) y =
      rMulNonnegEnvelope y (rNeg x) :=
    rMulNonnegEnvelope_comm (rNeg x) y
  rw [hPP, hNN, hPN, hNP]
  apply congrArg (fun t => rAdd (rAdd
    (rMulNonnegEnvelope y x)
    (rMulNonnegEnvelope (rNeg y) (rNeg x))) (rNeg t))
  exact rAdd_comm
    (rMulNonnegEnvelope (rNeg y) x)
    (rMulNonnegEnvelope y (rNeg x))

/-- Zero annihilates the selected signed multiplication on the left. -/
@[simp] theorem rMulCandidate_zero_left (x : RBOMA) :
    rMulCandidate rZero x = rZero := by
  unfold rMulCandidate
  rw [rNeg_zero]
  rw [rMulNonnegEnvelope_zero_left, rMulNonnegEnvelope_zero_left,
      rMulNonnegEnvelope_zero_left, rMulNonnegEnvelope_zero_left]
  rw [rAdd_zero_left, rAdd_zero_left, rNeg_zero, rAdd_zero_left]

/-- Zero annihilates the selected signed multiplication on the right. -/
@[simp] theorem rMulCandidate_zero_right (x : RBOMA) :
    rMulCandidate x rZero = rZero := by
  rw [rMulCandidate_comm]
  exact rMulCandidate_zero_left x

end BOMA.R.DedekindSignedMulBasicLaws001
