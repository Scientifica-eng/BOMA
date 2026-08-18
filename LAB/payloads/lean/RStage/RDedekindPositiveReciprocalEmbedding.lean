/- Rational preservation for the direct positive Dedekind reciprocal candidate. -/
namespace BOMA.R.DedekindPositiveReciprocalEmbedding001

open BOMA.Q.Quotient001
open BOMA.Q.Inverse001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.QPositiveMultiplicativeApprox001
open BOMA.R.QInverseOrder001
open BOMA.R.DedekindPositiveReciprocal001

/-- A positive principal rational cut contains a strictly positive rational witness. -/
theorem principalCut_has_positive
    {q : QBOMA} (h0q : qLT qZero q) :
    CutHasPositive (principalCut q) := by
  rcases rational_order_dense h0q with ⟨a, h0a, haq⟩
  exact ⟨a, haq, h0a⟩

/-- An outside point of principalCut(q) lies at or above q. -/
theorem principal_outside_ge
    {q r : QBOMA}
    (hrOut : ¬ (principalCut q).lower r) :
    qLE q r := by
  rcases qle_total q r with hqr | hrq
  · exact hqr
  · by_cases heq : r = q
    · rw [heq]
      exact qle_refl q
    · have hrltq : qLT r q := ⟨hrq, heq⟩
      exact False.elim (hrOut hrltq)

/-- Two inverse witnesses for the same nonzero rational coincide. -/
theorem q_inverse_witness_unique
    {q a b : QBOMA}
    (hq0 : q ≠ qZero)
    (ha : QInvRel q a)
    (hb : QInvRel q b) : a = b := by
  unfold QInvRel at ha hb
  apply qMul_left_cancel_nonzero hq0
  exact ha.trans hb.symm

/-- On a positive principal rational cut, the direct reciprocal candidate is
exactly the principal cut of any accepted Q inverse witness. -/
theorem cutRecipPos_principal
    {q qinv : QBOMA}
    (h0q : qLT qZero q)
    (hqinv : QInvRel q qinv) :
    CutEquiv
      (cutRecipPos (principalCut q) (principalCut_has_positive h0q))
      (principalCut qinv) := by
  have h0qinv : qLT qZero qinv := qlt_zero_inverse h0q hqinv
  have hqNZ : q ≠ qZero := by
    intro hq0
    exact h0q.2 hq0.symm
  intro p
  constructor
  · intro hp
    rcases hp with hpNeg | ⟨r, rinv, hrOut, h0r, hrinv, hpRinv⟩
    · exact qlt_trans hpNeg h0qinv
    · have hqr : qLE q r := principal_outside_ge hrOut
      rcases qlt_trichotomy q r with hqrStrict | hEq | hrqStrict
      · have hrev : qLT rinv qinv :=
          q_inverse_strict_antitone h0q hqrStrict hqinv hrinv
        exact qlt_trans hpRinv hrev
      · have hsame : rinv = qinv := by
          have hrAsQ : QInvRel q rinv := by
            rw [hEq]
            exact hrinv
          exact q_inverse_witness_unique hqNZ hrAsQ hqinv
        rw [hsame] at hpRinv
        exact hpRinv
      · exact False.elim (hrOut hrqStrict)
  · intro hp
    rcases qlt_trichotomy p qZero with hpNeg | hpEq | h0p
    · exact Or.inl hpNeg
    · have hp0 : qLE qZero p := by
        rw [hpEq]
        exact qle_refl qZero
      rcases rational_order_dense hp with ⟨t, hpt, htqinv⟩
      have h0t : qLT qZero t := qlt_zero_of_nonneg_lt hp0 hpt
      have htNZ : t ≠ qZero := by
        intro ht0
        exact h0t.2 ht0.symm
      rcases q_inverse_exists t htNZ with ⟨r, htr⟩
      have hrt : QInvRel r t := by
        unfold QInvRel at htr ⊢
        calc
          qMul r t = qMul t r := qMul_comm r t
          _ = qOne := htr
      have hqinvq : QInvRel qinv q := by
        unfold QInvRel at hqinv ⊢
        calc
          qMul qinv q = qMul q qinv := qMul_comm qinv q
          _ = qOne := hqinv
      have hqr : qLT q r :=
        q_inverse_strict_antitone h0t htqinv htr hqinvq
      have hrOut : ¬ (principalCut q).lower r := by
        intro hrq
        exact (qlt_asymm hqr) hrq
      exact Or.inr ⟨r, t, hrOut,
        qlt_trans h0q hqr, hrt, hpt⟩
    · have hp0 : qLE qZero p := h0p.1
      rcases rational_order_dense hp with ⟨t, hpt, htqinv⟩
      have h0t : qLT qZero t := qlt_zero_of_nonneg_lt hp0 hpt
      have htNZ : t ≠ qZero := by
        intro ht0
        exact h0t.2 ht0.symm
      rcases q_inverse_exists t htNZ with ⟨r, htr⟩
      have hrt : QInvRel r t := by
        unfold QInvRel at htr ⊢
        calc
          qMul r t = qMul t r := qMul_comm r t
          _ = qOne := htr
      have hqinvq : QInvRel qinv q := by
        unfold QInvRel at hqinv ⊢
        calc
          qMul qinv q = qMul q qinv := qMul_comm qinv q
          _ = qOne := hqinv
      have hqr : qLT q r :=
        q_inverse_strict_antitone h0t htqinv htr hqinvq
      have hrOut : ¬ (principalCut q).lower r := by
        intro hrq
        exact (qlt_asymm hqr) hrq
      exact Or.inr ⟨r, t, hrOut,
        qlt_trans h0q hqr, hrt, hpt⟩

end BOMA.R.DedekindPositiveReciprocalEmbedding001
