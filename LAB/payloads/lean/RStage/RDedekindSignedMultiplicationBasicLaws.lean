/- Basic laws for the selected sign-case-free signed Dedekind multiplication. -/
namespace BOMA.R.DedekindSignedMulBasicLaws001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindAdditionLaws001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindAdditiveInverse001
open BOMA.R.DedekindPositivePart001
open BOMA.R.DedekindPositiveDecomposition001
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
  rw [BOMA.R.DedekindSignedMulCandidate001.rNeg_zero]
  rw [rMulNonnegEnvelope_zero_left, rMulNonnegEnvelope_zero_left,
      rMulNonnegEnvelope_zero_left, rMulNonnegEnvelope_zero_left]
  rw [rAdd_zero_left, rAdd_zero_left,
      BOMA.R.DedekindSignedMulCandidate001.rNeg_zero, rAdd_zero_left]

/-- Zero annihilates the selected signed multiplication on the right. -/
@[simp] theorem rMulCandidate_zero_right (x : RBOMA) :
    rMulCandidate x rZero = rZero := by
  rw [rMulCandidate_comm]
  exact rMulCandidate_zero_left x

/-- A nonpositive principal rational factor annihilates the nonnegative kernel,
even when the second input is an arbitrary real representative. -/
theorem cutMulNonnegEnvelope_principal_nonpos_left
    (q : QBOMA) (A : LowerCut) (hq : qLE q qZero) :
    CutEquiv
      (cutMulNonnegEnvelope (principalCut q) A)
      (principalCut qZero) := by
  intro t
  constructor
  · intro ht
    rcases ht with htNeg | htProd
    · exact htNeg
    · rcases htProd with ⟨a, _b, ha, _hb, h0a, _h0b, _ht⟩
      have ha0 : qLT a qZero :=
        ((cutPosPart_principal_nonpos hq) a).mp ha
      exact False.elim ((qlt_asymm h0a) ha0)
  · intro ht0
    exact Or.inl ht0

/-- Quotient form of arbitrary-right annihilation by a nonpositive rational factor. -/
theorem rMulNonnegEnvelope_rOfQ_nonpos_left
    (q : QBOMA) (x : RBOMA) (hq : qLE q qZero) :
    rMulNonnegEnvelope (rOfQ q) x = rZero := by
  refine Quotient.inductionOn x ?_
  intro A
  change
    rmk (cutMulNonnegEnvelope (principalCut q) A) =
    rmk (principalCut qZero)
  exact rmk_sound (cutMulNonnegEnvelope_principal_nonpos_left q A hq)

/-- The nonnegative kernel sees the formal real -1 as zero on its left input. -/
theorem rMulNonnegEnvelope_negOne_left (x : RBOMA) :
    rMulNonnegEnvelope (rNeg rOne) x = rZero := by
  rw [rOfQ_neg qOne]
  apply rMulNonnegEnvelope_rOfQ_nonpos_left
  exact qneg_nonpos_of_nonneg qzero_le_one

/-- One is a left identity for the selected signed multiplication.
The kernel one law reduces the expression to x⁺-x⁻, then the separately
verified positive/negative decomposition theorem closes the proof. -/
theorem rMulCandidate_one_left (x : RBOMA) :
    rMulCandidate rOne x = x := by
  unfold rMulCandidate
  rw [rMulNonnegEnvelope_one_left x]
  rw [rMulNonnegEnvelope_negOne_left (rNeg x)]
  rw [rMulNonnegEnvelope_one_left (rNeg x)]
  rw [rMulNonnegEnvelope_negOne_left x]
  rw [rAdd_zero_right, rAdd_zero_right]
  change rAdd (rPosPart x) (rNeg (rNegPart x)) = x
  exact rPosNeg_decomposition x

/-- One is also a right identity by commutativity. -/
theorem rMulCandidate_one_right (x : RBOMA) :
    rMulCandidate x rOne = x := by
  rw [rMulCandidate_comm]
  exact rMulCandidate_one_left x

end BOMA.R.DedekindSignedMulBasicLaws001
