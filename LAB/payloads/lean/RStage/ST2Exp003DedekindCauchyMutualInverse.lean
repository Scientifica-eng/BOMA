/- ST2-EXP-003 H5 mutual-inverse layer.

   This source builds only after the exact-verified H5 order-reflection
   milestone.  The two LUB comparison maps are proved mutually inverse by
   showing that the rational lower envelope selected by each composite is
   exactly the rational lower envelope of the original point.

   This yields an order-isomorphism certificate.  It does not yet claim
   preservation of addition, multiplication, inverses, or a field isomorphism,
   and it does not create a research Junction. -/
namespace BOMA.R.StageTwo.DedekindCauchyComparison003

open BOMA.Q.Quotient001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindOrderConstructive001
open BOMA.R.DedekindOrderClassical001
open BOMA.R.DedekindStrictOrder001
open BOMA.R.DedekindRationalDensity001
open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyOrderCore003
open BOMA.R.StageTwo.CauchyOrderTotal003
open BOMA.R.StageTwo.CauchyLUBBracket003

/-- Going Cauchy → Dedekind → Cauchy returns the original Cauchy real. -/
theorem dToC_cToD (x : RCBOMA) :
    dToC (cToD x) = x := by
  apply rcle_antisymm
  · apply (dToC_spec (cToD x)).2
    intro y hy
    rcases hy with ⟨q, rfl, hq⟩
    exact cToD_rational_lower_reflect hq
  · rcases rcle_total x (dToC (cToD x)) with hforward | hback
    · exact hforward
    · by_cases hforward : rCLE x (dToC (cToD x))
      · exact hforward
      · have hne : dToC (cToD x) ≠ x := by
          intro hEq
          apply hforward
          rw [hEq]
          exact rcle_refl x
        have hstrict : rCLT (dToC (cToD x)) x := ⟨hback, hne⟩
        rcases rC_rational_image_dense hstrict with
          ⟨q, hcompq, hqx⟩
        have hqD : rLE (rOfQ q) (cToD x) := by
          apply (cToD_spec x).1
          exact ⟨q, rfl, hqx.1⟩
        have hqC : rCLE (rCOfQ q) (dToC (cToD x)) := by
          apply (dToC_spec (cToD x)).1
          exact ⟨q, rfl, hqD⟩
        exact False.elim
          (hcompq.2 (rcle_antisymm hcompq.1 hqC))

/-- Going Dedekind → Cauchy → Dedekind returns the original accepted real. -/
theorem cToD_dToC (x : RBOMA) :
    cToD (dToC x) = x := by
  apply rLE_antisymm
  · apply (cToD_spec (dToC x)).2
    intro y hy
    rcases hy with ⟨q, rfl, hq⟩
    exact dToC_rational_lower_reflect hq
  · rcases rLE_total_classical x (cToD (dToC x)) with hforward | hback
    · exact hforward
    · by_cases hforward : rLE x (cToD (dToC x))
      · exact hforward
      · have hne : cToD (dToC x) ≠ x := by
          intro hEq
          apply hforward
          rw [hEq]
          exact rLE_refl x
        have hstrict : rLT (cToD (dToC x)) x := ⟨hback, hne⟩
        rcases r_rational_image_dense hstrict with
          ⟨q, hcompq, hqx⟩
        have hqC : rCLE (rCOfQ q) (dToC x) := by
          apply (dToC_spec x).1
          exact ⟨q, rfl, hqx.1⟩
        have hqD : rLE (rOfQ q) (cToD (dToC x)) := by
          apply (cToD_spec (dToC x)).1
          exact ⟨q, rfl, hqC⟩
        exact False.elim
          (hcompq.2 (rLE_antisymm hcompq.1 hqD))

/-- Machine-checkable H5 order-isomorphism package.  The word
    "order-isomorphism" here is intentionally limited to the mutually inverse
    maps and exact order equivalences already proved; no field operations are
    included. -/
structure DedekindCauchyOrderIsomorphismCertificate where
  reflection : DedekindCauchyOrderReflectionCertificate
  cToDMap : RCBOMA → RBOMA
  dToCMap : RBOMA → RCBOMA
  cToDOrderIff : ∀ {x y : RCBOMA},
    rLE (cToDMap x) (cToDMap y) ↔ rCLE x y
  dToCOrderIff : ∀ {x y : RBOMA},
    rCLE (dToCMap x) (dToCMap y) ↔ rLE x y
  leftInverse : ∀ x : RCBOMA, dToCMap (cToDMap x) = x
  rightInverse : ∀ x : RBOMA, cToDMap (dToCMap x) = x

noncomputable def dedekindCauchyOrderIsomorphismCertificate :
    DedekindCauchyOrderIsomorphismCertificate where
  reflection := dedekindCauchyOrderReflectionCertificate
  cToDMap := cToD
  dToCMap := dToC
  cToDOrderIff := @cToD_order_iff
  dToCOrderIff := @dToC_order_iff
  leftInverse := dToC_cToD
  rightInverse := cToD_dToC

end BOMA.R.StageTwo.DedekindCauchyComparison003
