/- ST2-EXP-001: the exact sixteen real properties directly consumed by C.
The certificate is assembled from existing accepted producers, never from the
oversized R integration certificate. Carrier and scalar operations are unchanged. -/
namespace BOMA.C.StageTwo.NarrowRInterface001

open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindOrderConstructive001
open BOMA.R.DedekindOrderClassical001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindAdditionLaws001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindAdditiveInverse001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.DedekindSignedMulBasicLaws001
open BOMA.R.DedekindSignedMulAssociativity001
open BOMA.R.DedekindSignedMulDistributivity001
open BOMA.R.DedekindOrderedRing001
open BOMA.R.DedekindNonzeroInverse004
open BOMA.R.DedekindOrderedFieldClosure001

/-- Exactly the sixteen accepted-real properties projected by the selected C proof. -/
structure NarrowROrderedFieldCertificate where
  orderTrans :
    ∀ {x y z : RBOMA}, rLE x y → rLE y z → rLE x z
  orderAntisymm :
    ∀ {x y : RBOMA}, rLE x y → rLE y x → x = y
  orderTotal :
    ∀ x y : RBOMA, rLE x y ∨ rLE y x
  nontrivial :
    rZero ≠ rOne
  addComm :
    ∀ x y : RBOMA, rAdd x y = rAdd y x
  addAssoc :
    ∀ x y z : RBOMA, rAdd (rAdd x y) z = rAdd x (rAdd y z)
  addZeroLeft :
    ∀ x : RBOMA, rAdd rZero x = x
  addInverseRight :
    ∀ x : RBOMA, rAdd x (rNeg x) = rZero
  addTranslateOrderIff :
    ∀ x y c : RBOMA, rLE (rAdd x c) (rAdd y c) ↔ rLE x y
  negOrderReversing :
    ∀ {x y : RBOMA}, rLE x y → rLE (rNeg y) (rNeg x)
  mulComm :
    ∀ x y : RBOMA, rMulCandidate x y = rMulCandidate y x
  mulAssoc :
    ∀ x y z : RBOMA,
      rMulCandidate (rMulCandidate x y) z =
      rMulCandidate x (rMulCandidate y z)
  mulOneLeft :
    ∀ x : RBOMA, rMulCandidate rOne x = x
  distribRight :
    ∀ x y z : RBOMA,
      rMulCandidate x (rAdd y z) =
      rAdd (rMulCandidate x y) (rMulCandidate x z)
  orderMulNonneg :
    ∀ {a b c : RBOMA},
      rLE a b → rLE rZero c →
      rLE (rMulCandidate a c) (rMulCandidate b c)
  inverseExists :
    ∀ x : RBOMA, x ≠ rZero →
      ∃ y : RBOMA, rMulCandidate x y = rOne

/-- Direct producer assembly; no projection of the whole accepted-R package. -/
theorem narrowRFromAcceptedProducers : NarrowROrderedFieldCertificate where
  orderTrans := @rLE_trans
  orderAntisymm := @rLE_antisymm
  orderTotal := rLE_total_classical
  nontrivial := rZero_ne_rOne_field
  addComm := rAdd_comm
  addAssoc := rAdd_assoc
  addZeroLeft := rAdd_zero_left
  addInverseRight := rAdd_neg_right
  addTranslateOrderIff := rLE_add_right_iff
  negOrderReversing := @rNeg_order_reversing
  mulComm := rMulCandidate_comm
  mulAssoc := rMulCandidate_assoc
  mulOneLeft := rMulCandidate_one_left
  distribRight := rMulCandidate_add_right
  orderMulNonneg := @rMulCandidate_order_compatible
  inverseExists := r_inverse_exists_nonzero

end BOMA.C.StageTwo.NarrowRInterface001
