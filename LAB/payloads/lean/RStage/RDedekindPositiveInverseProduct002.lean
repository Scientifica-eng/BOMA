/- Revised positive inverse-product theorem for the direct Dedekind reciprocal route.
Revision 002 consumes the corrected pure-Q gap estimate and preserves revision 001
as a proof-engineering learning artifact. -/
namespace BOMA.R.DedekindPositiveInverseProduct002

open BOMA.Q.Quotient001
open BOMA.Q.Inverse001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindPositivePart001
open BOMA.R.DedekindNonnegativeMul001
open BOMA.R.QPositiveMultiplicativeApprox001
open BOMA.R.DedekindPositiveReciprocal001
open BOMA.R.DedekindAnchoredBracket001
open BOMA.R.QReciprocalGap002

/-- Reverse inclusion for a nonnegative q below one. -/
theorem principal_one_mem_mul_recip_of_nonneg
    (A : LowerCut)
    (hApos : CutHasPositive A)
    {q : QBOMA}
    (h0q : qLE qZero q)
    (hq1 : qLT q qOne) :
    (cutMulNonnegEnvelope A (cutRecipPos A hApos)).lower q := by
  rcases hApos with ⟨a0, ha0A, h0a0⟩
  let omq := qAdd qOne (qNeg q)
  have homqRaw : QPositive omq := by
    unfold omq
    exact positive_difference_of_lt hq1
  have homq : qLT qZero omq :=
    ⟨homqRaw.1, fun hz => homqRaw.2 hz.symm⟩
  let eps := qMul omq a0
  have heps : qLT qZero eps := by
    have ht := qmul_lt_right_positive homq h0a0
    unfold eps
    rw [qMul_zero_left] at ht
    exact ht
  rcases cut_bracket_approx_anchored A a0 eps ha0A heps with
    ⟨a, r, haA, hrOut, ha0a, hgapPos, hgapSmall⟩
  have h0a : qLT qZero a := qlt_le_trans_gap h0a0 ha0a
  have har : qLT a r := cut_inside_lt_outside haA hrOut
  have h0r : qLT qZero r := qlt_trans h0a har
  have hrNZ : r ≠ qZero := by
    intro hr0
    exact h0r.2 hr0.symm
  rcases q_inverse_exists r hrNZ with ⟨rinv, hrinv⟩
  have hratio : qLT q (qMul a rinv) := by
    apply q_lt_mul_inverse_of_small_gap h0q hq1 h0a0 ha0a h0r hgapPos
    · unfold eps omq at hgapSmall
      exact hgapSmall
    · exact hrinv
  have h0rinv : qLT qZero rinv := qlt_zero_inverse h0r hrinv
  rcases q_positive_product_inner_approx h0q h0rinv hratio with
    ⟨a', b, h0a', ha'a, h0b, hbInv, hqab⟩
  have ha'A : A.lower a' := A.downward haA ha'a.1
  have hLocalPos : CutHasPositive A := ⟨a0, ha0A, h0a0⟩
  have hbLocal : (cutRecipPos A hLocalPos).lower b :=
    Or.inr ⟨r, rinv, hrOut, h0r, hrinv, hbInv⟩
  have hProofEq : CutEquiv (cutRecipPos A hLocalPos) (cutRecipPos A hApos) :=
    cutRecipPos_proof_independent A hLocalPos hApos
  have hbRecip : (cutRecipPos A hApos).lower b := (hProofEq b).mp hbLocal
  exact Or.inr ⟨a', b, Or.inl ha'A, Or.inl hbRecip, h0a', h0b, hqab⟩

/-- The direct positive reciprocal is a true multiplicative inverse at the
representation level. Fine cut bracketing is consumed only in the reverse
inclusion principalCut(1) ⊆ A*recip(A). -/
theorem cutMul_recipPos_equiv_one
    (A : LowerCut)
    (hApos : CutHasPositive A) :
    CutEquiv
      (cutMulNonnegEnvelope A (cutRecipPos A hApos))
      (principalCut qOne) := by
  intro q
  constructor
  · intro hq
    rcases hq with hqNeg | hqProd
    · exact qlt_trans hqNeg qzero_lt_one
    · rcases hqProd with ⟨a, b, haPos, hbPos, h0a, h0b, hqab⟩
      have haA : A.lower a := by
        rcases haPos with haA | haNeg
        · exact haA
        · exact False.elim ((qlt_asymm h0a) haNeg)
      have hbRecip : (cutRecipPos A hApos).lower b := by
        rcases hbPos with hbRecip | hbNeg
        · exact hbRecip
        · exact False.elim ((qlt_asymm h0b) hbNeg)
      rcases hbRecip with hbNeg | ⟨r, rinv, hrOut, h0r, hrinv, hbInv⟩
      · exact False.elim ((qlt_asymm h0b) hbNeg)
      · have har : qLT a r := cut_inside_lt_outside haA hrOut
        have h0rinv : qLT qZero rinv := qlt_zero_inverse h0r hrinv
        have hab_arinv : qLT (qMul a b) (qMul a rinv) :=
          qmul_lt_left_positive hbInv h0a
        have har_rinv : qLT (qMul a rinv) (qMul r rinv) :=
          qmul_lt_right_positive har h0rinv
        have hab1 : qLT (qMul a b) qOne := by
          have ht := qlt_trans hab_arinv har_rinv
          unfold QInvRel at hrinv
          rw [hrinv] at ht
          exact ht
        exact qlt_trans hqab hab1
  · intro hq1
    rcases qlt_trichotomy q qZero with hqNeg | hqEq | h0qStrict
    · exact Or.inl hqNeg
    · have h0q : qLE qZero q := by
        rw [hqEq]
        exact qle_refl qZero
      exact principal_one_mem_mul_recip_of_nonneg A hApos h0q hq1
    · exact principal_one_mem_mul_recip_of_nonneg A hApos h0qStrict.1 hq1

end BOMA.R.DedekindPositiveInverseProduct002
