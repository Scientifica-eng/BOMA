/- ST2-EXP-015 Gate C: independent Cauchy-native Route-Q ring and
field closure over the fixed RCBOMA scalar producer.

This source extends only the native Gate-B syntax quotient.  It derives ring
laws and witness-only nonzero inversion from the independently verified Cauchy
scalar laws.  It does not use a pair-carrier comparison or transport field laws
from another complex realization. -/
namespace BOMA.C.StageTwo.CauchyQField015

open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyAdditive003
open BOMA.R.StageTwo.CauchyMultiplicative003
open BOMA.R.StageTwo.CauchyOrderCore003
open BOMA.R.StageTwo.CauchyOrderTotal003
open BOMA.R.StageTwo.CauchyOrderedRing003
open BOMA.R.StageTwo.CauchyInverse003
open BOMA.R.StageTwo.CauchyLUB003
open BOMA.C.StageTwo.CauchyQRoute015

/-- Additive inverse witnesses are unique in the fixed Cauchy scalar. -/
theorem qf_scalar_add_inverse_unique {x y : RCBOMA}
    (hxy : rCAdd x y = rCZero) : y = rCNeg x := by
  calc
    y = rCAdd rCZero y := (rCAdd_zero_left y).symm
    _ = rCAdd (rCAdd x (rCNeg x)) y := by rw [rCAdd_neg_right x]
    _ = rCAdd x (rCAdd (rCNeg x) y) := rCAdd_assoc x (rCNeg x) y
    _ = rCAdd x (rCAdd y (rCNeg x)) := by
      rw [rCAdd_comm (rCNeg x) y]
    _ = rCAdd (rCAdd x y) (rCNeg x) :=
      (rCAdd_assoc x y (rCNeg x)).symm
    _ = rCAdd rCZero (rCNeg x) := by rw [hxy]
    _ = rCNeg x := rCAdd_zero_left (rCNeg x)

/-- Scalar negation is involutive. -/
theorem qf_scalar_neg_involutive (x : RCBOMA) : rCNeg (rCNeg x) = x := by
  have hleft : rCAdd (rCNeg x) x = rCZero := by
    calc
      rCAdd (rCNeg x) x = rCAdd x (rCNeg x) := rCAdd_comm (rCNeg x) x
      _ = rCZero := rCAdd_neg_right x
  exact (qf_scalar_add_inverse_unique hleft).symm

/-- Multiplication by a scalar additive inverse on the right negates a product. -/
theorem qf_scalar_mul_neg_right (x y : RCBOMA) :
    rCMul x (rCNeg y) = rCNeg (rCMul x y) := by
  have hd := rCMul_add_right x y (rCNeg y)
  have hsum :
      rCAdd (rCMul x y) (rCMul x (rCNeg y)) = rCZero := by
    calc
      rCAdd (rCMul x y) (rCMul x (rCNeg y)) =
          rCMul x (rCAdd y (rCNeg y)) := hd.symm
      _ = rCMul x rCZero := by rw [rCAdd_neg_right y]
      _ = rCZero := scalar_mul_zero_right x
  exact qf_scalar_add_inverse_unique hsum

/-- Multiplication by a scalar additive inverse on the left negates a product. -/
theorem qf_scalar_mul_neg_left (x y : RCBOMA) :
    rCMul (rCNeg x) y = rCNeg (rCMul x y) := by
  calc
    rCMul (rCNeg x) y = rCMul y (rCNeg x) := rCMul_comm (rCNeg x) y
    _ = rCNeg (rCMul y x) := qf_scalar_mul_neg_right y x
    _ = rCNeg (rCMul x y) := by rw [rCMul_comm y x]

/-- Squaring a negated scalar preserves its square. -/
theorem qf_scalar_mul_neg_neg_same (x : RCBOMA) :
    rCMul (rCNeg x) (rCNeg x) = rCMul x x := by
  calc
    rCMul (rCNeg x) (rCNeg x) = rCNeg (rCMul x (rCNeg x)) :=
      qf_scalar_mul_neg_left x (rCNeg x)
    _ = rCNeg (rCNeg (rCMul x x)) := by
      rw [qf_scalar_mul_neg_right x x]
    _ = rCMul x x := qf_scalar_neg_involutive _

