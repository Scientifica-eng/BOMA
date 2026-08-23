/- ST2-EXP-003 completeness selector: choose one rational approximation to each
   term of an RCBOMA sequence at the explicit vanishing radius qCauchyScale n.
   This is the countable data-selection boundary required by the frozen Plan.
   No Dedekind producer or standard real carrier is used. -/
namespace BOMA.R.StageTwo.CauchyApproximation003

open BOMA.NCore.RB001
open BOMA.NArithmetic.Order001
open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.R.Gateway001
open BOMA.R.CauchyProbe001
open BOMA.R.StageTwo.CauchyCloseness003
open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyMultiplicative003
open BOMA.R.StageTwo.CauchyScale003
open BOMA.R.StageTwo.CauchyCompletionCore003
open BOMA.R.StageTwo.CauchyDensity003

/-- Explicit Choice boundary: one rational approximation is selected for each
    quotient term and each accepted-natural index. -/
noncomputable def qApproxAtScale (x : RCBOMA) (n : BOMANat) : QBOMA := by
  classical
  exact Classical.choose
    (rational_approximation_exists x (qCauchyScale n) (qCauchyScale_pos n))

/-- The selected rational really approximates the quotient term at the declared
    vanishing scale. -/
theorem qApproxAtScale_close (x : RCBOMA) (n : BOMANat) :
    rCClose (qCauchyScale n) x (rCOfQ (qApproxAtScale x n)) := by
  classical
  unfold qApproxAtScale
  exact Classical.choose_spec
    (rational_approximation_exists x (qCauchyScale n) (qCauchyScale_pos n))

/-- Selected rational approximation sequence for a quotient-valued sequence. -/
noncomputable def qApproxSeq (u : RCSeq) : QSeq :=
  fun n => qApproxAtScale (u n) n

/-- A Cauchy sequence in the independently constructed quotient has a selected
    rational approximation sequence which is itself Cauchy in accepted Q.

    Error budget: quarter + half + quarter = epsilon. -/
theorem qApproxSeq_cauchy {u : RCSeq} (hu : IsRCCauchy u) :
    IsCauchy (qApproxSeq u) := by
  intro eps heps
  rcases positive_half_exists heps with ⟨half, hhalf, hhalfSum⟩
  rcases positive_half_exists hhalf with ⟨quarter, hquarter, hquarterSum⟩
  rcases qCauchyScale_tends_zero quarter hquarter with ⟨Ns, hNs⟩
  rcases hu half hhalf with ⟨Nu, hNu⟩
  rcases common_upper_bound Ns Nu with ⟨N, hNsN, hNuN⟩
  refine ⟨N, ?_⟩
  intro m n hm hn
  have hsm : qLE (qCauchyScale m) quarter :=
    hNs m (le_trans hNsN hm)
  have hsn : qLE (qCauchyScale n) quarter :=
    hNs n (le_trans hNsN hn)
  have ham : rCClose quarter (u m) (rCOfQ (qApproxSeq u m)) := by
    exact rCClose_mono (qApproxAtScale_close (u m) m) hsm
  have han : rCClose quarter (u n) (rCOfQ (qApproxSeq u n)) := by
    exact rCClose_mono (qApproxAtScale_close (u n) n) hsn
  have hum : rCClose half (u m) (u n) :=
    hNu m n (le_trans hNuN hm) (le_trans hNuN hn)
  have hleft : rCClose quarter (rCOfQ (qApproxSeq u m)) (u m) :=
    rCClose_symm ham
  have hchain1 := rCClose_trans_add hleft hum
  have hchain2 := rCClose_trans_add hchain1 han
  have hradius : qAdd quarter (qAdd half quarter) = eps := by
    calc
      qAdd quarter (qAdd half quarter) =
          qAdd (qAdd quarter half) quarter :=
        (qAdd_assoc quarter half quarter).symm
      _ = qAdd (qAdd half quarter) quarter := by
        rw [qAdd_comm quarter half]
      _ = qAdd half (qAdd quarter quarter) :=
        qAdd_assoc half quarter quarter
      _ = qAdd half half := by rw [hquarterSum]
      _ = eps := hhalfSum
  rw [hradius] at hchain2
  exact (rCClose_ofQ_iff).1 hchain2

/-- Package the selected rational sequence as an actual rational Cauchy
    representative for the eventual quotient limit. -/
noncomputable def approxCauchySeq (u : RCSeq) (hu : IsRCCauchy u) : CauchySeq :=
  ⟨qApproxSeq u, qApproxSeq_cauchy hu⟩

/-- Machine-checkable statement of the countable approximation boundary. -/
structure CauchyApproximationCertificate where
  selectedClose : ∀ x : RCBOMA, ∀ n : BOMANat,
    rCClose (qCauchyScale n) x (rCOfQ (qApproxAtScale x n))
  selectedCauchy : ∀ {u : RCSeq}, IsRCCauchy u → IsCauchy (qApproxSeq u)
  density : CauchyDensityCertificate

theorem cauchyApproximationCertificate : CauchyApproximationCertificate where
  selectedClose := qApproxAtScale_close
  selectedCauchy := @qApproxSeq_cauchy
  density := cauchyDensityCertificate

end BOMA.R.StageTwo.CauchyApproximation003
