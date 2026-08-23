/- ST2-EXP-003 completeness prerequisite: rational-radius closeness on the
   research quotient reflects accepted rational closeness on embedded Q, and
   every quotient class admits an arbitrarily close embedded-rational witness.
   This is still independent of the selected Dedekind real producer. -/
namespace BOMA.R.StageTwo.CauchyDensity003

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
open BOMA.R.StageTwo.CauchyOrderedRing003
open BOMA.R.StageTwo.CauchyCompletionCore003

/-- A positive rational increment enlarges any rational endpoint. -/
theorem qLE_self_add_pos (x : QBOMA) {eps : QBOMA} (heps : qPos eps) :
    qLE x (qAdd x eps) := by
  have h := qadd_mono_right heps.1 x
  rw [qAdd_zero_left, qAdd_comm eps x] at h
  exact h

/-- Symmetric additive error bounds are exactly the existing rational
    difference-based closeness predicate. -/
theorem qClose_iff_add_bounds {eps x y : QBOMA} :
    qClose eps x y ↔
      qLE x (qAdd y eps) ∧ qLE y (qAdd x eps) := by
  constructor
  · intro h
    exact ⟨qClose_to_le_add h, qClose_to_le_add (qClose_symm h)⟩
  · rintro ⟨hxy, hyx⟩
    constructor
    · have hrev := qneg_reverses (qLE_add_to_difference_upper hyx)
      rw [qNeg_difference] at hrev
      exact hrev
    · exact qLE_add_to_difference_upper hxy

/-- On constant embedded rationals, quotient closeness is exactly accepted
    rational closeness at the same radius. -/
theorem rCClose_ofQ_iff {eps q r : QBOMA} :
    rCClose eps (rCOfQ q) (rCOfQ r) ↔ qClose eps q r := by
  unfold rCClose
  rw [rCOfQ_add, rCOfQ_add,
    rCOfQ_order q (qAdd r eps), rCOfQ_order r (qAdd q eps)]
  exact qClose_iff_add_bounds.symm

/-- Every independently constructed Cauchy quotient class has an embedded
    rational approximation at every positive rational radius. The witness is
    one sufficiently late term of an arbitrary quotient representative; no
    Dedekind cut or accepted real producer is used. -/
theorem rational_approximation_exists (x : RCBOMA) (eps : QBOMA)
    (heps : qPos eps) :
    ∃ q : QBOMA, rCClose eps x (rCOfQ q) := by
  refine Quotient.inductionOn x ?_
  intro u
  rcases u.cauchy eps heps with ⟨N, hN⟩
  refine ⟨u.seq N, ?_⟩
  constructor
  · rw [rCOfQ_add]
    apply (rCLE_mk u (cauchyOfQ (qAdd (u.seq N) eps))).2
    intro eta heta
    refine ⟨N, ?_⟩
    intro n hn
    have hclose := hN n N hn (le_refl N)
    have hbase : qLE (u.seq n) (qAdd (u.seq N) eps) :=
      qClose_to_le_add hclose
    exact qle_trans hbase (qLE_self_add_pos (qAdd (u.seq N) eps) heta)
  · change rCLE (rCmk (cauchyOfQ (u.seq N)))
      (rCmk (cAddSeq u (cauchyOfQ eps)))
    apply (rCLE_mk (cauchyOfQ (u.seq N))
      (cAddSeq u (cauchyOfQ eps))).2
    intro eta heta
    refine ⟨N, ?_⟩
    intro n hn
    have hclose := hN N n (le_refl N) hn
    have hbase : qLE (u.seq N) (qAdd (u.seq n) eps) :=
      qClose_to_le_add hclose
    exact qle_trans hbase (qLE_self_add_pos (qAdd (u.seq n) eps) heta)

/-- Machine-checkable density boundary for the later completeness selector. -/
structure CauchyDensityCertificate where
  embeddedClose : ∀ {eps q r : QBOMA},
    rCClose eps (rCOfQ q) (rCOfQ r) ↔ qClose eps q r
  dense : ∀ x : RCBOMA, ∀ eps : QBOMA, qPos eps →
    ∃ q : QBOMA, rCClose eps x (rCOfQ q)
  completionCore : CauchyCompletionCoreCertificate

theorem cauchyDensityCertificate : CauchyDensityCertificate where
  embeddedClose := @rCClose_ofQ_iff
  dense := rational_approximation_exists
  completionCore := cauchyCompletionCoreCertificate

end BOMA.R.StageTwo.CauchyDensity003
