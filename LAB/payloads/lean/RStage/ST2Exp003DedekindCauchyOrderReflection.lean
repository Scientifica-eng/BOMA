/- ST2-EXP-003 H5 order-reflection layer.

   This source builds on the exact-verified H5 foundation and Cauchy rational
   density milestone.  It first proves that each LUB comparison map reflects
   rational lower bounds, then upgrades that fact to reflection of the full
   non-strict orders in both directions.

   The result is order-embedding strength only.  Surjectivity, mutual inverse,
   order isomorphism, field isomorphism, and any research Junction remain
   outside this source. -/
namespace BOMA.R.StageTwo.DedekindCauchyComparison003

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.R.Gateway001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindOrderConstructive001
open BOMA.R.DedekindOrderClassical001
open BOMA.R.DedekindStrictOrder001
open BOMA.R.DedekindRationalDensity001
open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyOrderCore003
open BOMA.R.StageTwo.CauchyOrderTotal003
open BOMA.R.StageTwo.CauchyLUBBracket003

/-- A rational below the Dedekind image of a Cauchy real was already below the
    original Cauchy real.  The contradiction uses the independently proved
    Cauchy rational density and the leastness of `cToD`. -/
theorem cToD_rational_lower_reflect {q : QBOMA} {x : RCBOMA}
    (hq : rLE (rOfQ q) (cToD x)) :
    rCLE (rCOfQ q) x := by
  rcases rcle_total (rCOfQ q) x with hqx | hxq
  · exact hqx
  · by_cases hqx : rCLE (rCOfQ q) x
    · exact hqx
    · have hxqNe : x ≠ rCOfQ q := by
        intro hEq
        apply hqx
        rw [← hEq]
        exact rcle_refl x
      have hxqStrict : rCLT x (rCOfQ q) := ⟨hxq, hxqNe⟩
      rcases rC_rational_image_dense hxqStrict with
        ⟨r, hxr, hrq⟩
      have hcToDr : rLE (cToD x) (rOfQ r) := by
        apply (cToD_spec x).2
        intro z hz
        rcases hz with ⟨s, rfl, hsx⟩
        apply (rOfQ_order s r).2
        apply (rCOfQ_order s r).1
        exact rcle_trans hsx hxr.1
      have hqrQ : qLE q r :=
        (rOfQ_order q r).1 (rLE_trans hq hcToDr)
      have hrqQ : qLT r q := (rCOfQ_strict r q).1 hrq
      exact False.elim (hrqQ.2 (qle_antisymm hrqQ.1 hqrQ))

/-- Symmetrically, a rational below the Cauchy image of an accepted Dedekind
    real was already below that Dedekind real.  This direction uses the
    accepted Dedekind rational-density theorem. -/
theorem dToC_rational_lower_reflect {q : QBOMA} {x : RBOMA}
    (hq : rCLE (rCOfQ q) (dToC x)) :
    rLE (rOfQ q) x := by
  rcases rLE_total_classical (rOfQ q) x with hqx | hxq
  · exact hqx
  · by_cases hqx : rLE (rOfQ q) x
    · exact hqx
    · have hxqNe : x ≠ rOfQ q := by
        intro hEq
        apply hqx
        rw [← hEq]
        exact rLE_refl x
      have hxqStrict : rLT x (rOfQ q) := ⟨hxq, hxqNe⟩
      rcases r_rational_image_dense hxqStrict with
        ⟨r, hxr, hrq⟩
      have hdToCr : rCLE (dToC x) (rCOfQ r) := by
        apply (dToC_spec x).2
        intro z hz
        rcases hz with ⟨s, rfl, hsx⟩
        apply (rCOfQ_order s r).2
        apply (rOfQ_order s r).1
        exact rLE_trans hsx hxr.1
      have hqrQ : qLE q r :=
        (rCOfQ_order q r).1 (rcle_trans hq hdToCr)
      have hrqQ : qLT r q := (rOfQ_strict_order r q).1 hrq
      exact False.elim (hrqQ.2 (qle_antisymm hrqQ.1 hqrQ))

