/- ST2-EXP-003 H4 prerequisite: rational bracketing of a nonempty bounded
   family in the independently constructed Cauchy carrier. For every positive
   rational step delta, find adjacent embedded rationals b and b+delta such
   that b is not an upper bound while b+delta is an upper bound.

   This source uses only the independent Cauchy route plus shared rational
   Archimedean scaling. It does not import the selected Dedekind carrier. -/
namespace BOMA.R.StageTwo.CauchyLUBBracket003

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001
open BOMA.NArithmetic.Order001
open BOMA.Q.Quotient001
open BOMA.Q.Embedding001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.QArchimedeanScaling001
open BOMA.R.CauchyProbe001
open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyAdditive003
open BOMA.R.StageTwo.CauchyOrderCore003
open BOMA.R.StageTwo.CauchyOrderTotal003
open BOMA.R.StageTwo.CauchyOrderedRing003
open BOMA.R.StageTwo.CauchyCompletionCore003
open BOMA.R.StageTwo.CauchyDensity003

/-- The exact H4 upper-bound predicate on the research Cauchy carrier. -/
def RCUpperBound (F : RCBOMA → Prop) (U : RCBOMA) : Prop :=
  ∀ x : RCBOMA, F x → rCLE x U

/-- Strict order derived from the already verified quotient partial order. -/
def rCLT (x y : RCBOMA) : Prop := rCLE x y ∧ x ≠ y

/-- Embedded rational strict order is preserved exactly. -/
theorem rCOfQ_strict {q r : QBOMA} (h : qLT q r) :
    rCLT (rCOfQ q) (rCOfQ r) := by
  refine ⟨(rCOfQ_order q r).2 h.1, ?_⟩
  intro heq
  exact h.2 (rCOfQ_injective heq)

/-- Strict/non-strict transitivity on the research quotient. -/
theorem rclt_trans_le {x y z : RCBOMA}
    (hxy : rCLT x y) (hyz : rCLE y z) : rCLT x z := by
  refine ⟨rcle_trans hxy.1 hyz, ?_⟩
  intro hxz
  have hyx : rCLE y x := by
    rw [hxz]
    exact hyz
  exact hxy.2 (rcle_antisymm hxy.1 hyx)

/-- Non-strict/strict transitivity on the research quotient. -/
theorem rcle_trans_lt {x y z : RCBOMA}
    (hxy : rCLE x y) (hyz : rCLT y z) : rCLT x z := by
  refine ⟨rcle_trans hxy hyz.1, ?_⟩
  intro hxz
  have zleY : rCLE z y := by
    rw [← hxz]
    exact hxy
  exact hyz.2 (rcle_antisymm hyz.1 zleY)

/-- Zero is also a right additive identity on the quotient. -/
theorem rCAdd_zero_right (x : RCBOMA) : rCAdd x rCZero = x := by
  calc
    rCAdd x rCZero = rCAdd rCZero x := rCAdd_comm x rCZero
    _ = x := rCAdd_zero_left x

/-- An upper bound remains an upper bound when enlarged. -/
theorem rcUpperBound_mono {F : RCBOMA → Prop} {U V : RCBOMA}
    (hU : RCUpperBound F U) (hUV : rCLE U V) : RCUpperBound F V := by
  intro x hx
  exact rcle_trans (hU x hx) hUV

/-- Failure of the upper-bound property has an explicit family witness.
    This is proposition-level classical witness extraction, not data used to
    define the later limit sequence. -/
theorem not_rcUpperBound_witness {F : RCBOMA → Prop} {U : RCBOMA}
    (hnot : ¬ RCUpperBound F U) :
    ∃ x : RCBOMA, F x ∧ ¬ rCLE x U := by
  classical
  by_cases hex : ∃ x : RCBOMA, F x ∧ ¬ rCLE x U
  · exact hex
  · have hUB : RCUpperBound F U := by
      intro x hx
      by_cases hle : rCLE x U
      · exact hle
      · exact False.elim (hex ⟨x, hx, hle⟩)
    exact False.elim (hnot hUB)

/-- Subtracting one positive rational step from an endpoint is strictly lower. -/
theorem q_sub_step_lt (q delta : QBOMA) (hdelta : qPos delta) :
    qLT (qAdd (qAdd q (qNeg delta)) (qNeg delta))
      (qAdd q (qNeg delta)) := by
  have hneg : qLT (qNeg delta) qZero := by
    have ht := qlt_add_right hdelta (qNeg delta)
    rw [qAdd_zero_left, qAdd_neg_right] at ht
    exact ht
  have ht := qlt_add_right hneg (qAdd q (qNeg delta))
  have hleft :
      qAdd (qNeg delta) (qAdd q (qNeg delta)) =
        qAdd (qAdd q (qNeg delta)) (qNeg delta) := by
    exact qAdd_comm (qNeg delta) (qAdd q (qNeg delta))
  rw [hleft, qAdd_zero_left] at ht
  exact ht

