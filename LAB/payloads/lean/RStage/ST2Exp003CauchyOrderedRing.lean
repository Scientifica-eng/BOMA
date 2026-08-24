/- ST2-EXP-003: compatibility of the total approximate Cauchy order with
   addition and nonnegative multiplication. Inverses and completeness remain
   separate obligations. -/
namespace BOMA.R.StageTwo.CauchyOrderedRing003

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
open BOMA.R.StageTwo.CauchyProductBounds003
open BOMA.R.StageTwo.CauchyMultiplicative003
open BOMA.R.StageTwo.CauchyOrderCore003
open BOMA.R.StageTwo.CauchyOrderTotal003

/-- Reassociate a translated epsilon after adding a common term. -/
theorem q_add_error_translate (v eps w : QBOMA) :
    qAdd (qAdd v eps) w = qAdd (qAdd v w) eps := by
  calc
    qAdd (qAdd v eps) w = qAdd v (qAdd eps w) := qAdd_assoc v eps w
    _ = qAdd v (qAdd w eps) :=
      congrArg (fun t => qAdd v t) (qAdd_comm eps w)
    _ = qAdd (qAdd v w) eps := (qAdd_assoc v w eps).symm

/-- Approximate order is preserved by a common pointwise right addend. -/
theorem cauchyLE_add_right {u v : CauchySeq}
    (h : CauchyLE u v) (w : CauchySeq) :
    CauchyLE (cAddSeq u w) (cAddSeq v w) := by
  intro eps heps
  rcases h eps heps with ⟨N, hN⟩
  refine ⟨N, ?_⟩
  intro n hn
  have ht := qadd_mono_right (hN n hn) (w.seq n)
  rw [q_add_error_translate] at ht
  exact ht

/-- Quotient approximate order is preserved by a common right addend. -/
theorem rcle_add_right {x y : RCBOMA} (h : rCLE x y) (z : RCBOMA) :
    rCLE (rCAdd x z) (rCAdd y z) := by
  refine Quotient.inductionOn x ?_ h
  intro u huy
  refine Quotient.inductionOn y ?_ huy
  intro v huv
  refine Quotient.inductionOn z ?_ huv
  intro w huv'
  exact cauchyLE_add_right huv' w

/-- Cancelling an added epsilon on the right. -/
theorem q_add_cancel_right (x eps : QBOMA) :
    qAdd (qAdd x eps) (qNeg eps) = x := by
  calc
    qAdd (qAdd x eps) (qNeg eps) = qAdd x (qAdd eps (qNeg eps)) :=
      qAdd_assoc x eps (qNeg eps)
    _ = qAdd x qZero := by rw [qAdd_neg_right]
    _ = x := qAdd_zero_right x

/-- Approximate quotient nonnegativity gives a representative lower bound. -/
theorem qLE_zero_add_to_lower {eps x : QBOMA}
    (h : qLE qZero (qAdd x eps)) : qLE (qNeg eps) x := by
  have ht := qadd_mono_right h (qNeg eps)
  rw [qAdd_zero_left, q_add_cancel_right] at ht
  exact ht

/-- A representative lower bound returns approximate nonnegativity. -/
theorem qLower_to_zero_add {eps x : QBOMA}
    (h : qLE (qNeg eps) x) : qLE qZero (qAdd x eps) := by
  have ht := qadd_mono_right h eps
  rw [qAdd_neg_left] at ht
  exact ht

/-- Signed rational product lower bound from symmetric size bounds and
    approximate nonnegativity of both factors. -/