/-- `cToD` reflects the full non-strict order. -/
theorem cToD_order_reflect {x y : RCBOMA}
    (hmap : rLE (cToD x) (cToD y)) :
    rCLE x y := by
  rcases rcle_total x y with hxy | hyx
  · exact hxy
  · by_cases hxy : rCLE x y
    · exact hxy
    · have hyxNe : y ≠ x := by
        intro hEq
        apply hxy
        rw [← hEq]
        exact rcle_refl y
      have hyxStrict : rCLT y x := ⟨hyx, hyxNe⟩
      rcases rC_rational_image_dense hyxStrict with
        ⟨q, hyq, hqx⟩
      have hqCx : rLE (rOfQ q) (cToD x) := by
        apply (cToD_spec x).1
        exact ⟨q, rfl, hqx.1⟩
      have hqCy : rLE (rOfQ q) (cToD y) :=
        rLE_trans hqCx hmap
      have hqY : rCLE (rCOfQ q) y :=
        cToD_rational_lower_reflect hqCy
      exact False.elim (hyq.2 (rcle_antisymm hyq.1 hqY))

/-- `dToC` reflects the full non-strict order. -/
theorem dToC_order_reflect {x y : RBOMA}
    (hmap : rCLE (dToC x) (dToC y)) :
    rLE x y := by
  rcases rLE_total_classical x y with hxy | hyx
  · exact hxy
  · by_cases hxy : rLE x y
    · exact hxy
    · have hyxNe : y ≠ x := by
        intro hEq
        apply hxy
        rw [← hEq]
        exact rLE_refl y
      have hyxStrict : rLT y x := ⟨hyx, hyxNe⟩
      rcases r_rational_image_dense hyxStrict with
        ⟨q, hyq, hqx⟩
      have hqCx : rCLE (rCOfQ q) (dToC x) := by
        apply (dToC_spec x).1
        exact ⟨q, rfl, hqx.1⟩
      have hqCy : rCLE (rCOfQ q) (dToC y) :=
        rcle_trans hqCx hmap
      have hqY : rLE (rOfQ q) y :=
        dToC_rational_lower_reflect hqCy
      exact False.elim (hyq.2 (rLE_antisymm hyq.1 hqY))

/-- Exact order equivalence induced by the first comparison map. -/
theorem cToD_order_iff {x y : RCBOMA} :
    rLE (cToD x) (cToD y) ↔ rCLE x y :=
  ⟨cToD_order_reflect, cToD_mono⟩

/-- Exact order equivalence induced by the reverse comparison map. -/
theorem dToC_order_iff {x y : RBOMA} :
    rCLE (dToC x) (dToC y) ↔ rLE x y :=
  ⟨dToC_order_reflect, dToC_mono⟩

/-- Machine-checkable order-reflection milestone.  This packages two order
    embeddings, not an isomorphism. -/
structure DedekindCauchyOrderReflectionCertificate where
  density : DedekindCauchyComparisonDensityCertificate
  cToDRationalLowerReflect : ∀ {q : QBOMA} {x : RCBOMA},
    rLE (rOfQ q) (cToD x) → rCLE (rCOfQ q) x
  dToCRationalLowerReflect : ∀ {q : QBOMA} {x : RBOMA},
    rCLE (rCOfQ q) (dToC x) → rLE (rOfQ q) x
  cToDOrderIff : ∀ {x y : RCBOMA},
    rLE (cToD x) (cToD y) ↔ rCLE x y
  dToCOrderIff : ∀ {x y : RBOMA},
    rCLE (dToC x) (dToC y) ↔ rLE x y

noncomputable def dedekindCauchyOrderReflectionCertificate :
    DedekindCauchyOrderReflectionCertificate where
  density := dedekindCauchyComparisonDensityCertificate
  cToDRationalLowerReflect := @cToD_rational_lower_reflect
  dToCRationalLowerReflect := @dToC_rational_lower_reflect
  cToDOrderIff := @cToD_order_iff
  dToCOrderIff := @dToC_order_iff

end BOMA.R.StageTwo.DedekindCauchyComparison003
