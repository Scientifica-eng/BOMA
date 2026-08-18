/- Distributivity of the nonnegative-envelope multiplication kernel over
addition on nonnegative right inputs. -/
namespace BOMA.R.DedekindNonnegativeMulDistributivity001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindAdditionEmbedding001
open BOMA.R.DedekindAdditionLaws001
open BOMA.R.DedekindPositivePart001
open BOMA.R.DedekindNonnegativeMul001
open BOMA.R.DedekindNonnegativeMulLaws001
open BOMA.R.QPositiveMultiplicativeApprox001

/-- Strict addition monotonicity in both arguments. -/
theorem qadd_lt_mono {a a' b b' : QBOMA}
    (ha : qLT a a') (hb : qLT b b') :
    qLT (qAdd a b) (qAdd a' b') := by
  have h1 : qLT (qAdd a b) (qAdd a' b) := qlt_add_right ha b
  have h2raw : qLT (qAdd b a') (qAdd b' a') := qlt_add_right hb a'
  have h2 : qLT (qAdd a' b) (qAdd a' b') := by
    rw [qAdd_comm a' b, qAdd_comm a' b']
    exact h2raw
  exact qlt_trans h1 h2

/-- Any strict inequality below a sum admits two strictly interior summands. -/
theorem q_sum_inner_approx {q u v : QBOMA}
    (h : qLT q (qAdd u v)) :
    ∃ u' v' : QBOMA,
      qLT u' u ∧ qLT v' v ∧ qLT q (qAdd u' v') := by
  have hqu : qLT (qAdd q (qNeg v)) u := qlt_sub_right_of_lt_add h
  rcases rational_order_dense hqu with ⟨u', hqvu, hu'u⟩
  have hquv : qLT q (qAdd u' v) := qlt_add_back_right hqvu
  have hqv : qLT (qAdd q (qNeg u')) v := qlt_sub_left_of_lt_add hquv
  rcases rational_order_dense hqv with ⟨v', hqu'v, hv'v⟩
  have hsum : qLT q (qAdd u' v') := qlt_add_back_left hqu'v
  exact ⟨u', v', hu'u, hv'v, hsum⟩

/-- If the left summand cut contains zero, adding it contains the right cut. -/
theorem cut_le_add_of_zero_le_left
    (B C : LowerCut)
    (h0B : CutLE (principalCut qZero) B) :
    CutLE C (cutAdd B C) := by
  intro q hqC
  rcases C.rounded hqC with ⟨c, hcC, hqc⟩
  have hdiff0 : qLT (qAdd q (qNeg c)) qZero := by
    have ht := qlt_add_right hqc (qNeg c)
    rw [qAdd_neg_right] at ht
    exact ht
  rcases rational_order_dense hdiff0 with ⟨b, hdiffb, hb0⟩
  have hbB : B.lower b := h0B b hb0
  have hqbc : qLT q (qAdd b c) := qlt_add_back_right hdiffb
  exact ⟨b, c, hbB, hcC, hqbc⟩

/-- If the right summand cut contains zero, adding it contains the left cut. -/
theorem cut_le_add_of_zero_le_right
    (B C : LowerCut)
    (h0C : CutLE (principalCut qZero) C) :
    CutLE B (cutAdd B C) := by
  intro q hqB
  have hqCB : (cutAdd C B).lower q :=
    cut_le_add_of_zero_le_left C B h0C q hqB
  exact (cutAdd_comm_equiv C B q).mp hqCB

/-- Sum of two nonnegative cuts is nonnegative. -/
theorem cutAdd_nonneg
    (B C : LowerCut)
    (h0B : CutLE (principalCut qZero) B)
    (h0C : CutLE (principalCut qZero) C) :
    CutLE (principalCut qZero) (cutAdd B C) :=
  cutLE_trans h0B (cut_le_add_of_zero_le_right B C h0C)

/-- Any rational strictly below a positive-factor product belongs to the kernel;
if the second factor is nonpositive the rational is automatically negative,
and if it is positive the explicit product witness is used. -/
theorem below_product_mem_kernel
    {A B : LowerCut} {a b t : QBOMA}
    (ha : (cutPosPart A).lower a)
    (hb : (cutPosPart B).lower b)
    (h0a : qLT qZero a)
    (ht : qLT t (qMul a b)) :
    (cutMulNonnegEnvelope A B).lower t := by
  rcases qlt_trichotomy b qZero with hb0 | hbeq | h0b
  · have hp0 : qLE (qMul a b) qZero := by
      have hm := qmul_mono_left_nonneg hb0.1 h0a.1
      rw [qMul_zero_right] at hm
      exact hm
    exact Or.inl (qlt_le_trans ht hp0)
  · have ht0 : qLT t qZero := by
      rw [hbeq, qMul_zero_right] at ht
      exact ht
    exact Or.inl ht0
  · exact Or.inr ⟨a, b, ha, hb, h0a, h0b, ht⟩

/-- A sum of two strict negatives is strict negative. -/
theorem qadd_lt_zero_of_neg {u v : QBOMA}
    (hu : qLT u qZero) (hv : qLT v qZero) :
    qLT (qAdd u v) qZero := by
  have h := qadd_lt_mono hu hv
  rw [qAdd_zero_left] at h
  exact h

/-- A sum of two positive rationals is positive. -/
theorem qzero_lt_add_of_pos {u v : QBOMA}
    (hu : qLT qZero u) (hv : qLT qZero v) :
    qLT qZero (qAdd u v) := by
  have h := qadd_lt_mono hu hv
  rw [qAdd_zero_left] at h
  exact h

/-- A positive sum witness b+c actually belongs to B+C when b∈B and c∈C,
using roundedness to create the strict witness required by cutAdd. -/
theorem sum_member_cutAdd
    {B C : LowerCut} {b c : QBOMA}
    (hb : B.lower b) (hc : C.lower c) :
    (cutAdd B C).lower (qAdd b c) := by
  rcases B.rounded hb with ⟨b', hb'B, hbb'⟩
  rcases C.rounded hc with ⟨c', hc'C, hcc'⟩
  have hsum : qLT (qAdd b c) (qAdd b' c') := qadd_lt_mono hbb' hcc'
  exact ⟨b', c', hb'B, hc'C, hsum⟩

/-- Distributivity of the nonnegative-envelope kernel in the right input,
provided both summand cuts are nonnegative. -/
theorem cutMulNonnegEnvelope_add_right_of_nonneg
    (A B C : LowerCut)
    (h0B : CutLE (principalCut qZero) B)
    (h0C : CutLE (principalCut qZero) C) :
    CutEquiv
      (cutMulNonnegEnvelope A (cutAdd B C))
      (cutAdd (cutMulNonnegEnvelope A B) (cutMulNonnegEnvelope A C)) := by
  have hBC0 : CutLE (principalCut qZero) (cutAdd B C) :=
    cutAdd_nonneg B C h0B h0C
  have hBpos : CutEquiv (cutPosPart B) B := cutPosPart_of_nonneg h0B
  have hCpos : CutEquiv (cutPosPart C) C := cutPosPart_of_nonneg h0C
  have hBCpos : CutEquiv (cutPosPart (cutAdd B C)) (cutAdd B C) :=
    cutPosPart_of_nonneg hBC0
  have hRHS0 :
      CutLE (principalCut qZero)
        (cutAdd (cutMulNonnegEnvelope A B) (cutMulNonnegEnvelope A C)) :=
    cutAdd_nonneg
      (cutMulNonnegEnvelope A B)
      (cutMulNonnegEnvelope A C)
      (cutZero_le_mulNonneg A B)
      (cutZero_le_mulNonneg A C)
  intro q
  constructor
  · intro hq
    rcases hq with hqNeg | hqProd
    · exact hRHS0 q hqNeg
    · rcases hqProd with ⟨a, d, ha, hdPos, h0a, h0d, hqad⟩
      have hd : (cutAdd B C).lower d := (hBCpos d).mp hdPos
      rcases hd with ⟨b, c, hb, hc, hdbc⟩
      have hadsum : qLT (qMul a d) (qAdd (qMul a b) (qMul a c)) := by
        have hm := qmul_lt_left_positive hdbc h0a
        rw [qMul_add_right] at hm
        exact hm
      have hqsum : qLT q (qAdd (qMul a b) (qMul a c)) :=
        qlt_trans hqad hadsum
      rcases q_sum_inner_approx hqsum with ⟨u, v, hu, hv, hquv⟩
      have huK : (cutMulNonnegEnvelope A B).lower u :=
        below_product_mem_kernel ha (Or.inl hb) h0a hu
      have hvK : (cutMulNonnegEnvelope A C).lower v :=
        below_product_mem_kernel ha (Or.inl hc) h0a hv
      exact ⟨u, v, huK, hvK, hquv⟩
  · intro hq
    rcases hq with ⟨u, v, huK, hvK, hquv⟩
    rcases huK with huNeg | huProd
    · rcases hvK with hvNeg | hvProd
      · have huv0 : qLT (qAdd u v) qZero := qadd_lt_zero_of_neg huNeg hvNeg
        exact Or.inl (qlt_trans hquv huv0)
      · rcases hvProd with ⟨a, c, ha, hcPos, h0a, h0c, hvac⟩
        have hcC : C.lower c := (hCpos c).mp hcPos
        have hcBC : (cutAdd B C).lower c :=
          cut_le_add_of_zero_le_left B C h0B c hcC
        have huv_v : qLT (qAdd u v) v := by
          have ht := qlt_add_right huNeg v
          rw [qAdd_zero_left] at ht
          exact ht
        have hqac : qLT q (qMul a c) :=
          qlt_trans hquv (qlt_trans huv_v hvac)
        exact Or.inr ⟨a, c, ha, Or.inl hcBC, h0a, h0c, hqac⟩
    · rcases huProd with ⟨a1, b, ha1, hbPos, h0a1, h0b, huab⟩
      rcases hvK with hvNeg | hvProd
      · have hbB : B.lower b := (hBpos b).mp hbPos
        have hbBC : (cutAdd B C).lower b :=
          cut_le_add_of_zero_le_right B C h0C b hbB
        have huv_u : qLT (qAdd u v) u := by
          have ht := qlt_add_right hvNeg u
          rw [qAdd_zero_left, qAdd_comm v u] at ht
          exact ht
        have hqab : qLT q (qMul a1 b) :=
          qlt_trans hquv (qlt_trans huv_u huab)
        exact Or.inr ⟨a1, b, ha1, Or.inl hbBC, h0a1, h0b, hqab⟩
      · rcases hvProd with ⟨a2, c, ha2, hcPos, h0a2, h0c, hvac⟩
        have hbB : B.lower b := (hBpos b).mp hbPos
        have hcC : C.lower c := (hCpos c).mp hcPos
        rcases qle_total a1 a2 with h12 | h21
        · rcases (cutPosPart A).rounded ha2 with ⟨a, ha, ha2a⟩
          have ha1a : qLT a1 a := qle_lt_trans h12 ha2a
          have h0a : qLT qZero a := qlt_trans h0a1 ha1a
          have huab' : qLT u (qMul a b) :=
            qlt_trans huab (qmul_lt_right_positive ha1a h0b)
          have hvac' : qLT v (qMul a c) :=
            qlt_trans hvac (qmul_lt_right_positive ha2a h0c)
          have hquv' : qLT q (qAdd (qMul a b) (qMul a c)) :=
            qlt_trans hquv (qadd_lt_mono huab' hvac')
          have hqprod : qLT q (qMul a (qAdd b c)) := by
            rw [qMul_add_right]
            exact hquv'
          have hbc : (cutAdd B C).lower (qAdd b c) :=
            sum_member_cutAdd hbB hcC
          have h0bc : qLT qZero (qAdd b c) := qzero_lt_add_of_pos h0b h0c
          exact Or.inr ⟨a, qAdd b c, ha, Or.inl hbc, h0a, h0bc, hqprod⟩
        · rcases (cutPosPart A).rounded ha1 with ⟨a, ha, ha1a⟩
          have ha2a : qLT a2 a := qle_lt_trans h21 ha1a
          have h0a : qLT qZero a := qlt_trans h0a2 ha2a
          have huab' : qLT u (qMul a b) :=
            qlt_trans huab (qmul_lt_right_positive ha1a h0b)
          have hvac' : qLT v (qMul a c) :=
            qlt_trans hvac (qmul_lt_right_positive ha2a h0c)
          have hquv' : qLT q (qAdd (qMul a b) (qMul a c)) :=
            qlt_trans hquv (qadd_lt_mono huab' hvac')
          have hqprod : qLT q (qMul a (qAdd b c)) := by
            rw [qMul_add_right]
            exact hquv'
          have hbc : (cutAdd B C).lower (qAdd b c) :=
            sum_member_cutAdd hbB hcC
          have h0bc : qLT qZero (qAdd b c) := qzero_lt_add_of_pos h0b h0c
          exact Or.inr ⟨a, qAdd b c, ha, Or.inl hbc, h0a, h0bc, hqprod⟩

/-- Quotient distributive interface on nonnegative right inputs. -/
theorem rMulNonnegEnvelope_add_right_of_nonneg
    (x y z : RBOMA)
    (h0y : rLE rZero y)
    (h0z : rLE rZero z) :
    rMulNonnegEnvelope x (rAdd y z) =
    rAdd (rMulNonnegEnvelope x y) (rMulNonnegEnvelope x z) := by
  refine Quotient.inductionOn x ?_
  intro A
  refine Quotient.inductionOn y ?_ h0y
  intro B h0B
  refine Quotient.inductionOn z ?_ h0z
  intro C h0C
  have hBcut : CutLE (principalCut qZero) B := by
    change rLE (rmk (principalCut qZero)) (rmk B) at h0B
    exact (rLE_mk_iff (principalCut qZero) B).1 h0B
  have hCcut : CutLE (principalCut qZero) C := by
    change rLE (rmk (principalCut qZero)) (rmk C) at h0C
    exact (rLE_mk_iff (principalCut qZero) C).1 h0C
  change
    rmk (cutMulNonnegEnvelope A (cutAdd B C)) =
    rmk (cutAdd (cutMulNonnegEnvelope A B) (cutMulNonnegEnvelope A C))
  exact rmk_sound (cutMulNonnegEnvelope_add_right_of_nonneg A B C hBcut hCcut)

end BOMA.R.DedekindNonnegativeMulDistributivity001
