/- ST2-EXP-003 H4: derive the accepted least-upper-bound contract on the
   independently constructed rational-Cauchy quotient. The proof uses shrinking
   rational brackets, their selected Cauchy endpoint sequences, and closure of
   the quotient order under Cauchy representative classes. It imports no
   selected Dedekind carrier or lower-cut construction. -/
namespace BOMA.R.StageTwo.CauchyLUB003

open BOMA.NCore.RB001
open BOMA.NArithmetic.Order001
open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.CauchyProbe001
open BOMA.R.StageTwo.CauchyCloseness003
open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyAdditive003
open BOMA.R.StageTwo.CauchyOrderCore003
open BOMA.R.StageTwo.CauchyOrderTotal003
open BOMA.R.StageTwo.CauchyScale003
open BOMA.R.StageTwo.CauchyLUBBracket003
open BOMA.R.StageTwo.CauchyLUBSequence003

/-- The matching upper endpoint is definitionally the selected lower endpoint
    plus the current shrinking rational scale. -/
noncomputable def h4UpperValue
    (F : RCBOMA → Prop)
    (hne : ∃ x : RCBOMA, F x)
    (U : RCBOMA) (hUB : RCUpperBound F U)
    (n : BOMANat) : QBOMA :=
  qAdd (h4Lower F hne U hUB n) (qCauchyScale n)

/-- Each explicit upper value is a genuine upper bound of the family. -/
theorem h4Upper_bound
    (F : RCBOMA → Prop)
    (hne : ∃ x : RCBOMA, F x)
    (U : RCBOMA) (hUB : RCUpperBound F U)
    (n : BOMANat) :
    RCUpperBound F (rCOfQ (h4UpperValue F hne U hUB n)) := by
  rcases h4Lower_spec F hne U hUB n with ⟨r, hnot, hrUB, hr⟩
  unfold h4UpperValue
  rw [← hr]
  exact hrUB

/-- Each selected lower endpoint is genuinely below the upper-bound frontier. -/
theorem h4Lower_nonupper
    (F : RCBOMA → Prop)
    (hne : ∃ x : RCBOMA, F x)
    (U : RCBOMA) (hUB : RCUpperBound F U)
    (n : BOMANat) :
    ¬ RCUpperBound F (rCOfQ (h4Lower F hne U hUB n)) := by
  rcases h4Lower_spec F hne U hUB n with ⟨r, hnot, hrUB, hr⟩
  exact hnot

/-- The upper endpoints are also a rational Cauchy sequence. Cross-bracketing
    already places each lower endpoint below every other upper endpoint; only
    the vanishing local scale remains to be absorbed into epsilon. -/
theorem h4Upper_cauchy
    (F : RCBOMA → Prop)
    (hne : ∃ x : RCBOMA, F x)
    (U : RCBOMA) (hUB : RCUpperBound F U) :
    IsCauchy (fun n => h4UpperValue F hne U hUB n) := by
  intro eps heps
  rcases qCauchyScale_tends_zero eps heps with ⟨N, hN⟩
  refine ⟨N, ?_⟩
  intro m n hm hn
  have hmn0 := h4Lower_cross_le F hne U hUB m n
  have hnm0 := h4Lower_cross_le F hne U hUB n m
  have hmn1 := qadd_mono_right hmn0 (qCauchyScale m)
  have hnm1 := qadd_mono_right hnm0 (qCauchyScale n)
  change qLE (h4UpperValue F hne U hUB m)
    (qAdd (h4UpperValue F hne U hUB n) (qCauchyScale m)) at hmn1
  change qLE (h4UpperValue F hne U hUB n)
    (qAdd (h4UpperValue F hne U hUB m) (qCauchyScale n)) at hnm1
  have hincM := qadd_mono_right (hN m hm) (h4UpperValue F hne U hUB n)
  have hincN := qadd_mono_right (hN n hn) (h4UpperValue F hne U hUB m)
  rw [qAdd_comm (qCauchyScale m) (h4UpperValue F hne U hUB n),
      qAdd_comm eps (h4UpperValue F hne U hUB n)] at hincM
  rw [qAdd_comm (qCauchyScale n) (h4UpperValue F hne U hUB m),
      qAdd_comm eps (h4UpperValue F hne U hUB m)] at hincN
  have hmn : qLE (h4UpperValue F hne U hUB m)
      (qAdd (h4UpperValue F hne U hUB n) eps) :=
    qle_trans hmn1 hincM
  have hnm : qLE (h4UpperValue F hne U hUB n)
      (qAdd (h4UpperValue F hne U hUB m) eps) :=
    qle_trans hnm1 hincN
  exact qClose_of_mutual_le_add hmn hnm

