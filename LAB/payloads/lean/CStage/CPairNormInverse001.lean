/- PDSA-C-005: selected Route P conjugate, norm, and inverse witnesses.

Zero norm yields only double-negated zero coordinates at the abstract real
interface. That weaker constructive result suffices to contradict a supplied
nonzero complex hypothesis; no equality decision or inverse selector is needed.
-/
namespace BOMA.C.PairNormInverse001

open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindOrderConstructive001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.StageIntegration002
open BOMA.C.RInterfaceNoSquareProbe001
open BOMA.C.PairCore001

/-- Conjugation reverses the selected imaginary coordinate. -/
def cConj (z : CBOMA) : CBOMA := ⟨z.re, rNeg z.im⟩

/-- The real-valued selected-coordinate norm is the sum of two squares. -/
def cNorm (z : CBOMA) : RBOMA :=
  rAdd (rMulCandidate z.re z.re) (rMulCandidate z.im z.im)

theorem c_conj_involutive
    (C : RStageIntegrationCertificate) (z : CBOMA) :
    cConj (cConj z) = z := by
  apply c_ext
  · rfl
  · exact neg_involutive_from_interface C z.im

theorem c_conj_ofR
    (C : RStageIntegrationCertificate) (a : RBOMA) :
    cConj (cOfR a) = cOfR a := by
  apply c_ext
  · rfl
  · exact neg_zero_from_interface C

theorem c_conj_add
    (C : RStageIntegrationCertificate) (z w : CBOMA) :
    cConj (cAdd z w) = cAdd (cConj z) (cConj w) := by
  apply c_ext
  · rfl
  · exact r_neg_add_from_interface C z.im w.im

theorem c_norm_conj
    (C : RStageIntegrationCertificate) (z : CBOMA) :
    cNorm (cConj z) = cNorm z := by
  change
    rAdd (rMulCandidate z.re z.re)
      (rMulCandidate (rNeg z.im) (rNeg z.im)) =
    rAdd (rMulCandidate z.re z.re)
      (rMulCandidate z.im z.im)
  rw [mul_neg_neg_same_from_interface C z.im]

/-- The norm product has exactly the embedded real norm and zero imaginary part. -/
theorem c_mul_conj
    (C : RStageIntegrationCertificate) (z : CBOMA) :
    cMul z (cConj z) = cOfR (cNorm z) := by
  apply c_ext
  · change
      rAdd (rMulCandidate z.re z.re)
        (rNeg (rMulCandidate z.im (rNeg z.im))) =
      rAdd (rMulCandidate z.re z.re) (rMulCandidate z.im z.im)
    rw [mul_neg_right_from_interface C z.im z.im,
      neg_involutive_from_interface C (rMulCandidate z.im z.im)]
  · change
      rAdd (rMulCandidate z.re (rNeg z.im))
        (rMulCandidate z.im z.re) = rZero
    rw [mul_neg_right_from_interface C z.re z.im,
      C.mulComm z.im z.re,
      C.addComm (rNeg (rMulCandidate z.re z.im))
        (rMulCandidate z.re z.im),
      C.addInverseRight (rMulCandidate z.re z.im)]

theorem c_conj_mul
    (C : RStageIntegrationCertificate) (z : CBOMA) :
    cMul (cConj z) z = cOfR (cNorm z) := by
  rw [c_mul_comm C (cConj z) z, c_mul_conj C z]

/-- A nonnegative sum equal to zero has zero first summand. -/
theorem r_nonnegative_sum_zero_left
    (C : RStageIntegrationCertificate) {a b : RBOMA}
    (h0a : rLE rZero a) (h0b : rLE rZero b)
    (hsum : rAdd a b = rZero) : a = rZero := by
  have ha0 : rLE a rZero := by
    have h := (C.addTranslateOrderIff rZero b a).2 h0b
    rw [C.addZeroLeft a, C.addComm b a, hsum] at h
    exact h
  exact C.orderAntisymm ha0 h0a

/-- A nonnegative sum equal to zero has zero second summand. -/
theorem r_nonnegative_sum_zero_right
    (C : RStageIntegrationCertificate) {a b : RBOMA}
    (h0a : rLE rZero a) (h0b : rLE rZero b)
    (hsum : rAdd a b = rZero) : b = rZero := by
  apply r_nonnegative_sum_zero_left C h0b h0a
  rw [C.addComm b a, hsum]

theorem c_norm_nonnegative
    (C : RStageIntegrationCertificate) (z : CBOMA) :
    rLE rZero (cNorm z) := by
  have h0re := square_nonnegative_of_interface C z.re
  have h0im := square_nonnegative_of_interface C z.im
  have h :=
    (C.addTranslateOrderIff rZero
      (rMulCandidate z.im z.im) (rMulCandidate z.re z.re)).2 h0im
  rw [C.addZeroLeft (rMulCandidate z.re z.re),
    C.addComm (rMulCandidate z.im z.im)
      (rMulCandidate z.re z.re)] at h
  exact C.orderTrans h0re h

theorem c_norm_zero_real_square
    (C : RStageIntegrationCertificate) (z : CBOMA)
    (hnorm : cNorm z = rZero) :
    rMulCandidate z.re z.re = rZero := by
  exact r_nonnegative_sum_zero_left C
    (square_nonnegative_of_interface C z.re)
    (square_nonnegative_of_interface C z.im) hnorm

theorem c_norm_zero_imaginary_square
    (C : RStageIntegrationCertificate) (z : CBOMA)
    (hnorm : cNorm z = rZero) :
    rMulCandidate z.im z.im = rZero := by
  exact r_nonnegative_sum_zero_right C
    (square_nonnegative_of_interface C z.re)
    (square_nonnegative_of_interface C z.im) hnorm

