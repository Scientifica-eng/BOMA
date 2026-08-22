/- ST2-EXP-002: independent Route-Q-normal-form norm and inverse witnesses.
The proof uses only accepted R and Route Q's own normal-form ring. -/
namespace BOMA.C.StageTwo.QNormalNormInverse002

open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindOrderConstructive001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.StageIntegration002
open BOMA.C.RInterfaceNoSquareProbe001
open BOMA.C.StageTwo.QNormalCore002

/-- Conjugation reverses the Q-normal imaginary coordinate. -/
def nConj (z : QNormal) : QNormal := ⟨z.re, rNeg z.im⟩

/-- The real-valued Q-normal coordinate norm is the sum of two squares. -/
def nNorm (z : QNormal) : RBOMA :=
  rAdd (rMulCandidate z.re z.re) (rMulCandidate z.im z.im)

theorem n_conj_involutive
    (C : RStageIntegrationCertificate) (z : QNormal) :
    nConj (nConj z) = z := by
  apply n_ext
  · rfl
  · exact neg_involutive_from_interface C z.im

theorem n_conj_ofR
    (C : RStageIntegrationCertificate) (a : RBOMA) :
    nConj (nOfR a) = nOfR a := by
  apply n_ext
  · rfl
  · exact neg_zero_from_interface C

theorem n_conj_add
    (C : RStageIntegrationCertificate) (z w : QNormal) :
    nConj (nAdd z w) = nAdd (nConj z) (nConj w) := by
  apply n_ext
  · rfl
  · exact r_neg_add_from_interface C z.im w.im

theorem n_norm_conj
    (C : RStageIntegrationCertificate) (z : QNormal) :
    nNorm (nConj z) = nNorm z := by
  change
    rAdd (rMulCandidate z.re z.re)
      (rMulCandidate (rNeg z.im) (rNeg z.im)) =
    rAdd (rMulCandidate z.re z.re)
      (rMulCandidate z.im z.im)
  rw [mul_neg_neg_same_from_interface C z.im]

/-- The norm product has exactly the embedded real norm and zero imaginary part. -/
theorem n_mul_conj
    (C : RStageIntegrationCertificate) (z : QNormal) :
    nMul z (nConj z) = nOfR (nNorm z) := by
  apply n_ext
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

theorem n_conj_mul
    (C : RStageIntegrationCertificate) (z : QNormal) :
    nMul (nConj z) z = nOfR (nNorm z) := by
  rw [n_mul_comm C (nConj z) z, n_mul_conj C z]

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

theorem n_norm_nonnegative
    (C : RStageIntegrationCertificate) (z : QNormal) :
    rLE rZero (nNorm z) := by
  have h0re := square_nonnegative_of_interface C z.re
  have h0im := square_nonnegative_of_interface C z.im
  have h :=
    (C.addTranslateOrderIff rZero
      (rMulCandidate z.im z.im) (rMulCandidate z.re z.re)).2 h0im
  rw [C.addZeroLeft (rMulCandidate z.re z.re),
    C.addComm (rMulCandidate z.im z.im)
      (rMulCandidate z.re z.re)] at h
  exact C.orderTrans h0re h

theorem n_norm_zero_real_square
    (C : RStageIntegrationCertificate) (z : QNormal)
    (hnorm : nNorm z = rZero) :
    rMulCandidate z.re z.re = rZero := by
  exact r_nonnegative_sum_zero_left C
    (square_nonnegative_of_interface C z.re)
    (square_nonnegative_of_interface C z.im) hnorm

theorem n_norm_zero_imaginary_square
    (C : RStageIntegrationCertificate) (z : QNormal)
    (hnorm : nNorm z = rZero) :
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
        (BOMA.C.StageTwo.QNormalRoute002.mul_one_right_from_interface C a).symm
      _ = rMulCandidate a (rMulCandidate a t) := by rw [ht]
      _ = rMulCandidate (rMulCandidate a a) t :=
        (C.mulAssoc a a t).symm
      _ = rMulCandidate rZero t := by rw [hsquare]
      _ = rZero := mul_zero_left_from_interface C t
  exact hnonzero hzero

/-- Zero norm entails only double-negated zero coordinates and zero complex value. -/
theorem n_norm_zero_not_nonzero
    (C : RStageIntegrationCertificate) (z : QNormal)
    (hnorm : nNorm z = rZero) : ¬ z ≠ nZero := by
  intro hnonzero
  have hre := r_square_zero_not_nonzero C
    (n_norm_zero_real_square C z hnorm)
  have him := r_square_zero_not_nonzero C
    (n_norm_zero_imaginary_square C z hnorm)
  apply hre
  intro hzre
  apply him
  intro hzim
  apply hnonzero
  apply n_ext
  · exact hzre
  · exact hzim

