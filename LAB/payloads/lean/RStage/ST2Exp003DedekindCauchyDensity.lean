/- ST2-EXP-003 H5 comparison density layer.

   This source extends the already verified H5 foundation without changing it.
   It proves strict density of the accepted rational image inside the
   independently constructed Cauchy real order.  The proof uses only the
   independent Cauchy ordered-field route and its rational approximation/gap
   interfaces; it does not use the selected Dedekind density theorem.

   This is still pre-reconvergence: no order reflection, mutual inverse,
   field-isomorphism, or research Junction claim is made here. -/
namespace BOMA.R.StageTwo.DedekindCauchyComparison003

open BOMA.NCore.RB001
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
open BOMA.R.StageTwo.CauchyNonzeroGap003
open BOMA.R.StageTwo.CauchyCompletionCore003
open BOMA.R.StageTwo.CauchyDensity003
open BOMA.R.StageTwo.CauchyLUBBracket003

/-- Left additive inverse derived from commutativity and the verified right
    inverse law. -/
theorem h5_rCAdd_neg_left (x : RCBOMA) :
    rCAdd (rCNeg x) x = rCZero := by
  rw [rCAdd_comm, rCAdd_neg_right]

/-- Right-additive cancellation on the independent Cauchy quotient. -/
theorem h5_rCAdd_right_cancel {x y z : RCBOMA}
    (h : rCAdd x z = rCAdd y z) : x = y := by
  have ht := congrArg (fun t => rCAdd t (rCNeg z)) h
  calc
    x = rCAdd x rCZero := (rCAdd_zero_right x).symm
    _ = rCAdd x (rCAdd z (rCNeg z)) := by rw [rCAdd_neg_right]
    _ = rCAdd (rCAdd x z) (rCNeg z) :=
      (rCAdd_assoc x z (rCNeg z)).symm
    _ = rCAdd (rCAdd y z) (rCNeg z) := ht
    _ = rCAdd y (rCAdd z (rCNeg z)) :=
      rCAdd_assoc y z (rCNeg z)
    _ = rCAdd y rCZero := by rw [rCAdd_neg_right]
    _ = y := rCAdd_zero_right y

/-- Strict Cauchy order is preserved by a common additive translate. -/
theorem h5_rclt_add_right {x y : RCBOMA}
    (hxy : rCLT x y) (z : RCBOMA) :
    rCLT (rCAdd x z) (rCAdd y z) := by
  refine ⟨rcle_add_right hxy.1 z, ?_⟩
  intro heq
  exact hxy.2 (h5_rCAdd_right_cancel heq)

/-- A strictly positive Cauchy real admits a positive embedded rational below
    it.  This is extracted from the independently verified eventual positive
    gap of a nonzero Cauchy representative. -/
theorem h5_positive_rational_below {x : RCBOMA}
    (h0x : rCLT rCZero x) :
    ∃ delta : QBOMA, qPos delta ∧ rCLE (rCOfQ delta) x := by
  refine Quotient.inductionOn x ?_ h0x
  intro u hu
  have hgap := eventually_positive_gap_of_nonzero
    u hu.1 (fun h => hu.2 h.symm)
  rcases hgap with ⟨delta, hdelta, N, hN⟩
  refine ⟨delta, hdelta, ?_⟩
  change CauchyLE (cauchyOfQ delta) u
  intro eps heps
  refine ⟨N, ?_⟩
  intro n hn
  change qLE delta (qAdd (u.seq n) eps)
  exact qle_trans (hN n hn) (qLE_self_add_pos (u.seq n) heps)

/-- The accepted rational image is strictly order-dense in the independently
    constructed Cauchy carrier.  No selected Dedekind theorem occurs in this
    proof. -/
