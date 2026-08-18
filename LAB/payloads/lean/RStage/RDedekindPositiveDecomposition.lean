/- Positive/negative-envelope decomposition on selected Dedekind reals.
The envelope definitions are sign-case-free; the final decomposition theorem
uses the already-isolated classical total-comparability witness explicitly. -/
namespace BOMA.R.DedekindPositiveDecomposition001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindOrderConstructive001
open BOMA.R.DedekindOrderClassical001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindAdditionLaws001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindAdditiveInverse001
open BOMA.R.DedekindPositivePart001

/-- If A is below zero, its positive envelope is exactly zero. -/
theorem cutPosPart_of_nonpos {A : LowerCut}
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

/-- Any rational outside a cut known to contain the zero cut is nonnegative. -/
theorem outside_of_nonnegative_cut_is_nonneg
    {A : LowerCut} {r : QBOMA}
    (h0A : CutLE (principalCut qZero) A)
    (hrOut : ¬ A.lower r) :
    qLE qZero r := by
  rcases qlt_trichotomy r qZero with hr0 | heq | h0r
  · exact False.elim (hrOut (h0A r hr0))
  · rw [heq]
    exact qle_refl qZero
  · exact h0r.1

/-- Negation of a nonnegative cut is below zero. -/
theorem cutNeg_le_zero_of_zero_le
    {A : LowerCut}
    (h0A : CutLE (principalCut qZero) A) :
    CutLE (cutNeg A) (principalCut qZero) := by
  intro q hq
  rcases hq with ⟨r, hrOut, hqnegr⟩
  have h0r : qLE qZero r :=
    outside_of_nonnegative_cut_is_nonneg h0A hrOut
  have hneg : qLE (qNeg r) (qNeg qZero) := qneg_reverses h0r
  rw [qNeg_zero] at hneg
  exact qlt_le_trans hqnegr hneg

/-- Negation of a nonpositive cut contains the zero cut. -/
theorem cutZero_le_neg_of_le_zero
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

/-- Formal positive part is fixed on nonnegative reals. -/
theorem rPosPart_of_nonneg {x : RBOMA}
    (h0x : rLE rZero x) :
    rPosPart x = x := by
  refine Quotient.inductionOn x ?_ h0x
  intro A h0A
  change rmk (cutPosPart A) = rmk A
  apply rmk_sound
  apply cutPosPart_of_nonneg
  change rLE (rmk (principalCut qZero)) (rmk A) at h0A
  exact (rLE_mk_iff (principalCut qZero) A).1 h0A

/-- Formal positive part collapses to zero on nonpositive reals. -/
theorem rPosPart_of_nonpos {x : RBOMA}
    (hx0 : rLE x rZero) :
    rPosPart x = rZero := by
  refine Quotient.inductionOn x ?_ hx0
  intro A hA0
  change rmk (cutPosPart A) = rmk (principalCut qZero)
  apply rmk_sound
  apply cutPosPart_of_nonpos
  change rLE (rmk A) (rmk (principalCut qZero)) at hA0
  exact (rLE_mk_iff A (principalCut qZero)).1 hA0

/-- Real negation sends a nonnegative real to a nonpositive real. -/
theorem rNeg_nonpos_of_nonneg {x : RBOMA}
    (h0x : rLE rZero x) :
    rLE (rNeg x) rZero := by
  refine Quotient.inductionOn x ?_ h0x
  intro A h0A
  change rLE (rmk (cutNeg A)) (rmk (principalCut qZero))
  apply (rLE_mk_iff (cutNeg A) (principalCut qZero)).2
  apply cutNeg_le_zero_of_zero_le
  change rLE (rmk (principalCut qZero)) (rmk A) at h0A
  exact (rLE_mk_iff (principalCut qZero) A).1 h0A

/-- Real negation sends a nonpositive real to a nonnegative real. -/
theorem rNeg_nonneg_of_nonpos {x : RBOMA}
    (hx0 : rLE x rZero) :
    rLE rZero (rNeg x) := by
  refine Quotient.inductionOn x ?_ hx0
  intro A hA0
  change rLE (rmk (principalCut qZero)) (rmk (cutNeg A))
  apply (rLE_mk_iff (principalCut qZero) (cutNeg A)).2
  apply cutZero_le_neg_of_le_zero
  change rLE (rmk A) (rmk (principalCut qZero)) at hA0
  exact (rLE_mk_iff A (principalCut qZero)).1 hA0

/-- Formal real negation fixes zero. -/
@[simp] theorem rNeg_zero : rNeg rZero = rZero := by
  symm
  exact rAdd_inverse_unique
    (x := rZero)
    (y := rZero)
    (rAdd_zero_left rZero)

/-- For a nonnegative real, the negative envelope is zero. -/
theorem rNegPart_of_nonneg {x : RBOMA}
    (h0x : rLE rZero x) :
    rNegPart x = rZero := by
  unfold rNegPart
  exact rPosPart_of_nonpos (rNeg_nonpos_of_nonneg h0x)

/-- For a nonpositive real, the negative envelope is exactly -x. -/
theorem rNegPart_of_nonpos {x : RBOMA}
    (hx0 : rLE x rZero) :
    rNegPart x = rNeg x := by
  unfold rNegPart
  exact rPosPart_of_nonneg (rNeg_nonneg_of_nonpos hx0)

/-- Signed decomposition of every selected Dedekind real.
The only sign split occurs here through the isolated classical total-order witness. -/
theorem rPosNeg_decomposition (x : RBOMA) :
    rAdd (rPosPart x) (rNeg (rNegPart x)) = x := by
  rcases rLE_total_classical rZero x with h0x | hx0
  · rw [rPosPart_of_nonneg h0x, rNegPart_of_nonneg h0x,
      rNeg_zero, rAdd_zero_right]
  · rw [rPosPart_of_nonpos hx0, rNegPart_of_nonpos hx0,
      rNeg_involutive, rAdd_zero_left]

end BOMA.R.DedekindPositiveDecomposition001
