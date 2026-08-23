/- ST2-EXP-003: totality of the independent approximate Cauchy order.
   The witness extraction from failure of an eventual universal bound uses one
   explicit local classical case split. No Dedekind producer is consumed. -/
namespace BOMA.R.StageTwo.CauchyOrderTotal003

open BOMA.NCore.RB001
open BOMA.NArithmetic.Order001
open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.R.Gateway001
open BOMA.R.CauchyProbe001
open BOMA.R.StageTwo.CauchyCloseness003
open BOMA.R.StageTwo.CauchyMultiplicative003
open BOMA.R.StageTwo.CauchyOrderCore003

/-- Classical normal form of failure of approximate Cauchy order. The theorem
    localizes the logical commitment used by totality. -/
theorem not_cauchyLE_witness {u v : CauchySeq} (hnot : ¬ CauchyLE u v) :
    ∃ eps : QBOMA, qPos eps ∧
      ∀ N : BOMANat, ∃ n : BOMANat, LE N n ∧
        ¬ qLE (u.seq n) (qAdd (v.seq n) eps) := by
  classical
  by_contra hnone
  apply hnot
  intro eps heps
  by_contra hnoN
  apply hnone
  refine ⟨eps, heps, ?_⟩
  intro N
  by_contra hnoCounter
  apply hnoN
  refine ⟨N, ?_⟩
  intro n hn
  by_contra hle
  apply hnoCounter
  exact ⟨n, hn, hle⟩

/-- Any two Cauchy representatives are comparable in approximate order. -/
theorem cauchyLE_total (u v : CauchySeq) :
    CauchyLE u v ∨ CauchyLE v u := by
  classical
  by_cases huv : CauchyLE u v
  · exact Or.inl huv
  · right
    rcases not_cauchyLE_witness huv with ⟨gap, hgap, hcounter⟩
    intro eps heps
    rcases positive_half_exists heps with ⟨delta, hdelta, hsum⟩
    rcases u.cauchy delta hdelta with ⟨Nu, hNu⟩
    rcases v.cauchy delta hdelta with ⟨Nv, hNv⟩
    rcases common_upper_bound Nu Nv with ⟨N, hNuN, hNvN⟩
    rcases hcounter N with ⟨n, hn, hfail⟩
    have hgapOrder : qLE (qAdd (v.seq n) gap) (u.seq n) := by
      rcases qle_total (u.seq n) (qAdd (v.seq n) gap) with hbad | hgood
      · exact False.elim (hfail hbad)
      · exact hgood
    have hvnGap : qLE (v.seq n) (qAdd (v.seq n) gap) := by
      have h := qadd_mono_right hgap.1 (v.seq n)
      rw [qAdd_zero_left, qAdd_comm gap (v.seq n)] at h
      exact h
    have hvnUn : qLE (v.seq n) (u.seq n) := qle_trans hvnGap hgapOrder
    refine ⟨N, ?_⟩
    intro m hm
    have hvmVn := qClose_to_le_add
      (hNv m n (le_trans hNvN hm) (le_trans hNvN hn))
    have hvnDeltaUn := qadd_mono_right hvnUn delta
    have hunUm := qClose_to_le_add
      (hNu n m (le_trans hNuN hn) (le_trans hNuN hm))
    have hunDeltaUm := qadd_mono_right hunUm delta
    rw [qAdd_assoc, hsum] at hunDeltaUm
    exact qle_trans hvmVn (qle_trans hvnDeltaUn hunDeltaUm)

/-- Totality descends to the research quotient. -/
theorem rcle_total (x y : RCBOMA) : rCLE x y ∨ rCLE y x := by
  refine Quotient.inductionOn x ?_
  intro u
  refine Quotient.inductionOn y ?_
  intro v
  exact cauchyLE_total u v

/-- Independently assembled total-order-strength research certificate. -/
structure CauchyTotalOrderCertificate where
  partialOrderCertificate : CauchyPartialOrderCertificate
  orderTotal : ∀ x y : RCBOMA, rCLE x y ∨ rCLE y x
  classicalWitnessExtraction :
    ∀ {u v : CauchySeq}, ¬ CauchyLE u v →
      ∃ eps : QBOMA, qPos eps ∧
        ∀ N : BOMANat, ∃ n : BOMANat, LE N n ∧
          ¬ qLE (u.seq n) (qAdd (v.seq n) eps)

theorem cauchyTotalOrderCertificate : CauchyTotalOrderCertificate where
  partialOrderCertificate := cauchyPartialOrderCertificate
  orderTotal := rcle_total
  classicalWitnessExtraction := @not_cauchyLE_witness

end BOMA.R.StageTwo.CauchyOrderTotal003