theorem rC_rational_image_dense {x y : RCBOMA}
    (hxy : rCLT x y) :
    ∃ q : QBOMA,
      rCLT x (rCOfQ q) ∧ rCLT (rCOfQ q) y := by
  let d : RCBOMA := rCAdd y (rCNeg x)
  have h0d : rCLE rCZero d := by
    have ht := rcle_add_right hxy.1 (rCNeg x)
    rw [rCAdd_neg_right x] at ht
    exact ht
  have hdne : d ≠ rCZero := by
    intro hd0
    have ht := congrArg (fun t => rCAdd t x) hd0
    have hleft : rCAdd d x = y := by
      unfold d
      calc
        rCAdd (rCAdd y (rCNeg x)) x =
            rCAdd y (rCAdd (rCNeg x) x) :=
          rCAdd_assoc y (rCNeg x) x
        _ = rCAdd y rCZero := by rw [h5_rCAdd_neg_left]
        _ = y := rCAdd_zero_right y
    have hright : rCAdd rCZero x = x := rCAdd_zero_left x
    rw [hleft, hright] at ht
    exact hxy.2 ht.symm
  have h0dStrict : rCLT rCZero d :=
    ⟨h0d, fun h => hdne h.symm⟩
  rcases h5_positive_rational_below h0dStrict with
    ⟨delta, hdelta, hdeltaD⟩
  rcases positive_half_exists hdelta with
    ⟨half, hhalf, hhalfSum⟩
  rcases positive_half_exists hhalf with
    ⟨quarter, hquarter, hquarterSum⟩
  rcases rational_approximation_exists x quarter hquarter with
    ⟨a, ha⟩
  let q : QBOMA := qAdd a half

  have hquarterHalf : qLT quarter half := by
    have ht := qlt_add_right hquarter quarter
    rw [qAdd_zero_left, hquarterSum] at ht
    exact ht
  have hthreeDelta : qLT (qAdd quarter half) delta := by
    have ht := qlt_add_right hquarterHalf half
    rw [hhalfSum] at ht
    exact ht

  refine ⟨q, ?_, ?_⟩
  · have hxApprox : rCLE x (rCOfQ (qAdd a quarter)) := by
      have ht := ha.1
      rw [rCOfQ_add] at ht
      exact ht
    have hApproxStrict :
        rCLT (rCOfQ (qAdd a quarter)) (rCOfQ q) := by
      apply rCOfQ_strict
      have ht := qlt_add_right hquarterHalf a
      change qLT (qAdd quarter a) (qAdd half a) at ht
      rw [qAdd_comm quarter a, qAdd_comm half a] at ht
      exact ht
    exact rcle_trans_lt hxApprox hApproxStrict
  · have hqToThree :
        rCLE (rCOfQ q)
          (rCAdd x (rCOfQ (qAdd quarter half))) := by
      have ht := rcle_add_right ha.2 (rCOfQ half)
      have hleft :
          rCAdd (rCOfQ a) (rCOfQ half) = rCOfQ q := by
        unfold q
        exact rCOfQ_add a half
      have hright :
          rCAdd (rCAdd x (rCOfQ quarter)) (rCOfQ half) =
            rCAdd x (rCOfQ (qAdd quarter half)) := by
        calc
          rCAdd (rCAdd x (rCOfQ quarter)) (rCOfQ half) =
              rCAdd x (rCAdd (rCOfQ quarter) (rCOfQ half)) :=
            rCAdd_assoc x (rCOfQ quarter) (rCOfQ half)
          _ = rCAdd x (rCOfQ (qAdd quarter half)) := by
            rw [rCOfQ_add]
      rw [hleft, hright] at ht
      exact ht
    have hthreeToDelta :
        rCLT (rCAdd x (rCOfQ (qAdd quarter half)))
          (rCAdd x (rCOfQ delta)) := by
      have ht := h5_rclt_add_right (rCOfQ_strict hthreeDelta) x
      rw [rCAdd_comm (rCOfQ (qAdd quarter half)) x,
        rCAdd_comm (rCOfQ delta) x] at ht
      exact ht
    have hqToDelta :
        rCLT (rCOfQ q) (rCAdd x (rCOfQ delta)) :=
      rcle_trans_lt hqToThree hthreeToDelta
    have hxdeltaY : rCLE (rCAdd x (rCOfQ delta)) y := by
      have ht := rcle_add_right hdeltaD x
      have hright : rCAdd d x = y := by
        unfold d
        calc
          rCAdd (rCAdd y (rCNeg x)) x =
              rCAdd y (rCAdd (rCNeg x) x) :=
            rCAdd_assoc y (rCNeg x) x
          _ = rCAdd y rCZero := by rw [h5_rCAdd_neg_left]
          _ = y := rCAdd_zero_right y
      rw [rCAdd_comm (rCOfQ delta) x, hright] at ht
      exact ht
    exact rclt_trans_le hqToDelta hxdeltaY

/-- Machine-checkable H5 density milestone, deliberately weaker than order
    reflection or an isomorphism certificate. -/
structure DedekindCauchyComparisonDensityCertificate where
  foundation : DedekindCauchyComparisonFoundationCertificate
  cauchyRationalDense : ∀ {x y : RCBOMA}, rCLT x y →
    ∃ q : QBOMA,
      rCLT x (rCOfQ q) ∧ rCLT (rCOfQ q) y

noncomputable def dedekindCauchyComparisonDensityCertificate :
    DedekindCauchyComparisonDensityCertificate where
  foundation := dedekindCauchyComparisonFoundationCertificate
  cauchyRationalDense := @rC_rational_image_dense

end BOMA.R.StageTwo.DedekindCauchyComparison003
