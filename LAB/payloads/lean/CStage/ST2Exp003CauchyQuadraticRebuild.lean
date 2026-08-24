/- ST2-EXP-003 H6: research-only rebuild of the selected quadratic complex
   meaning over the independently completed Cauchy real carrier.

   This source consumes only the independent Cauchy real interface already
   proved through H4.  The exact Dedekind/Cauchy Junction is a governance
   prerequisite for admitting H6, not a mathematical source dependency here.

   The construction deliberately mirrors the accepted selected pair meaning:
   a rank-two real-coordinate carrier, faithful real embedding, distinguished
   I with I^2 = -1, unique real coordinates, commutative-ring laws, conjugate
   norm, and witness-only nonzero inversion.  It does not modify or re-export
   accepted C-BLOCK-001/C-BLOCK-002 and introduces no global inverse selector. -/
namespace BOMA.C.StageTwo.CauchyQuadratic003

open BOMA.Q.Quotient001
open BOMA.Q.Integration001
open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyAdditive003
open BOMA.R.StageTwo.CauchyMultiplicative003
open BOMA.R.StageTwo.CauchyOrderCore003
open BOMA.R.StageTwo.CauchyOrderTotal003
open BOMA.R.StageTwo.CauchyOrderedRing003
open BOMA.R.StageTwo.CauchyInverse003
open BOMA.R.StageTwo.CauchyLUB003

/-- The alternative real zero and one are distinct by faithfulness of the
    constant accepted-rational embedding. -/
theorem rC_nontrivial : rCZero ≠ rCOne := by
  intro h
  have hq : rCOfQ qZero = rCOfQ qOne := h
  exact q_nontrivial (rCOfQ_injective hq)

/-- Right additive zero derived from commutativity and the verified left law. -/
theorem rCAdd_zero_right (x : RCBOMA) : rCAdd x rCZero = x := by
  rw [rCAdd_comm x rCZero, rCAdd_zero_left x]

/-- Negation fixes zero without any equality decision. -/
theorem rCNeg_zero : rCNeg rCZero = rCZero := by
  have h := rCAdd_neg_right rCZero
  rw [rCAdd_zero_left] at h
  exact h

/-- Additive inverse witnesses are unique in the alternative real additive
    group. -/
theorem rC_add_inverse_unique {x y : RCBOMA}
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

/-- Alternative-real negation is involutive. -/
theorem rCNeg_involutive (x : RCBOMA) : rCNeg (rCNeg x) = x := by
  have hleft : rCAdd (rCNeg x) x = rCZero := by
    calc
      rCAdd (rCNeg x) x = rCAdd x (rCNeg x) := rCAdd_comm (rCNeg x) x
      _ = rCZero := rCAdd_neg_right x
  exact (rC_add_inverse_unique hleft).symm

/-- Right multiplicative zero derived from commutativity. -/
theorem rCMul_zero_right (x : RCBOMA) : rCMul x rCZero = rCZero := by
  rw [rCMul_comm x rCZero, rCMul_zero_left x]

/-- Right multiplicative one derived from commutativity. -/
theorem rCMul_one_right_local (x : RCBOMA) : rCMul x rCOne = x := by
  rw [rCMul_comm x rCOne, rCMul_one_left x]

/-- Multiplication by an additive inverse on the right negates the product. -/
theorem rCMul_neg_right (x y : RCBOMA) :
    rCMul x (rCNeg y) = rCNeg (rCMul x y) := by
  have hd := rCMul_add_right x y (rCNeg y)
  have hsum :
      rCAdd (rCMul x y) (rCMul x (rCNeg y)) = rCZero := by
    calc
      rCAdd (rCMul x y) (rCMul x (rCNeg y)) =
          rCMul x (rCAdd y (rCNeg y)) := hd.symm
      _ = rCMul x rCZero := by rw [rCAdd_neg_right y]
      _ = rCZero := rCMul_zero_right x
  exact rC_add_inverse_unique hsum

/-- Multiplication by an additive inverse on the left negates the product. -/
theorem rCMul_neg_left (x y : RCBOMA) :
    rCMul (rCNeg x) y = rCNeg (rCMul x y) := by
  calc
    rCMul (rCNeg x) y = rCMul y (rCNeg x) := rCMul_comm (rCNeg x) y
    _ = rCNeg (rCMul y x) := rCMul_neg_right y x
    _ = rCNeg (rCMul x y) := by rw [rCMul_comm y x]