/-- Upper endpoints packaged as a Cauchy representative. -/
noncomputable def h4UpperCauchySeq
    (F : RCBOMA → Prop)
    (hne : ∃ x : RCBOMA, F x)
    (U : RCBOMA) (hUB : RCUpperBound F U) : CauchySeq :=
  ⟨fun n => h4UpperValue F hne U hUB n, h4Upper_cauchy F hne U hUB⟩

/-- The shrinking bracket width makes lower and upper endpoint sequences
    asymptotically identical. -/
theorem h4LowerUpper_equiv
    (F : RCBOMA → Prop)
    (hne : ∃ x : RCBOMA, F x)
    (U : RCBOMA) (hUB : RCUpperBound F U) :
    CauchyEquiv (h4LowerCauchySeq F hne U hUB)
      (h4UpperCauchySeq F hne U hUB) := by
  intro eps heps
  rcases qCauchyScale_tends_zero eps heps with ⟨N, hN⟩
  refine ⟨N, ?_⟩
  intro n hn
  have hscale : qLE (qCauchyScale n) eps := hN n hn
  have hlowUp : qLE (h4Lower F hne U hUB n)
      (h4UpperValue F hne U hUB n) := by
    have ht := qadd_mono_right (qCauchyScale_pos n).1 (h4Lower F hne U hUB n)
    rw [qAdd_zero_left, qAdd_comm (qCauchyScale n) (h4Lower F hne U hUB n)] at ht
    exact ht
  have hUpErr : qLE (h4UpperValue F hne U hUB n)
      (qAdd (h4UpperValue F hne U hUB n) eps) := by
    have ht := qadd_mono_right heps.1 (h4UpperValue F hne U hUB n)
    rw [qAdd_zero_left, qAdd_comm eps (h4UpperValue F hne U hUB n)] at ht
    exact ht
  have hLowerToUpperErr : qLE (h4Lower F hne U hUB n)
      (qAdd (h4UpperValue F hne U hUB n) eps) :=
    qle_trans hlowUp hUpErr
  have hUpperToLowerErr : qLE (h4UpperValue F hne U hUB n)
      (qAdd (h4Lower F hne U hUB n) eps) := by
    unfold h4UpperValue
    have ht := qadd_mono_right hscale (h4Lower F hne U hUB n)
    rw [qAdd_comm (qCauchyScale n) (h4Lower F hne U hUB n),
        qAdd_comm eps (h4Lower F hne U hUB n)] at ht
    exact ht
  exact qClose_of_mutual_le_add hLowerToUpperErr hUpperToLowerErr

/-- If a fixed quotient point lies below every embedded term of a Cauchy
    representative, it lies below the quotient class represented by that
    sequence. This is the order-closure lemma needed for the upper-bound half. -/
theorem rcle_pointwise_to_class
    (d : CauchySeq) (x : RCBOMA)
    (h : ∀ n : BOMANat, rCLE x (rCOfQ (d.seq n))) :
    rCLE x (rCmk d) := by
  refine Quotient.inductionOn x ?_ h
  intro u hu
  change CauchyLE u d
  intro eps heps
  rcases positive_half_exists heps with ⟨delta, hdelta, hsum⟩
  rcases d.cauchy delta hdelta with ⟨Nd, hNd⟩
  have hfixed := hu Nd
  change CauchyLE u (cauchyOfQ (d.seq Nd)) at hfixed
  rcases hfixed delta hdelta with ⟨Nu, hNu⟩
  rcases common_upper_bound Nd Nu with ⟨N, hNdN, hNuN⟩
  refine ⟨N, ?_⟩
  intro n hn
  have huFixed := hNu n (le_trans hNuN hn)
  change qLE (u.seq n) (qAdd (d.seq Nd) delta) at huFixed
  have hfixedToN := qClose_to_le_add
    (hNd Nd n (le_refl Nd) (le_trans hNdN hn))
  have hmove := qadd_mono_right hfixedToN delta
  rw [qAdd_assoc, hsum] at hmove
  exact qle_trans huFixed hmove

/-- Dually, if every embedded term of a Cauchy representative lies below a
    fixed quotient point, then the represented quotient class lies below it. -/
theorem rcle_class_to_pointwise
    (d : CauchySeq) (B : RCBOMA)
    (h : ∀ n : BOMANat, rCLE (rCOfQ (d.seq n)) B) :
    rCLE (rCmk d) B := by
  refine Quotient.inductionOn B ?_ h
  intro v hv
  change CauchyLE d v
  intro eps heps
  rcases positive_half_exists heps with ⟨delta, hdelta, hsum⟩
  rcases d.cauchy delta hdelta with ⟨Nd, hNd⟩
  have hfixed := hv Nd
  change CauchyLE (cauchyOfQ (d.seq Nd)) v at hfixed
  rcases hfixed delta hdelta with ⟨Nv, hNv⟩
  rcases common_upper_bound Nd Nv with ⟨N, hNdN, hNvN⟩
  refine ⟨N, ?_⟩
  intro n hn
  have hnToFixed := qClose_to_le_add
    (qClose_symm (hNd Nd n (le_refl Nd) (le_trans hNdN hn)))
  have hfixedV := hNv n (le_trans hNvN hn)
  change qLE (d.seq Nd) (qAdd (v.seq n) delta) at hfixedV
  have hmove := qadd_mono_right hfixedV delta
  rw [qAdd_assoc, hsum] at hmove
  exact qle_trans hnToFixed hmove

