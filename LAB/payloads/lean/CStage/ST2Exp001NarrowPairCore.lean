/- PDSA-C-004: user-selected Route P canonical complex carrier and ring core.

The canonical carrier transparently reuses the already verified Route P record.
Every non-definitional scalar law is derived from the abstract accepted real
integration certificate. This file proves a commutative-ring core only; the
nonzero multiplicative inverse belongs to a later frozen PDSA cycle.
-/
namespace BOMA.C.StageTwo.NarrowPairCore001

open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.C.StageTwo.NarrowRInterface001
open BOMA.C.StageTwo.NarrowNoSquare001

/-- The branch carrier is definitionally the original accepted pair carrier. -/
abbrev CBOMA : Type := BOMA.C.PairCore001.CBOMA

theorem c_ext {z w : CBOMA}
    (hre : z.re = w.re) (him : z.im = w.im) : z = w :=
  BOMA.C.RoutePairProbe001.pair_ext hre him

abbrev cZero : CBOMA := BOMA.C.PairCore001.cZero
abbrev cOne : CBOMA := BOMA.C.PairCore001.cOne
abbrev cOfR (a : RBOMA) : CBOMA := BOMA.C.PairCore001.cOfR a
abbrev cI : CBOMA := BOMA.C.PairCore001.cI
abbrev cNeg (z : CBOMA) : CBOMA := BOMA.C.PairCore001.cNeg z
abbrev cAdd (z w : CBOMA) : CBOMA := BOMA.C.PairCore001.cAdd z w
abbrev cMul (z w : CBOMA) : CBOMA := BOMA.C.PairCore001.cMul z w

/-- Scalar additive reassociation needed by the explicit equational normalizer. -/
theorem r_add_left_comm_from_interface
    (C : NarrowROrderedFieldCertificate) (a b c : RBOMA) :
    rAdd a (rAdd b c) = rAdd b (rAdd a c) := by
  calc
    rAdd a (rAdd b c) = rAdd (rAdd a b) c := (C.addAssoc a b c).symm
    _ = rAdd (rAdd b a) c := by rw [C.addComm a b]
    _ = rAdd b (rAdd a c) := C.addAssoc b a c

/-- Scalar multiplicative reassociation needed by the explicit normalizer. -/
theorem r_mul_left_comm_from_interface
    (C : NarrowROrderedFieldCertificate) (a b c : RBOMA) :
    rMulCandidate a (rMulCandidate b c) =
      rMulCandidate b (rMulCandidate a c) := by
  calc
    rMulCandidate a (rMulCandidate b c) =
        rMulCandidate (rMulCandidate a b) c := (C.mulAssoc a b c).symm
    _ = rMulCandidate (rMulCandidate b a) c := by rw [C.mulComm a b]
    _ = rMulCandidate b (rMulCandidate a c) := C.mulAssoc b a c

/-- Distribution in the first scalar argument is derived, not assumed. -/
theorem r_mul_add_left_from_interface
    (C : NarrowROrderedFieldCertificate) (a b c : RBOMA) :
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
    (C : NarrowROrderedFieldCertificate) (a b : RBOMA) :
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
theorem c_zero_ne_one (C : NarrowROrderedFieldCertificate) :
    cZero ≠ cOne := by
  intro h
  exact C.nontrivial (congrArg BOMA.C.RoutePairProbe001.PairCandidate.re h)

/-- The selected real embedding is faithful. -/
theorem c_ofR_injective {a b : RBOMA} (h : cOfR a = cOfR b) : a = b :=
  BOMA.C.StageTwo.NarrowRoutePair001.ofR_injective h

theorem c_add_comm (C : NarrowROrderedFieldCertificate) (z w : CBOMA) :
    cAdd z w = cAdd w z := by
  apply c_ext
  · exact C.addComm z.re w.re
  · exact C.addComm z.im w.im