/-- Squaring a negated alternative real gives the same square. -/
theorem rCMul_neg_neg_same (x : RCBOMA) :
    rCMul (rCNeg x) (rCNeg x) = rCMul x x := by
  calc
    rCMul (rCNeg x) (rCNeg x) = rCNeg (rCMul x (rCNeg x)) :=
      rCMul_neg_left x (rCNeg x)
    _ = rCNeg (rCNeg (rCMul x x)) := by rw [rCMul_neg_right x x]
    _ = rCMul x x := rCNeg_involutive _

/-- Additive left-commutation helper for explicit pair normalizations. -/
theorem rCAdd_left_comm (a b c : RCBOMA) :
    rCAdd a (rCAdd b c) = rCAdd b (rCAdd a c) := by
  calc
    rCAdd a (rCAdd b c) = rCAdd (rCAdd a b) c :=
      (rCAdd_assoc a b c).symm
    _ = rCAdd (rCAdd b a) c := by rw [rCAdd_comm a b]
    _ = rCAdd b (rCAdd a c) := rCAdd_assoc b a c

/-- Multiplicative left-commutation helper. -/
theorem rCMul_left_comm (a b c : RCBOMA) :
    rCMul a (rCMul b c) = rCMul b (rCMul a c) := by
  calc
    rCMul a (rCMul b c) = rCMul (rCMul a b) c :=
      (rCMul_assoc a b c).symm
    _ = rCMul (rCMul b a) c := by rw [rCMul_comm a b]
    _ = rCMul b (rCMul a c) := rCMul_assoc b a c

/-- Distribution in the first alternative-real argument. -/
theorem rCMul_add_left (a b c : RCBOMA) :
    rCMul (rCAdd a b) c = rCAdd (rCMul a c) (rCMul b c) := by
  calc
    rCMul (rCAdd a b) c = rCMul c (rCAdd a b) := rCMul_comm (rCAdd a b) c
    _ = rCAdd (rCMul c a) (rCMul c b) := rCMul_add_right c a b
    _ = rCAdd (rCMul a c) (rCMul b c) := by
      rw [rCMul_comm c a, rCMul_comm c b]

/-- Negation distributes over alternative-real addition. -/
theorem rCNeg_add (a b : RCBOMA) :
    rCNeg (rCAdd a b) = rCAdd (rCNeg a) (rCNeg b) := by
  have h :
      rCAdd (rCAdd a b) (rCAdd (rCNeg a) (rCNeg b)) = rCZero := by
    calc
      rCAdd (rCAdd a b) (rCAdd (rCNeg a) (rCNeg b)) =
          rCAdd a (rCAdd b (rCAdd (rCNeg a) (rCNeg b))) :=
        rCAdd_assoc a b (rCAdd (rCNeg a) (rCNeg b))
      _ = rCAdd a (rCAdd (rCNeg a) (rCAdd b (rCNeg b))) := by
        rw [rCAdd_left_comm b (rCNeg a) (rCNeg b)]
      _ = rCAdd (rCAdd a (rCNeg a)) (rCAdd b (rCNeg b)) :=
        (rCAdd_assoc a (rCNeg a) (rCAdd b (rCNeg b))).symm
      _ = rCZero := by
        rw [rCAdd_neg_right a, rCAdd_neg_right b, rCAdd_zero_left]
  exact (rC_add_inverse_unique h).symm

/-- Every alternative-real square is nonnegative, derived only from the
    independently proved Cauchy total ordered-ring laws. -/
theorem rC_square_nonnegative (x : RCBOMA) : rCLE rCZero (rCMul x x) := by
  rcases rcle_total rCZero x with h0x | hx0
  · exact rcle_mul_nonneg h0x h0x
  · have h0nx : rCLE rCZero (rCNeg x) := by
      have h := rcle_add_right hx0 (rCNeg x)
      rw [rCAdd_neg_right x, rCAdd_zero_left] at h
      exact h
    have h := rcle_mul_nonneg h0nx h0nx
    rw [rCMul_neg_neg_same x] at h
    exact h

/-- Research H6 carrier: the same selected quadratic pair meaning, now with
    independently constructed Cauchy-real coordinates. -/
