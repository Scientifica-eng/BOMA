/- ST2-EXP-002: independent commutative ring on Route Q's own NormalForm.
No selected pair-route declaration or field producer is referenced. -/
namespace BOMA.C.StageTwo.QNormalCore002

open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.StageIntegration002
open BOMA.C.RInterfaceNoSquareProbe001

/-- The Q-local carrier is Route Q's own canonical normalization record. -/
abbrev QNormal : Type := BOMA.C.StageTwo.QNormalRoute002.NormalForm

/-- The Q-normal identity is record equality, equivalent to coordinate equality. -/
theorem n_ext {z w : QNormal}
    (hre : z.re = w.re) (him : z.im = w.im) : z = w :=
  BOMA.C.StageTwo.QNormalRoute002.normal_ext hre him

def nZero : QNormal := BOMA.C.StageTwo.QNormalRoute002.zero
def nOne : QNormal := BOMA.C.StageTwo.QNormalRoute002.one
def nOfR (a : RBOMA) : QNormal := BOMA.C.StageTwo.QNormalRoute002.ofR a
def nI : QNormal := BOMA.C.StageTwo.QNormalRoute002.imag
def nNeg (z : QNormal) : QNormal := BOMA.C.StageTwo.QNormalRoute002.neg z
def nAdd (z w : QNormal) : QNormal := BOMA.C.StageTwo.QNormalRoute002.add z w
def nMul (z w : QNormal) : QNormal := BOMA.C.StageTwo.QNormalRoute002.mul z w

/-- Scalar additive reassociation needed by the explicit equational normalizer. -/
theorem r_add_left_comm_from_interface
    (C : RStageIntegrationCertificate) (a b c : RBOMA) :
    rAdd a (rAdd b c) = rAdd b (rAdd a c) := by
  calc
    rAdd a (rAdd b c) = rAdd (rAdd a b) c := (C.addAssoc a b c).symm
    _ = rAdd (rAdd b a) c := by rw [C.addComm a b]
    _ = rAdd b (rAdd a c) := C.addAssoc b a c

/-- Scalar multiplicative reassociation needed by the explicit normalizer. -/
theorem r_mul_left_comm_from_interface
    (C : RStageIntegrationCertificate) (a b c : RBOMA) :
    rMulCandidate a (rMulCandidate b c) =
      rMulCandidate b (rMulCandidate a c) := by
  calc
    rMulCandidate a (rMulCandidate b c) =
        rMulCandidate (rMulCandidate a b) c := (C.mulAssoc a b c).symm
    _ = rMulCandidate (rMulCandidate b a) c := by rw [C.mulComm a b]
    _ = rMulCandidate b (rMulCandidate a c) := C.mulAssoc b a c

/-- Distribution in the first scalar argument is derived, not assumed. -/
theorem r_mul_add_left_from_interface
    (C : RStageIntegrationCertificate) (a b c : RBOMA) :
    rMulCandidate (rAdd a b) c =
      rAdd (rMulCandidate a c) (rMulCandidate b c) := by
  calc
    rMulCandidate (rAdd a b) c = rMulCandidate c (rAdd a b) :=
      C.mulComm (rAdd a b) c
    _ = rAdd (rMulCandidate c a) (rMulCandidate c b) :=
      C.distribRight c a b
    _ = rAdd (rMulCandidate a c) (rMulCandidate b c) := by
      rw [C.mulComm c a, C.mulComm c b]

/-- Additive inverse distributes over scalar addition using inverse uniqueness. -/
theorem r_neg_add_from_interface
    (C : RStageIntegrationCertificate) (a b : RBOMA) :
    rNeg (rAdd a b) = rAdd (rNeg a) (rNeg b) := by
  have h : rAdd (rAdd a b) (rAdd (rNeg a) (rNeg b)) = rZero := by
    calc
      rAdd (rAdd a b) (rAdd (rNeg a) (rNeg b)) =
          rAdd a (rAdd b (rAdd (rNeg a) (rNeg b))) :=
        C.addAssoc a b (rAdd (rNeg a) (rNeg b))
      _ = rAdd a (rAdd (rNeg a) (rAdd b (rNeg b))) := by
        rw [r_add_left_comm_from_interface C b (rNeg a) (rNeg b)]
      _ = rAdd (rAdd a (rNeg a)) (rAdd b (rNeg b)) :=
        (C.addAssoc a (rNeg a) (rAdd b (rNeg b))).symm
      _ = rZero := by
        rw [C.addInverseRight a, C.addInverseRight b, C.addZeroLeft rZero]
  exact (add_inverse_unique_from_interface C h).symm