/-- Additive left-commutation helper for explicit normal-form algebra. -/
theorem qf_scalar_add_left_comm (a b c : RCBOMA) :
    rCAdd a (rCAdd b c) = rCAdd b (rCAdd a c) := by
  calc
    rCAdd a (rCAdd b c) = rCAdd (rCAdd a b) c :=
      (rCAdd_assoc a b c).symm
    _ = rCAdd (rCAdd b a) c := by rw [rCAdd_comm a b]
    _ = rCAdd b (rCAdd a c) := rCAdd_assoc b a c

/-- Multiplicative left-commutation helper. -/
theorem qf_scalar_mul_left_comm (a b c : RCBOMA) :
    rCMul a (rCMul b c) = rCMul b (rCMul a c) := by
  calc
    rCMul a (rCMul b c) = rCMul (rCMul a b) c :=
      (rCMul_assoc a b c).symm
    _ = rCMul (rCMul b a) c := by rw [rCMul_comm a b]
    _ = rCMul b (rCMul a c) := rCMul_assoc b a c

/-- Distribution in the first scalar argument. -/
theorem qf_scalar_mul_add_left (a b c : RCBOMA) :
    rCMul (rCAdd a b) c = rCAdd (rCMul a c) (rCMul b c) := by
  calc
    rCMul (rCAdd a b) c = rCMul c (rCAdd a b) :=
      rCMul_comm (rCAdd a b) c
    _ = rCAdd (rCMul c a) (rCMul c b) := rCMul_add_right c a b
    _ = rCAdd (rCMul a c) (rCMul b c) := by
      rw [rCMul_comm c a, rCMul_comm c b]

/-- Scalar negation distributes over addition. -/
theorem qf_scalar_neg_add (a b : RCBOMA) :
    rCNeg (rCAdd a b) = rCAdd (rCNeg a) (rCNeg b) := by
  have h :
      rCAdd (rCAdd a b) (rCAdd (rCNeg a) (rCNeg b)) = rCZero := by
    calc
      rCAdd (rCAdd a b) (rCAdd (rCNeg a) (rCNeg b)) =
          rCAdd a (rCAdd b (rCAdd (rCNeg a) (rCNeg b))) :=
        rCAdd_assoc a b (rCAdd (rCNeg a) (rCNeg b))
      _ = rCAdd a (rCAdd (rCNeg a) (rCAdd b (rCNeg b))) := by
        rw [qf_scalar_add_left_comm b (rCNeg a) (rCNeg b)]
      _ = rCAdd (rCAdd a (rCNeg a)) (rCAdd b (rCNeg b)) :=
        (rCAdd_assoc a (rCNeg a) (rCAdd b (rCNeg b))).symm
      _ = rCZero := by
        rw [rCAdd_neg_right a, rCAdd_neg_right b, rCAdd_zero_left]
  exact (qf_scalar_add_inverse_unique h).symm

/-- Normal-form multiplication is associative using only Cauchy scalar laws. -/
theorem nf_mul_assoc (u v w : CauchyQNormal) :
    nfMul (nfMul u v) w = nfMul u (nfMul v w) := by
  cases u <;> cases v <;> cases w <;>
    simp [nfMul, qf_scalar_mul_add_left, rCMul_add_right,
      qf_scalar_mul_neg_left, qf_scalar_mul_neg_right, qf_scalar_neg_add,
      qf_scalar_neg_involutive, rCMul_assoc, rCMul_comm,
      qf_scalar_mul_left_comm, rCAdd_assoc, rCAdd_comm,
      qf_scalar_add_left_comm]

/-- Normal-form multiplication distributes over normal-form addition. -/
theorem nf_mul_add_right (u v w : CauchyQNormal) :
    nfMul u (nfAdd v w) = nfAdd (nfMul u v) (nfMul u w) := by
  cases u <;> cases v <;> cases w <;>
    simp [nfMul, nfAdd, qf_scalar_mul_add_left, rCMul_add_right,
      qf_scalar_mul_neg_left, qf_scalar_mul_neg_right, qf_scalar_neg_add,
      qf_scalar_neg_involutive, rCMul_assoc, rCMul_comm,
      qf_scalar_mul_left_comm, rCAdd_assoc, rCAdd_comm,
      qf_scalar_add_left_comm]

theorem q_add_comm (z w : CauchyQBOMA) : qAdd z w = qAdd w z := by
  apply q_ext
  rw [q_normal_add, q_normal_add]
  apply normal_ext
  · exact rCAdd_comm _ _
  · exact rCAdd_comm _ _

