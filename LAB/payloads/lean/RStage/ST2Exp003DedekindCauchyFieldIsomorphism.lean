/- ST2-EXP-003 H5 inverse-preservation and field-isomorphism layer.

   This source starts only after the exact-verified multiplicative-preservation
   milestone.  Both completed real routes intentionally expose multiplicative
   inverses through unique witness relations rather than a newly selected global
   inverse operation.  The comparison therefore preserves and reflects that
   exact witness relation, together with nonzeroness.

   This file packages the resulting order/field-structure isomorphism at theorem
   level.  It does not declare a research Junction, does not modify accepted R,
   and does not start the downstream C rebuild. -/
namespace BOMA.R.StageTwo.DedekindCauchyComparison003

open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.DedekindNonzeroInverse004
open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyAdditive003
open BOMA.R.StageTwo.CauchyMultiplicative003
open BOMA.R.StageTwo.CauchyInverse003

/-- Forward comparison preserves and reflects zero, hence nonzeroness. -/
theorem cToD_ne_zero_iff {x : RCBOMA} :
    cToD x ≠ rZero ↔ x ≠ rCZero := by
  constructor
  · intro hx h0
    apply hx
    rw [h0, cToD_zero]
  · intro hx h0
    apply hx
    have h := congrArg dToC h0
    rw [dToC_cToD, dToC_zero] at h
    exact h

/-- Reverse comparison preserves and reflects zero, hence nonzeroness. -/
theorem dToC_ne_zero_iff {x : RBOMA} :
    dToC x ≠ rCZero ↔ x ≠ rZero := by
  constructor
  · intro hx h0
    apply hx
    rw [h0, dToC_zero]
  · intro hx h0
    apply hx
    have h := congrArg cToD h0
    rw [cToD_dToC, cToD_zero] at h
    exact h

/-- The forward H5 map preserves and reflects the exact multiplicative inverse
    witness relation. -/
theorem cToD_inverse_relation_iff {x y : RCBOMA} :
    RCInvRel x y ↔ rMulCandidate (cToD x) (cToD y) = rOne := by
  unfold RCInvRel
  constructor
  · intro h
    have hm := congrArg cToD h
    rw [cToD_mul, cToD_one] at hm
    exact hm
  · intro h
    have hm : cToD (rCMul x y) = cToD rCOne := by
      rw [cToD_mul, cToD_one]
      exact h
    have hi := congrArg dToC hm
    simpa only [dToC_cToD] using hi

/-- The reverse H5 map preserves and reflects the accepted inverse witness
    equation. -/
theorem dToC_inverse_relation_iff {x y : RBOMA} :
    rMulCandidate x y = rOne ↔ RCInvRel (dToC x) (dToC y) := by
  unfold RCInvRel
  constructor
  · intro h
    have hm := congrArg dToC h
    rw [dToC_mul, dToC_one] at hm
    exact hm
  · intro h
    have hm :
        dToC (rMulCandidate x y) = dToC rOne := by
      rw [dToC_mul, dToC_one]
      exact h
    have hi := congrArg cToD hm
    simpa only [cToD_dToC] using hi

/-- Every nonzero Cauchy inverse witness transports to an accepted Dedekind
    inverse witness without selecting any new element. -/
theorem cToD_inverse_witness
    {x y : RCBOMA}
    (hx : x ≠ rCZero)
    (hy : RCInvRel x y) :
    cToD x ≠ rZero ∧
      rMulCandidate (cToD x) (cToD y) = rOne := by
  exact ⟨(cToD_ne_zero_iff).2 hx, (cToD_inverse_relation_iff).1 hy⟩

/-- Every accepted Dedekind inverse witness transports to a Cauchy inverse
    witness without selecting any new element. -/
theorem dToC_inverse_witness
    {x y : RBOMA}
    (hx : x ≠ rZero)
    (hy : rMulCandidate x y = rOne) :
    dToC x ≠ rCZero ∧ RCInvRel (dToC x) (dToC y) := by
  exact ⟨(dToC_ne_zero_iff).2 hx, (dToC_inverse_relation_iff).1 hy⟩