/-- The canonical complex zero and unit remain distinct. -/
theorem n_zero_ne_one (C : RStageIntegrationCertificate) :
    nZero ≠ nOne := by
  intro h
  exact C.nontrivial (congrArg BOMA.C.RouteQuadraticQuotientProbe001.NormalForm.re h)

/-- The Q-normal real embedding is faithful. -/
theorem n_ofR_injective {a b : RBOMA} (h : nOfR a = nOfR b) : a = b :=
  BOMA.C.StageTwo.QNormalRoute002.ofR_injective h

theorem n_add_comm (C : RStageIntegrationCertificate) (z w : QNormal) :
    nAdd z w = nAdd w z := by
  apply n_ext
  · exact C.addComm z.re w.re
  · exact C.addComm z.im w.im

theorem n_add_assoc
    (C : RStageIntegrationCertificate) (z w v : QNormal) :
    nAdd (nAdd z w) v = nAdd z (nAdd w v) := by
  apply n_ext
  · exact C.addAssoc z.re w.re v.re
  · exact C.addAssoc z.im w.im v.im

theorem n_add_zero_left (C : RStageIntegrationCertificate) (z : QNormal) :
    nAdd nZero z = z := by
  apply n_ext
  · exact C.addZeroLeft z.re
  · exact C.addZeroLeft z.im

theorem n_add_zero_right (C : RStageIntegrationCertificate) (z : QNormal) :
    nAdd z nZero = z := by
  rw [n_add_comm C z nZero, n_add_zero_left C z]

theorem n_add_neg_right (C : RStageIntegrationCertificate) (z : QNormal) :
    nAdd z (nNeg z) = nZero := by
  apply n_ext
  · exact C.addInverseRight z.re
  · exact C.addInverseRight z.im

theorem n_add_neg_left (C : RStageIntegrationCertificate) (z : QNormal) :
    nAdd (nNeg z) z = nZero := by
  rw [n_add_comm C (nNeg z) z, n_add_neg_right C z]

theorem n_neg_involutive (C : RStageIntegrationCertificate) (z : QNormal) :
    nNeg (nNeg z) = z := by
  apply n_ext
  · exact neg_involutive_from_interface C z.re
  · exact neg_involutive_from_interface C z.im

theorem n_mul_comm (C : RStageIntegrationCertificate) (z w : QNormal) :
    nMul z w = nMul w z := by
  cases z <;> cases w <;>
    simp [nMul, BOMA.C.StageTwo.QNormalRoute002.mul, BOMA.C.RouteQuadraticQuotientProbe001.nfMul, C.mulComm, C.addComm]

/-- Associativity is an explicit consequence of the accepted real ring laws. -/
theorem n_mul_assoc
    (C : RStageIntegrationCertificate) (z w v : QNormal) :
    nMul (nMul z w) v = nMul z (nMul w v) := by
  cases z <;> cases w <;> cases v <;>
    simp [nMul, BOMA.C.StageTwo.QNormalRoute002.mul, BOMA.C.RouteQuadraticQuotientProbe001.nfMul,
      r_mul_add_left_from_interface C, C.distribRight,
      mul_neg_left_from_interface C, mul_neg_right_from_interface C,
      r_neg_add_from_interface C, neg_involutive_from_interface C,
      C.mulAssoc, C.mulComm, r_mul_left_comm_from_interface C,
      C.addAssoc, C.addComm, r_add_left_comm_from_interface C]

theorem n_mul_one_left (C : RStageIntegrationCertificate) (z : QNormal) :
    nMul nOne z = z := by
  apply n_ext
  · change
      rAdd (rMulCandidate rOne z.re)
        (rNeg (rMulCandidate rZero z.im)) = z.re
    rw [C.mulOneLeft z.re, mul_zero_left_from_interface C z.im,
      neg_zero_from_interface C,
      BOMA.C.StageTwo.QNormalRoute002.add_zero_right_from_interface C z.re]
  · change
      rAdd (rMulCandidate rOne z.im)
        (rMulCandidate rZero z.re) = z.im
    rw [C.mulOneLeft z.im, mul_zero_left_from_interface C z.re,
      BOMA.C.StageTwo.QNormalRoute002.add_zero_right_from_interface C z.im]

