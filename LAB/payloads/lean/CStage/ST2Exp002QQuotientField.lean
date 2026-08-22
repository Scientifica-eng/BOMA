/- ST2-EXP-002: independent field on the retained quadratic-expression quotient.
Every result is proved from accepted R and Route Q's own normalized witness field. -/
namespace BOMA.C.StageTwo.QQuotientField002

open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.StageIntegration002
open BOMA.C.StageTwo.QNormalCore002
open BOMA.C.StageTwo.QNormalNormInverse002

abbrev QBOMA : Type := BOMA.C.RouteQuadraticQuotientProbe001.QuotientCandidate
abbrev qZero : QBOMA := BOMA.C.RouteQuadraticQuotientProbe001.zero
abbrev qOne : QBOMA := BOMA.C.RouteQuadraticQuotientProbe001.one
abbrev qOfR (a : RBOMA) : QBOMA := BOMA.C.RouteQuadraticQuotientProbe001.ofR a
abbrev qI : QBOMA := BOMA.C.RouteQuadraticQuotientProbe001.imag
abbrev qNeg (z : QBOMA) : QBOMA := BOMA.C.RouteQuadraticQuotientProbe001.neg z
abbrev qAdd (z w : QBOMA) : QBOMA := BOMA.C.RouteQuadraticQuotientProbe001.add z w
abbrev qMul (z w : QBOMA) : QBOMA := BOMA.C.RouteQuadraticQuotientProbe001.mul z w

/-- Constructive canonical normal form; no representative choice is involved. -/
def qNormal : QBOMA → QNormal :=
  Quotient.lift BOMA.C.RouteQuadraticQuotientProbe001.normalize
    (fun _ _ h => h)

/-- Quotient identity is exactly equality of canonical normal forms. -/
theorem q_ext {z w : QBOMA}
    (h : qNormal z = qNormal w) : z = w := by
  revert h
  refine Quotient.inductionOn₂ z w ?_
  intro e f h
  exact Quotient.sound h

theorem q_normal_zero : qNormal qZero = nZero := rfl

theorem q_normal_one : qNormal qOne = nOne := rfl

theorem q_normal_ofR (a : RBOMA) : qNormal (qOfR a) = nOfR a := rfl

theorem q_normal_imag : qNormal qI = nI := rfl

theorem q_normal_neg (z : QBOMA) :
    qNormal (qNeg z) = nNeg (qNormal z) := by
  refine Quotient.inductionOn z ?_
  intro e
  rfl

theorem q_normal_add (z w : QBOMA) :
    qNormal (qAdd z w) = nAdd (qNormal z) (qNormal w) := by
  refine Quotient.inductionOn₂ z w ?_
  intro e f
  rfl

theorem q_normal_mul (z w : QBOMA) :
    qNormal (qMul z w) = nMul (qNormal z) (qNormal w) := by
  refine Quotient.inductionOn₂ z w ?_
  intro e f
  rfl

theorem q_zero_ne_one (R : RStageIntegrationCertificate) :
    qZero ≠ qOne := by
  intro h
  exact R.nontrivial (BOMA.C.RouteQuadraticQuotientProbe001.ofR_injective h)

theorem q_ofR_injective {a b : RBOMA} (h : qOfR a = qOfR b) :
    a = b :=
  BOMA.C.RouteQuadraticQuotientProbe001.ofR_injective h

theorem q_add_comm (R : RStageIntegrationCertificate) (z w : QBOMA) :
    qAdd z w = qAdd w z := by
  apply q_ext
  rw [q_normal_add, q_normal_add]
  exact n_add_comm R (qNormal z) (qNormal w)

theorem q_add_assoc (R : RStageIntegrationCertificate) (z w v : QBOMA) :
    qAdd (qAdd z w) v = qAdd z (qAdd w v) := by
  apply q_ext
  rw [q_normal_add, q_normal_add, q_normal_add, q_normal_add]
  exact n_add_assoc R (qNormal z) (qNormal w) (qNormal v)

