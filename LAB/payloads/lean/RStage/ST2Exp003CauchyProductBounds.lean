/- ST2-EXP-003: rational product estimates under explicit symmetric bounds.
   This is a prerequisite for Cauchy multiplication, not a multiplication
   operation on the quotient and not a field-completion claim. -/
namespace BOMA.R.StageTwo.CauchyProductBounds003

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.CauchyProbe001
open BOMA.R.StageTwo.CauchyCloseness003
open BOMA.R.StageTwo.CauchyAdditive003
open BOMA.R.StageTwo.CauchyBounded003

/-- Negation in the right rational factor. -/
theorem qMul_neg_right (x y : QBOMA) :
    qMul x (qNeg y) = qNeg (qMul x y) := by
  calc
    qMul x (qNeg y) = qMul (qNeg y) x := qMul_comm x (qNeg y)
    _ = qNeg (qMul y x) := qMul_neg_left y x
    _ = qNeg (qMul x y) := congrArg qNeg (qMul_comm y x)

/-- The product of two negated rationals is the original product. -/
theorem qMul_neg_neg (x y : QBOMA) :
    qMul (qNeg x) (qNeg y) = qMul x y := by
  calc
    qMul (qNeg x) (qNeg y) = qNeg (qMul x (qNeg y)) :=
      qMul_neg_left x (qNeg y)
    _ = qNeg (qNeg (qMul x y)) := congrArg qNeg (qMul_neg_right x y)
    _ = qMul x y := qNeg_neg (qMul x y)

/-- A symmetric bound is preserved by negation. -/
theorem qAbsBound_neg {B x : QBOMA} (hx : qAbsBound B x) :
    qAbsBound B (qNeg x) := by
  constructor
  · exact qneg_reverses hx.2
  · simpa only [qNeg_neg] using qneg_reverses hx.1

/-- The upper half of the rational interval-product estimate. -/
theorem qMul_upper_of_bounds {B C x y : QBOMA}
    (hB : qLE qZero B) (hC : qLE qZero C)
    (hx : qAbsBound B x) (hy : qAbsBound C y) :
    qLE (qMul x y) (qMul B C) := by
  have hBC : qLE qZero (qMul B C) := qmul_nonneg hB hC
  rcases qle_total qZero x with hx0 | hx0
  · rcases qle_total qZero y with hy0 | hy0
    · exact qle_trans
        (qmul_mono_right_nonneg hx.2 hy0)
        (qmul_mono_left_nonneg hy.2 hB)
    · have hxy0 := qmul_mono_left_nonneg hy0 hx0
      rw [qMul_zero_right] at hxy0
      exact qle_trans hxy0 hBC
  · rcases qle_total qZero y with hy0 | hy0
    · have hxy0 := qmul_mono_right_nonneg hx0 hy0
      rw [qMul_zero_left] at hxy0
      exact qle_trans hxy0 hBC
    · have hnx : qLE qZero (qNeg x) := by
        have h := qneg_reverses hx0
        rw [BOMA.R.StageTwo.CauchyBounded003.qNeg_zero] at h
        exact h
      have hny : qLE qZero (qNeg y) := by
        have h := qneg_reverses hy0
        rw [BOMA.R.StageTwo.CauchyBounded003.qNeg_zero] at h
        exact h
      have hnxB : qLE (qNeg x) B := by
        simpa only [qNeg_neg] using qneg_reverses hx.1
      have hnyC : qLE (qNeg y) C := by
        simpa only [qNeg_neg] using qneg_reverses hy.1
      have hprod := qle_trans
        (qmul_mono_right_nonneg hnxB hny)
        (qmul_mono_left_nonneg hnyC hB)
      rw [qMul_neg_neg] at hprod
      exact hprod

/-- Products of symmetrically bounded rationals are symmetrically bounded. -/
theorem qAbsBound_mul {B C x y : QBOMA}
    (hB : qLE qZero B) (hC : qLE qZero C)
    (hx : qAbsBound B x) (hy : qAbsBound C y) :
    qAbsBound (qMul B C) (qMul x y) := by
  constructor
  · have hupper := qMul_upper_of_bounds hB hC (qAbsBound_neg hx) hy
    rw [qMul_neg_left] at hupper
    simpa only [qNeg_neg] using qneg_reverses hupper
  · exact qMul_upper_of_bounds hB hC hx hy

/-- Sums of symmetrically bounded rationals add their radii. -/
theorem qAbsBound_add {B C x y : QBOMA}
    (hx : qAbsBound B x) (hy : qAbsBound C y) :
    qAbsBound (qAdd B C) (qAdd x y) := by
  constructor
  · have h := qAdd_mono hx.1 hy.1
    rw [← qNeg_add] at h
    exact h
  · exact qAdd_mono hx.2 hy.2

/-- Algebraic decomposition of the difference between two products. -/
theorem q_product_difference (x y a b : QBOMA) :
    qAdd (qMul x (qAdd y (qNeg b)))
      (qMul b (qAdd x (qNeg a))) =
    qAdd (qMul x y) (qNeg (qMul a b)) := by
  rw [qMul_add_right, qMul_add_right, qMul_neg_right, qMul_neg_right]
  rw [qMul_comm b x, qMul_comm b a]
  exact q_difference_chain (qMul x y) (qMul x b) (qMul a b)

/-- Product closeness from a common endpoint bound and an explicit scale. -/
theorem qClose_mul_of_common_bound
    {eps delta K x a y b : QBOMA}
    (hK : qLE qZero K) (hdelta : qLE qZero delta)
    (hscale : qAdd (qMul K delta) (qMul K delta) = eps)
    (hx : qAbsBound K x) (ha : qAbsBound K a)
    (hy : qAbsBound K y) (hb : qAbsBound K b)
    (hxa : qClose delta x a) (hyb : qClose delta y b) :
    qClose eps (qMul x y) (qMul a b) := by
  have hfirst : qAbsBound (qMul K delta)
      (qMul x (qAdd y (qNeg b))) :=
    qAbsBound_mul hK hdelta hx hyb
  have hsecond : qAbsBound (qMul K delta)
      (qMul b (qAdd x (qNeg a))) :=
    qAbsBound_mul hK hdelta hb hxa
  have hsum := qAbsBound_add hfirst hsecond
  rw [hscale] at hsum
  change qAbsBound eps
    (qAdd (qMul x y) (qNeg (qMul a b)))
  rw [← q_product_difference]
  exact hsum

/-- Product-estimate milestone retaining the verified boundedness producer. -/
structure CauchyProductBoundCertificate where
  boundedCertificate : CauchyBoundedCertificate
  boundMul : ∀ {B C x y : QBOMA},
    qLE qZero B → qLE qZero C →
    qAbsBound B x → qAbsBound C y →
    qAbsBound (qMul B C) (qMul x y)
  productCloseness : ∀ {eps delta K x a y b : QBOMA},
    qLE qZero K → qLE qZero delta →
    qAdd (qMul K delta) (qMul K delta) = eps →
    qAbsBound K x → qAbsBound K a →
    qAbsBound K y → qAbsBound K b →
    qClose delta x a → qClose delta y b →
    qClose eps (qMul x y) (qMul a b)

theorem cauchyProductBoundCertificate : CauchyProductBoundCertificate where
  boundedCertificate := cauchyBoundedCertificate
  boundMul := @qAbsBound_mul
  productCloseness := @qClose_mul_of_common_bound

end BOMA.R.StageTwo.CauchyProductBounds003