structure CCBOMA where
  re : RCBOMA
  im : RCBOMA

/-- Coordinate extensionality is the exact identity of the H6 pair carrier. -/
theorem cc_ext {z w : CCBOMA}
    (hre : z.re = w.re) (him : z.im = w.im) : z = w := by
  cases z
  cases w
  cases hre
  cases him
  rfl

def ccZero : CCBOMA := ⟨rCZero, rCZero⟩
def ccOne : CCBOMA := ⟨rCOne, rCZero⟩
def ccOfR (a : RCBOMA) : CCBOMA := ⟨a, rCZero⟩
def ccI : CCBOMA := ⟨rCZero, rCOne⟩
def ccNeg (z : CCBOMA) : CCBOMA := ⟨rCNeg z.re, rCNeg z.im⟩
def ccAdd (z w : CCBOMA) : CCBOMA :=
  ⟨rCAdd z.re w.re, rCAdd z.im w.im⟩
def ccMul (z w : CCBOMA) : CCBOMA :=
  ⟨rCAdd (rCMul z.re w.re) (rCNeg (rCMul z.im w.im)),
   rCAdd (rCMul z.re w.im) (rCMul z.im w.re)⟩

/-- The alternative-real embedding into the H6 pair carrier is faithful. -/
theorem cc_ofR_injective {a b : RCBOMA} (h : ccOfR a = ccOfR b) : a = b :=
  congrArg CCBOMA.re h

/-- Multiplication of an embedded real by I exposes its imaginary coordinate. -/
theorem cc_embed_mul_i (b : RCBOMA) : ccMul (ccOfR b) ccI = ⟨rCZero, b⟩ := by
  apply cc_ext
  · change
      rCAdd (rCMul b rCZero) (rCNeg (rCMul rCZero rCOne)) = rCZero
    rw [rCMul_zero_right b, rCMul_zero_left rCOne,
      rCNeg_zero, rCAdd_zero_left]
  · change rCAdd (rCMul b rCOne) (rCMul rCZero rCZero) = b
    rw [rCMul_one_right_local b, rCMul_zero_left rCZero, rCAdd_zero_right b]

/-- Every coordinate pair has the expected real-plus-imaginary normal form. -/
theorem cc_coordinate_expression (a b : RCBOMA) :
    ccAdd (ccOfR a) (ccMul (ccOfR b) ccI) = ⟨a, b⟩ := by
  rw [cc_embed_mul_i b]
  apply cc_ext
  · exact rCAdd_zero_right a
  · exact rCAdd_zero_left b

/-- The distinguished H6 generator squares to negative one. -/
theorem cc_i_squared : ccMul ccI ccI = ccNeg ccOne := by
  apply cc_ext
  · change
      rCAdd (rCMul rCZero rCZero) (rCNeg (rCMul rCOne rCOne)) = rCNeg rCOne
    rw [rCMul_zero_left rCZero, rCMul_one_left rCOne, rCAdd_zero_left]
  · change
      rCAdd (rCMul rCZero rCOne) (rCMul rCOne rCZero) = rCNeg rCZero
    rw [rCMul_zero_left rCOne, rCMul_zero_right rCOne,
      rCAdd_zero_left, rCNeg_zero]

/-- Every H6 value has real/imaginary coordinates. -/
theorem cc_generation (z : CCBOMA) :
    ∃ a b : RCBOMA, z = ccAdd (ccOfR a) (ccMul (ccOfR b) ccI) := by
  refine ⟨z.re, z.im, ?_⟩
  rw [cc_coordinate_expression z.re z.im]

/-- H6 coordinates are unique at the actual pair equality. -/
theorem cc_coordinate_unique {a b a' b' : RCBOMA}
    (h : ccAdd (ccOfR a) (ccMul (ccOfR b) ccI) =
      ccAdd (ccOfR a') (ccMul (ccOfR b') ccI)) :
    a = a' ∧ b = b' := by
  rw [cc_coordinate_expression a b, cc_coordinate_expression a' b'] at h
  exact ⟨congrArg CCBOMA.re h, congrArg CCBOMA.im h⟩

/-- The H6 imaginary generator does not collapse into the embedded real line. -/
theorem cc_i_not_real : ¬ ∃ a : RCBOMA, ccI = ccOfR a := by
  rintro ⟨a, ha⟩
  have h : rCOne = rCZero := congrArg CCBOMA.im ha
  exact rC_nontrivial h.symm