theorem n_mul_one_right (C : RStageIntegrationCertificate) (z : QNormal) :
    nMul z nOne = z := by
  rw [n_mul_comm C z nOne, n_mul_one_left C z]

/-- Right distribution is proved independently from the abstract real interface. -/
theorem n_mul_add_right
    (C : RStageIntegrationCertificate) (z w v : QNormal) :
    nMul z (nAdd w v) = nAdd (nMul z w) (nMul z v) := by
  cases z <;> cases w <;> cases v <;>
    simp [nMul, nAdd, BOMA.C.StageTwo.QNormalRoute002.mul, BOMA.C.RouteQuadraticQuotientProbe001.nfMul,
      BOMA.C.StageTwo.QNormalRoute002.add, BOMA.C.RouteQuadraticQuotientProbe001.nfAdd,
      r_mul_add_left_from_interface C, C.distribRight,
      mul_neg_left_from_interface C, mul_neg_right_from_interface C,
      r_neg_add_from_interface C, neg_involutive_from_interface C,
      C.mulAssoc, C.mulComm, r_mul_left_comm_from_interface C,
      C.addAssoc, C.addComm, r_add_left_comm_from_interface C]

theorem n_mul_add_left
    (C : RStageIntegrationCertificate) (z w v : QNormal) :
    nMul (nAdd z w) v = nAdd (nMul z v) (nMul w v) := by
  calc
    nMul (nAdd z w) v = nMul v (nAdd z w) :=
      n_mul_comm C (nAdd z w) v
    _ = nAdd (nMul v z) (nMul v w) := n_mul_add_right C v z w
    _ = nAdd (nMul z v) (nMul w v) := by
      rw [n_mul_comm C v z, n_mul_comm C v w]

theorem n_mul_zero_left (C : RStageIntegrationCertificate) (z : QNormal) :
    nMul nZero z = nZero := by
  apply n_ext
  · change
      rAdd (rMulCandidate rZero z.re)
        (rNeg (rMulCandidate rZero z.im)) = rZero
    rw [mul_zero_left_from_interface C z.re,
      mul_zero_left_from_interface C z.im,
      neg_zero_from_interface C, C.addZeroLeft rZero]
  · change
      rAdd (rMulCandidate rZero z.im)
        (rMulCandidate rZero z.re) = rZero
    rw [mul_zero_left_from_interface C z.im,
      mul_zero_left_from_interface C z.re, C.addZeroLeft rZero]

theorem n_mul_zero_right (C : RStageIntegrationCertificate) (z : QNormal) :
    nMul z nZero = nZero := by
  rw [n_mul_comm C z nZero, n_mul_zero_left C z]

theorem n_ofR_zero : nOfR rZero = nZero := rfl

theorem n_ofR_one : nOfR rOne = nOne := rfl

theorem n_ofR_neg (C : RStageIntegrationCertificate) (a : RBOMA) :
    nOfR (rNeg a) = nNeg (nOfR a) := by
  apply n_ext
  · rfl
  · exact (neg_zero_from_interface C).symm

theorem n_ofR_add (C : RStageIntegrationCertificate) (a b : RBOMA) :
    nOfR (rAdd a b) = nAdd (nOfR a) (nOfR b) := by
  apply n_ext
  · rfl
  · exact (C.addZeroLeft rZero).symm

theorem n_ofR_mul (C : RStageIntegrationCertificate) (a b : RBOMA) :
    nOfR (rMulCandidate a b) = nMul (nOfR a) (nOfR b) := by
  apply n_ext
  · change
      rMulCandidate a b =
        rAdd (rMulCandidate a b) (rNeg (rMulCandidate rZero rZero))
    rw [mul_zero_left_from_interface C rZero,
      neg_zero_from_interface C,
      BOMA.C.StageTwo.QNormalRoute002.add_zero_right_from_interface C
        (rMulCandidate a b)]
  · change
      rZero = rAdd (rMulCandidate a rZero) (rMulCandidate rZero b)
    rw [mul_zero_right_from_interface C a,
      mul_zero_left_from_interface C b, C.addZeroLeft rZero]

theorem n_i_squared (C : RStageIntegrationCertificate) :
    nMul nI nI = nNeg nOne :=
  BOMA.C.StageTwo.QNormalRoute002.imag_squared C