theorem q_add_assoc (z w v : CauchyQBOMA) :
    qAdd (qAdd z w) v = qAdd z (qAdd w v) := by
  apply q_ext
  rw [q_normal_add, q_normal_add, q_normal_add, q_normal_add]
  apply normal_ext
  · exact rCAdd_assoc _ _ _
  · exact rCAdd_assoc _ _ _

theorem q_add_zero_left (z : CauchyQBOMA) : qAdd qZero z = z := by
  apply q_ext
  rw [q_normal_add, q_normal_zero]
  apply normal_ext
  · exact rCAdd_zero_left _
  · exact rCAdd_zero_left _

theorem q_add_zero_right (z : CauchyQBOMA) : qAdd z qZero = z := by
  rw [q_add_comm z qZero, q_add_zero_left z]

theorem q_add_neg_right (z : CauchyQBOMA) : qAdd z (qNeg z) = qZero := by
  apply q_ext
  rw [q_normal_add, q_normal_neg, q_normal_zero]
  apply normal_ext
  · exact rCAdd_neg_right _
  · exact rCAdd_neg_right _

theorem q_mul_comm (z w : CauchyQBOMA) : qMul z w = qMul w z := by
  apply q_ext
  rw [q_normal_mul, q_normal_mul]
  apply normal_ext
  · change
      rCAdd (rCMul (qNormal z).re (qNormal w).re)
        (rCNeg (rCMul (qNormal z).im (qNormal w).im)) =
      rCAdd (rCMul (qNormal w).re (qNormal z).re)
        (rCNeg (rCMul (qNormal w).im (qNormal z).im))
    rw [rCMul_comm (qNormal z).re (qNormal w).re,
      rCMul_comm (qNormal z).im (qNormal w).im]
  · change
      rCAdd (rCMul (qNormal z).re (qNormal w).im)
        (rCMul (qNormal z).im (qNormal w).re) =
      rCAdd (rCMul (qNormal w).re (qNormal z).im)
        (rCMul (qNormal w).im (qNormal z).re)
    rw [rCMul_comm (qNormal z).re (qNormal w).im,
      rCMul_comm (qNormal z).im (qNormal w).re,
      rCAdd_comm]

theorem q_mul_assoc (z w v : CauchyQBOMA) :
    qMul (qMul z w) v = qMul z (qMul w v) := by
  apply q_ext
  rw [q_normal_mul, q_normal_mul, q_normal_mul, q_normal_mul]
  exact nf_mul_assoc _ _ _

theorem q_mul_one_left (z : CauchyQBOMA) : qMul qOne z = z := by
  apply q_ext
  rw [q_normal_mul, q_normal_one]
  apply normal_ext
  · change
      rCAdd (rCMul rCOne (qNormal z).re)
        (rCNeg (rCMul rCZero (qNormal z).im)) = (qNormal z).re
    rw [rCMul_one_left, rCMul_zero_left, scalar_neg_zero,
      scalar_add_zero_right]
  · change
      rCAdd (rCMul rCOne (qNormal z).im)
        (rCMul rCZero (qNormal z).re) = (qNormal z).im
    rw [rCMul_one_left, rCMul_zero_left, scalar_add_zero_right]

theorem q_mul_one_right (z : CauchyQBOMA) : qMul z qOne = z := by
  rw [q_mul_comm z qOne, q_mul_one_left z]

theorem q_mul_zero_left (z : CauchyQBOMA) : qMul qZero z = qZero := by
  apply q_ext
  rw [q_normal_mul, q_normal_zero]
  apply normal_ext
  · change
      rCAdd (rCMul rCZero (qNormal z).re)
        (rCNeg (rCMul rCZero (qNormal z).im)) = rCZero
    rw [rCMul_zero_left, rCMul_zero_left, scalar_neg_zero, rCAdd_zero_left]
  · change
      rCAdd (rCMul rCZero (qNormal z).im)
        (rCMul rCZero (qNormal z).re) = rCZero
    rw [rCMul_zero_left, rCMul_zero_left, rCAdd_zero_left]

theorem q_mul_zero_right (z : CauchyQBOMA) : qMul z qZero = qZero := by
  rw [q_mul_comm z qZero, q_mul_zero_left z]

theorem q_mul_add_right (z w v : CauchyQBOMA) :
    qMul z (qAdd w v) = qAdd (qMul z w) (qMul z v) := by
  apply q_ext
  rw [q_normal_mul, q_normal_add, q_normal_add, q_normal_mul, q_normal_mul]
  exact nf_mul_add_right _ _ _

theorem q_ofR_zero : qOfR rCZero = qZero := rfl
theorem q_ofR_one : qOfR rCOne = qOne := rfl