theorem cc_zero_ne_one : ccZero ≠ ccOne := by
  intro h
  exact rC_nontrivial (congrArg CCBOMA.re h)

theorem cc_add_comm (z w : CCBOMA) : ccAdd z w = ccAdd w z := by
  apply cc_ext
  · exact rCAdd_comm z.re w.re
  · exact rCAdd_comm z.im w.im

theorem cc_add_assoc (z w v : CCBOMA) :
    ccAdd (ccAdd z w) v = ccAdd z (ccAdd w v) := by
  apply cc_ext
  · exact rCAdd_assoc z.re w.re v.re
  · exact rCAdd_assoc z.im w.im v.im

theorem cc_add_zero_left (z : CCBOMA) : ccAdd ccZero z = z := by
  apply cc_ext
  · exact rCAdd_zero_left z.re
  · exact rCAdd_zero_left z.im

theorem cc_add_zero_right (z : CCBOMA) : ccAdd z ccZero = z := by
  rw [cc_add_comm z ccZero, cc_add_zero_left z]

theorem cc_add_neg_right (z : CCBOMA) : ccAdd z (ccNeg z) = ccZero := by
  apply cc_ext
  · exact rCAdd_neg_right z.re
  · exact rCAdd_neg_right z.im

theorem cc_mul_comm (z w : CCBOMA) : ccMul z w = ccMul w z := by
  cases z <;> cases w <;>
    simp [ccMul, rCMul_comm, rCAdd_comm]

theorem cc_mul_assoc (z w v : CCBOMA) :
    ccMul (ccMul z w) v = ccMul z (ccMul w v) := by
  cases z <;> cases w <;> cases v <;>
    simp [ccMul, rCMul_add_left, rCMul_add_right,
      rCMul_neg_left, rCMul_neg_right, rCNeg_add, rCNeg_involutive,
      rCMul_assoc, rCMul_comm, rCMul_left_comm,
      rCAdd_assoc, rCAdd_comm, rCAdd_left_comm]

theorem cc_mul_one_left (z : CCBOMA) : ccMul ccOne z = z := by
  apply cc_ext
  · change
      rCAdd (rCMul rCOne z.re) (rCNeg (rCMul rCZero z.im)) = z.re
    rw [rCMul_one_left z.re, rCMul_zero_left z.im,
      rCNeg_zero, rCAdd_zero_right z.re]
  · change rCAdd (rCMul rCOne z.im) (rCMul rCZero z.re) = z.im
    rw [rCMul_one_left z.im, rCMul_zero_left z.re, rCAdd_zero_right z.im]

theorem cc_mul_one_right (z : CCBOMA) : ccMul z ccOne = z := by
  rw [cc_mul_comm z ccOne, cc_mul_one_left z]

theorem cc_mul_add_right (z w v : CCBOMA) :
    ccMul z (ccAdd w v) = ccAdd (ccMul z w) (ccMul z v) := by
  cases z <;> cases w <;> cases v <;>
    simp [ccMul, ccAdd, rCMul_add_left, rCMul_add_right,
      rCMul_neg_left, rCMul_neg_right, rCNeg_add, rCNeg_involutive,
      rCMul_assoc, rCMul_comm, rCMul_left_comm,
      rCAdd_assoc, rCAdd_comm, rCAdd_left_comm]

theorem cc_mul_zero_left (z : CCBOMA) : ccMul ccZero z = ccZero := by
  apply cc_ext
  · change rCAdd (rCMul rCZero z.re) (rCNeg (rCMul rCZero z.im)) = rCZero
    rw [rCMul_zero_left z.re, rCMul_zero_left z.im,
      rCNeg_zero, rCAdd_zero_left]
  · change rCAdd (rCMul rCZero z.im) (rCMul rCZero z.re) = rCZero
    rw [rCMul_zero_left z.im, rCMul_zero_left z.re, rCAdd_zero_left]

theorem cc_mul_zero_right (z : CCBOMA) : ccMul z ccZero = ccZero := by
  rw [cc_mul_comm z ccZero, cc_mul_zero_left z]

theorem cc_ofR_zero : ccOfR rCZero = ccZero := rfl

theorem cc_ofR_one : ccOfR rCOne = ccOne := rfl