theorem c_add_assoc
    (C : NarrowROrderedFieldCertificate) (z w v : CBOMA) :
    cAdd (cAdd z w) v = cAdd z (cAdd w v) := by
  apply c_ext
  · exact C.addAssoc z.re w.re v.re
  · exact C.addAssoc z.im w.im v.im

theorem c_add_zero_left (C : NarrowROrderedFieldCertificate) (z : CBOMA) :
    cAdd cZero z = z := by
  apply c_ext
  · exact C.addZeroLeft z.re
  · exact C.addZeroLeft z.im

theorem c_add_zero_right (C : NarrowROrderedFieldCertificate) (z : CBOMA) :
    cAdd z cZero = z := by
  rw [c_add_comm C z cZero, c_add_zero_left C z]

theorem c_add_neg_right (C : NarrowROrderedFieldCertificate) (z : CBOMA) :
    cAdd z (cNeg z) = cZero := by
  apply c_ext
  · exact C.addInverseRight z.re
  · exact C.addInverseRight z.im

theorem c_add_neg_left (C : NarrowROrderedFieldCertificate) (z : CBOMA) :
    cAdd (cNeg z) z = cZero := by
  rw [c_add_comm C (cNeg z) z, c_add_neg_right C z]

theorem c_neg_involutive (C : NarrowROrderedFieldCertificate) (z : CBOMA) :
    cNeg (cNeg z) = z := by
  apply c_ext
  · exact neg_involutive_from_interface C z.re
  · exact neg_involutive_from_interface C z.im

theorem c_mul_comm (C : NarrowROrderedFieldCertificate) (z w : CBOMA) :
    cMul z w = cMul w z := by
  cases z <;> cases w <;>
    simp [cMul, BOMA.C.PairCore001.cMul,
      BOMA.C.RoutePairProbe001.mul, C.mulComm, C.addComm]

/-- Associativity is an explicit consequence of the accepted real ring laws. -/
theorem c_mul_assoc
    (C : NarrowROrderedFieldCertificate) (z w v : CBOMA) :
    cMul (cMul z w) v = cMul z (cMul w v) := by
  cases z <;> cases w <;> cases v <;>
    simp [cMul, BOMA.C.PairCore001.cMul,
      BOMA.C.RoutePairProbe001.mul,
      r_mul_add_left_from_interface C, C.distribRight,
      mul_neg_left_from_interface C, mul_neg_right_from_interface C,
      r_neg_add_from_interface C, neg_involutive_from_interface C,
      C.mulAssoc, C.mulComm, r_mul_left_comm_from_interface C,
      C.addAssoc, C.addComm, r_add_left_comm_from_interface C]

theorem c_mul_one_left (C : NarrowROrderedFieldCertificate) (z : CBOMA) :
    cMul cOne z = z := by
  apply c_ext
  · change
      rAdd (rMulCandidate rOne z.re)
        (rNeg (rMulCandidate rZero z.im)) = z.re
    rw [C.mulOneLeft z.re, mul_zero_left_from_interface C z.im,
      neg_zero_from_interface C,
      BOMA.C.StageTwo.NarrowRoutePair001.add_zero_right_from_interface C z.re]
  · change
      rAdd (rMulCandidate rOne z.im)
        (rMulCandidate rZero z.re) = z.im
    rw [C.mulOneLeft z.im, mul_zero_left_from_interface C z.re,
      BOMA.C.StageTwo.NarrowRoutePair001.add_zero_right_from_interface C z.im]

theorem c_mul_one_right (C : NarrowROrderedFieldCertificate) (z : CBOMA) :
    cMul z cOne = z := by
  rw [c_mul_comm C z cOne, c_mul_one_left C z]

