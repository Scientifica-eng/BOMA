/- ST2-EXP-003: independent Cauchy equivalence, formal carrier, and faithful
   rational embedding. No accepted Dedekind carrier or producer is imported. -/
namespace BOMA.R.StageTwo.CauchyQuotient003

open BOMA.NCore.RB001
open BOMA.NArithmetic.Order001
open BOMA.Q.Quotient001
open BOMA.R.Gateway001
open BOMA.R.CauchyProbe001
open BOMA.R.StageTwo.CauchyCloseness003

/-- The old representation-level relation is genuinely reflexive. -/
theorem cauchyEquiv_refl (u : CauchySeq) : CauchyEquiv u u := by
  intro eps heps
  refine ⟨BOMANat.z, ?_⟩
  intro n hn
  exact qClose_refl_of_pos eps (u.seq n) heps

/-- Its symmetry follows from proved rational-difference symmetry. -/
theorem cauchyEquiv_symm {u v : CauchySeq}
    (h : CauchyEquiv u v) : CauchyEquiv v u := by
  intro eps heps
  rcases h eps heps with ⟨N, hN⟩
  exact ⟨N, fun n hn => qClose_symm (hN n hn)⟩

/-- Its transitivity uses an explicitly proved positive epsilon half. -/
theorem cauchyEquiv_trans {u v w : CauchySeq}
    (huv : CauchyEquiv u v) (hvw : CauchyEquiv v w) :
    CauchyEquiv u w := by
  intro eps heps
  rcases positive_half_exists heps with ⟨delta, hdelta, hsum⟩
  rcases huv delta hdelta with ⟨Nu, hNu⟩
  rcases hvw delta hdelta with ⟨Nv, hNv⟩
  rcases le_total Nu Nv with hUV | hVU
  · refine ⟨Nv, ?_⟩
    intro n hn
    have h := qClose_triangle (hNu n (le_trans hUV hn)) (hNv n hn)
    rw [hsum] at h
    exact h
  · refine ⟨Nu, ?_⟩
    intro n hn
    have h := qClose_triangle (hNu n hn) (hNv n (le_trans hVU hn))
    rw [hsum] at h
    exact h

/-- Verified asymptotic identity, rather than raw Lean structure equality. -/
def cauchySetoid : Setoid CauchySeq where
  r := CauchyEquiv
  iseqv := ⟨cauchyEquiv_refl, @cauchyEquiv_symm, @cauchyEquiv_trans⟩

/-- Research Cauchy real carrier; not an accepted replacement for RBOMA. -/
def RCBOMA : Type := Quotient cauchySetoid

/-- Quotient injection of an explicitly verified rational Cauchy sequence. -/
def rCmk (u : CauchySeq) : RCBOMA := Quotient.mk cauchySetoid u

/-- Formal carrier equality is exactly the declared asymptotic identity. -/
theorem rCmk_eq_iff {u v : CauchySeq} : rCmk u = rCmk v ↔ CauchyEquiv u v := by
  constructor
  · exact Quotient.exact
  · intro huv
    exact Quotient.sound huv

/-- Rational embedding by the previously verified constant-sequence producer. -/
def rCOfQ (q : QBOMA) : RCBOMA := rCmk (cauchyOfQ q)

/-- Formal quotient equality between constant sequences reflects QBOMA identity. -/
theorem rCOfQ_injective {q r : QBOMA} (h : rCOfQ q = rCOfQ r) : q = r := by
  have hequiv : CauchyEquiv (cauchyOfQ q) (cauchyOfQ r) :=
    (rCmk_eq_iff).mp h
  apply qClose_all_positive_reflects
  intro eps heps
  rcases hequiv eps heps with ⟨N, hN⟩
  exact hN N (le_refl N)

end BOMA.R.StageTwo.CauchyQuotient003
