/- ST2-EXP-003 H5 comparison foundation.

   This file is intentionally COMBINED rather than independent: the workflow
   assembles the unchanged accepted Dedekind R manifest first, then the
   research-only Cauchy addendum ending in this source.  No accepted producer
   is modified and no research Junction is declared here.

   The first comparison layer constructs canonical (choice-selected) LUB maps
   in both directions from the same accepted rational carrier.  Each map is
   proved to preserve the rational embedding exactly and to be monotone.  The
   later H5 layer may prove order reflection / mutual inverse laws and only then
   decide whether an R-field research Junction is justified. -/
namespace BOMA.R.StageTwo.DedekindCauchyComparison003

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.Q.Quotient001
open BOMA.Q.Embedding001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindOrderConstructive001
open BOMA.R.DedekindOrderClassical001
open BOMA.R.DedekindStrictOrder001
open BOMA.R.DedekindCompleteness001
open BOMA.R.DedekindRationalDensity001
open BOMA.R.DedekindArchimedean001
open BOMA.R.StageIntegration002
open BOMA.R.CauchyProbe001
open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyOrderCore003
open BOMA.R.StageTwo.CauchyOrderTotal003
open BOMA.R.StageTwo.CauchyLUBBracket003
open BOMA.R.StageTwo.CauchyLUB003

/-- Accepted Dedekind reals have an embedded rational strictly below them.
    This is representation elimination only; it introduces no new selector. -/
theorem dedekind_rational_strict_lower_exists (x : RBOMA) :
    ∃ q : QBOMA, rLT (rOfQ q) x := by
  refine Quotient.inductionOn x ?_
  intro A
  rcases A.nonempty with ⟨a, ha⟩
  rcases A.rounded ha with ⟨b, hb, hab⟩
  refine ⟨b, ?_⟩
  change rLT (rmk (principalCut b)) (rmk A)
  apply (rlt_mk_iff (principalCut b) A).2
  constructor
  · intro q hq
    exact A.downward hb hq.1
  · intro hEq
    have hbb : (principalCut b).lower b := (hEq b).2 hb
    exact (qlt_irrefl b) hbb

/-- Accepted Archimedean evidence gives a rational (non-strict) upper bound. -/
theorem dedekind_rational_upper_exists (x : RBOMA) :
    ∃ q : QBOMA, rLE x (rOfQ q) := by
  rcases r_archimedean_strict_upper x with ⟨n, hn⟩
  exact ⟨qOfN n, hn.1⟩

/-- One explicit rational upper endpoint for a Cauchy real.  The only choice
    here is the already localized rational-approximation witness exported by
    the independent route. -/
noncomputable def cUpperQ (x : RCBOMA) : QBOMA :=
  Classical.choose (rational_upper_exists x qOne qzero_lt_one)

theorem cUpperQ_spec (x : RCBOMA) :
    rCLE x (rCOfQ (cUpperQ x)) :=
  Classical.choose_spec (rational_upper_exists x qOne qzero_lt_one)

/-- One explicit rational upper endpoint for an accepted Dedekind real. -/
noncomputable def dUpperQ (x : RBOMA) : QBOMA :=
  Classical.choose (dedekind_rational_upper_exists x)

theorem dUpperQ_spec (x : RBOMA) :
    rLE x (rOfQ (dUpperQ x)) :=
  Classical.choose_spec (dedekind_rational_upper_exists x)

/-- Dedekind-side image of all accepted rationals lying below a Cauchy real. -/
def CToDFamily (x : RCBOMA) (y : RBOMA) : Prop :=
  ∃ q : QBOMA, y = rOfQ q ∧ rCLE (rCOfQ q) x

/-- Cauchy-side image of all accepted rationals lying below a Dedekind real. -/
def DToCFamily (x : RBOMA) (y : RCBOMA) : Prop :=
  ∃ q : QBOMA, y = rCOfQ q ∧ rLE (rOfQ q) x

theorem cToDFamily_nonempty (x : RCBOMA) :
    ∃ y : RBOMA, CToDFamily x y := by
  rcases rational_strict_lower_exists x qOne qzero_lt_one with ⟨q, hq⟩
  exact ⟨rOfQ q, q, rfl, hq.1⟩

theorem cToDFamily_upper (x : RCBOMA) :
    RUpperBound (CToDFamily x) (rOfQ (cUpperQ x)) := by
  intro y hy
  rcases hy with ⟨q, rfl, hqx⟩
  apply (rOfQ_order q (cUpperQ x)).2
  apply (rCOfQ_order q (cUpperQ x)).1
  exact rcle_trans hqx (cUpperQ_spec x)

theorem dToCFamily_nonempty (x : RBOMA) :
    ∃ y : RCBOMA, DToCFamily x y := by
  rcases dedekind_rational_strict_lower_exists x with ⟨q, hq⟩
  exact ⟨rCOfQ q, q, rfl, hq.1⟩

theorem dToCFamily_upper (x : RBOMA) :
    RCUpperBound (DToCFamily x) (rCOfQ (dUpperQ x)) := by
  intro y hy
  rcases hy with ⟨q, rfl, hqx⟩
  apply (rCOfQ_order q (dUpperQ x)).2
  apply (rOfQ_order q (dUpperQ x)).1
  exact rLE_trans hqx (dUpperQ_spec x)