/-- Density gives a rational strictly below any quotient point. -/
theorem rational_strict_lower_exists (x : RCBOMA) (delta : QBOMA)
    (hdelta : qPos delta) :
    ∃ a : QBOMA, rCLT (rCOfQ a) x := by
  rcases rational_approximation_exists x delta hdelta with ⟨q, hq⟩
  let y : QBOMA := qAdd q (qNeg delta)
  let a : QBOMA := qAdd y (qNeg delta)
  have htranslated := rcle_add_right hq.2 (rCOfQ (qNeg delta))
  have hyx : rCLE (rCOfQ y) x := by
    have hleft :
        rCAdd (rCOfQ q) (rCOfQ (qNeg delta)) = rCOfQ y := by
      unfold y
      exact rCOfQ_add q (qNeg delta)
    have hright :
        rCAdd (rCAdd x (rCOfQ delta)) (rCOfQ (qNeg delta)) = x := by
      calc
        rCAdd (rCAdd x (rCOfQ delta)) (rCOfQ (qNeg delta)) =
            rCAdd x (rCAdd (rCOfQ delta) (rCOfQ (qNeg delta))) :=
          rCAdd_assoc x (rCOfQ delta) (rCOfQ (qNeg delta))
        _ = rCAdd x (rCOfQ (qAdd delta (qNeg delta))) := by
          rw [rCOfQ_add]
        _ = rCAdd x rCZero := by rw [qAdd_neg_right]
        _ = x := rCAdd_zero_right x
    rw [hleft, hright] at htranslated
    exact htranslated
  refine ⟨a, ?_⟩
  apply rclt_trans_le (rCOfQ_strict (q_sub_step_lt q delta hdelta))
  exact hyx

/-- Density also gives a rational endpoint above any quotient point. -/
theorem rational_upper_exists (x : RCBOMA) (delta : QBOMA)
    (hdelta : qPos delta) :
    ∃ b : QBOMA, rCLE x (rCOfQ b) := by
  rcases rational_approximation_exists x delta hdelta with ⟨q, hq⟩
  refine ⟨qAdd q delta, ?_⟩
  have h := hq.1
  rw [rCOfQ_add] at h
  exact h

/-- A nonempty family has a rational point which is not an upper bound. -/
theorem family_rational_nonupper_exists
    (F : RCBOMA → Prop) (hne : ∃ x : RCBOMA, F x)
    (delta : QBOMA) (hdelta : qPos delta) :
    ∃ a : QBOMA, ¬ RCUpperBound F (rCOfQ a) := by
  rcases hne with ⟨x, hx⟩
  rcases rational_strict_lower_exists x delta hdelta with ⟨a, hax⟩
  refine ⟨a, ?_⟩
  intro hUB
  have hxa := hUB x hx
  exact hax.2 (rcle_antisymm hax.1 hxa)

/-- An explicit quotient upper bound can be enlarged to an embedded rational
    upper bound. -/
theorem family_rational_upper_exists
    (F : RCBOMA → Prop) (U : RCBOMA) (hUB : RCUpperBound F U)
    (delta : QBOMA) (hdelta : qPos delta) :
    ∃ u : QBOMA, RCUpperBound F (rCOfQ u) := by
  rcases rational_upper_exists U delta hdelta with ⟨u, hUu⟩
  exact ⟨u, rcUpperBound_mono hUB hUu⟩

/-- Route-independent rational grid used only for H4 bracketing. -/
def h4Grid (a delta : QBOMA) (n : BOMANat) : QBOMA :=
  qAdd a (qMul (qOfN n) delta)

@[simp] theorem h4Grid_zero (a delta : QBOMA) : h4Grid a delta z = a := by
  unfold h4Grid
  rw [qOfN_zero, qMul_zero_left, qAdd_zero_right]

/-- Advancing the natural index advances by exactly one rational step. -/
theorem h4Grid_succ (a delta : QBOMA) (n : BOMANat) :
    h4Grid a delta (s n) = qAdd (h4Grid a delta n) delta := by
  unfold h4Grid
  have hsucc : qOfN (s n) = qAdd (qOfN n) qOne := by
    have h := qOfN_add n (s z)
    simpa using h
  rw [hsucc, qMul_add_left, qMul_one_left]
  exact (qAdd_assoc a (qMul (qOfN n) delta) delta).symm

