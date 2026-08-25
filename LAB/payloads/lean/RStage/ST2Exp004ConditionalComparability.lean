/- ST2-EXP-004 Gate C: conditional comparability interface probe.

This research-only source intentionally does not import or name the selected
classical witness.  It preserves the accepted carrier/order definitions and
threads an explicit `CutComparability` hypothesis through the two direct
consumers measured here.  Every exported result in this file is conditional;
none is a constructive recovery of totality. -/
namespace BOMA.R.StageTwo.TotalOrderRegime004.Conditional

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindOrderConstructive001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindAdditionLaws001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindAdditiveInverse001
open BOMA.R.DedekindPositivePart001

/-- Gate-C copy of the F-04-free nonpositive positive-part lemma. -/
theorem cutPosPart_of_nonpos004 {A : LowerCut}
    (hA0 : CutLE A (principalCut qZero)) :
    CutEquiv (cutPosPart A) (principalCut qZero) := by
  intro q
  constructor
  · intro hq
    rcases hq with hA | h0
    · exact hA0 q hA
    · exact h0
  · intro h0
    exact Or.inr h0

/-- Gate-C copy of the F-04-free outside-point nonnegativity lemma. -/
theorem outside_of_nonnegative_cut_is_nonneg004
    {A : LowerCut} {r : QBOMA}
    (h0A : CutLE (principalCut qZero) A)
    (hrOut : ¬ A.lower r) :
    qLE qZero r := by
  rcases qlt_trichotomy r qZero with hr0 | heq | h0r
  · exact False.elim (hrOut (h0A r hr0))
  · rw [heq]
    exact qle_refl qZero
  · exact h0r.1

/-- Gate-C copy of the F-04-free negation/nonnegativity transport. -/
theorem cutNeg_le_zero_of_zero_le004
    {A : LowerCut}
    (h0A : CutLE (principalCut qZero) A) :
    CutLE (cutNeg A) (principalCut qZero) := by
  intro q hq
  rcases hq with ⟨r, hrOut, hqnegr⟩
  have h0r : qLE qZero r :=
    outside_of_nonnegative_cut_is_nonneg004 h0A hrOut
  have hneg : qLE (qNeg r) (qNeg qZero) := qneg_reverses h0r
  rw [qNeg_zero] at hneg
  exact qlt_le_trans hqnegr hneg

/-- Gate-C copy of the F-04-free converse negation transport. -/
theorem cutZero_le_neg_of_le_zero004
    {A : LowerCut}
    (hA0 : CutLE A (principalCut qZero)) :
    CutLE (principalCut qZero) (cutNeg A) := by
  intro q hq0
  have h0negq : qLT qZero (qNeg q) := by
    have ht := qneg_strict_reverses hq0
    rw [qNeg_zero] at ht
    exact ht
  rcases rational_order_dense h0negq with ⟨r, h0r, hrnegq⟩
  have hrOut : ¬ A.lower r := by
    intro hrA
    have hr0 : qLT r qZero := hA0 r hrA
    exact (qlt_asymm h0r) hr0
  have hqnegr : qLT q (qNeg r) := by
    have ht := qneg_strict_reverses hrnegq
    rw [qNeg_involutive q] at ht
    exact ht
  exact ⟨r, hrOut, hqnegr⟩

/-- Positive part is fixed on nonnegative reals without totality. -/
theorem rPosPart_of_nonneg004 {x : RBOMA}
    (h0x : rLE rZero x) :
    rPosPart x = x := by
  refine Quotient.inductionOn x ?_ h0x
  intro A h0A
  change rmk (cutPosPart A) = rmk A
  apply rmk_sound
  apply cutPosPart_of_nonneg
  change rLE (rmk (principalCut qZero)) (rmk A) at h0A
  exact (rLE_mk_iff (principalCut qZero) A).1 h0A

/-- Positive part collapses on nonpositive reals without totality. -/
theorem rPosPart_of_nonpos004 {x : RBOMA}
    (hx0 : rLE x rZero) :
    rPosPart x = rZero := by
  refine Quotient.inductionOn x ?_ hx0
  intro A hA0
  change rmk (cutPosPart A) = rmk (principalCut qZero)
  apply rmk_sound
  apply cutPosPart_of_nonpos004
  change rLE (rmk A) (rmk (principalCut qZero)) at hA0
  exact (rLE_mk_iff A (principalCut qZero)).1 hA0