theorem q_ofR_neg (a : RCBOMA) : qOfR (rCNeg a) = qNeg (qOfR a) := by
  apply q_ext
  rw [q_normal_ofR, q_normal_neg, q_normal_ofR]
  apply normal_ext
  · rfl
  · exact scalar_neg_zero.symm

theorem q_ofR_add (a b : RCBOMA) :
    qOfR (rCAdd a b) = qAdd (qOfR a) (qOfR b) := by
  apply q_ext
  rw [q_normal_ofR, q_normal_add, q_normal_ofR, q_normal_ofR]
  apply normal_ext
  · rfl
  · exact (rCAdd_zero_left rCZero).symm

theorem q_ofR_mul (a b : RCBOMA) :
    qOfR (rCMul a b) = qMul (qOfR a) (qOfR b) := by
  apply q_ext
  rw [q_normal_ofR, q_normal_mul, q_normal_ofR, q_normal_ofR]
  apply normal_ext
  · change
      rCMul a b =
        rCAdd (rCMul a b) (rCNeg (rCMul rCZero rCZero))
    rw [rCMul_zero_left, scalar_neg_zero, scalar_add_zero_right]
  · change
      rCZero = rCAdd (rCMul a rCZero) (rCMul rCZero b)
    rw [scalar_mul_zero_right, rCMul_zero_left, rCAdd_zero_left]

/-- Native Route-Q commutative-ring and quadratic-coordinate certificate. -/
structure CauchyQRingCertificate where
  nontrivial : qZero ≠ qOne
  embeddingInjective : ∀ {a b : RCBOMA}, qOfR a = qOfR b → a = b
  addComm : ∀ z w : CauchyQBOMA, qAdd z w = qAdd w z
  addAssoc : ∀ z w v : CauchyQBOMA, qAdd (qAdd z w) v = qAdd z (qAdd w v)
  addZeroLeft : ∀ z : CauchyQBOMA, qAdd qZero z = z
  addInverseRight : ∀ z : CauchyQBOMA, qAdd z (qNeg z) = qZero
  mulComm : ∀ z w : CauchyQBOMA, qMul z w = qMul w z
  mulAssoc : ∀ z w v : CauchyQBOMA, qMul (qMul z w) v = qMul z (qMul w v)
  mulOneLeft : ∀ z : CauchyQBOMA, qMul qOne z = z
  distribRight : ∀ z w v : CauchyQBOMA,
    qMul z (qAdd w v) = qAdd (qMul z w) (qMul z v)
  mulZeroRight : ∀ z : CauchyQBOMA, qMul z qZero = qZero
  embeddingZero : qOfR rCZero = qZero
  embeddingOne : qOfR rCOne = qOne
  embeddingNeg : ∀ a : RCBOMA, qOfR (rCNeg a) = qNeg (qOfR a)
  embeddingAdd : ∀ a b : RCBOMA,
    qOfR (rCAdd a b) = qAdd (qOfR a) (qOfR b)
  embeddingMul : ∀ a b : RCBOMA,
    qOfR (rCMul a b) = qMul (qOfR a) (qOfR b)
  imagSquared : qMul qI qI = qNeg qOne
  generation : ∀ z : CauchyQBOMA,
    ∃ a b : RCBOMA, z = qCoord a b
  coordinateUnique : ∀ {a b a' b' : RCBOMA},
    qCoord a b = qCoord a' b' → a = a' ∧ b = b'
  imagNotReal : ¬ ∃ a : RCBOMA, qI = qOfR a

theorem cauchyQRingCertificate : CauchyQRingCertificate where
  nontrivial := q_zero_ne_one
  embeddingInjective := @q_ofR_injective
  addComm := q_add_comm
  addAssoc := q_add_assoc
  addZeroLeft := q_add_zero_left
  addInverseRight := q_add_neg_right
  mulComm := q_mul_comm
  mulAssoc := q_mul_assoc
  mulOneLeft := q_mul_one_left
  distribRight := q_mul_add_right
  mulZeroRight := q_mul_zero_right
  embeddingZero := q_ofR_zero
  embeddingOne := q_ofR_one
  embeddingNeg := q_ofR_neg
  embeddingAdd := q_ofR_add
  embeddingMul := q_ofR_mul
  imagSquared := q_i_squared
  generation := q_generation
  coordinateUnique := @q_coordinate_unique
  imagNotReal := q_i_not_real

