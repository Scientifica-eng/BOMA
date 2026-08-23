/- ST2-EXP-003 H4 sequence stage: choose one rational lower endpoint from
   each verified shrinking upper-bound bracket and prove that the resulting
   rational sequence is Cauchy. The only new data selection is the explicit
   countable Classical.choose of one bracket lower endpoint at each accepted
   natural index. No selected Dedekind carrier is imported. -/
namespace BOMA.R.StageTwo.CauchyLUBSequence003

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Order001
open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.CauchyProbe001
open BOMA.R.StageTwo.CauchyCloseness003
open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyOrderCore003
open BOMA.R.StageTwo.CauchyOrderTotal003
open BOMA.R.StageTwo.CauchyScale003
open BOMA.R.StageTwo.CauchyLUBBracket003

/-- Explicit Choice boundary: one lower rational endpoint from the verified
    H4 bracket at scale qCauchyScale n. -/
noncomputable def h4Lower
    (F : RCBOMA → Prop)
    (hne : ∃ x : RCBOMA, F x)
    (U : RCBOMA) (hUB : RCUpperBound F U)
    (n : BOMANat) : QBOMA := by
  classical
  exact Classical.choose
    (rational_lub_bracket_exists F hne U hUB
      (qCauchyScale n) (qCauchyScale_pos n))

/-- The selected lower endpoint retains a matching upper endpoint exactly one
    shrinking rational scale above it. -/
theorem h4Lower_spec
    (F : RCBOMA → Prop)
    (hne : ∃ x : RCBOMA, F x)
    (U : RCBOMA) (hUB : RCUpperBound F U)
    (n : BOMANat) :
    ∃ r : QBOMA,
      ¬ RCUpperBound F (rCOfQ (h4Lower F hne U hUB n)) ∧
      RCUpperBound F (rCOfQ r) ∧
      r = qAdd (h4Lower F hne U hUB n) (qCauchyScale n) := by
  classical
  unfold h4Lower
  exact Classical.choose_spec
    (rational_lub_bracket_exists F hne U hUB
      (qCauchyScale n) (qCauchyScale_pos n))

/-- Any selected lower endpoint lies below every later selected bracket upper
    endpoint. This follows from a family witness above the first non-upper
    endpoint and the second endpoint's verified upper-bound property. -/
theorem h4Lower_cross_le
    (F : RCBOMA → Prop)
    (hne : ∃ x : RCBOMA, F x)
    (U : RCBOMA) (hUB : RCUpperBound F U)
    (m n : BOMANat) :
    qLE (h4Lower F hne U hUB m)
      (qAdd (h4Lower F hne U hUB n) (qCauchyScale n)) := by
  rcases h4Lower_spec F hne U hUB m with ⟨rm, hnotm, hubm, hrm⟩
  rcases h4Lower_spec F hne U hUB n with ⟨rn, hnotn, hubn, hrn⟩
  rcases not_rcUpperBound_witness hnotm with ⟨x, hxF, hnotx⟩
  have hLowerX : rCLE (rCOfQ (h4Lower F hne U hUB m)) x := by
    rcases rcle_total x (rCOfQ (h4Lower F hne U hUB m)) with hbad | hgood
    · exact False.elim (hnotx hbad)
    · exact hgood
  have hxUpper : rCLE x (rCOfQ rn) := hubn x hxF
  have hchain :
      rCLE (rCOfQ (h4Lower F hne U hUB m)) (rCOfQ rn) :=
    rcle_trans hLowerX hxUpper
  rw [hrn] at hchain
  exact (rCOfQ_order _ _).1 hchain

/-- Mutual epsilon-translate bounds are exactly enough for rational closeness. -/
theorem qClose_of_mutual_le_add {eps x y : QBOMA}
    (hxy : qLE x (qAdd y eps))
    (hyx : qLE y (qAdd x eps)) :
    qClose eps x y := by
  constructor
  · have hdiff : qLE (qAdd y (qNeg x)) eps :=
      qLE_add_to_difference_upper hyx
    have hneg := qneg_reverses hdiff
    rw [qNeg_difference] at hneg
    exact hneg
  · exact qLE_add_to_difference_upper hxy

/-- The chosen lower endpoints form a rational Cauchy sequence because each
    endpoint lies below every other endpoint plus that other's shrinking scale. -/
theorem h4Lower_cauchy
    (F : RCBOMA → Prop)
    (hne : ∃ x : RCBOMA, F x)
    (U : RCBOMA) (hUB : RCUpperBound F U) :
    IsCauchy (fun n => h4Lower F hne U hUB n) := by
  intro eps heps
  rcases qCauchyScale_tends_zero eps heps with ⟨N, hN⟩
  refine ⟨N, ?_⟩
  intro m n hm hn
  have hmn0 := h4Lower_cross_le F hne U hUB m n
  have hnm0 := h4Lower_cross_le F hne U hUB n m
  have hscaleN : qLE (qCauchyScale n) eps := hN n hn
  have hscaleM : qLE (qCauchyScale m) eps := hN m hm
  have hincN := qadd_mono_right hscaleN (h4Lower F hne U hUB n)
  have hincM := qadd_mono_right hscaleM (h4Lower F hne U hUB m)
  rw [qAdd_comm (qCauchyScale n) (h4Lower F hne U hUB n),
      qAdd_comm eps (h4Lower F hne U hUB n)] at hincN
  rw [qAdd_comm (qCauchyScale m) (h4Lower F hne U hUB m),
      qAdd_comm eps (h4Lower F hne U hUB m)] at hincM
  have hmn :
      qLE (h4Lower F hne U hUB m)
        (qAdd (h4Lower F hne U hUB n) eps) :=
    qle_trans hmn0 hincN
  have hnm :
      qLE (h4Lower F hne U hUB n)
        (qAdd (h4Lower F hne U hUB m) eps) :=
    qle_trans hnm0 hincM
  exact qClose_of_mutual_le_add hmn hnm

/-- The H4 lower-bracket sequence packaged as an accepted-style Cauchy
    representative for the research quotient. -/
noncomputable def h4LowerCauchySeq
    (F : RCBOMA → Prop)
    (hne : ∃ x : RCBOMA, F x)
    (U : RCBOMA) (hUB : RCUpperBound F U) : CauchySeq :=
  ⟨fun n => h4Lower F hne U hUB n, h4Lower_cauchy F hne U hUB⟩

/-- H4 sequence-stage certificate. -/
structure CauchyLUBSequenceCertificate where
  bracket : CauchyLUBBracketCertificate
  lowerCauchy : ∀ (F : RCBOMA → Prop),
    (∃ x : RCBOMA, F x) →
    ∀ U : RCBOMA, RCUpperBound F U →
      IsCauchy (fun n => h4Lower F ‹∃ x : RCBOMA, F x› U ‹RCUpperBound F U› n)

theorem cauchyLUBSequenceCertificate : CauchyLUBSequenceCertificate where
  bracket := cauchyLUBBracketCertificate
  lowerCauchy := by
    intro F hne U hUB
    exact h4Lower_cauchy F hne U hUB

end BOMA.R.StageTwo.CauchyLUBSequence003