/-- A supplied nonzero complex hypothesis constructively makes its norm nonzero. -/
theorem n_norm_nonzero
    (C : RStageIntegrationCertificate) {z : QNormal}
    (hnonzero : z ≠ nZero) : nNorm z ≠ rZero := by
  intro hnorm
  exact n_norm_zero_not_nonzero C z hnorm hnonzero

/-- A real inverse witness for the norm determines a complex inverse witness. -/
theorem n_inverse_from_real_witness
    (C : RStageIntegrationCertificate) (z : QNormal) (t : RBOMA)
    (ht : rMulCandidate (nNorm z) t = rOne) :
    nMul z (nMul (nOfR t) (nConj z)) = nOne := by
  calc
    nMul z (nMul (nOfR t) (nConj z)) =
        nMul z (nMul (nConj z) (nOfR t)) := by
      rw [n_mul_comm C (nOfR t) (nConj z)]
    _ = nMul (nMul z (nConj z)) (nOfR t) :=
      (n_mul_assoc C z (nConj z) (nOfR t)).symm
    _ = nMul (nOfR (nNorm z)) (nOfR t) := by rw [n_mul_conj C z]
    _ = nOfR (rMulCandidate (nNorm z) t) :=
      (n_ofR_mul C (nNorm z) t).symm
    _ = nOfR rOne := by rw [ht]
    _ = nOne := n_ofR_one

/-- The field interface supplies existential witnesses, never a global selector. -/
theorem n_inverse_exists
    (C : RStageIntegrationCertificate) (z : QNormal)
    (hnonzero : z ≠ nZero) :
    ∃ w : QNormal, nMul z w = nOne := by
  rcases C.inverseExists (nNorm z) (n_norm_nonzero C hnonzero) with ⟨t, ht⟩
  exact ⟨nMul (nOfR t) (nConj z), n_inverse_from_real_witness C z t ht⟩

theorem n_inverse_left_of_right
    (C : RStageIntegrationCertificate) {z w : QNormal}
    (hzw : nMul z w = nOne) :
    nMul w z = nOne := by
  rw [n_mul_comm C w z, hzw]

/-- Inverse witnesses are unique by the already verified ring laws. -/
theorem n_inverse_unique
    (C : RStageIntegrationCertificate) {z w v : QNormal}
    (hw : nMul z w = nOne)
    (hv : nMul z v = nOne) : w = v := by
  calc
    w = nMul w nOne := (n_mul_one_right C w).symm
    _ = nMul w (nMul z v) := by rw [hv]
    _ = nMul (nMul w z) v := (n_mul_assoc C w z v).symm
    _ = nMul nOne v := by rw [n_mul_comm C w z, hw]
    _ = v := n_mul_one_left C v

/-- Complete Q-normal field-strength certificate with witness-only inversion. -/
structure QNormalFieldCertificate where
  ring : QNormalRingCertificate
  normNonnegative : ∀ z : QNormal, rLE rZero (nNorm z)
  normNonzero : ∀ z : QNormal, z ≠ nZero → nNorm z ≠ rZero
  conjugateProduct : ∀ z : QNormal, nMul z (nConj z) = nOfR (nNorm z)
  inverseExists : ∀ z : QNormal, z ≠ nZero → ∃ w : QNormal, nMul z w = nOne
  inverseUnique : ∀ {z w v : QNormal},
    nMul z w = nOne → nMul z v = nOne → w = v

/-- Field closure is derived from the abstract accepted real certificate alone. -/
theorem qNormalFieldCertificate
    (C : RStageIntegrationCertificate) : QNormalFieldCertificate where
  ring := qNormalRingCertificate C
  normNonnegative := n_norm_nonnegative C
  normNonzero := fun _ h => n_norm_nonzero C h
  conjugateProduct := n_mul_conj C
  inverseExists := n_inverse_exists C
  inverseUnique := @n_inverse_unique C

/-- Instantiate the witness-field certificate on the accepted real export. -/
theorem qNormalFieldCertificateFromAcceptedR : QNormalFieldCertificate :=
  qNormalFieldCertificate rStageIntegrationCertificate

end BOMA.C.StageTwo.QNormalNormInverse002