theorem qMul_approx_nonneg_lower
    {eps delta K x y : QBOMA}
    (heps : qLE qZero eps) (hdelta : qLE qZero delta)
    (hK : qLE qZero K)
    (hscale : qAdd (qMul K delta) (qMul K delta) = eps)
    (hx : qAbsBound K x) (hy : qAbsBound K y)
    (hxLower : qLE (qNeg delta) x)
    (hyLower : qLE (qNeg delta) y) :
    qLE (qNeg eps) (qMul x y) := by
  have htermNonNeg : qLE qZero (qMul K delta) := qmul_nonneg hK hdelta
  have htermEps : qLE (qMul K delta) eps := by
    have h := qadd_mono_right htermNonNeg (qMul K delta)
    rw [qAdd_zero_left, hscale] at h
    exact h
  have hnegEpsZero : qLE (qNeg eps) qZero := by
    have h := qneg_reverses heps
    rw [BOMA.R.StageTwo.CauchyBounded003.qNeg_zero] at h
    exact h
  rcases qle_total qZero x with hx0 | hx0
  · rcases qle_total qZero y with hy0 | hy0
    · exact qle_trans hnegEpsZero (qmul_nonneg hx0 hy0)
    · have hproductLower := qmul_mono_left_nonneg hyLower hx0
      rw [qMul_neg_right] at hproductLower
      have hxTerm := qmul_mono_right_nonneg hx.2 hdelta
      have hneg := qneg_reverses (qle_trans hxTerm htermEps)
      exact qle_trans hneg hproductLower
  · rcases qle_total qZero y with hy0 | hy0
    · have hproductLower := qmul_mono_right_nonneg hxLower hy0
      rw [qMul_neg_left] at hproductLower
      have hyTerm := qmul_mono_right_nonneg hy.2 hdelta
      rw [qMul_comm y delta] at hyTerm
      have hneg := qneg_reverses (qle_trans hyTerm htermEps)
      exact qle_trans hneg hproductLower
    · have hnx : qLE qZero (qNeg x) := by
        have h := qneg_reverses hx0
        rw [BOMA.R.StageTwo.CauchyBounded003.qNeg_zero] at h
        exact h
      have hny : qLE qZero (qNeg y) := by
        have h := qneg_reverses hy0
        rw [BOMA.R.StageTwo.CauchyBounded003.qNeg_zero] at h
        exact h
      have hprod := qmul_nonneg hnx hny
      rw [qMul_neg_neg] at hprod
      exact qle_trans hnegEpsZero hprod

/-- Pointwise multiplication of two approximately nonnegative Cauchy
    representatives is approximately nonnegative. -/
theorem cauchyLE_mul_nonneg (u v : CauchySeq)
    (hu : CauchyLE (cauchyOfQ qZero) u)
    (hv : CauchyLE (cauchyOfQ qZero) v) :
    CauchyLE (cauchyOfQ qZero) (cMulSeq u v) := by
  rcases pair_common_eventual_bound u v with ⟨K, hK, Nb, hNb⟩
  intro eps heps
  rcases product_delta_exists heps hK with ⟨delta, hdelta, hscale⟩
  rcases hu delta hdelta with ⟨Nu, hNu⟩
  rcases hv delta hdelta with ⟨Nv, hNv⟩
  rcases common_upper_bound Nb Nu with ⟨Nbu, hNbNbu, hNuNbu⟩
  rcases common_upper_bound Nbu Nv with ⟨N, hNbuN, hNvN⟩
  refine ⟨N, ?_⟩
  intro n hn
  rcases hNb n (le_trans hNbNbu (le_trans hNbuN hn)) with ⟨hUn, hVn⟩
  have hULower := qLE_zero_add_to_lower
    (hNu n (le_trans hNuNbu (le_trans hNbuN hn)))
  have hVLower := qLE_zero_add_to_lower (hNv n (le_trans hNvN hn))
  exact qLower_to_zero_add
    (qMul_approx_nonneg_lower heps.1 hdelta.1 hK.1 hscale
      hUn hVn hULower hVLower)

/-- Quotient multiplication preserves nonnegativity. -/
theorem rcle_mul_nonneg {x y : RCBOMA}
    (hx : rCLE rCZero x) (hy : rCLE rCZero y) :
    rCLE rCZero (rCMul x y) := by
  refine Quotient.inductionOn x ?_ hx hy
  intro u hxu hyu
  refine Quotient.inductionOn y ?_ hxu hyu
  intro v h0u h0v
  exact cauchyLE_mul_nonneg u v h0u h0v

/-- Independently assembled ordered-commutative-ring-strength certificate. -/
structure CauchyOrderedRingCertificate where
  totalOrderCertificate : CauchyTotalOrderCertificate
  addMonotoneRight : ∀ {x y : RCBOMA}, rCLE x y →
    ∀ z : RCBOMA, rCLE (rCAdd x z) (rCAdd y z)
  mulNonnegative : ∀ {x y : RCBOMA},
    rCLE rCZero x → rCLE rCZero y → rCLE rCZero (rCMul x y)

theorem cauchyOrderedRingCertificate : CauchyOrderedRingCertificate where
  totalOrderCertificate := cauchyTotalOrderCertificate
  addMonotoneRight := @rcle_add_right
  mulNonnegative := @rcle_mul_nonneg

end BOMA.R.StageTwo.CauchyOrderedRing003