theorem q_add_zero_left (R : RStageIntegrationCertificate) (z : QBOMA) :
    qAdd qZero z = z := by
  apply q_ext
  rw [q_normal_add, q_normal_zero]
  exact n_add_zero_left R (qNormal z)

theorem q_add_neg_right (R : RStageIntegrationCertificate) (z : QBOMA) :
    qAdd z (qNeg z) = qZero := by
  apply q_ext
  rw [q_normal_add, q_normal_neg, q_normal_zero]
  exact n_add_neg_right R (qNormal z)

theorem q_mul_comm (R : RStageIntegrationCertificate) (z w : QBOMA) :
    qMul z w = qMul w z := by
  apply q_ext
  rw [q_normal_mul, q_normal_mul]
  exact n_mul_comm R (qNormal z) (qNormal w)

theorem q_mul_assoc (R : RStageIntegrationCertificate) (z w v : QBOMA) :
    qMul (qMul z w) v = qMul z (qMul w v) := by
  apply q_ext
  rw [q_normal_mul, q_normal_mul, q_normal_mul, q_normal_mul]
  exact n_mul_assoc R (qNormal z) (qNormal w) (qNormal v)

theorem q_mul_one_left (R : RStageIntegrationCertificate) (z : QBOMA) :
    qMul qOne z = z := by
  apply q_ext
  rw [q_normal_mul, q_normal_one]
  exact n_mul_one_left R (qNormal z)

theorem q_mul_one_right (R : RStageIntegrationCertificate) (z : QBOMA) :
    qMul z qOne = z := by
  rw [q_mul_comm R z qOne, q_mul_one_left R z]

theorem q_mul_add_right
    (R : RStageIntegrationCertificate) (z w v : QBOMA) :
    qMul z (qAdd w v) = qAdd (qMul z w) (qMul z v) := by
  apply q_ext
  rw [q_normal_mul, q_normal_add, q_normal_add, q_normal_mul, q_normal_mul]
  exact n_mul_add_right R (qNormal z) (qNormal w) (qNormal v)

theorem q_mul_zero_right (R : RStageIntegrationCertificate) (z : QBOMA) :
    qMul z qZero = qZero := by
  apply q_ext
  rw [q_normal_mul, q_normal_zero]
  exact n_mul_zero_right R (qNormal z)

theorem q_ofR_zero : qOfR rZero = qZero := rfl

theorem q_ofR_one : qOfR rOne = qOne := rfl

theorem q_ofR_neg (R : RStageIntegrationCertificate) (a : RBOMA) :
    qOfR (rNeg a) = qNeg (qOfR a) := by
  apply q_ext
  rw [q_normal_ofR, q_normal_neg, q_normal_ofR]
  exact n_ofR_neg R a

theorem q_ofR_add (R : RStageIntegrationCertificate) (a b : RBOMA) :
    qOfR (rAdd a b) = qAdd (qOfR a) (qOfR b) := by
  apply q_ext
  rw [q_normal_ofR, q_normal_add, q_normal_ofR, q_normal_ofR]
  exact n_ofR_add R a b

theorem q_ofR_mul (R : RStageIntegrationCertificate) (a b : RBOMA) :
    qOfR (rMulCandidate a b) = qMul (qOfR a) (qOfR b) := by
  apply q_ext
  rw [q_normal_ofR, q_normal_mul, q_normal_ofR, q_normal_ofR]
  exact n_ofR_mul R a b

theorem q_i_squared (R : RStageIntegrationCertificate) :
    qMul qI qI = qNeg qOne :=
  BOMA.C.RouteQuadraticQuotientProbe001.imag_squared R

def qCoord (a b : RBOMA) : QBOMA :=
  qAdd (qOfR a) (qMul (qOfR b) qI)

theorem q_normal_coord (R : RStageIntegrationCertificate) (a b : RBOMA) :
    qNormal (qCoord a b) = ⟨a, b⟩ := by
  exact BOMA.C.RouteQuadraticQuotientProbe001.normalized_coordinate_expression R a b

theorem q_generation (R : RStageIntegrationCertificate) (z : QBOMA) :
    ∃ a b : RBOMA, z = qCoord a b :=
  BOMA.C.RouteQuadraticQuotientProbe001.decomposition R z