/-- The accepted Dedekind LUB of the rational envelope below a Cauchy real. -/
theorem cToD_lub_exists (x : RCBOMA) :
    ∃ s : RBOMA,
      (∀ y : RBOMA, CToDFamily x y → rLE y s) ∧
      (∀ B : RBOMA, RUpperBound (CToDFamily x) B → rLE s B) :=
  rDedekind_lub_exists
    (CToDFamily x)
    (cToDFamily_nonempty x)
    (rOfQ (cUpperQ x))
    (cToDFamily_upper x)

/-- H5 comparison map from the independent Cauchy carrier into the accepted
    Dedekind carrier.  Choice selects the LUB already proved to exist. -/
noncomputable def cToD (x : RCBOMA) : RBOMA :=
  Classical.choose (cToD_lub_exists x)

theorem cToD_spec (x : RCBOMA) :
    (∀ y : RBOMA, CToDFamily x y → rLE y (cToD x)) ∧
    (∀ B : RBOMA, RUpperBound (CToDFamily x) B → rLE (cToD x) B) :=
  Classical.choose_spec (cToD_lub_exists x)

/-- The independent Cauchy LUB of the rational envelope below a Dedekind real. -/
theorem dToC_lub_exists (x : RBOMA) :
    ∃ s : RCBOMA,
      (∀ y : RCBOMA, DToCFamily x y → rCLE y s) ∧
      (∀ B : RCBOMA, RCUpperBound (DToCFamily x) B → rCLE s B) :=
  rCauchy_lub_exists
    (DToCFamily x)
    (dToCFamily_nonempty x)
    (rCOfQ (dUpperQ x))
    (dToCFamily_upper x)

/-- H5 comparison map from the accepted Dedekind carrier into the independent
    Cauchy carrier.  Choice selects the independently proved H4 LUB. -/
noncomputable def dToC (x : RBOMA) : RCBOMA :=
  Classical.choose (dToC_lub_exists x)

theorem dToC_spec (x : RBOMA) :
    (∀ y : RCBOMA, DToCFamily x y → rCLE y (dToC x)) ∧
    (∀ B : RCBOMA, RCUpperBound (DToCFamily x) B → rCLE (dToC x) B) :=
  Classical.choose_spec (dToC_lub_exists x)

/-- The Cauchy-to-Dedekind comparison fixes every accepted rational exactly. -/
theorem cToD_rational (q : QBOMA) :
    cToD (rCOfQ q) = rOfQ q := by
  apply rLE_antisymm
  · apply (cToD_spec (rCOfQ q)).2
    intro y hy
    rcases hy with ⟨r, rfl, hrq⟩
    exact (rOfQ_order r q).2 ((rCOfQ_order r q).1 hrq)
  · apply (cToD_spec (rCOfQ q)).1
    exact ⟨q, rfl, rcle_refl (rCOfQ q)⟩

/-- The Dedekind-to-Cauchy comparison fixes every accepted rational exactly. -/
theorem dToC_rational (q : QBOMA) :
    dToC (rOfQ q) = rCOfQ q := by
  apply rcle_antisymm
  · apply (dToC_spec (rOfQ q)).2
    intro y hy
    rcases hy with ⟨r, rfl, hrq⟩
    exact (rCOfQ_order r q).2 ((rOfQ_order r q).1 hrq)
  · apply (dToC_spec (rOfQ q)).1
    exact ⟨q, rfl, rLE_refl (rOfQ q)⟩

/-- The first comparison map is monotone. -/
theorem cToD_mono {x y : RCBOMA} (hxy : rCLE x y) :
    rLE (cToD x) (cToD y) := by
  apply (cToD_spec x).2
  intro z hz
  apply (cToD_spec y).1
  rcases hz with ⟨q, rfl, hqx⟩
  exact ⟨q, rfl, rcle_trans hqx hxy⟩

/-- The reverse comparison map is monotone. -/
theorem dToC_mono {x y : RBOMA} (hxy : rLE x y) :
    rCLE (dToC x) (dToC y) := by
  apply (dToC_spec x).2
  intro z hz
  apply (dToC_spec y).1
  rcases hz with ⟨q, rfl, hqx⟩
  exact ⟨q, rfl, rLE_trans hqx hxy⟩

/-- Machine-checkable H5 foundation.  This is deliberately weaker than a
    research Junction: no injectivity, mutual inverse, or field-homomorphism
    claim is made until those properties are separately proved. -/
structure DedekindCauchyComparisonFoundationCertificate where
  acceptedRoute : RStageIntegrationCertificate
  cauchyRoute : CauchyLUBCertificate
  cToDMap : RCBOMA → RBOMA
  dToCMap : RBOMA → RCBOMA
  cToDRational : ∀ q : QBOMA, cToDMap (rCOfQ q) = rOfQ q
  dToCRational : ∀ q : QBOMA, dToCMap (rOfQ q) = rCOfQ q
  cToDMonotone : ∀ {x y : RCBOMA}, rCLE x y → rLE (cToDMap x) (cToDMap y)
  dToCMonotone : ∀ {x y : RBOMA}, rLE x y → rCLE (dToCMap x) (dToCMap y)

noncomputable def dedekindCauchyComparisonFoundationCertificate :
    DedekindCauchyComparisonFoundationCertificate where
  acceptedRoute := rStageIntegrationCertificate
  cauchyRoute := cauchyLUBCertificate
  cToDMap := cToD
  dToCMap := dToC
  cToDRational := cToD_rational
  dToCRational := dToC_rational
  cToDMonotone := @cToD_mono
  dToCMonotone := @dToC_mono

end BOMA.R.StageTwo.DedekindCauchyComparison003