/-- Real negation sends nonnegative reals to nonpositive reals. -/
theorem rNeg_nonpos_of_nonneg004 {x : RBOMA}
    (h0x : rLE rZero x) :
    rLE (rNeg x) rZero := by
  refine Quotient.inductionOn x ?_ h0x
  intro A h0A
  change rLE (rmk (cutNeg A)) (rmk (principalCut qZero))
  apply (rLE_mk_iff (cutNeg A) (principalCut qZero)).2
  apply cutNeg_le_zero_of_zero_le004
  change rLE (rmk (principalCut qZero)) (rmk A) at h0A
  exact (rLE_mk_iff (principalCut qZero) A).1 h0A

/-- Real negation sends nonpositive reals to nonnegative reals. -/
theorem rNeg_nonneg_of_nonpos004 {x : RBOMA}
    (hx0 : rLE x rZero) :
    rLE rZero (rNeg x) := by
  refine Quotient.inductionOn x ?_ hx0
  intro A hA0
  change rLE (rmk (principalCut qZero)) (rmk (cutNeg A))
  apply (rLE_mk_iff (principalCut qZero) (cutNeg A)).2
  apply cutZero_le_neg_of_le_zero004
  change rLE (rmk A) (rmk (principalCut qZero)) at hA0
  exact (rLE_mk_iff A (principalCut qZero)).1 hA0

/-- Gate-C zero-negation lemma, independent of the totality provider. -/
@[simp] theorem rNeg_zero004 : rNeg rZero = rZero := by
  symm
  exact rAdd_inverse_unique
    (x := rZero)
    (y := rZero)
    (rAdd_zero_left rZero)

/-- Negative envelope vanishes in the nonnegative branch. -/
theorem rNegPart_of_nonneg004 {x : RBOMA}
    (h0x : rLE rZero x) :
    rNegPart x = rZero := by
  unfold rNegPart
  exact rPosPart_of_nonpos004 (rNeg_nonpos_of_nonneg004 h0x)

/-- Negative envelope is `-x` in the nonpositive branch. -/
theorem rNegPart_of_nonpos004 {x : RBOMA}
    (hx0 : rLE x rZero) :
    rNegPart x = rNeg x := by
  unfold rNegPart
  exact rPosPart_of_nonneg004 (rNeg_nonneg_of_nonpos004 hx0)

/-- CONDITIONAL_ON_CUT_COMPARABILITY: totality follows from an explicit narrow
comparability hypothesis; no concrete witness is selected here. -/
theorem rLE_total_conditional
    (hComp : CutComparability) (x y : RBOMA) :
    rLE x y ∨ rLE y x :=
  rLE_total_of_cutComparability hComp x y

/-- CONDITIONAL_ON_CUT_COMPARABILITY: the accepted sign-decomposition shape is
recovered once the narrow comparability interface is supplied explicitly. -/
theorem rPosNeg_decomposition_conditional
    (hComp : CutComparability) (x : RBOMA) :
    rAdd (rPosPart x) (rNeg (rNegPart x)) = x := by
  rcases rLE_total_conditional hComp rZero x with h0x | hx0
  · rw [rPosPart_of_nonneg004 h0x, rNegPart_of_nonneg004 h0x,
      rNeg_zero004, rAdd_zero_right]
  · rw [rPosPart_of_nonpos004 hx0, rNegPart_of_nonpos004 hx0,
      rNeg_involutive, rAdd_zero_left]

/-- Research certificate making the Gate-C conditional boundary explicit. -/
structure ConditionalComparabilityCertificate (hComp : CutComparability) : Prop where
  orderTotal : ∀ x y : RBOMA, rLE x y ∨ rLE y x
  positiveDecomposition : ∀ x : RBOMA,
    rAdd (rPosPart x) (rNeg (rNegPart x)) = x

/-- CONDITIONAL_ON_CUT_COMPARABILITY: assemble the measured consumers from the
explicit narrow interface only. -/
def conditionalComparabilityCertificate
    (hComp : CutComparability) : ConditionalComparabilityCertificate hComp where
  orderTotal := rLE_total_conditional hComp
  positiveDecomposition := rPosNeg_decomposition_conditional hComp

end BOMA.R.StageTwo.TotalOrderRegime004.Conditional
