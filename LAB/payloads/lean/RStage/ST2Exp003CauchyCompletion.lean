/- ST2-EXP-003: sequential completeness of the independently constructed
   rational-Cauchy quotient. The proof uses the explicit countable rational
   approximation selector and vanishing rational scale already exposed in
   earlier sources. It does not import the selected Dedekind real producer and
   does not claim the Dedekind least-upper-bound contract. -/
namespace BOMA.R.StageTwo.CauchyCompletion003

open BOMA.NCore.RB001
open BOMA.NArithmetic.Order001
open BOMA.Q.Quotient001
open BOMA.R.Gateway001
open BOMA.R.CauchyProbe001
open BOMA.R.StageTwo.CauchyCloseness003
open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyAdditive003
open BOMA.R.StageTwo.CauchyMultiplicative003
open BOMA.R.StageTwo.CauchyOrderCore003
open BOMA.R.StageTwo.CauchyScale003
open BOMA.R.StageTwo.CauchyCompletionCore003
open BOMA.R.StageTwo.CauchyDensity003
open BOMA.R.StageTwo.CauchyApproximation003

/-- The embedded terms of any accepted-Q Cauchy representative converge, in
    quotient closeness, to the quotient class represented by that sequence. -/
theorem embedded_terms_converge_to_class (d : CauchySeq) :
    RCConverges (fun n => rCOfQ (d.seq n)) (rCmk d) := by
  intro eps heps
  rcases d.cauchy eps heps with ⟨N, hN⟩
  refine ⟨N, ?_⟩
  intro n hn
  constructor
  · change rCLE (rCmk (cauchyOfQ (d.seq n)))
      (rCmk (cAddSeq d (cauchyOfQ eps)))
    apply (rCLE_mk (cauchyOfQ (d.seq n))
      (cAddSeq d (cauchyOfQ eps))).2
    intro eta heta
    refine ⟨N, ?_⟩
    intro j hj
    have hclose := hN n j hn hj
    have hbase : qLE (d.seq n) (qAdd (d.seq j) eps) :=
      qClose_to_le_add hclose
    exact qle_trans hbase (qLE_self_add_pos (qAdd (d.seq j) eps) heta)
  · rw [rCOfQ_add]
    apply (rCLE_mk d (cauchyOfQ (qAdd (d.seq n) eps))).2
    intro eta heta
    refine ⟨N, ?_⟩
    intro j hj
    have hclose := hN j n hj hn
    have hbase : qLE (d.seq j) (qAdd (d.seq n) eps) :=
      qClose_to_le_add hclose
    exact qle_trans hbase (qLE_self_add_pos (qAdd (d.seq n) eps) heta)

/-- The explicit selected rational approximation sequence supplies a quotient
    limit for the original quotient-valued Cauchy sequence. -/
theorem selected_approximation_converges {u : RCSeq} (hu : IsRCCauchy u) :
    RCConverges u (rCmk (approxCauchySeq u hu)) := by
  intro eps heps
  rcases positive_half_exists heps with ⟨half, hhalf, hhalfSum⟩
  rcases qCauchyScale_tends_zero half hhalf with ⟨Ns, hNs⟩
  rcases embedded_terms_converge_to_class (approxCauchySeq u hu) half hhalf with
    ⟨Nd, hNd⟩
  rcases common_upper_bound Ns Nd with ⟨N, hNsN, hNdN⟩
  refine ⟨N, ?_⟩
  intro n hn
  have hscale : qLE (qCauchyScale n) half :=
    hNs n (le_trans hNsN hn)
  have happ : rCClose half (u n) (rCOfQ (qApproxSeq u n)) :=
    rCClose_mono (qApproxAtScale_close (u n) n) hscale
  have hlimit :
      rCClose half (rCOfQ (qApproxSeq u n))
        (rCmk (approxCauchySeq u hu)) := by
    simpa [approxCauchySeq] using hNd n (le_trans hNdN hn)
  have hchain := rCClose_trans_add happ hlimit
  rw [hhalfSum] at hchain
  exact hchain

/-- The independent rational-Cauchy quotient is sequentially Cauchy complete
    under the exact contract declared in CauchyCompletionCore003. -/
theorem rCCauchyComplete : RCCauchyComplete := by
  intro u hu
  exact ⟨rCmk (approxCauchySeq u hu), selected_approximation_converges hu⟩

/-- Completion milestone package. Sequential completeness is deliberately kept
    distinct from the still-open accepted Dedekind least-upper-bound bridge. -/
structure CauchyCompletionCertificate where
  approximation : CauchyApproximationCertificate
  embeddedTermsConverge : ∀ d : CauchySeq,
    RCConverges (fun n => rCOfQ (d.seq n)) (rCmk d)
  complete : RCCauchyComplete

theorem cauchyCompletionCertificate : CauchyCompletionCertificate where
  approximation := cauchyApproximationCertificate
  embeddedTermsConverge := embedded_terms_converge_to_class
  complete := rCCauchyComplete

end BOMA.R.StageTwo.CauchyCompletion003
