/- Signed Dedekind multiplication candidate built compositionally from positive envelopes.
The operation definition contains no sign-case `if`; sign analysis appears only in proofs. -/
namespace BOMA.R.DedekindSignedMulCandidate001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindAdditionLaws001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindAdditiveInverse001
open BOMA.R.DedekindPositivePart001
open BOMA.R.DedekindNonnegativeMul001
open BOMA.R.DedekindNonnegativeMulEmbedding001
open BOMA.R.QPositiveMultiplicativeApprox001

/-- If a principal rational cut is nonpositive, its positive envelope is the zero cut. -/
theorem cutPosPart_principal_nonpos {q : QBOMA} (hq : qLE q qZero) :
    CutEquiv (cutPosPart (principalCut q)) (principalCut qZero) := by
  intro x
  constructor
  · intro hx
    rcases hx with hxq | hx0
    · exact qlt_le_trans hxq hq
    · exact hx0
  · intro hx0
    exact Or.inr hx0

/-- If the left rational input is nonpositive, the nonnegative-envelope kernel is zero. -/
theorem cutMulNonnegEnvelope_principal_left_nonpos
    (q r : QBOMA) (hq : qLE q qZero) :
    CutEquiv
      (cutMulNonnegEnvelope (principalCut q) (principalCut r))
      (principalCut qZero) := by
  intro x
  constructor
  · intro hx
    rcases hx with hxNeg | hxProd
    · exact hxNeg
    · rcases hxProd with ⟨a, b, ha, _hb, h0a, _h0b, _hxab⟩
      have ha0 : qLT a qZero :=
        ((cutPosPart_principal_nonpos hq) a).mp ha
      exact False.elim ((qlt_asymm h0a) ha0)
  · intro hx0
    exact Or.inl hx0

/-- If the right rational input is nonpositive, the kernel is zero. -/
theorem cutMulNonnegEnvelope_principal_right_nonpos
    (q r : QBOMA) (hr : qLE r qZero) :
    CutEquiv
      (cutMulNonnegEnvelope (principalCut q) (principalCut r))
      (principalCut qZero) := by
  exact cutEquiv_trans
    (cutMulNonnegEnvelope_comm (principalCut q) (principalCut r))
    (cutMulNonnegEnvelope_principal_left_nonpos r q hr)

/-- Quotient form of left nonpositive annihilation on rational inputs. -/
theorem rMulNonnegEnvelope_rOfQ_left_nonpos
    (q r : QBOMA) (hq : qLE q qZero) :
    rMulNonnegEnvelope (rOfQ q) (rOfQ r) = rZero := by
  change
    rmk (cutMulNonnegEnvelope (principalCut q) (principalCut r)) =
    rmk (principalCut qZero)
  exact rmk_sound (cutMulNonnegEnvelope_principal_left_nonpos q r hq)

/-- Quotient form of right nonpositive annihilation on rational inputs. -/
theorem rMulNonnegEnvelope_rOfQ_right_nonpos
    (q r : QBOMA) (hr : qLE r qZero) :
    rMulNonnegEnvelope (rOfQ q) (rOfQ r) = rZero := by
  change
    rmk (cutMulNonnegEnvelope (principalCut q) (principalCut r)) =
    rmk (principalCut qZero)
  exact rmk_sound (cutMulNonnegEnvelope_principal_right_nonpos q r hr)

/-- Negation sends nonnegative rationals to nonpositive rationals. -/
theorem qneg_nonpos_of_nonneg {q : QBOMA} (hq : qLE qZero q) :
    qLE (qNeg q) qZero := by
  have h := qneg_reverses hq
  rw [qNeg_zero] at h
  exact h

/-- Negation sends nonpositive rationals to nonnegative rationals. -/
theorem qneg_nonneg_of_nonpos {q : QBOMA} (hq : qLE q qZero) :
    qLE qZero (qNeg q) := by
  have h := qneg_reverses hq
  rw [qNeg_zero] at h
  exact h

/-- Multiplying a negated left factor negates the rational product. -/
theorem qMul_neg_left (q r : QBOMA) :
    qMul (qNeg q) r = qNeg (qMul q r) := by
  apply qAdd_inverse_unique
  calc
    qAdd (qMul q r) (qMul (qNeg q) r) =
        qMul (qAdd q (qNeg q)) r := (qMul_add_left q (qNeg q) r).symm
    _ = qMul qZero r := by rw [qAdd_neg_right]
    _ = qZero := qMul_zero_left r

/-- Multiplying a negated right factor negates the rational product. -/
theorem qMul_neg_right (q r : QBOMA) :
    qMul q (qNeg r) = qNeg (qMul q r) := by
  calc
    qMul q (qNeg r) = qMul (qNeg r) q := qMul_comm q (qNeg r)
    _ = qNeg (qMul r q) := qMul_neg_left r q
    _ = qNeg (qMul q r) := congrArg qNeg (qMul_comm r q)

/-- Product of two rational negatives is the original product. -/
theorem qMul_neg_neg (q r : QBOMA) :
    qMul (qNeg q) (qNeg r) = qMul q r := by
  calc
    qMul (qNeg q) (qNeg r) = qNeg (qMul q (qNeg r)) :=
      qMul_neg_left q (qNeg r)
    _ = qNeg (qNeg (qMul q r)) := congrArg qNeg (qMul_neg_right q r)
    _ = qMul q r := qNeg_involutive (qMul q r)