/-- A rational translated-gap bound places the endpoint below the grid point. -/
theorem qle_h4Grid_of_gap_bound {a u delta : QBOMA} {n : BOMANat}
    (h : qLE (qAdd u (qNeg a)) (qMul (qOfN n) delta)) :
    qLE u (h4Grid a delta n) := by
  have ht := qadd_mono_right h a
  have hleft : qAdd (qAdd u (qNeg a)) a = u := by
    calc
      qAdd (qAdd u (qNeg a)) a = qAdd u (qAdd (qNeg a) a) :=
        qAdd_assoc u (qNeg a) a
      _ = qAdd u qZero := by rw [qAdd_neg_left]
      _ = u := qAdd_zero_right u
  have hright : qAdd (qMul (qOfN n) delta) a = h4Grid a delta n := by
    unfold h4Grid
    exact qAdd_comm (qMul (qOfN n) delta) a
  rw [hleft, hright] at ht
  exact ht

/-- A rational grid eventually reaches an upper bound already known at a
    rational endpoint. -/
theorem h4Grid_eventually_upper
    (F : RCBOMA → Prop) (a u delta : QBOMA)
    (hu : RCUpperBound F (rCOfQ u)) (hdelta : qPos delta) :
    ∃ n : BOMANat, RCUpperBound F (rCOfQ (h4Grid a delta n)) := by
  rcases q_archimedean_scale (qAdd u (qNeg a)) delta hdelta with ⟨n, hn⟩
  have hugrid : qLE u (h4Grid a delta n) := qle_h4Grid_of_gap_bound hn
  exact ⟨n, rcUpperBound_mono hu ((rCOfQ_order _ _).2 hugrid)⟩

/-- Finite classical search for the first upper-bound grid point. -/
theorem h4Grid_first_upper
    (F : RCBOMA → Prop) (a delta : QBOMA)
    (ha : ¬ RCUpperBound F (rCOfQ a)) :
    ∀ n : BOMANat,
      RCUpperBound F (rCOfQ (h4Grid a delta n)) →
      ∃ b r : QBOMA,
        ¬ RCUpperBound F (rCOfQ b) ∧
        RCUpperBound F (rCOfQ r) ∧
        r = qAdd b delta := by
  intro n
  induction n with
  | z =>
      intro hupper
      have hbase : RCUpperBound F (rCOfQ a) := by
        simpa using hupper
      exact False.elim (ha hbase)
  | s n ih =>
      intro hupper
      rcases Classical.em (RCUpperBound F (rCOfQ (h4Grid a delta n))) with hprev | hprev
      · exact ih hprev
      · refine ⟨h4Grid a delta n, h4Grid a delta (s n), hprev, hupper, ?_⟩
        exact h4Grid_succ a delta n

/-- For every positive rational step there is an adjacent rational bracket
    straddling the family upper-bound frontier. -/
theorem rational_lub_bracket_exists
    (F : RCBOMA → Prop)
    (hne : ∃ x : RCBOMA, F x)
    (U : RCBOMA) (hUB : RCUpperBound F U)
    (delta : QBOMA) (hdelta : qPos delta) :
    ∃ b r : QBOMA,
      ¬ RCUpperBound F (rCOfQ b) ∧
      RCUpperBound F (rCOfQ r) ∧
      r = qAdd b delta := by
  rcases family_rational_nonupper_exists F hne delta hdelta with ⟨a, ha⟩
  rcases family_rational_upper_exists F U hUB delta hdelta with ⟨u, hu⟩
  rcases h4Grid_eventually_upper F a u delta hu hdelta with ⟨n, hn⟩
  exact h4Grid_first_upper F a delta ha n hn

/-- H4 bracketing certificate. -/
structure CauchyLUBBracketCertificate where
  bracket : ∀ (F : RCBOMA → Prop),
    (∃ x : RCBOMA, F x) →
    ∀ U : RCBOMA, RCUpperBound F U →
    ∀ delta : QBOMA, qPos delta →
      ∃ b r : QBOMA,
        ¬ RCUpperBound F (rCOfQ b) ∧
        RCUpperBound F (rCOfQ r) ∧
        r = qAdd b delta
  completion : BOMA.R.StageTwo.CauchyCompletion003.CauchyCompletionCertificate

theorem cauchyLUBBracketCertificate : CauchyLUBBracketCertificate where
  bracket := rational_lub_bracket_exists
  completion := BOMA.R.StageTwo.CauchyCompletion003.cauchyCompletionCertificate

end BOMA.R.StageTwo.CauchyLUBBracket003
