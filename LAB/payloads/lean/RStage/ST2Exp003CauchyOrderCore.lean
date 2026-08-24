/- ST2-EXP-003: representative-invariant approximate order on the independent
   Cauchy quotient. This file establishes partial-order strength and faithful
   rational order extension; totality remains a separate obligation. -/
namespace BOMA.R.StageTwo.CauchyOrderCore003

open BOMA.NCore.RB001
open BOMA.NArithmetic.Order001
open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.CauchyProbe001
open BOMA.R.StageTwo.CauchyCloseness003
open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyAdditive003
open BOMA.R.StageTwo.CauchyBounded003
open BOMA.R.StageTwo.CauchyMultiplicative003

/-- Upper epsilon-closeness is ordinary order after adding epsilon. -/
theorem qClose_to_le_add {eps x y : QBOMA} (h : qClose eps x y) :
    qLE x (qAdd y eps) := by
  have ht := qadd_mono_right h.2 y
  rw [q_difference_cancel_right, qAdd_comm eps y] at ht
  exact ht

/-- Cancelling the right endpoint from an ordered epsilon translate. -/
theorem q_sum_sub_right (y eps : QBOMA) :
    qAdd (qAdd y eps) (qNeg y) = eps := by
  calc
    qAdd (qAdd y eps) (qNeg y) = qAdd y (qAdd eps (qNeg y)) :=
      qAdd_assoc y eps (qNeg y)
    _ = qAdd y (qAdd (qNeg y) eps) :=
      congrArg (fun t => qAdd y t) (qAdd_comm eps (qNeg y))
    _ = qAdd (qAdd y (qNeg y)) eps :=
      (qAdd_assoc y (qNeg y) eps).symm
    _ = qAdd qZero eps := by rw [qAdd_neg_right]
    _ = eps := qAdd_zero_left eps

/-- An epsilon translate bound is exactly an upper difference bound. -/
theorem qLE_add_to_difference_upper {eps x y : QBOMA}
    (h : qLE x (qAdd y eps)) :
    qLE (qAdd x (qNeg y)) eps := by
  have ht := qadd_mono_right h (qNeg y)
  rw [q_sum_sub_right] at ht
  exact ht

/-- Approximate non-strict order between Cauchy representatives. -/
def CauchyLE (u v : CauchySeq) : Prop :=
  ∀ eps : QBOMA, qPos eps →
    ∃ N : BOMANat, ∀ n : BOMANat, LE N n →
      qLE (u.seq n) (qAdd (v.seq n) eps)

theorem cauchyLE_refl (u : CauchySeq) : CauchyLE u u := by
  intro eps heps
  refine ⟨BOMANat.z, ?_⟩
  intro n hn
  have h := qadd_mono_right heps.1 (u.seq n)
  rw [qAdd_zero_left, qAdd_comm eps (u.seq n)] at h
  exact h

theorem cauchyLE_trans {u v w : CauchySeq}
    (huv : CauchyLE u v) (hvw : CauchyLE v w) : CauchyLE u w := by
  intro eps heps
  rcases positive_half_exists heps with ⟨delta, hdelta, hsum⟩
  rcases huv delta hdelta with ⟨Nu, hNu⟩
  rcases hvw delta hdelta with ⟨Nv, hNv⟩
  rcases common_upper_bound Nu Nv with ⟨N, hNuN, hNvN⟩
  refine ⟨N, ?_⟩
  intro n hn
  have ht := qadd_mono_right (hNv n (le_trans hNvN hn)) delta
  rw [qAdd_assoc, hsum] at ht
  exact qle_trans (hNu n (le_trans hNuN hn)) ht