theorem q_coordinate_unique
    (R : RStageIntegrationCertificate) {a b c d : RBOMA}
    (h : qCoord a b = qCoord c d) : a = c ∧ b = d :=
  BOMA.C.RouteQuadraticQuotientProbe001.decomposition_unique R h

theorem q_i_not_real (R : RStageIntegrationCertificate) :
    ¬ ∃ a : RBOMA, qI = qOfR a :=
  BOMA.C.RouteQuadraticQuotientProbe001.imag_not_real R

def qRe (z : QBOMA) : RBOMA := (qNormal z).re
def qIm (z : QBOMA) : RBOMA := (qNormal z).im

theorem q_extract_sound (R : RStageIntegrationCertificate) (z : QBOMA) :
    z = qCoord (qRe z) (qIm z) := by
  apply q_ext
  rw [q_normal_coord R]
  change qNormal z = ⟨(qNormal z).re, (qNormal z).im⟩
  cases qNormal z
  rfl

theorem q_coordinate_zero (R : RStageIntegrationCertificate) :
    qCoord rZero rZero = qZero := by
  apply q_ext
  rw [q_normal_coord R, q_normal_zero]
  rfl

theorem q_coordinate_one (R : RStageIntegrationCertificate) :
    qCoord rOne rZero = qOne := by
  apply q_ext
  rw [q_normal_coord R, q_normal_one]
  rfl

theorem q_coordinate_real (R : RStageIntegrationCertificate) (a : RBOMA) :
    qCoord a rZero = qOfR a := by
  apply q_ext
  rw [q_normal_coord R, q_normal_ofR]
  rfl

theorem q_coordinate_imag (R : RStageIntegrationCertificate) :
    qCoord rZero rOne = qI := by
  apply q_ext
  rw [q_normal_coord R, q_normal_imag]
  rfl

theorem q_coordinate_neg (R : RStageIntegrationCertificate) (a b : RBOMA) :
    qNeg (qCoord a b) = qCoord (rNeg a) (rNeg b) := by
  apply q_ext
  rw [q_normal_neg, q_normal_coord R, q_normal_coord R]
  rfl

theorem q_coordinate_add
    (R : RStageIntegrationCertificate) (a b c d : RBOMA) :
    qAdd (qCoord a b) (qCoord c d) =
      qCoord (rAdd a c) (rAdd b d) := by
  apply q_ext
  rw [q_normal_add, q_normal_coord R, q_normal_coord R, q_normal_coord R]
  rfl

theorem q_coordinate_mul
    (R : RStageIntegrationCertificate) (a b c d : RBOMA) :
    qMul (qCoord a b) (qCoord c d) =
      qCoord
        (rAdd (rMulCandidate a c) (rNeg (rMulCandidate b d)))
        (rAdd (rMulCandidate a d) (rMulCandidate b c)) := by
  apply q_ext
  rw [q_normal_mul, q_normal_coord R, q_normal_coord R, q_normal_coord R]
  rfl

/-- Encode a Q-local normal form by the quotient's declared expression syntax. -/
def qOfNormal (u : QNormal) : QBOMA := qCoord u.re u.im

theorem q_normal_of_normal
    (R : RStageIntegrationCertificate) (u : QNormal) :
    qNormal (qOfNormal u) = u := by
  change qNormal (qCoord u.re u.im) = u
  rw [q_normal_coord R]
  cases u
  rfl

theorem q_inverse_exists
    (R : RStageIntegrationCertificate) (z : QBOMA)
    (hnonzero : z ≠ qZero) :
    ∃ w : QBOMA, qMul z w = qOne := by
  have hn : qNormal z ≠ nZero := by
    intro hz
    apply hnonzero
    apply q_ext
    rw [q_normal_zero]
    exact hz
  rcases n_inverse_exists R (qNormal z) hn with ⟨w, hw⟩
  refine ⟨qOfNormal w, ?_⟩
  apply q_ext
  rw [q_normal_mul, q_normal_of_normal R w, q_normal_one]
  exact hw