/-- A zero real square contradicts any proposed nonzero real witness.

The conclusion is deliberately double-negated equality, not equality; the
abstract real interface does not provide stable or decidable equality. -/
theorem r_square_zero_not_nonzero
    (C : RStageIntegrationCertificate) {a : RBOMA}
    (hsquare : rMulCandidate a a = rZero) : ¬ a ≠ rZero := by
  intro hnonzero
  rcases C.inverseExists a hnonzero with ⟨t, ht⟩
  have hzero : a = rZero := by
    calc
      a = rMulCandidate a rOne :=
        (BOMA.C.RoutePairProbe001.mul_one_right_from_interface C a).symm
      _ = rMulCandidate a (rMulCandidate a t) := by rw [ht]
      _ = rMulCandidate (rMulCandidate a a) t :=
        (C.mulAssoc a a t).symm
      _ = rMulCandidate rZero t := by rw [hsquare]
      _ = rZero := mul_zero_left_from_interface C t
  exact hnonzero hzero

/-- Zero norm entails only double-negated zero coordinates and zero complex value. -/
theorem c_norm_zero_not_nonzero
    (C : RStageIntegrationCertificate) (z : CBOMA)
    (hnorm : cNorm z = rZero) : ¬ z ≠ cZero := by
  intro hnonzero
  have hre := r_square_zero_not_nonzero C
    (c_norm_zero_real_square C z hnorm)
  have him := r_square_zero_not_nonzero C
    (c_norm_zero_imaginary_square C z hnorm)
  apply hre
  intro hzre
  apply him
  intro hzim
  apply hnonzero
  apply c_ext
  · exact hzre
  · exact hzim

/-- A supplied nonzero complex hypothesis constructively makes its norm nonzero. -/
theorem c_norm_nonzero
    (C : RStageIntegrationCertificate) {z : CBOMA}
    (hnonzero : z ≠ cZero) : cNorm z ≠ rZero := by
  intro hnorm
  exact c_norm_zero_not_nonzero C z hnorm hnonzero

/-- A real inverse witness for the norm determines a complex inverse witness. -/
theorem c_inverse_from_real_witness
    (C : RStageIntegrationCertificate) (z : CBOMA) (t : RBOMA)
    (ht : rMulCandidate (cNorm z) t = rOne) :
    cMul z (cMul (cOfR t) (cConj z)) = cOne := by
  calc
    cMul z (cMul (cOfR t) (cConj z)) =
        cMul z (cMul (cConj z) (cOfR t)) := by
      rw [c_mul_comm C (cOfR t) (cConj z)]
    _ = cMul (cMul z (cConj z)) (cOfR t) :=
      (c_mul_assoc C z (cConj z) (cOfR t)).symm
    _ = cMul (cOfR (cNorm z)) (cOfR t) := by rw [c_mul_conj C z]
    _ = cOfR (rMulCandidate (cNorm z) t) :=
      (c_ofR_mul C (cNorm z) t).symm
    _ = cOfR rOne := by rw [ht]
    _ = cOne := c_ofR_one

/-- The field interface supplies existential witnesses, never a global selector. -/
theorem c_inverse_exists
    (C : RStageIntegrationCertificate) (z : CBOMA)
    (hnonzero : z ≠ cZero) :
    ∃ w : CBOMA, cMul z w = cOne := by
  rcases C.inverseExists (cNorm z) (c_norm_nonzero C hnonzero) with ⟨t, ht⟩
  exact ⟨cMul (cOfR t) (cConj z), c_inverse_from_real_witness C z t ht⟩

theorem c_inverse_left_of_right
    (C : RStageIntegrationCertificate) {z w : CBOMA}
    (hzw : cMul z w = cOne) :
    cMul w z = cOne := by
  rw [c_mul_comm C w z, hzw]

/-- Inverse witnesses are unique by the already verified ring laws. -/
theorem c_inverse_unique
    (C : RStageIntegrationCertificate) {z w v : CBOMA}
    (hw : cMul z w = cOne)
    (hv : cMul z v = cOne) : w = v := by
  calc
    w = cMul w cOne := (c_mul_one_right C w).symm
    _ = cMul w (cMul z v) := by rw [hv]
    _ = cMul (cMul w z) v := (c_mul_assoc C w z v).symm
    _ = cMul cOne v := by rw [c_mul_comm C w z, hw]
    _ = v := c_mul_one_left C v

/-- Complete selected-route field-strength certificate with witness-only inversion. -/
structure CPairFieldCertificate where
  ring : CPairRingCoreCertificate
  normNonnegative : ∀ z : CBOMA, rLE rZero (cNorm z)
  normNonzero : ∀ z : CBOMA, z ≠ cZero → cNorm z ≠ rZero
  conjugateProduct : ∀ z : CBOMA, cMul z (cConj z) = cOfR (cNorm z)
  inverseExists : ∀ z : CBOMA, z ≠ cZero → ∃ w : CBOMA, cMul z w = cOne
  inverseUnique : ∀ {z w v : CBOMA},
    cMul z w = cOne → cMul z v = cOne → w = v

/-- Field closure is derived from the abstract accepted real certificate alone. -/
theorem cPairFieldCertificate
    (C : RStageIntegrationCertificate) : CPairFieldCertificate where
  ring := cPairRingCoreCertificate C
  normNonnegative := c_norm_nonnegative C
  normNonzero := fun _ h => c_norm_nonzero C h
  conjugateProduct := c_mul_conj C
  inverseExists := c_inverse_exists C
  inverseUnique := @c_inverse_unique C

/-- Instantiate the witness-field certificate on the accepted real export. -/
theorem cPairFieldCertificateFromAcceptedR : CPairFieldCertificate :=
  cPairFieldCertificate rStageIntegrationCertificate

end BOMA.C.PairNormInverse001
