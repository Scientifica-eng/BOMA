/- Stage-One real integration certificate.
This file introduces no new carrier, operation, axiom, or completeness notion.
It packages already-certified interfaces to verify that they coexist on one RBOMA. -/
namespace BOMA.R.StageIntegration002

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.R.Gateway001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindOrderConstructive001
open BOMA.R.DedekindOrderClassical001
open BOMA.R.DedekindStrictOrder001
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
open BOMA.R.DedekindCompleteness001
open BOMA.R.DedekindRationalDensity001
open BOMA.R.DedekindArchimedean001

/-- RA-21 machine-checkable integration surface.

The certificate deliberately keeps multiplicative inversion witness-based:
no global inverse selector is introduced. Completeness is exactly the selected
Dedekind least-upper-bound contract. -/
structure RStageIntegrationCertificate where
  qEmbeddingInjective :
    ∀ {q r : QBOMA}, rOfQ q = rOfQ r → q = r
  qOrderExact :
    ∀ q r : QBOMA, rLE (rOfQ q) (rOfQ r) ↔ qLE q r
  orderRefl :
    ∀ x : RBOMA, rLE x x
  orderTrans :
    ∀ {x y z : RBOMA}, rLE x y → rLE y z → rLE x z
  orderAntisymm :
    ∀ {x y : RBOMA}, rLE x y → rLE y x → x = y
  orderTotal :
    ∀ x y : RBOMA, rLE x y ∨ rLE y x
  strictIrrefl :
    ∀ x : RBOMA, ¬ rLT x x
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
  inverseUnique :
    ∀ {x y z : RBOMA},
      rMulCandidate x y = rOne →
      rMulCandidate x z = rOne → y = z
  positiveInverse :
    ∀ {x y : RBOMA},
      rLT rZero x → rMulCandidate x y = rOne → rLT rZero y
  dedekindLUB :
    ∀ (F : RBOMA → Prop),
      (∃ x : RBOMA, F x) →
      ∀ U : RBOMA, RUpperBound F U →
      ∃ s : RBOMA,
        (∀ x : RBOMA, F x → rLE x s) ∧
        (∀ B : RBOMA, RUpperBound F B → rLE s B)
  rationalDensity :
    ∀ {x y : RBOMA}, rLT x y →
      ∃ q : QBOMA, rLT x (rOfQ q) ∧ rLT (rOfQ q) y
  archimedeanUpper :
    ∀ x : RBOMA,
      ∃ n : BOMANat, rLT x (rOfQ (BOMA.Q.Embedding001.qOfN n))

/-- The single certificate used by R-J-002. Each field is an already-proved
Stage-One theorem instantiated on the same formal carrier and operations. -/
theorem rStageIntegrationCertificate : RStageIntegrationCertificate where
  qEmbeddingInjective := @rOfQ_injective
  qOrderExact := rOfQ_order
  orderRefl := rLE_refl
  orderTrans := @rLE_trans
  orderAntisymm := @rLE_antisymm
  orderTotal := rLE_total_classical
  strictIrrefl := rlt_irrefl
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
  inverseUnique := @r_inverse_witness_unique
  positiveInverse := @rInverse_positive_of_positive
  dedekindLUB := rDedekind_lub_exists
  rationalDensity := @r_rational_image_dense
  archimedeanUpper := r_archimedean_strict_upper

end BOMA.R.StageIntegration002
