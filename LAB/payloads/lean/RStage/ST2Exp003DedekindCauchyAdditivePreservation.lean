/- ST2-EXP-003 H5 additive-preservation layer.

   This source starts only after the exact-verified Dedekind/Cauchy order
   isomorphism milestone.  It proves preservation of addition by characterizing
   strict rational lower bounds of a sum on both carriers, then derives zero
   and negation preservation from the already certified rational embedding and
   additive-inverse uniqueness.

   Multiplication, nonzero inverse preservation, field isomorphism, and any
   research Junction remain outside this source. -/
namespace BOMA.R.StageTwo.DedekindCauchyComparison003

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindOrderConstructive001
open BOMA.R.DedekindOrderClassical001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindAdditionEmbedding001
open BOMA.R.DedekindAdditionLaws001
open BOMA.R.DedekindOrderAdditive001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindAdditiveInverse001
open BOMA.R.DedekindStrictOrder001
open BOMA.R.DedekindRationalDensity001
open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyAdditive003
open BOMA.R.StageTwo.CauchyOrderCore003
open BOMA.R.StageTwo.CauchyOrderTotal003
open BOMA.R.StageTwo.CauchyOrderedRing003
open BOMA.R.StageTwo.CauchyLUBBracket003

/-- Left additive inverse on the independent Cauchy carrier, derived from the
    already certified right inverse and commutativity. -/
theorem rCAdd_neg_left_h5 (x : RCBOMA) :
    rCAdd (rCNeg x) x = rCZero := by
  calc
    rCAdd (rCNeg x) x = rCAdd x (rCNeg x) := rCAdd_comm _ _
    _ = rCZero := rCAdd_neg_right x

/-- Cancel a right summand on the independent Cauchy additive group. -/
theorem rCAdd_sub_right_h5 (x y : RCBOMA) :
    rCAdd (rCAdd x y) (rCNeg y) = x := by
  calc
    rCAdd (rCAdd x y) (rCNeg y) =
        rCAdd x (rCAdd y (rCNeg y)) := rCAdd_assoc x y (rCNeg y)
    _ = rCAdd x rCZero := by rw [rCAdd_neg_right]
    _ = x := rCAdd_zero_right x

/-- Right cancellation on the independent Cauchy additive group. -/
theorem rCAdd_right_cancel_h5 {x y z : RCBOMA}
    (h : rCAdd x z = rCAdd y z) : x = y := by
  have ht := congrArg (fun t => rCAdd t (rCNeg z)) h
  rw [rCAdd_sub_right_h5, rCAdd_sub_right_h5] at ht
  exact ht

/-- Strict Cauchy order is preserved by a common right additive translate. -/
theorem rclt_add_right_h5 {x y : RCBOMA}
    (hxy : rCLT x y) (z : RCBOMA) :
    rCLT (rCAdd x z) (rCAdd y z) := by
  refine ⟨rcle_add_right hxy.1 z, ?_⟩
  intro hEq
  exact hxy.2 (rCAdd_right_cancel_h5 hEq)

/-- A strict rational lower bound of a Cauchy sum can be split into strict
    rational lower bounds of the two summands. -/