theorem cc_ofR_neg (a : RCBOMA) : ccOfR (rCNeg a) = ccNeg (ccOfR a) := by
  apply cc_ext
  · rfl
  · exact rCNeg_zero.symm

theorem cc_ofR_add (a b : RCBOMA) :
    ccOfR (rCAdd a b) = ccAdd (ccOfR a) (ccOfR b) := by
  apply cc_ext
  · rfl
  · exact (rCAdd_zero_left rCZero).symm

theorem cc_ofR_mul (a b : RCBOMA) :
    ccOfR (rCMul a b) = ccMul (ccOfR a) (ccOfR b) := by
  apply cc_ext
  · change
      rCMul a b = rCAdd (rCMul a b) (rCNeg (rCMul rCZero rCZero))
    rw [rCMul_zero_left rCZero, rCNeg_zero, rCAdd_zero_right]
  · change rCZero = rCAdd (rCMul a rCZero) (rCMul rCZero b)
    rw [rCMul_zero_right a, rCMul_zero_left b, rCAdd_zero_left]

/-- Research H6 commutative-ring and quadratic-coordinate package. -/
structure CauchyPairRingCertificate where
  nontrivial : ccZero ≠ ccOne
  embeddingInjective : ∀ {a b : RCBOMA}, ccOfR a = ccOfR b → a = b
  addComm : ∀ z w : CCBOMA, ccAdd z w = ccAdd w z
  addAssoc : ∀ z w v : CCBOMA, ccAdd (ccAdd z w) v = ccAdd z (ccAdd w v)
  addZeroLeft : ∀ z : CCBOMA, ccAdd ccZero z = z
  addInverseRight : ∀ z : CCBOMA, ccAdd z (ccNeg z) = ccZero
  mulComm : ∀ z w : CCBOMA, ccMul z w = ccMul w z
  mulAssoc : ∀ z w v : CCBOMA, ccMul (ccMul z w) v = ccMul z (ccMul w v)
  mulOneLeft : ∀ z : CCBOMA, ccMul ccOne z = z
  distribRight : ∀ z w v : CCBOMA,
    ccMul z (ccAdd w v) = ccAdd (ccMul z w) (ccMul z v)
  mulZeroRight : ∀ z : CCBOMA, ccMul z ccZero = ccZero
  embeddingZero : ccOfR rCZero = ccZero
  embeddingOne : ccOfR rCOne = ccOne
  embeddingNeg : ∀ a : RCBOMA, ccOfR (rCNeg a) = ccNeg (ccOfR a)
  embeddingAdd : ∀ a b : RCBOMA,
    ccOfR (rCAdd a b) = ccAdd (ccOfR a) (ccOfR b)
  embeddingMul : ∀ a b : RCBOMA,
    ccOfR (rCMul a b) = ccMul (ccOfR a) (ccOfR b)
  imagSquared : ccMul ccI ccI = ccNeg ccOne
  generation : ∀ z : CCBOMA,
    ∃ a b : RCBOMA, z = ccAdd (ccOfR a) (ccMul (ccOfR b) ccI)
  coordinateUnique : ∀ {a b a' b' : RCBOMA},
    ccAdd (ccOfR a) (ccMul (ccOfR b) ccI) =
      ccAdd (ccOfR a') (ccMul (ccOfR b') ccI) → a = a' ∧ b = b'
  imagNotReal : ¬ ∃ a : RCBOMA, ccI = ccOfR a

theorem cauchyPairRingCertificate : CauchyPairRingCertificate where
  nontrivial := cc_zero_ne_one
  embeddingInjective := @cc_ofR_injective
  addComm := cc_add_comm
  addAssoc := cc_add_assoc
  addZeroLeft := cc_add_zero_left
  addInverseRight := cc_add_neg_right
  mulComm := cc_mul_comm
  mulAssoc := cc_mul_assoc
  mulOneLeft := cc_mul_one_left
  distribRight := cc_mul_add_right
  mulZeroRight := cc_mul_zero_right
  embeddingZero := cc_ofR_zero
  embeddingOne := cc_ofR_one
  embeddingNeg := cc_ofR_neg
  embeddingAdd := cc_ofR_add
  embeddingMul := cc_ofR_mul
  imagSquared := cc_i_squared
  generation := cc_generation
  coordinateUnique := @cc_coordinate_unique
  imagNotReal := cc_i_not_real