/-- Zero is fixed by formal real negation. -/
@[simp] theorem rNeg_zero : rNeg rZero = rZero := by
  symm
  exact rAdd_inverse_unique
    (x := rZero)
    (y := rZero)
    (rAdd_zero_left rZero)

/-- Candidate A: signed multiplication obtained by bilinear positive/negative-part expansion.
`rMulNonnegEnvelope` internally applies positive envelopes to its inputs.
No proposition-valued sign decision occurs in this definition. -/
def rMulCandidate (x y : RBOMA) : RBOMA :=
  rAdd
    (rAdd
      (rMulNonnegEnvelope x y)
      (rMulNonnegEnvelope (rNeg x) (rNeg y)))
    (rNeg
      (rAdd
        (rMulNonnegEnvelope x (rNeg y))
        (rMulNonnegEnvelope (rNeg x) y)))

/-- Candidate A preserves accepted rational multiplication for all rational signs.
Sign splitting is confined to this proof; the operation definition itself is sign-case-free. -/
theorem rMulCandidate_rOfQ (q r : QBOMA) :
    rMulCandidate (rOfQ q) (rOfQ r) = rOfQ (qMul q r) := by
  rcases qle_total qZero q with hqNonNeg | hqNonPos
  · rcases qle_total qZero r with hrNonNeg | hrNonPos
    · have hnq : qLE (qNeg q) qZero := qneg_nonpos_of_nonneg hqNonNeg
      have hnr : qLE (qNeg r) qZero := qneg_nonpos_of_nonneg hrNonNeg
      have hPP := rMulNonnegEnvelope_rOfQ q r hqNonNeg hrNonNeg
      have hNN := rMulNonnegEnvelope_rOfQ_left_nonpos (qNeg q) (qNeg r) hnq
      have hPN := rMulNonnegEnvelope_rOfQ_right_nonpos q (qNeg r) hnr
      have hNP := rMulNonnegEnvelope_rOfQ_left_nonpos (qNeg q) r hnq
      unfold rMulCandidate
      rw [rOfQ_neg q, rOfQ_neg r, hPP, hNN, hPN, hNP]
      rw [rAdd_zero_right, rAdd_zero_left, rNeg_zero, rAdd_zero_right]
    · have hnq : qLE (qNeg q) qZero := qneg_nonpos_of_nonneg hqNonNeg
      have hnr : qLE qZero (qNeg r) := qneg_nonneg_of_nonpos hrNonPos
      have hPP := rMulNonnegEnvelope_rOfQ_right_nonpos q r hrNonPos
      have hNN := rMulNonnegEnvelope_rOfQ_left_nonpos (qNeg q) (qNeg r) hnq
      have hPN := rMulNonnegEnvelope_rOfQ q (qNeg r) hqNonNeg hnr
      have hNP := rMulNonnegEnvelope_rOfQ_left_nonpos (qNeg q) r hnq
      unfold rMulCandidate
      rw [rOfQ_neg q, rOfQ_neg r, hPP, hNN, hPN, hNP]
      rw [rAdd_zero_left, rAdd_zero_right]
      rw [rOfQ_neg]
      apply congrArg rOfQ
      calc
        qNeg (qMul q (qNeg r)) = qNeg (qNeg (qMul q r)) :=
          congrArg qNeg (qMul_neg_right q r)
        _ = qMul q r := qNeg_involutive _
  · rcases qle_total qZero r with hrNonNeg | hrNonPos
    · have hnq : qLE qZero (qNeg q) := qneg_nonneg_of_nonpos hqNonPos
      have hnr : qLE (qNeg r) qZero := qneg_nonpos_of_nonneg hrNonNeg
      have hPP := rMulNonnegEnvelope_rOfQ_left_nonpos q r hqNonPos
      have hNN := rMulNonnegEnvelope_rOfQ_right_nonpos (qNeg q) (qNeg r) hnr
      have hPN := rMulNonnegEnvelope_rOfQ_left_nonpos q (qNeg r) hqNonPos
      have hNP := rMulNonnegEnvelope_rOfQ (qNeg q) r hnq hrNonNeg
      unfold rMulCandidate
      rw [rOfQ_neg q, rOfQ_neg r, hPP, hNN, hPN, hNP]
      rw [rAdd_zero_left, rAdd_zero_left]
      rw [rOfQ_neg]
      apply congrArg rOfQ
      calc
        qNeg (qMul (qNeg q) r) = qNeg (qNeg (qMul q r)) :=
          congrArg qNeg (qMul_neg_left q r)
        _ = qMul q r := qNeg_involutive _
    · have hnq : qLE qZero (qNeg q) := qneg_nonneg_of_nonpos hqNonPos
      have hnr : qLE qZero (qNeg r) := qneg_nonneg_of_nonpos hrNonPos
      have hPP := rMulNonnegEnvelope_rOfQ_left_nonpos q r hqNonPos
      have hNN := rMulNonnegEnvelope_rOfQ (qNeg q) (qNeg r) hnq hnr
      have hPN := rMulNonnegEnvelope_rOfQ_left_nonpos q (qNeg r) hqNonPos
      have hNP := rMulNonnegEnvelope_rOfQ_right_nonpos (qNeg q) r hrNonPos
      unfold rMulCandidate
      rw [rOfQ_neg q, rOfQ_neg r, hPP, hNN, hPN, hNP]
      rw [rAdd_zero_left, rAdd_zero_right, rNeg_zero, rAdd_zero_right]
      apply congrArg rOfQ
      exact qMul_neg_neg q r

end BOMA.R.DedekindSignedMulCandidate001