theorem n_generation (C : RStageIntegrationCertificate) (z : QNormal) :
    ∃ a b : RBOMA, z = nAdd (nOfR a) (nMul (nOfR b) nI) :=
  BOMA.C.StageTwo.QNormalRoute002.decomposition C z

theorem n_coordinate_unique
    (C : RStageIntegrationCertificate) {a b a' b' : RBOMA}
    (h : nAdd (nOfR a) (nMul (nOfR b) nI) =
      nAdd (nOfR a') (nMul (nOfR b') nI)) :
    a = a' ∧ b = b' :=
  BOMA.C.StageTwo.QNormalRoute002.decomposition_unique C h

theorem n_i_not_real (C : RStageIntegrationCertificate) :
    ¬ ∃ a : RBOMA, nI = nOfR a :=
  BOMA.C.StageTwo.QNormalRoute002.imag_not_real C

/-- Precisely scoped Q-normal integration surface: ring, not field. -/
structure QNormalRingCertificate where
  nontrivial : nZero ≠ nOne
  embeddingInjective : ∀ {a b : RBOMA}, nOfR a = nOfR b → a = b
  addComm : ∀ z w : QNormal, nAdd z w = nAdd w z
  addAssoc : ∀ z w v : QNormal, nAdd (nAdd z w) v = nAdd z (nAdd w v)
  addZeroLeft : ∀ z : QNormal, nAdd nZero z = z
  addInverseRight : ∀ z : QNormal, nAdd z (nNeg z) = nZero
  mulComm : ∀ z w : QNormal, nMul z w = nMul w z
  mulAssoc : ∀ z w v : QNormal, nMul (nMul z w) v = nMul z (nMul w v)
  mulOneLeft : ∀ z : QNormal, nMul nOne z = z
  distribRight : ∀ z w v : QNormal,
    nMul z (nAdd w v) = nAdd (nMul z w) (nMul z v)
  mulZeroRight : ∀ z : QNormal, nMul z nZero = nZero
  embeddingZero : nOfR rZero = nZero
  embeddingOne : nOfR rOne = nOne
  embeddingNeg : ∀ a : RBOMA, nOfR (rNeg a) = nNeg (nOfR a)
  embeddingAdd : ∀ a b : RBOMA,
    nOfR (rAdd a b) = nAdd (nOfR a) (nOfR b)
  embeddingMul : ∀ a b : RBOMA,
    nOfR (rMulCandidate a b) = nMul (nOfR a) (nOfR b)
  imagSquared : nMul nI nI = nNeg nOne
  generation : ∀ z : QNormal,
    ∃ a b : RBOMA, z = nAdd (nOfR a) (nMul (nOfR b) nI)
  coordinateUnique : ∀ {a b a' b' : RBOMA},
    nAdd (nOfR a) (nMul (nOfR b) nI) =
      nAdd (nOfR a') (nMul (nOfR b') nI) → a = a' ∧ b = b'
  imagNotReal : ¬ ∃ a : RBOMA, nI = nOfR a

/-- Abstract real-interface construction; no real representation is unfolded. -/
theorem qNormalRingCertificate
    (C : RStageIntegrationCertificate) : QNormalRingCertificate where
  nontrivial := n_zero_ne_one C
  embeddingInjective := @n_ofR_injective
  addComm := n_add_comm C
  addAssoc := n_add_assoc C
  addZeroLeft := n_add_zero_left C
  addInverseRight := n_add_neg_right C
  mulComm := n_mul_comm C
  mulAssoc := n_mul_assoc C
  mulOneLeft := n_mul_one_left C
  distribRight := n_mul_add_right C
  mulZeroRight := n_mul_zero_right C
  embeddingZero := n_ofR_zero
  embeddingOne := n_ofR_one
  embeddingNeg := n_ofR_neg C
  embeddingAdd := n_ofR_add C
  embeddingMul := n_ofR_mul C
  imagSquared := n_i_squared C
  generation := n_generation C
  coordinateUnique := @n_coordinate_unique C
  imagNotReal := n_i_not_real C

/-- Instantiate the ring-core certificate on the accepted Stage-One real export. -/
theorem qNormalRingCertificateFromAcceptedR : QNormalRingCertificate :=
  qNormalRingCertificate rStageIntegrationCertificate

end BOMA.C.StageTwo.QNormalCore002