/-- Replacing the left representative by an asymptotically equal one. -/
theorem cauchyLE_replace_left {u u' v : CauchySeq}
    (hu : CauchyEquiv u u') (hle : CauchyLE u v) : CauchyLE u' v := by
  intro eps heps
  rcases positive_half_exists heps with ⟨delta, hdelta, hsum⟩
  rcases hu delta hdelta with ⟨Nu, hNu⟩
  rcases hle delta hdelta with ⟨Nv, hNv⟩
  rcases common_upper_bound Nu Nv with ⟨N, hNuN, hNvN⟩
  refine ⟨N, ?_⟩
  intro n hn
  have hleft := qClose_to_le_add
    (qClose_symm (hNu n (le_trans hNuN hn)))
  have hright := qadd_mono_right (hNv n (le_trans hNvN hn)) delta
  rw [qAdd_assoc, hsum] at hright
  exact qle_trans hleft hright

/-- Replacing the right representative by an asymptotically equal one. -/
theorem cauchyLE_replace_right {u v v' : CauchySeq}
    (hv : CauchyEquiv v v') (hle : CauchyLE u v) : CauchyLE u v' := by
  intro eps heps
  rcases positive_half_exists heps with ⟨delta, hdelta, hsum⟩
  rcases hle delta hdelta with ⟨Nu, hNu⟩
  rcases hv delta hdelta with ⟨Nv, hNv⟩
  rcases common_upper_bound Nu Nv with ⟨N, hNuN, hNvN⟩
  refine ⟨N, ?_⟩
  intro n hn
  have hright := qadd_mono_right
    (qClose_to_le_add (hNv n (le_trans hNvN hn))) delta
  rw [qAdd_assoc, hsum] at hright
  exact qle_trans (hNu n (le_trans hNuN hn)) hright

/-- Approximate order is independent of both selected representatives. -/
theorem cauchyLE_respects {u u' v v' : CauchySeq}
    (hu : CauchyEquiv u u') (hv : CauchyEquiv v v') :
    CauchyLE u v ↔ CauchyLE u' v' := by
  constructor
  · intro h
    exact cauchyLE_replace_right hv (cauchyLE_replace_left hu h)
  · intro h
    exact cauchyLE_replace_right (cauchyEquiv_symm hv)
      (cauchyLE_replace_left (cauchyEquiv_symm hu) h)

/-- Opposite approximate inequalities force asymptotic equality. -/
theorem cauchyLE_antisymm {u v : CauchySeq}
    (huv : CauchyLE u v) (hvu : CauchyLE v u) : CauchyEquiv u v := by
  intro eps heps
  rcases huv eps heps with ⟨Nu, hNu⟩
  rcases hvu eps heps with ⟨Nv, hNv⟩
  rcases common_upper_bound Nu Nv with ⟨N, hNuN, hNvN⟩
  refine ⟨N, ?_⟩
  intro n hn
  constructor
  · have hrev := qneg_reverses
      (qLE_add_to_difference_upper (hNv n (le_trans hNvN hn)))
    rw [qNeg_difference] at hrev
    exact hrev
  · exact qLE_add_to_difference_upper (hNu n (le_trans hNuN hn))

/-- Approximate order descends to the quotient by the proved Iff transport. -/
def rCLE : RCBOMA → RCBOMA → Prop :=
  Quotient.lift₂
    (fun u v => CauchyLE u v)
    (fun _ _ _ _ hu hv => propext (cauchyLE_respects hu hv))

@[simp] theorem rCLE_mk (u v : CauchySeq) :
    rCLE (rCmk u) (rCmk v) ↔ CauchyLE u v := Iff.rfl

theorem rcle_refl (x : RCBOMA) : rCLE x x := by
  refine Quotient.inductionOn x ?_
  exact cauchyLE_refl

theorem rcle_trans {x y z : RCBOMA}
    (hxy : rCLE x y) (hyz : rCLE y z) : rCLE x z := by
  refine Quotient.inductionOn x ?_ hxy hyz
  intro u huy hyw
  refine Quotient.inductionOn y ?_ huy hyw
  intro v huv hvw
  refine Quotient.inductionOn z ?_ huv hvw
  intro w huv' hvw'
  exact cauchyLE_trans huv' hvw'

theorem rcle_antisymm {x y : RCBOMA}
    (hxy : rCLE x y) (hyx : rCLE y x) : x = y := by
  refine Quotient.inductionOn x ?_ hxy hyx
  intro u huv hvu
  refine Quotient.inductionOn y ?_ huv hvu
  intro v huv' hvu'
  exact Quotient.sound (cauchyLE_antisymm huv' hvu')

/-- The approximate quotient order exactly extends accepted rational order. -/
theorem rCOfQ_order (q r : QBOMA) :
    rCLE (rCOfQ q) (rCOfQ r) ↔ qLE q r := by
  constructor
  · intro h
    rcases qlt_trichotomy q r with hqr | hqr | hrq
    · exact hqr.1
    · rw [hqr]
      exact qle_refl r
    · have hd := positive_difference_of_lt hrq
      have hdpos : qPos (qAdd q (qNeg r)) :=
        ⟨hd.1, fun hz => hd.2 hz.symm⟩
      rcases positive_half_exists hdpos with ⟨delta, hdelta, hsum⟩
      rcases h delta hdelta with ⟨N, hN⟩
      have hqrDelta := hN N (le_refl N)
      have hqeq : qAdd r (qAdd q (qNeg r)) = q := by
        calc
          qAdd r (qAdd q (qNeg r)) = qAdd (qAdd r q) (qNeg r) :=
            (qAdd_assoc r q (qNeg r)).symm
          _ = qAdd (qAdd q r) (qNeg r) :=
            congrArg (fun t => qAdd t (qNeg r)) (qAdd_comm r q)
          _ = qAdd q (qAdd r (qNeg r)) := qAdd_assoc q r (qNeg r)
          _ = qAdd q qZero := by rw [qAdd_neg_right]
          _ = q := qAdd_zero_right q
      have hstrict := qlt_add_right hdelta (qAdd r delta)
      rw [qAdd_zero_left, qAdd_comm delta (qAdd r delta),
        qAdd_assoc, hsum, hqeq] at hstrict
      exact False.elim
        (hstrict.2 (qle_antisymm hstrict.1 hqrDelta))
  · intro hqr
    intro eps heps
    refine ⟨BOMANat.z, ?_⟩
    intro n hn
    have hinc := qadd_mono_right heps.1 r
    rw [qAdd_zero_left, qAdd_comm eps r] at hinc
    exact qle_trans hqr hinc

/-- Independently assembled partial-order-strength research certificate. -/
structure CauchyPartialOrderCertificate where
  ringCertificate : CauchyCommutativeRingCertificate
  orderRefl : ∀ x : RCBOMA, rCLE x x
  orderTrans : ∀ {x y z : RCBOMA}, rCLE x y → rCLE y z → rCLE x z
  orderAntisymm : ∀ {x y : RCBOMA}, rCLE x y → rCLE y x → x = y
  qEmbeddingOrder : ∀ q r : QBOMA, rCLE (rCOfQ q) (rCOfQ r) ↔ qLE q r

theorem cauchyPartialOrderCertificate : CauchyPartialOrderCertificate where
  ringCertificate := cauchyCommutativeRingCertificate
  orderRefl := rcle_refl
  orderTrans := @rcle_trans
  orderAntisymm := @rcle_antisymm
  qEmbeddingOrder := rCOfQ_order

end BOMA.R.StageTwo.CauchyOrderCore003
