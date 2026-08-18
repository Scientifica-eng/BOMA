/- Deeper Cauchy-route probe: constant rational sequences. -/
namespace BOMA.R.CauchyProbe001

open BOMA.NCore.RB001
open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001

/-- Zero is its own selected additive inverse. -/
theorem qNeg_zero : qNeg qZero = qZero := by
  symm
  exact qAdd_inverse_unique (x := qZero) (y := qZero) (qAdd_zero_left qZero)

/-- Any rational is epsilon-close to itself for positive epsilon. -/
theorem qClose_refl_of_pos (eps q : QBOMA) (heps : qPos eps) :
    qClose eps q q := by
  unfold qClose
  rw [qAdd_neg_right]
  have hneg : qLE (qNeg eps) (qNeg qZero) := qneg_reverses heps.1
  rw [qNeg_zero] at hneg
  exact ⟨hneg, heps.1⟩

/-- Constant rational sequence. -/
def constSeq (q : QBOMA) : QSeq := fun _ => q

/-- Constant sequences are Cauchy without any Archimedean or density lemma. -/
theorem constSeq_cauchy (q : QBOMA) : IsCauchy (constSeq q) := by
  intro eps heps
  refine ⟨BOMANat.z, ?_⟩
  intro m n hm hn
  exact qClose_refl_of_pos eps q heps

/-- Candidate rational embedding into Cauchy syntax. -/
def cauchyOfQ (q : QBOMA) : CauchySeq :=
  ⟨constSeq q, constSeq_cauchy q⟩

/-- Reflexive identity evidence for the constant embedding. -/
theorem cauchyOfQ_self_equiv (q : QBOMA) :
    CauchyEquiv (cauchyOfQ q) (cauchyOfQ q) := by
  intro eps heps
  refine ⟨BOMANat.z, ?_⟩
  intro n hn
  exact qClose_refl_of_pos eps q heps

end BOMA.R.CauchyProbe001