/-- Conjugation uses only the canonical quotient extractor. -/
def qConj (z : CauchyQBOMA) : CauchyQBOMA :=
  qCoord (qRe z) (rCNeg (qIm z))

/-- Real-valued canonical norm. -/
def qNorm (z : CauchyQBOMA) : RCBOMA :=
  rCAdd (rCMul (qRe z) (qRe z)) (rCMul (qIm z) (qIm z))

theorem q_mul_conj (z : CauchyQBOMA) :
    qMul z (qConj z) = qOfR (qNorm z) := by
  apply q_ext
  unfold qConj
  rw [q_normal_mul, q_normal_coord, q_normal_ofR]
  apply normal_ext
  · change
      rCAdd (rCMul (qRe z) (qRe z))
        (rCNeg (rCMul (qIm z) (rCNeg (qIm z)))) = qNorm z
    rw [qf_scalar_mul_neg_right, qf_scalar_neg_involutive]
    rfl
  · change
      rCAdd (rCMul (qRe z) (rCNeg (qIm z)))
        (rCMul (qIm z) (qRe z)) = rCZero
    rw [qf_scalar_mul_neg_right, rCMul_comm (qIm z) (qRe z),
      rCAdd_comm (rCNeg (rCMul (qRe z) (qIm z)))
        (rCMul (qRe z) (qIm z)),
      rCAdd_neg_right]

/-- Every Cauchy scalar square is nonnegative from the verified total ordered ring. -/
theorem qf_scalar_square_nonnegative (x : RCBOMA) :
    rCLE rCZero (rCMul x x) := by
  rcases rcle_total rCZero x with h0x | hx0
  · exact rcle_mul_nonneg h0x h0x
  · have h0nx : rCLE rCZero (rCNeg x) := by
      have h := rcle_add_right hx0 (rCNeg x)
      rw [rCAdd_neg_right x, rCAdd_zero_left] at h
      exact h
    have h := rcle_mul_nonneg h0nx h0nx
    rw [qf_scalar_mul_neg_neg_same x] at h
    exact h

theorem qf_scalar_nonnegative_sum_zero_left {a b : RCBOMA}
    (h0a : rCLE rCZero a) (h0b : rCLE rCZero b)
    (hsum : rCAdd a b = rCZero) : a = rCZero := by
  have ha0 : rCLE a rCZero := by
    have h := rcle_add_right h0b a
    rw [rCAdd_zero_left a, rCAdd_comm b a, hsum] at h
    exact h
  exact rcle_antisymm ha0 h0a

theorem qf_scalar_nonnegative_sum_zero_right {a b : RCBOMA}
    (h0a : rCLE rCZero a) (h0b : rCLE rCZero b)
    (hsum : rCAdd a b = rCZero) : b = rCZero := by
  apply qf_scalar_nonnegative_sum_zero_left h0b h0a
  rw [rCAdd_comm b a, hsum]

theorem q_norm_nonnegative (z : CauchyQBOMA) :
    rCLE rCZero (qNorm z) := by
  have h0re := qf_scalar_square_nonnegative (qRe z)
  have h0im := qf_scalar_square_nonnegative (qIm z)
  have h := rcle_add_right h0im (rCMul (qRe z) (qRe z))
  rw [rCAdd_zero_left,
    rCAdd_comm (rCMul (qIm z) (qIm z))
      (rCMul (qRe z) (qRe z))] at h
  exact rcle_trans h0re h

theorem q_norm_zero_real_square (z : CauchyQBOMA)
    (hnorm : qNorm z = rCZero) :
    rCMul (qRe z) (qRe z) = rCZero := by
  exact qf_scalar_nonnegative_sum_zero_left
    (qf_scalar_square_nonnegative (qRe z))
    (qf_scalar_square_nonnegative (qIm z)) hnorm

theorem q_norm_zero_imag_square (z : CauchyQBOMA)
    (hnorm : qNorm z = rCZero) :
    rCMul (qIm z) (qIm z) = rCZero := by
  exact qf_scalar_nonnegative_sum_zero_right
    (qf_scalar_square_nonnegative (qRe z))
    (qf_scalar_square_nonnegative (qIm z)) hnorm

