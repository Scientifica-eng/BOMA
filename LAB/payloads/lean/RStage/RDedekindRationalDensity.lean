/- Rational-image density in the selected Dedekind quotient carrier.
The only new classical step is witness extraction from strict extensional cut inclusion. -/
namespace BOMA.R.DedekindRationalDensity001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindStrictOrder001

/-- Strict cut inclusion has an explicit rational point lying in the larger cut
and outside the smaller cut. The witness extraction from failure of extensional
identity is the localized classical step in this file. -/
theorem strict_cut_inclusion_witness
    {A B : LowerCut}
    (hAB : CutLE A B)
    (hne : ¬ CutEquiv A B) :
    ∃ b : QBOMA, B.lower b ∧ ¬ A.lower b := by
  apply Classical.byContradiction
  intro hNoWitness
  apply hne
  intro q
  constructor
  · intro hqA
    exact hAB q hqA
  · intro hqB
    cases Classical.em (A.lower q) with
    | inl hqA => exact hqA
    | inr hNotA =>
        exact False.elim (hNoWitness ⟨q, hqB, hNotA⟩)

/-- Between two strictly nested lower cuts lies a principal rational cut that is
strictly above the smaller cut and strictly below the larger cut. -/
theorem principal_cut_between_strict_cuts
    {A B : LowerCut}
    (hAB : CutLE A B)
    (hne : ¬ CutEquiv A B) :
    ∃ m : QBOMA,
      CutLE A (principalCut m) ∧
      ¬ CutEquiv A (principalCut m) ∧
      CutLE (principalCut m) B ∧
      ¬ CutEquiv (principalCut m) B := by
  rcases strict_cut_inclusion_witness hAB hne with ⟨b, hbB, hbNotA⟩
  rcases B.rounded hbB with ⟨c, hcB, hbc⟩
  rcases rational_order_dense hbc with ⟨m, hbm, hmc⟩

  have hApm : CutLE A (principalCut m) := by
    intro a haA
    change qLT a m
    have hab : qLT a b := by
      rcases qle_total a b with hab | hba
      · refine ⟨hab, ?_⟩
        intro heq
        apply hbNotA
        rw [← heq]
        exact haA
      · exact False.elim (hbNotA (A.downward haA hba))
    exact qlt_trans hab hbm

  have hmB : B.lower m := B.downward hcB hmc.1

  have hpmB : CutLE (principalCut m) B := by
    intro a haM
    exact B.downward hmB haM.1

  have hAne : ¬ CutEquiv A (principalCut m) := by
    intro hEq
    exact hbNotA ((hEq b).2 hbm)

  have hBne : ¬ CutEquiv (principalCut m) B := by
    intro hEq
    have hmm : (principalCut m).lower m := (hEq m).2 hmB
    exact (qlt_irrefl m) hmm

  exact ⟨m, hApm, hAne, hpmB, hBne⟩

/-- RA-12: the embedded accepted rationals are strictly order-dense in RBOMA. -/
theorem r_rational_image_dense
    {x y : RBOMA}
    (hxy : rLT x y) :
    ∃ q : QBOMA,
      rLT x (rOfQ q) ∧ rLT (rOfQ q) y := by
  rcases hxy.1 with ⟨A, B, hxA, hyB, hAB⟩
  have hneAB : ¬ CutEquiv A B := by
    intro hEq
    apply hxy.2
    calc
      x = rmk A := hxA
      _ = rmk B := rmk_sound hEq
      _ = y := hyB.symm
  rcases principal_cut_between_strict_cuts hAB hneAB with
    ⟨m, hApm, hAne, hpmB, hBne⟩
  refine ⟨m, ?_, ?_⟩
  · constructor
    · exact ⟨A, principalCut m, hxA, rfl, hApm⟩
    · intro hxq
      apply hAne
      have hmk : rmk A = rmk (principalCut m) := by
        calc
          rmk A = x := hxA.symm
          _ = rOfQ m := hxq
          _ = rmk (principalCut m) := rfl
      exact (rmk_eq_iff).1 hmk
  · constructor
    · exact ⟨principalCut m, B, rfl, hyB, hpmB⟩
    · intro hqy
      apply hBne
      have hmk : rmk (principalCut m) = rmk B := by
        calc
          rmk (principalCut m) = rOfQ m := rfl
          _ = y := hqy
          _ = rmk B := hyB
      exact (rmk_eq_iff).1 hmk

end BOMA.R.DedekindRationalDensity001