/-- Conjugation reverses the alternative-real imaginary coordinate. -/
def ccConj (z : CCBOMA) : CCBOMA := ⟨z.re, rCNeg z.im⟩

/-- The H6 real-valued norm is the sum of the two alternative-real squares. -/
def ccNorm (z : CCBOMA) : RCBOMA := rCAdd (rCMul z.re z.re) (rCMul z.im z.im)

theorem cc_conj_involutive (z : CCBOMA) : ccConj (ccConj z) = z := by
  apply cc_ext
  · rfl
  · exact rCNeg_involutive z.im

theorem cc_mul_conj (z : CCBOMA) : ccMul z (ccConj z) = ccOfR (ccNorm z) := by
  apply cc_ext
  · change
      rCAdd (rCMul z.re z.re) (rCNeg (rCMul z.im (rCNeg z.im))) =
        rCAdd (rCMul z.re z.re) (rCMul z.im z.im)
    rw [rCMul_neg_right z.im z.im, rCNeg_involutive]
  · change rCAdd (rCMul z.re (rCNeg z.im)) (rCMul z.im z.re) = rCZero
    rw [rCMul_neg_right z.re z.im, rCMul_comm z.im z.re,
      rCAdd_comm (rCNeg (rCMul z.re z.im)) (rCMul z.re z.im),
      rCAdd_neg_right]

/-- A nonnegative alternative-real sum equal to zero has zero first summand. -/
theorem rC_nonnegative_sum_zero_left {a b : RCBOMA}
    (h0a : rCLE rCZero a) (h0b : rCLE rCZero b)
    (hsum : rCAdd a b = rCZero) : a = rCZero := by
  have ha0 : rCLE a rCZero := by
    have h := rcle_add_right h0b a
    rw [rCAdd_zero_left a, rCAdd_comm b a, hsum] at h
    exact h
  exact rcle_antisymm ha0 h0a

/-- A nonnegative alternative-real sum equal to zero has zero second summand. -/
theorem rC_nonnegative_sum_zero_right {a b : RCBOMA}
    (h0a : rCLE rCZero a) (h0b : rCLE rCZero b)
    (hsum : rCAdd a b = rCZero) : b = rCZero := by
  apply rC_nonnegative_sum_zero_left h0b h0a
  rw [rCAdd_comm b a, hsum]

theorem cc_norm_nonnegative (z : CCBOMA) : rCLE rCZero (ccNorm z) := by
  have h0re := rC_square_nonnegative z.re
  have h0im := rC_square_nonnegative z.im
  have h := rcle_add_right h0im (rCMul z.re z.re)
  rw [rCAdd_zero_left, rCAdd_comm (rCMul z.im z.im) (rCMul z.re z.re)] at h
  exact rcle_trans h0re h

theorem cc_norm_zero_real_square (z : CCBOMA) (hnorm : ccNorm z = rCZero) :
    rCMul z.re z.re = rCZero := by
  exact rC_nonnegative_sum_zero_left
    (rC_square_nonnegative z.re) (rC_square_nonnegative z.im) hnorm

theorem cc_norm_zero_imag_square (z : CCBOMA) (hnorm : ccNorm z = rCZero) :
    rCMul z.im z.im = rCZero := by
  exact rC_nonnegative_sum_zero_right
    (rC_square_nonnegative z.re) (rC_square_nonnegative z.im) hnorm

/-- A zero square contradicts any supplied alternative-real nonzero witness. -/
theorem rC_square_zero_not_nonzero {a : RCBOMA}
    (hsquare : rCMul a a = rCZero) : ¬ a ≠ rCZero := by
  intro hnonzero
  rcases rC_inverse_exists a hnonzero with ⟨t, ht⟩
  unfold RCInvRel at ht
  have hzero : a = rCZero := by
    calc
      a = rCMul a rCOne := (rCMul_one_right_local a).symm
      _ = rCMul a (rCMul a t) := by rw [ht]
      _ = rCMul (rCMul a a) t := (rCMul_assoc a a t).symm
      _ = rCMul rCZero t := by rw [hsquare]
      _ = rCZero := rCMul_zero_left t
  exact hnonzero hzero