theorem rC_rational_strict_below_add_split
    {q : QBOMA} {x y : RCBOMA}
    (hq : rCLT (rCOfQ q) (rCAdd x y)) :
    ∃ a b : QBOMA,
      rCLT (rCOfQ a) x ∧
      rCLT (rCOfQ b) y ∧
      qLT q (qAdd a b) := by
  have hsubY0 := rclt_add_right_h5 hq (rCNeg y)
  have hsubY : rCLT (rCAdd (rCOfQ q) (rCNeg y)) x := by
    rw [rCAdd_sub_right_h5 x y] at hsubY0
    exact hsubY0
  rcases rC_rational_image_dense hsubY with ⟨a, hsubYa, hax⟩
  have hqAy0 := rclt_add_right_h5 hsubYa y
  have hleftY :
      rCAdd (rCAdd (rCOfQ q) (rCNeg y)) y = rCOfQ q := by
    calc
      rCAdd (rCAdd (rCOfQ q) (rCNeg y)) y =
          rCAdd (rCOfQ q) (rCAdd (rCNeg y) y) :=
        rCAdd_assoc (rCOfQ q) (rCNeg y) y
      _ = rCAdd (rCOfQ q) rCZero := by rw [rCAdd_neg_left_h5]
      _ = rCOfQ q := rCAdd_zero_right _
  rw [hleftY] at hqAy0
  have hsubA0 := rclt_add_right_h5 hqAy0 (rCNeg (rCOfQ a))
  have hleftA :
      rCAdd (rCOfQ q) (rCNeg (rCOfQ a)) =
        rCOfQ (qAdd q (qNeg a)) := by
    rw [rCOfQ_neg, rCOfQ_add]
  have hrightA :
      rCAdd (rCAdd (rCOfQ a) y) (rCNeg (rCOfQ a)) = y := by
    calc
      rCAdd (rCAdd (rCOfQ a) y) (rCNeg (rCOfQ a)) =
          rCAdd (rCAdd y (rCOfQ a)) (rCNeg (rCOfQ a)) := by
        rw [rCAdd_comm (rCOfQ a) y]
      _ = rCAdd y (rCAdd (rCOfQ a) (rCNeg (rCOfQ a))) :=
        rCAdd_assoc y (rCOfQ a) (rCNeg (rCOfQ a))
      _ = rCAdd y rCZero := by rw [rCAdd_neg_right]
      _ = y := rCAdd_zero_right y
  rw [hleftA, hrightA] at hsubA0
  rcases rC_rational_image_dense hsubA0 with ⟨b, hqAb, hby⟩
  have hqAbQ : qLT (qAdd q (qNeg a)) b := by
    refine ⟨(rCOfQ_order _ _).1 hqAb.1, ?_⟩
    intro hEq
    apply hqAb.2
    exact congrArg rCOfQ hEq
  exact ⟨a, b, hax, hby, qlt_add_back_left hqAbQ⟩

/-- Conversely, strict rational lower bounds of both Cauchy summands combine
    into a strict rational lower bound of their sum. -/
theorem rC_rational_strict_below_add_of_split
    {q a b : QBOMA} {x y : RCBOMA}
    (hax : rCLT (rCOfQ a) x)
    (hby : rCLT (rCOfQ b) y)
    (hq : qLT q (qAdd a b)) :
    rCLT (rCOfQ q) (rCAdd x y) := by
  have hqsum : rCLT (rCOfQ q) (rCOfQ (qAdd a b)) := rCOfQ_strict hq
  have hsum1 :
      rCLE (rCAdd (rCOfQ a) (rCOfQ b))
        (rCAdd x (rCOfQ b)) :=
    rcle_add_right hax.1 (rCOfQ b)
  have hsum2raw := rcle_add_right hby.1 x
  have hsum2 :
      rCLE (rCAdd x (rCOfQ b)) (rCAdd x y) := by
    rw [rCAdd_comm (rCOfQ b) x, rCAdd_comm y x] at hsum2raw
    exact hsum2raw
  have hsum :
      rCLE (rCOfQ (qAdd a b)) (rCAdd x y) := by
    rw [← rCOfQ_add]
    exact rcle_trans hsum1 hsum2
  exact rclt_trans_le hqsum hsum

/-- Exact Cauchy-side strict rational lower-envelope characterization of
    addition. -/
theorem rC_rational_strict_below_add_iff
    {q : QBOMA} {x y : RCBOMA} :
    rCLT (rCOfQ q) (rCAdd x y) ↔
      ∃ a b : QBOMA,
        rCLT (rCOfQ a) x ∧
        rCLT (rCOfQ b) y ∧
        qLT q (qAdd a b) := by
  constructor
  · exact rC_rational_strict_below_add_split
  · rintro ⟨a, b, hax, hby, hq⟩
    exact rC_rational_strict_below_add_of_split hax hby hq

/-- A principal rational Dedekind real lies strictly below an explicit lower
    cut exactly when its rational endpoint belongs to that cut. -/
theorem rOfQ_strict_mk_iff_lower (q : QBOMA) (A : LowerCut) :
    rLT (rOfQ q) (rmk A) ↔ A.lower q := by
  constructor
  · intro h
    change rLT (rmk (principalCut q)) (rmk A) at h
    rcases (rlt_mk_iff (principalCut q) A).1 h with ⟨hInc, hNotEq⟩
    classical
    by_cases hqA : A.lower q
    · exact hqA
    · exfalso
      apply hNotEq
      intro p
      constructor
      · intro hp
        exact hInc p hp
      · intro hpA
        rcases qlt_trichotomy p q with hpq | hpq | hqp
        · exact hpq
        · subst p
          exact False.elim (hqA hpA)
        · exact False.elim (hqA (A.downward hpA hqp.1))
  · intro hqA
    change rLT (rmk (principalCut q)) (rmk A)
    apply (rlt_mk_iff (principalCut q) A).2
    constructor
    · intro p hp
      exact A.downward hqA hp.1
    · intro hEq
      have hqq : (principalCut q).lower q := (hEq q).2 hqA
      exact (qlt_irrefl q) hqq