theorem q_inverse_unique
    (R : RStageIntegrationCertificate) {z w v : QBOMA}
    (hw : qMul z w = qOne) (hv : qMul z v = qOne) :
    w = v := by
  calc
    w = qMul w qOne := (q_mul_one_right R w).symm
    _ = qMul w (qMul z v) := by rw [hv]
    _ = qMul (qMul w z) v := (q_mul_assoc R w z v).symm
    _ = qMul qOne v := by rw [q_mul_comm R w z, hw]
    _ = v := q_mul_one_left R v

/-- Independent Route-Q field contract at quotient equality and identity. -/
structure QFieldCertificate where
  nontrivial : qZero ≠ qOne
  embeddingInjective : ∀ {a b : RBOMA}, qOfR a = qOfR b → a = b
  addComm : ∀ z w : QBOMA, qAdd z w = qAdd w z
  addAssoc : ∀ z w v : QBOMA, qAdd (qAdd z w) v = qAdd z (qAdd w v)
  addZeroLeft : ∀ z : QBOMA, qAdd qZero z = z
  addInverseRight : ∀ z : QBOMA, qAdd z (qNeg z) = qZero
  mulComm : ∀ z w : QBOMA, qMul z w = qMul w z
  mulAssoc : ∀ z w v : QBOMA, qMul (qMul z w) v = qMul z (qMul w v)
  mulOneLeft : ∀ z : QBOMA, qMul qOne z = z
  distribRight : ∀ z w v : QBOMA,
    qMul z (qAdd w v) = qAdd (qMul z w) (qMul z v)
  inverseExists : ∀ z : QBOMA, z ≠ qZero → ∃ w : QBOMA, qMul z w = qOne
  inverseUnique : ∀ {z w v : QBOMA}, qMul z w = qOne → qMul z v = qOne → w = v
  embeddingZero : qOfR rZero = qZero
  embeddingOne : qOfR rOne = qOne
  embeddingNeg : ∀ a : RBOMA, qOfR (rNeg a) = qNeg (qOfR a)
  embeddingAdd : ∀ a b : RBOMA, qOfR (rAdd a b) = qAdd (qOfR a) (qOfR b)
  embeddingMul : ∀ a b : RBOMA,
    qOfR (rMulCandidate a b) = qMul (qOfR a) (qOfR b)
  imagSquared : qMul qI qI = qNeg qOne
  generation : ∀ z : QBOMA, ∃ a b : RBOMA, z = qCoord a b
  coordinateUnique : ∀ {a b c d : RBOMA}, qCoord a b = qCoord c d → a = c ∧ b = d
  imagNotReal : ¬ ∃ a : RBOMA, qI = qOfR a
  extractorSound : ∀ z : QBOMA, z = qCoord (qRe z) (qIm z)

theorem qFieldCertificate (R : RStageIntegrationCertificate) :
    QFieldCertificate where
  nontrivial := q_zero_ne_one R
  embeddingInjective := @q_ofR_injective
  addComm := q_add_comm R
  addAssoc := q_add_assoc R
  addZeroLeft := q_add_zero_left R
  addInverseRight := q_add_neg_right R
  mulComm := q_mul_comm R
  mulAssoc := q_mul_assoc R
  mulOneLeft := q_mul_one_left R
  distribRight := q_mul_add_right R
  inverseExists := q_inverse_exists R
  inverseUnique := @q_inverse_unique R
  embeddingZero := q_ofR_zero
  embeddingOne := q_ofR_one
  embeddingNeg := q_ofR_neg R
  embeddingAdd := q_ofR_add R
  embeddingMul := q_ofR_mul R
  imagSquared := q_i_squared R
  generation := q_generation R
  coordinateUnique := @q_coordinate_unique R
  imagNotReal := q_i_not_real R
  extractorSound := q_extract_sound R

/-- Independent field witness instantiated on the same whole accepted-R interface. -/
theorem qFieldCertificateFromAcceptedR : QFieldCertificate :=
  qFieldCertificate rStageIntegrationCertificate

end BOMA.C.StageTwo.QQuotientField002