/-- The independently constructed supremum candidate is the quotient class of
    the selected lower-endpoint Cauchy sequence. -/
noncomputable def h4Sup
    (F : RCBOMA → Prop)
    (hne : ∃ x : RCBOMA, F x)
    (U : RCBOMA) (hUB : RCUpperBound F U) : RCBOMA :=
  rCmk (h4LowerCauchySeq F hne U hUB)

/-- Every family member lies below the Cauchy supremum candidate. -/
theorem member_le_h4Sup
    (F : RCBOMA → Prop)
    (hne : ∃ x : RCBOMA, F x)
    (U : RCBOMA) (hUB : RCUpperBound F U)
    (x : RCBOMA) (hx : F x) :
    rCLE x (h4Sup F hne U hUB) := by
  have hpoint : ∀ n : BOMANat,
      rCLE x (rCOfQ ((h4UpperCauchySeq F hne U hUB).seq n)) := by
    intro n
    exact h4Upper_bound F hne U hUB n x hx
  have hUpperClass :=
    rcle_pointwise_to_class (h4UpperCauchySeq F hne U hUB) x hpoint
  have heq :
      rCmk (h4LowerCauchySeq F hne U hUB) =
        rCmk (h4UpperCauchySeq F hne U hUB) :=
    Quotient.sound (h4LowerUpper_equiv F hne U hUB)
  unfold h4Sup
  rw [← heq] at hUpperClass
  exact hUpperClass

/-- The Cauchy supremum candidate lies below every common upper bound. -/
theorem h4Sup_le_of_upper
    (F : RCBOMA → Prop)
    (hne : ∃ x : RCBOMA, F x)
    (U : RCBOMA) (hUB : RCUpperBound F U)
    (B : RCBOMA) (hB : RCUpperBound F B) :
    rCLE (h4Sup F hne U hUB) B := by
  have hpoint : ∀ n : BOMANat,
      rCLE (rCOfQ ((h4LowerCauchySeq F hne U hUB).seq n)) B := by
    intro n
    have hnot := h4Lower_nonupper F hne U hUB n
    rcases not_rcUpperBound_witness hnot with ⟨x, hxF, hnotx⟩
    have hLowerX : rCLE (rCOfQ (h4Lower F hne U hUB n)) x := by
      rcases rcle_total x (rCOfQ (h4Lower F hne U hUB n)) with hbad | hgood
      · exact False.elim (hnotx hbad)
      · exact hgood
    exact rcle_trans hLowerX (hB x hxF)
  unfold h4Sup
  exact rcle_class_to_pointwise (h4LowerCauchySeq F hne U hUB) B hpoint

/-- Exact H4 least-upper-bound theorem, matching the accepted RA-11 contract
    but proved on RCBOMA without importing the selected Dedekind producer. -/
theorem rCauchy_lub_exists
    (F : RCBOMA → Prop)
    (hne : ∃ x : RCBOMA, F x)
    (U : RCBOMA) (hUB : RCUpperBound F U) :
    ∃ s : RCBOMA,
      (∀ x : RCBOMA, F x → rCLE x s) ∧
      (∀ B : RCBOMA, RCUpperBound F B → rCLE s B) := by
  refine ⟨h4Sup F hne U hUB, ?_, ?_⟩
  · intro x hx
    exact member_le_h4Sup F hne U hUB x hx
  · intro B hB
    exact h4Sup_le_of_upper F hne U hUB B hB

/-- H4 completion certificate. -/
structure CauchyLUBCertificate where
  sequence : CauchyLUBSequenceCertificate
  lub : ∀ (F : RCBOMA → Prop)
    (hne : ∃ x : RCBOMA, F x)
    (U : RCBOMA) (hUB : RCUpperBound F U),
      ∃ s : RCBOMA,
        (∀ x : RCBOMA, F x → rCLE x s) ∧
        (∀ B : RCBOMA, RCUpperBound F B → rCLE s B)

theorem cauchyLUBCertificate : CauchyLUBCertificate where
  sequence := cauchyLUBSequenceCertificate
  lub := by
    intro F hne U hUB
    exact rCauchy_lub_exists F hne U hUB

end BOMA.R.StageTwo.CauchyLUB003