/-- Exact accepted-Dedekind strict rational lower-envelope characterization of
    addition, exposed without selecting representatives. -/
theorem r_rational_strict_below_add_iff
    {q : QBOMA} {x y : RBOMA} :
    rLT (rOfQ q) (rAdd x y) ↔
      ∃ a b : QBOMA,
        rLT (rOfQ a) x ∧
        rLT (rOfQ b) y ∧
        qLT q (qAdd a b) := by
  refine Quotient.inductionOn x ?_
  intro A
  refine Quotient.inductionOn y ?_
  intro B
  constructor
  · intro h
    have hcut : (cutAdd A B).lower q := by
      apply (rOfQ_strict_mk_iff_lower q (cutAdd A B)).1
      simpa only [rAdd_mk] using h
    rcases hcut with ⟨a, b, ha, hb, hq⟩
    exact ⟨a, b,
      (rOfQ_strict_mk_iff_lower a A).2 ha,
      (rOfQ_strict_mk_iff_lower b B).2 hb,
      hq⟩
  · rintro ⟨a, b, ha, hb, hq⟩
    have hcut : (cutAdd A B).lower q :=
      ⟨a, b,
        (rOfQ_strict_mk_iff_lower a A).1 ha,
        (rOfQ_strict_mk_iff_lower b B).1 hb,
        hq⟩
    have hm := (rOfQ_strict_mk_iff_lower q (cutAdd A B)).2 hcut
    simpa only [rAdd_mk] using hm

/-- The H5 comparison map preserves and reflects strict rational lower bounds. -/
theorem cToD_rational_strict_iff {q : QBOMA} {x : RCBOMA} :
    rLT (rOfQ q) (cToD x) ↔ rCLT (rCOfQ q) x := by
  constructor
  · intro h
    refine ⟨cToD_rational_lower_reflect h.1, ?_⟩
    intro hEq
    apply h.2
    have hm := congrArg cToD hEq
    rw [cToD_rational] at hm
    exact hm
  · intro h
    constructor
    · have hm := cToD_mono h.1
      rw [cToD_rational] at hm
      exact hm
    · intro hEq
      apply h.2
      have hm : cToD (rCOfQ q) = cToD x := by
        rw [cToD_rational]
        exact hEq
      have hi := congrArg dToC hm
      simpa only [dToC_cToD] using hi

/-- If every embedded rational strictly below x is strictly below y, then x≤y
    on the accepted Dedekind carrier. -/
theorem rLE_of_rational_strict_lower_imp {x y : RBOMA}
    (h : ∀ q : QBOMA, rLT (rOfQ q) x → rLT (rOfQ q) y) :
    rLE x y := by
  rcases rLE_total_classical x y with hxy | hyx
  · exact hxy
  · by_cases hxy : rLE x y
    · exact hxy
    · have hyxNe : y ≠ x := by
        intro hEq
        apply hxy
        rw [hEq]
        exact rLE_refl x
      have hyxStrict : rLT y x := ⟨hyx, hyxNe⟩
      rcases r_rational_image_dense hyxStrict with ⟨q, hyq, hqx⟩
      have hqy : rLT (rOfQ q) y := h q hqx
      exact False.elim (hyq.2 (rLE_antisymm hyq.1 hqy.1))

/-- Accepted Dedekind reals are equal when they have the same strict rational
    lower envelope. -/
theorem r_eq_of_rational_strict_lower_iff {x y : RBOMA}
    (h : ∀ q : QBOMA,
      rLT (rOfQ q) x ↔ rLT (rOfQ q) y) :
    x = y := by
  apply rLE_antisymm
  · apply rLE_of_rational_strict_lower_imp
    intro q hqx
    exact (h q).1 hqx
  · apply rLE_of_rational_strict_lower_imp
    intro q hqy
    exact (h q).2 hqy