/-- Zero norm contradicts a supplied nonzero H6 complex witness. -/
theorem cc_norm_zero_not_nonzero (z : CCBOMA)
    (hnorm : ccNorm z = rCZero) : ¬ z ≠ ccZero := by
  intro hnonzero
  have hre := rC_square_zero_not_nonzero (cc_norm_zero_real_square z hnorm)
  have him := rC_square_zero_not_nonzero (cc_norm_zero_imag_square z hnorm)
  apply hre
  intro hzre
  apply him
  intro hzim
  apply hnonzero
  apply cc_ext
  · exact hzre
  · exact hzim

theorem cc_norm_nonzero {z : CCBOMA}
    (hnonzero : z ≠ ccZero) : ccNorm z ≠ rCZero := by
  intro hnorm
  exact cc_norm_zero_not_nonzero z hnorm hnonzero

/-- A real inverse witness for the H6 norm determines a complex inverse
    witness; no inverse selector is introduced. -/
theorem cc_inverse_from_real_witness (z : CCBOMA) (t : RCBOMA)
    (ht : rCMul (ccNorm z) t = rCOne) :
    ccMul z (ccMul (ccOfR t) (ccConj z)) = ccOne := by
  calc
    ccMul z (ccMul (ccOfR t) (ccConj z)) =
        ccMul z (ccMul (ccConj z) (ccOfR t)) := by
      rw [cc_mul_comm (ccOfR t) (ccConj z)]
    _ = ccMul (ccMul z (ccConj z)) (ccOfR t) :=
      (cc_mul_assoc z (ccConj z) (ccOfR t)).symm
    _ = ccMul (ccOfR (ccNorm z)) (ccOfR t) := by rw [cc_mul_conj z]
    _ = ccOfR (rCMul (ccNorm z) t) := (cc_ofR_mul (ccNorm z) t).symm
    _ = ccOfR rCOne := by rw [ht]
    _ = ccOne := cc_ofR_one

/-- H6 preserves the witness-only field interface. -/
theorem cc_inverse_exists (z : CCBOMA) (hnonzero : z ≠ ccZero) :
    ∃ w : CCBOMA, ccMul z w = ccOne := by
  rcases rC_inverse_exists (ccNorm z) (cc_norm_nonzero hnonzero) with ⟨t, ht⟩
  unfold RCInvRel at ht
  exact ⟨ccMul (ccOfR t) (ccConj z), cc_inverse_from_real_witness z t ht⟩

/-- H6 inverse witnesses are unique by the proved commutative-ring laws. -/
theorem cc_inverse_unique {z w v : CCBOMA}
    (hw : ccMul z w = ccOne) (hv : ccMul z v = ccOne) : w = v := by
  calc
    w = ccMul w ccOne := (cc_mul_one_right w).symm
    _ = ccMul w (ccMul z v) := by rw [hv]
    _ = ccMul (ccMul w z) v := (cc_mul_assoc w z v).symm
    _ = ccMul ccOne v := by rw [cc_mul_comm w z, hw]
    _ = v := cc_mul_one_left v

/-- Full research-only H6 certificate.  It explicitly packages the independently
    completed H4 real route together with the selected quadratic-field meaning
    rebuilt natively over that real carrier. -/
structure CauchyQuadraticFieldCertificate where
  realRoute : CauchyLUBCertificate
  ring : CauchyPairRingCertificate
  normNonnegative : ∀ z : CCBOMA, rCLE rCZero (ccNorm z)
  normNonzero : ∀ z : CCBOMA, z ≠ ccZero → ccNorm z ≠ rCZero
  conjugateProduct : ∀ z : CCBOMA, ccMul z (ccConj z) = ccOfR (ccNorm z)
  inverseExists : ∀ z : CCBOMA, z ≠ ccZero → ∃ w : CCBOMA, ccMul z w = ccOne
  inverseUnique : ∀ {z w v : CCBOMA},
    ccMul z w = ccOne → ccMul z v = ccOne → w = v

theorem cauchyQuadraticFieldCertificate : CauchyQuadraticFieldCertificate where
  realRoute := cauchyLUBCertificate
  ring := cauchyPairRingCertificate
  normNonnegative := cc_norm_nonnegative
  normNonzero := fun _ h => cc_norm_nonzero h
  conjugateProduct := cc_mul_conj
  inverseExists := cc_inverse_exists
  inverseUnique := @cc_inverse_unique

end BOMA.C.StageTwo.CauchyQuadratic003
