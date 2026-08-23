/- ST2-EXP-003: a nonzero Cauchy quotient class is eventually separated from
   zero by one fixed positive rational gap on one fixed side. This is the
   prerequisite for a later reciprocal-sequence construction. No Dedekind
   producer and no representative selector is used here. -/
namespace BOMA.R.StageTwo.CauchyNonzeroGap003

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
open BOMA.R.StageTwo.CauchyMultiplicative003
open BOMA.R.StageTwo.CauchyOrderCore003
open BOMA.R.StageTwo.CauchyOrderTotal003
open BOMA.R.StageTwo.CauchyOrderedRing003

/-- Eventually every representative value lies above one fixed positive gap. -/
def EventuallyPositiveGap (u : CauchySeq) : Prop :=
  ∃ delta : QBOMA, qPos delta ∧
    ∃ N : BOMANat, ∀ n : BOMANat, LE N n → qLE delta (u.seq n)

/-- Eventually every representative value lies below one fixed negative gap. -/
def EventuallyNegativeGap (u : CauchySeq) : Prop :=
  ∃ delta : QBOMA, qPos delta ∧
    ∃ N : BOMANat, ∀ n : BOMANat, LE N n → qLE (u.seq n) (qNeg delta)

/-- The fixed-sign separation needed before constructing reciprocal values. -/
def EventuallySignSeparated (u : CauchySeq) : Prop :=
  EventuallyPositiveGap u ∨ EventuallyNegativeGap u

/-- Removing the second half of an exact positive split. -/
theorem q_split_sub_half {gap delta : QBOMA}
    (hsum : qAdd delta delta = gap) :
    qAdd gap (qNeg delta) = delta := by
  calc
    qAdd gap (qNeg delta) =
        qAdd (qAdd delta delta) (qNeg delta) := by rw [hsum]
    _ = qAdd delta (qAdd delta (qNeg delta)) :=
      qAdd_assoc delta delta (qNeg delta)
    _ = qAdd delta qZero := by rw [qAdd_neg_right]
    _ = delta := qAdd_zero_right delta

/-- Adding back one half to minus the full split leaves minus one half. -/
theorem q_neg_split_add_half {gap delta : QBOMA}
    (hsum : qAdd delta delta = gap) :
    qAdd (qNeg gap) delta = qNeg delta := by
  have hneg : qNeg gap = qAdd (qNeg delta) (qNeg delta) := by
    rw [← hsum, qNeg_add]
  rw [hneg]
  calc
    qAdd (qAdd (qNeg delta) (qNeg delta)) delta =
        qAdd (qNeg delta) (qAdd (qNeg delta) delta) :=
      qAdd_assoc (qNeg delta) (qNeg delta) delta
    _ = qAdd (qNeg delta) qZero := by rw [qAdd_neg_left]
    _ = qNeg delta := qAdd_zero_right (qNeg delta)

/-- If a representative is positive in quotient order but not zero, a failed
    reverse inequality supplies an arbitrarily late strict gap. Cauchy
    stability converts that sparse gap into one eventual uniform lower bound. -/
theorem eventually_positive_gap_of_nonzero
    (u : CauchySeq)
    (h0u : rCLE rCZero (rCmk u))
    (hne : rCmk u ≠ rCZero) :
    EventuallyPositiveGap u := by
  have hnot : ¬ rCLE (rCmk u) rCZero := by
    intro hu0
    exact hne (rcle_antisymm hu0 h0u)
  change ¬ CauchyLE u (cauchyOfQ qZero) at hnot
  rcases not_cauchyLE_witness hnot with ⟨gap, hgap, hcounter⟩
  rcases positive_half_exists hgap with ⟨delta, hdelta, hsum⟩
  rcases u.cauchy delta hdelta with ⟨Nc, hNc⟩
  rcases hcounter Nc with ⟨n, hn, hfail⟩
  change ¬ qLE (u.seq n) (qAdd qZero gap) at hfail
  rw [qAdd_zero_left] at hfail
  have hgapUn : qLE gap (u.seq n) := by
    rcases qle_total (u.seq n) gap with hbad | hgood
    · exact False.elim (hfail hbad)
    · exact hgood
  refine ⟨delta, hdelta, Nc, ?_⟩
  intro m hm
  have hclose : qLE (u.seq n) (qAdd (u.seq m) delta) :=
    qClose_to_le_add (hNc n m hn hm)
  have hgapClose : qLE gap (qAdd (u.seq m) delta) :=
    qle_trans hgapUn hclose
  have ht := qadd_mono_right hgapClose (qNeg delta)
  have hleft : qAdd gap (qNeg delta) = delta := q_split_sub_half hsum
  have hright : qAdd (qAdd (u.seq m) delta) (qNeg delta) = u.seq m :=
    q_add_cancel_right (u.seq m) delta
  rw [hleft, hright] at ht
  exact ht

