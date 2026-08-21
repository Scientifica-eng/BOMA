/- Formal identity probe for the selected Dedekind route. -/
namespace BOMA.R.DedekindQuotient001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.R.DedekindProbe001

/-- Extensional cut identity packaged as a formal Setoid. -/
def cutSetoid : Setoid LowerCut where
  r := CutEquiv
  iseqv := ⟨cutEquiv_refl, @cutEquiv_symm, @cutEquiv_trans⟩

/-- Candidate Stage-One real carrier under identity Candidate A. -/
def RBOMA : Type := Quotient cutSetoid

/-- Injection of a lower-cut representation into the formal carrier. -/
def rmk (A : LowerCut) : RBOMA := Quotient.mk cutSetoid A

/-- Extensional-equivalent cuts become formally equal. -/
theorem rmk_sound {A B : LowerCut} (h : CutEquiv A B) : rmk A = rmk B :=
  Quotient.sound h

/-- Formal equality of explicit representatives is exactly CutEquiv. -/
theorem rmk_eq_iff {A B : LowerCut} : rmk A = rmk B ↔ CutEquiv A B := by
  constructor
  · intro h
    exact Quotient.exact h
  · exact rmk_sound

/-- Candidate rational embedding into the quotient real carrier. -/
def rOfQ (q : QBOMA) : RBOMA := rmk (principalCut q)

/-- The principal-cut rational embedding remains injective after quotienting. -/
theorem rOfQ_injective {q r : QBOMA} (h : rOfQ q = rOfQ r) : q = r := by
  apply principalCut_reflects
  exact Quotient.exact h

/-- Inclusion of cuts respects extensional identity in both endpoints. -/
theorem cutLE_respects {A A' B B' : LowerCut}
    (hA : CutEquiv A A') (hB : CutEquiv B B')
    (hLE : CutLE A B) : CutLE A' B' := by
  intro q hqA'
  have hqA : A.lower q := (hA q).mpr hqA'
  have hqB : B.lower q := hLE q hqA
  exact (hB q).mp hqB

/-- Quotient order without proposition extensionality: endpoints are witnessed
by explicit cut representatives related by inclusion. -/
def rLE (x y : RBOMA) : Prop :=
  ∃ A : LowerCut, ∃ B : LowerCut,
    x = rmk A ∧ y = rmk B ∧ CutLE A B

/-- On explicit representatives, formal real order is exactly cut inclusion. -/
theorem rLE_mk_iff (A B : LowerCut) :
    rLE (rmk A) (rmk B) ↔ CutLE A B := by
  constructor
  · rintro ⟨A', B', hAeq, hBeq, hLE⟩
    have hA : CutEquiv A A' := (rmk_eq_iff).mp hAeq
    have hB : CutEquiv B B' := (rmk_eq_iff).mp hBeq
    exact cutLE_respects (cutEquiv_symm hA) (cutEquiv_symm hB) hLE
  · intro h
    exact ⟨A, B, rfl, rfl, h⟩

/-- The quotient rational embedding preserves and reflects accepted Q order.
The Iff chain is composed directly rather than rewriting one proposition by an
Iff theorem, keeping proposition extensionality out of this proof term. -/
theorem rOfQ_order (q r : QBOMA) :
    rLE (rOfQ q) (rOfQ r) ↔ qLE q r := by
  change rLE (rmk (principalCut q)) (rmk (principalCut r)) ↔ qLE q r
  have hPrincipal :
      CutLE (principalCut q) (principalCut r) ↔ qLE q r := by
    change PrincipalLE q r ↔ qLE q r
    exact principalLE_iff_qLE q r
  exact (rLE_mk_iff (principalCut q) (principalCut r)).trans hPrincipal

end BOMA.R.DedekindQuotient001
