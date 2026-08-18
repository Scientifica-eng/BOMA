/- Representation-only Dedekind route probe. No real carrier identity is selected here. -/
namespace BOMA.R.DedekindProbe001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.R.Gateway001

/-- Lower Dedekind-cut syntax over accepted QBOMA.
The no-greatest-element requirement is expressed by strict rational order. -/
structure LowerCut where
  lower : QBOMA → Prop
  nonempty : ∃ q : QBOMA, lower q
  proper : ∃ q : QBOMA, ¬ lower q
  downward : ∀ {a b : QBOMA}, lower b → qLE a b → lower a
  rounded : ∀ {a : QBOMA}, lower a → ∃ b : QBOMA, lower b ∧ qLT a b

/-- Extensional representation relation for cut syntax.
This is deliberately external: the probe does not assume function/proposition
extensionality or select raw structure equality as real identity. -/
def CutEquiv (A B : LowerCut) : Prop :=
  ∀ q : QBOMA, A.lower q ↔ B.lower q

theorem cutEquiv_refl (A : LowerCut) : CutEquiv A A := by
  intro q
  exact Iff.rfl

theorem cutEquiv_symm {A B : LowerCut} (h : CutEquiv A B) : CutEquiv B A := by
  intro q
  exact (h q).symm

theorem cutEquiv_trans {A B C : LowerCut}
    (hAB : CutEquiv A B) (hBC : CutEquiv B C) : CutEquiv A C := by
  intro q
  exact Iff.trans (hAB q) (hBC q)

end BOMA.R.DedekindProbe001