/-- The negative case is symmetric: failure of zero-below-u yields an
    arbitrarily late negative gap, then Cauchy stability makes it uniform. -/
theorem eventually_negative_gap_of_nonzero
    (u : CauchySeq)
    (hu0 : rCLE (rCmk u) rCZero)
    (hne : rCmk u ≠ rCZero) :
    EventuallyNegativeGap u := by
  have hnot : ¬ rCLE rCZero (rCmk u) := by
    intro h0u
    exact hne (rcle_antisymm hu0 h0u)
  change ¬ CauchyLE (cauchyOfQ qZero) u at hnot
  rcases not_cauchyLE_witness hnot with ⟨gap, hgap, hcounter⟩
  rcases positive_half_exists hgap with ⟨delta, hdelta, hsum⟩
  rcases u.cauchy delta hdelta with ⟨Nc, hNc⟩
  rcases hcounter Nc with ⟨n, hn, hfail⟩
  change ¬ qLE qZero (qAdd (u.seq n) gap) at hfail
  have hsumZero : qLE (qAdd (u.seq n) gap) qZero := by
    rcases qle_total qZero (qAdd (u.seq n) gap) with hbad | hgood
    · exact False.elim (hfail hbad)
    · exact hgood
  have hUnNegGap : qLE (u.seq n) (qNeg gap) := by
    have ht := qadd_mono_right hsumZero (qNeg gap)
    have hleft : qAdd (qAdd (u.seq n) gap) (qNeg gap) = u.seq n :=
      q_add_cancel_right (u.seq n) gap
    rw [hleft, qAdd_zero_left] at ht
    exact ht
  refine ⟨delta, hdelta, Nc, ?_⟩
  intro m hm
  have hclose : qLE (u.seq m) (qAdd (u.seq n) delta) :=
    qClose_to_le_add (qClose_symm (hNc n m hn hm))
  have hbound : qLE (qAdd (u.seq n) delta) (qAdd (qNeg gap) delta) :=
    qadd_mono_right hUnNegGap delta
  have ht : qLE (u.seq m) (qAdd (qNeg gap) delta) :=
    qle_trans hclose hbound
  rw [q_neg_split_add_half hsum] at ht
  exact ht

/-- Every nonzero representative class is eventually uniformly separated from
    zero on one side. No inverse witness is selected at this milestone. -/
theorem nonzero_eventually_sign_separated
    (u : CauchySeq) (hne : rCmk u ≠ rCZero) :
    EventuallySignSeparated u := by
  rcases rcle_total rCZero (rCmk u) with h0u | hu0
  · exact Or.inl (eventually_positive_gap_of_nonzero u h0u hne)
  · exact Or.inr (eventually_negative_gap_of_nonzero u hu0 hne)

/-- Integrated prerequisite certificate for the reciprocal stage. -/
structure CauchyNonzeroGapCertificate where
  orderedRingCertificate : CauchyOrderedRingCertificate
  nonzeroSeparated : ∀ (u : CauchySeq), rCmk u ≠ rCZero →
    EventuallySignSeparated u

theorem cauchyNonzeroGapCertificate : CauchyNonzeroGapCertificate where
  orderedRingCertificate := cauchyOrderedRingCertificate
  nonzeroSeparated := nonzero_eventually_sign_separated

end BOMA.R.StageTwo.CauchyNonzeroGap003