/-- Right distribution is proved independently from the abstract real interface. -/
theorem c_mul_add_right
    (C : NarrowROrderedFieldCertificate) (z w v : CBOMA) :
    cMul z (cAdd w v) = cAdd (cMul z w) (cMul z v) := by
  cases z <;> cases w <;> cases v <;>
    simp [cMul, cAdd, BOMA.C.PairCore001.cMul,
      BOMA.C.PairCore001.cAdd, BOMA.C.RoutePairProbe001.mul,
      BOMA.C.RoutePairProbe001.add,
      r_mul_add_left_from_interface C, C.distribRight,
      mul_neg_left_from_interface C, mul_neg_right_from_interface C,
      r_neg_add_from_interface C, neg_involutive_from_interface C,
      C.mulAssoc, C.mulComm, r_mul_left_comm_from_interface C,
      C.addAssoc, C.addComm, r_add_left_comm_from_interface C]

theorem c_mul_add_left
    (C : NarrowROrderedFieldCertificate) (z w v : CBOMA) :
    cMul (cAdd z w) v = cAdd (cMul z v) (cMul w v) := by
  calc
    cMul (cAdd z w) v = cMul v (cAdd z w) :=
      c_mul_comm C (cAdd z w) v
    _ = cAdd (cMul v z) (cMul v w) := c_mul_add_right C v z w
    _ = cAdd (cMul z v) (cMul w v) := by
      rw [c_mul_comm C v z, c_mul_comm C v w]

theorem c_mul_zero_left (C : NarrowROrderedFieldCertificate) (z : CBOMA) :
    cMul cZero z = cZero := by
  apply c_ext
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

theorem c_mul_zero_right (C : NarrowROrderedFieldCertificate) (z : CBOMA) :
    cMul z cZero = cZero := by
  rw [c_mul_comm C z cZero, c_mul_zero_left C z]

theorem c_ofR_zero : cOfR rZero = cZero := rfl

theorem c_ofR_one : cOfR rOne = cOne := rfl

theorem c_ofR_neg (C : NarrowROrderedFieldCertificate) (a : RBOMA) :
    cOfR (rNeg a) = cNeg (cOfR a) := by
  apply c_ext
  · rfl
  · exact (neg_zero_from_interface C).symm

theorem c_ofR_add (C : NarrowROrderedFieldCertificate) (a b : RBOMA) :
    cOfR (rAdd a b) = cAdd (cOfR a) (cOfR b) := by
  apply c_ext
  · rfl
  · exact (C.addZeroLeft rZero).symm

theorem c_ofR_mul (C : NarrowROrderedFieldCertificate) (a b : RBOMA) :
    cOfR (rMulCandidate a b) = cMul (cOfR a) (cOfR b) := by
  apply c_ext
  · change
      rMulCandidate a b =
        rAdd (rMulCandidate a b) (rNeg (rMulCandidate rZero rZero))
    rw [mul_zero_left_from_interface C rZero,
      neg_zero_from_interface C,
      BOMA.C.StageTwo.NarrowRoutePair001.add_zero_right_from_interface C
        (rMulCandidate a b)]
  · change
      rZero = rAdd (rMulCandidate a rZero) (rMulCandidate rZero b)
    rw [mul_zero_right_from_interface C a,
      mul_zero_left_from_interface C b, C.addZeroLeft rZero]

theorem c_i_squared (C : NarrowROrderedFieldCertificate) :
    cMul cI cI = cNeg cOne :=
  BOMA.C.StageTwo.NarrowRoutePair001.imag_squared C

theorem c_generation (C : NarrowROrderedFieldCertificate) (z : CBOMA) :
    ∃ a b : RBOMA, z = cAdd (cOfR a) (cMul (cOfR b) cI) :=
  BOMA.C.StageTwo.NarrowRoutePair001.decomposition C z

theorem c_coordinate_unique
    (C : NarrowROrderedFieldCertificate) {a b a' b' : RBOMA}
    (h : cAdd (cOfR a) (cMul (cOfR b) cI) =
      cAdd (cOfR a') (cMul (cOfR b') cI)) :
    a = a' ∧ b = b' :=
  BOMA.C.StageTwo.NarrowRoutePair001.decomposition_unique C h