/-- Strict rational lower bounds coincide for the image of a Cauchy sum and
    the accepted Dedekind sum of the two images. -/
theorem cToD_add_rational_strict_iff
    (q : QBOMA) (x y : RCBOMA) :
    rLT (rOfQ q) (cToD (rCAdd x y)) ↔
      rLT (rOfQ q) (rAdd (cToD x) (cToD y)) := by
  constructor
  · intro h
    have hCsum : rCLT (rCOfQ q) (rCAdd x y) :=
      (cToD_rational_strict_iff).1 h
    rcases (rC_rational_strict_below_add_iff).1 hCsum with
      ⟨a, b, hax, hby, hq⟩
    apply (r_rational_strict_below_add_iff).2
    exact ⟨a, b,
      (cToD_rational_strict_iff).2 hax,
      (cToD_rational_strict_iff).2 hby,
      hq⟩
  · intro h
    rcases (r_rational_strict_below_add_iff).1 h with
      ⟨a, b, hax, hby, hq⟩
    apply (cToD_rational_strict_iff).2
    apply (rC_rational_strict_below_add_iff).2
    exact ⟨a, b,
      (cToD_rational_strict_iff).1 hax,
      (cToD_rational_strict_iff).1 hby,
      hq⟩

/-- The explicit H5 order isomorphism preserves addition. -/
theorem cToD_add (x y : RCBOMA) :
    cToD (rCAdd x y) = rAdd (cToD x) (cToD y) := by
  apply r_eq_of_rational_strict_lower_iff
  intro q
  exact cToD_add_rational_strict_iff q x y

/-- The reverse H5 map preserves addition. -/
theorem dToC_add (x y : RBOMA) :
    dToC (rAdd x y) = rCAdd (dToC x) (dToC y) := by
  have h := congrArg dToC (cToD_add (dToC x) (dToC y))
  rw [dToC_cToD, cToD_dToC, cToD_dToC] at h
  exact h.symm

/-- The forward H5 map preserves additive zero. -/
theorem cToD_zero : cToD rCZero = rZero := by
  change cToD (rCOfQ qZero) = rOfQ qZero
  exact cToD_rational qZero

/-- The reverse H5 map preserves additive zero. -/
theorem dToC_zero : dToC rZero = rCZero := by
  change dToC (rOfQ qZero) = rCOfQ qZero
  exact dToC_rational qZero

/-- Addition preservation plus uniqueness of additive inverse forces forward
    preservation of negation. -/
theorem cToD_neg (x : RCBOMA) :
    cToD (rCNeg x) = rNeg (cToD x) := by
  apply rAdd_inverse_unique (x := cToD x)
  have h := cToD_add x (rCNeg x)
  rw [rCAdd_neg_right, cToD_zero] at h
  exact h.symm

/-- The reverse H5 map preserves negation as well. -/
theorem dToC_neg (x : RBOMA) :
    dToC (rNeg x) = rCNeg (dToC x) := by
  have h := congrArg dToC (cToD_neg (dToC x))
  rw [dToC_cToD, cToD_dToC] at h
  exact h.symm

/-- Machine-checkable additive-group preservation milestone.  Multiplication
    and field inverses are intentionally absent. -/
structure DedekindCauchyAdditivePreservationCertificate where
  orderIso : DedekindCauchyOrderIsomorphismCertificate
  forwardAdd : ∀ x y : RCBOMA,
    cToD (rCAdd x y) = rAdd (cToD x) (cToD y)
  reverseAdd : ∀ x y : RBOMA,
    dToC (rAdd x y) = rCAdd (dToC x) (dToC y)
  forwardZero : cToD rCZero = rZero
  reverseZero : dToC rZero = rCZero
  forwardNeg : ∀ x : RCBOMA, cToD (rCNeg x) = rNeg (cToD x)
  reverseNeg : ∀ x : RBOMA, dToC (rNeg x) = rCNeg (dToC x)

noncomputable def dedekindCauchyAdditivePreservationCertificate :
    DedekindCauchyAdditivePreservationCertificate where
  orderIso := dedekindCauchyOrderIsomorphismCertificate
  forwardAdd := cToD_add
  reverseAdd := dToC_add
  forwardZero := cToD_zero
  reverseZero := dToC_zero
  forwardNeg := cToD_neg
  reverseNeg := dToC_neg

end BOMA.R.StageTwo.DedekindCauchyComparison003