theorem qf_scalar_square_zero_not_nonzero {a : RCBOMA}
    (hsquare : rCMul a a = rCZero) : ¬ a ≠ rCZero := by
  intro hnonzero
  rcases rC_inverse_exists a hnonzero with ⟨t, ht⟩
  unfold RCInvRel at ht
  have hzero : a = rCZero := by
    calc
      a = rCMul a rCOne := (scalar_mul_one_right a).symm
      _ = rCMul a (rCMul a t) := by rw [ht]
      _ = rCMul (rCMul a a) t := (rCMul_assoc a a t).symm
      _ = rCMul rCZero t := by rw [hsquare]
      _ = rCZero := rCMul_zero_left t
  exact hnonzero hzero

theorem q_norm_zero_not_nonzero (z : CauchyQBOMA)
    (hnorm : qNorm z = rCZero) : ¬ z ≠ qZero := by
  intro hnonzero
  have hre :=
    qf_scalar_square_zero_not_nonzero (q_norm_zero_real_square z hnorm)
  have him :=
    qf_scalar_square_zero_not_nonzero (q_norm_zero_imag_square z hnorm)
  apply hre
  intro hzre
  apply him
  intro hzim
  apply hnonzero
  apply q_ext
  rw [q_normal_zero]
  apply normal_ext
  · exact hzre
  · exact hzim

theorem q_norm_nonzero {z : CauchyQBOMA}
    (hnonzero : z ≠ qZero) : qNorm z ≠ rCZero := by
  intro hnorm
  exact q_norm_zero_not_nonzero z hnorm hnonzero

/-- A supplied scalar inverse witness for the norm determines a Q inverse witness. -/
theorem q_inverse_from_real_witness (z : CauchyQBOMA) (t : RCBOMA)
    (ht : rCMul (qNorm z) t = rCOne) :
    qMul z (qMul (qOfR t) (qConj z)) = qOne := by
  calc
    qMul z (qMul (qOfR t) (qConj z)) =
        qMul z (qMul (qConj z) (qOfR t)) := by
      rw [q_mul_comm (qOfR t) (qConj z)]
    _ = qMul (qMul z (qConj z)) (qOfR t) :=
      (q_mul_assoc z (qConj z) (qOfR t)).symm
    _ = qMul (qOfR (qNorm z)) (qOfR t) := by rw [q_mul_conj z]
    _ = qOfR (rCMul (qNorm z) t) := (q_ofR_mul (qNorm z) t).symm
    _ = qOfR rCOne := by rw [ht]
    _ = qOne := q_ofR_one

/-- Gate C preserves witness-only inversion; no global inverse selector is defined. -/
theorem q_inverse_exists (z : CauchyQBOMA) (hnonzero : z ≠ qZero) :
    ∃ w : CauchyQBOMA, qMul z w = qOne := by
  rcases rC_inverse_exists (qNorm z) (q_norm_nonzero hnonzero) with ⟨t, ht⟩
  unfold RCInvRel at ht
  exact ⟨qMul (qOfR t) (qConj z), q_inverse_from_real_witness z t ht⟩

theorem q_inverse_unique {z w v : CauchyQBOMA}
    (hw : qMul z w = qOne) (hv : qMul z v = qOne) : w = v := by
  calc
    w = qMul w qOne := (q_mul_one_right w).symm
    _ = qMul w (qMul z v) := by rw [hv]
    _ = qMul (qMul w z) v := (q_mul_assoc w z v).symm
    _ = qMul qOne v := by rw [q_mul_comm w z, hw]
    _ = v := q_mul_one_left v

/-- Independent native Route-Q field-strength certificate. -/
structure CauchyQFieldCertificate where
  realRoute : CauchyLUBCertificate
  ring : CauchyQRingCertificate
  normNonnegative : ∀ z : CauchyQBOMA, rCLE rCZero (qNorm z)
  normNonzero : ∀ z : CauchyQBOMA, z ≠ qZero → qNorm z ≠ rCZero
  conjugateProduct : ∀ z : CauchyQBOMA, qMul z (qConj z) = qOfR (qNorm z)
  inverseExists : ∀ z : CauchyQBOMA,
    z ≠ qZero → ∃ w : CauchyQBOMA, qMul z w = qOne
  inverseUnique : ∀ {z w v : CauchyQBOMA},
    qMul z w = qOne → qMul z v = qOne → w = v

theorem cauchyQFieldCertificate : CauchyQFieldCertificate where
  realRoute := cauchyLUBCertificate
  ring := cauchyQRingCertificate
  normNonnegative := q_norm_nonnegative
  normNonzero := fun _ h => q_norm_nonzero h
  conjugateProduct := q_mul_conj
  inverseExists := q_inverse_exists
  inverseUnique := @q_inverse_unique

end BOMA.C.StageTwo.CauchyQField015