theorem c_i_not_real (C : NarrowROrderedFieldCertificate) :
    ¬ ∃ a : RBOMA, cI = cOfR a :=
  BOMA.C.StageTwo.NarrowRoutePair001.imag_not_real C

/-- Precisely scoped selected-route integration surface: ring, not field. -/
structure CPairRingCoreCertificate where
  nontrivial : cZero ≠ cOne
  embeddingInjective : ∀ {a b : RBOMA}, cOfR a = cOfR b → a = b
  addComm : ∀ z w : CBOMA, cAdd z w = cAdd w z
  addAssoc : ∀ z w v : CBOMA, cAdd (cAdd z w) v = cAdd z (cAdd w v)
  addZeroLeft : ∀ z : CBOMA, cAdd cZero z = z
  addInverseRight : ∀ z : CBOMA, cAdd z (cNeg z) = cZero
  mulComm : ∀ z w : CBOMA, cMul z w = cMul w z
  mulAssoc : ∀ z w v : CBOMA, cMul (cMul z w) v = cMul z (cMul w v)
  mulOneLeft : ∀ z : CBOMA, cMul cOne z = z
  distribRight : ∀ z w v : CBOMA,
    cMul z (cAdd w v) = cAdd (cMul z w) (cMul z v)
  mulZeroRight : ∀ z : CBOMA, cMul z cZero = cZero
  embeddingZero : cOfR rZero = cZero
  embeddingOne : cOfR rOne = cOne
  embeddingNeg : ∀ a : RBOMA, cOfR (rNeg a) = cNeg (cOfR a)
  embeddingAdd : ∀ a b : RBOMA,
    cOfR (rAdd a b) = cAdd (cOfR a) (cOfR b)
  embeddingMul : ∀ a b : RBOMA,
    cOfR (rMulCandidate a b) = cMul (cOfR a) (cOfR b)
  imagSquared : cMul cI cI = cNeg cOne
  generation : ∀ z : CBOMA,
    ∃ a b : RBOMA, z = cAdd (cOfR a) (cMul (cOfR b) cI)
  coordinateUnique : ∀ {a b a' b' : RBOMA},
    cAdd (cOfR a) (cMul (cOfR b) cI) =
      cAdd (cOfR a') (cMul (cOfR b') cI) → a = a' ∧ b = b'
  imagNotReal : ¬ ∃ a : RBOMA, cI = cOfR a

/-- Abstract real-interface construction; no real representation is unfolded. -/
theorem cPairRingCoreCertificate
    (C : NarrowROrderedFieldCertificate) : CPairRingCoreCertificate where
  nontrivial := c_zero_ne_one C
  embeddingInjective := @c_ofR_injective
  addComm := c_add_comm C
  addAssoc := c_add_assoc C
  addZeroLeft := c_add_zero_left C
  addInverseRight := c_add_neg_right C
  mulComm := c_mul_comm C
  mulAssoc := c_mul_assoc C
  mulOneLeft := c_mul_one_left C
  distribRight := c_mul_add_right C
  mulZeroRight := c_mul_zero_right C
  embeddingZero := c_ofR_zero
  embeddingOne := c_ofR_one
  embeddingNeg := c_ofR_neg C
  embeddingAdd := c_ofR_add C
  embeddingMul := c_ofR_mul C
  imagSquared := c_i_squared C
  generation := c_generation C
  coordinateUnique := @c_coordinate_unique C
  imagNotReal := c_i_not_real C

/-- Instantiate the ring-core certificate on the accepted Stage-One real export. -/
theorem cPairRingCoreCertificateFromNarrowR : CPairRingCoreCertificate :=
  cPairRingCoreCertificate narrowRFromAcceptedProducers

end BOMA.C.StageTwo.NarrowPairCore001
