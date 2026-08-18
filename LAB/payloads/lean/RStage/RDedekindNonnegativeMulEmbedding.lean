/- Rational preservation for the nonnegative-envelope Dedekind multiplication kernel. -/
namespace BOMA.R.DedekindNonnegativeMulEmbedding001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindPositivePart001
open BOMA.R.DedekindNonnegativeMul001
open BOMA.R.QPositiveMultiplicativeApprox001

/-- Principal zero inclusion into a nonnegative principal rational cut. -/
theorem principal_zero_le_principal {q : QBOMA} (hq : qLE qZero q) :
    CutLE (principalCut qZero) (principalCut q) := by
  intro x hx
  exact (principalLE_iff_qLE qZero q).2 hq x hx

/-- For a nonnegative rational q, max(principal(q),0) is just principal(q). -/
theorem cutPosPart_principal_nonneg {q : QBOMA} (hq : qLE qZero q) :
    CutEquiv (cutPosPart (principalCut q)) (principalCut q) :=
  cutPosPart_of_nonneg (principal_zero_le_principal hq)

/-- The positive-envelope multiplication kernel agrees extensionally with
ordinary rational multiplication on nonnegative principal cuts. -/
theorem cutMulNonnegEnvelope_principal
    (q r : QBOMA)
    (hq : qLE qZero q)
    (hr : qLE qZero r) :
    CutEquiv
      (cutMulNonnegEnvelope (principalCut q) (principalCut r))
      (principalCut (qMul q r)) := by
  intro x
  constructor
  · intro hx
    rcases hx with hxNeg | hxProd
    · have hqrNonNeg : qLE qZero (qMul q r) := qmul_nonneg hq hr
      exact qle_lt_trans hxNeg hqrNonNeg
    · rcases hxProd with ⟨a, b, haPosCut, hbPosCut, h0a, h0b, hxab⟩
      have haQ : qLT a q :=
        ((cutPosPart_principal_nonneg hq) a).mp haPosCut
      have hbR : qLT b r :=
        ((cutPosPart_principal_nonneg hr) b).mp hbPosCut
      have hab_qb : qLE (qMul a b) (qMul q b) :=
        qmul_mono_right_nonneg haQ.1 h0b.1
      have hqb_qr : qLE (qMul q b) (qMul q r) :=
        qmul_mono_left_nonneg hbR.1 hq
      have hab_qr : qLE (qMul a b) (qMul q r) :=
        qle_trans hab_qb hqb_qr
      exact qlt_le_trans hxab hab_qr
  · intro hx
    rcases qlt_trichotomy x qZero with hxNeg | hxEq | hxPos
    · exact Or.inl hxNeg
    · have hx0 : qLE qZero x := by
        rw [hxEq]
        exact qle_refl qZero
      have hrNZ : qZero ≠ r := by
        intro h0r
        have hprod0 : qMul q r = qZero := by
          rw [← h0r, qMul_zero_right]
        have hxlt0 : qLT x qZero := by
          rw [← hprod0]
          exact hx
        have hxeq0 : x = qZero := qle_antisymm hxlt0.1 hx0
        exact hxlt0.2 hxeq0
      have hrPos : qLT qZero r := ⟨hr, hrNZ⟩
      rcases q_positive_product_inner_approx hx0 hrPos hx with
        ⟨a, b, h0a, haq, h0b, hbr, hxab⟩
      exact Or.inr ⟨a, b, Or.inl haq, Or.inl hbr, h0a, h0b, hxab⟩
    · have hx0 : qLE qZero x := hxPos.1
      have hrNZ : qZero ≠ r := by
        intro h0r
        have hprod0 : qMul q r = qZero := by
          rw [← h0r, qMul_zero_right]
        have hxlt0 : qLT x qZero := by
          rw [← hprod0]
          exact hx
        exact (qlt_asymm hxPos) hxlt0
      have hrPos : qLT qZero r := ⟨hr, hrNZ⟩
      rcases q_positive_product_inner_approx hx0 hrPos hx with
        ⟨a, b, h0a, haq, h0b, hbr, hxab⟩
      exact Or.inr ⟨a, b, Or.inl haq, Or.inl hbr, h0a, h0b, hxab⟩

/-- The formal nonnegative-envelope multiplication kernel preserves accepted
rational multiplication on nonnegative rational inputs. -/
theorem rMulNonnegEnvelope_rOfQ
    (q r : QBOMA)
    (hq : qLE qZero q)
    (hr : qLE qZero r) :
    rMulNonnegEnvelope (rOfQ q) (rOfQ r) = rOfQ (qMul q r) := by
  change
    rmk (cutMulNonnegEnvelope (principalCut q) (principalCut r)) =
    rmk (principalCut (qMul q r))
  exact rmk_sound (cutMulNonnegEnvelope_principal q r hq hr)

end BOMA.R.DedekindNonnegativeMulEmbedding001