/-- Existence of the accepted inverse witness is exactly transported from the
    independent Cauchy route. -/
theorem cToD_inverse_exists_of_nonzero
    (x : RCBOMA) (hx : x ≠ rCZero) :
    ∃ y : RBOMA,
      rMulCandidate (cToD x) y = rOne := by
  rcases rC_inverse_exists x hx with ⟨y, hy⟩
  exact ⟨cToD y, (cToD_inverse_relation_iff).1 hy⟩

/-- Conversely, accepted inverse existence transports to the independent
    Cauchy route through the reverse comparison map. -/
theorem dToC_inverse_exists_of_nonzero
    (x : RBOMA) (hx : x ≠ rZero) :
    ∃ y : RCBOMA, RCInvRel (dToC x) y := by
  rcases r_inverse_exists_nonzero x hx with ⟨y, hy⟩
  exact ⟨dToC y, (dToC_inverse_relation_iff).1 hy⟩

/-- Final machine-checkable H5 field-isomorphism package.

    This is a BOMA theorem-level certificate rather than a new carrier or a
    standard-library field instance.  It records exactly the structures that
    the explicit mutually inverse comparison maps preserve. -/
structure DedekindCauchyFieldIsomorphismCertificate where
  multiplicative : DedekindCauchyMultiplicativePreservationCertificate
  forwardMap : RCBOMA → RBOMA
  reverseMap : RBOMA → RCBOMA
  leftInverse : ∀ x : RCBOMA, reverseMap (forwardMap x) = x
  rightInverse : ∀ x : RBOMA, forwardMap (reverseMap x) = x
  rationalPreservation : ∀ q : BOMA.Q.Quotient001.QBOMA,
    forwardMap (rCOfQ q) = rOfQ q
  orderIff : ∀ {x y : RCBOMA},
    BOMA.R.DedekindQuotient001.rLE (forwardMap x) (forwardMap y) ↔
      BOMA.R.StageTwo.CauchyOrderCore003.rCLE x y
  addPreservation : ∀ x y : RCBOMA,
    forwardMap (BOMA.R.StageTwo.CauchyAdditive003.rCAdd x y) =
      BOMA.R.DedekindAddition001.rAdd (forwardMap x) (forwardMap y)
  zeroPreservation : forwardMap rCZero = rZero
  negPreservation : ∀ x : RCBOMA,
    forwardMap (BOMA.R.StageTwo.CauchyAdditive003.rCNeg x) =
      BOMA.R.DedekindNegationCandidate001.rNeg (forwardMap x)
  mulPreservation : ∀ x y : RCBOMA,
    forwardMap (BOMA.R.StageTwo.CauchyMultiplicative003.rCMul x y) =
      rMulCandidate (forwardMap x) (forwardMap y)
  onePreservation : forwardMap rCOne = rOne
  nonzeroIff : ∀ {x : RCBOMA}, forwardMap x ≠ rZero ↔ x ≠ rCZero
  inverseRelationIff : ∀ {x y : RCBOMA},
    RCInvRel x y ↔ rMulCandidate (forwardMap x) (forwardMap y) = rOne

noncomputable def dedekindCauchyFieldIsomorphismCertificate :
    DedekindCauchyFieldIsomorphismCertificate where
  multiplicative := dedekindCauchyMultiplicativePreservationCertificate
  forwardMap := cToD
  reverseMap := dToC
  leftInverse := dToC_cToD
  rightInverse := cToD_dToC
  rationalPreservation := cToD_rational
  orderIff := @cToD_order_iff
  addPreservation := cToD_add
  zeroPreservation := cToD_zero
  negPreservation := cToD_neg
  mulPreservation := cToD_mul
  onePreservation := cToD_one
  nonzeroIff := @cToD_ne_zero_iff
  inverseRelationIff := @cToD_inverse_relation_iff

end BOMA.R.StageTwo.DedekindCauchyComparison003
