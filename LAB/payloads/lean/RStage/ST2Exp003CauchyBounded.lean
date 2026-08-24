/- ST2-EXP-003: eventual symmetric boundedness of rational Cauchy sequences.
   This is the explicit prerequisite for pointwise multiplication; it does not
   define multiplication or claim an ordered-field completion. -/
namespace BOMA.R.StageTwo.CauchyBounded003

open BOMA.NCore.RB001
open BOMA.NArithmetic.Order001
open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.CauchyProbe001
open BOMA.R.StageTwo.CauchyCloseness003
open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyAdditive003

/-- The selected rational negation fixes zero. -/
theorem qNeg_zero : qNeg qZero = qZero := by
  symm
  exact qAdd_inverse_unique (x := qZero) (y := qZero) (qAdd_zero_left qZero)

/-- A symmetric rational interval with radius `B`. -/
def qAbsBound (B x : QBOMA) : Prop :=
  qLE (qNeg B) x ∧ qLE x B

/-- Adding one to a nonnegative rational produces a positive rational. -/
theorem qNonneg_add_one_positive {B : QBOMA} (hB : qLE qZero B) :
    qPos (qAdd B qOne) := by
  constructor
  · have h := qAdd_mono hB qzero_le_one
    rw [qAdd_zero_left] at h
    exact h
  · intro hzero
    have hstep := qadd_mono_right qzero_le_one B
    rw [qAdd_zero_left, qAdd_comm qOne B, hzero.symm] at hstep
    have hBzero : B = qZero := qle_antisymm hstep hB
    rw [hBzero, qAdd_zero_left] at hzero
    exact qone_ne_zero hzero.symm

/-- A positive radius remains positive after adding one. -/
theorem qAdd_one_positive {B : QBOMA} (hB : qPos B) :
    qPos (qAdd B qOne) :=
  qNonneg_add_one_positive hB.1

/-- Every nonnegative rational lies in a positive symmetric interval. -/
theorem nonnegative_has_positive_bound {a : QBOMA} (ha : qLE qZero a) :
    ∃ B : QBOMA, qPos B ∧ qAbsBound B a := by
  let B := qAdd a qOne
  have hBpos : qPos B := qNonneg_add_one_positive ha
  refine ⟨B, hBpos, ?_⟩
  constructor
  · have hneg : qLE (qNeg B) (qNeg qZero) := qneg_reverses hBpos.1
    rw [qNeg_zero] at hneg
    exact qle_trans hneg ha
  · have h := qadd_mono_right qzero_le_one a
    rw [qAdd_zero_left, qAdd_comm qOne a] at h
    exact h

/-- Every rational admits a positive symmetric interval. -/
theorem rational_has_positive_bound (a : QBOMA) :
    ∃ B : QBOMA, qPos B ∧ qAbsBound B a := by
  rcases qle_total qZero a with ha | ha
  · exact nonnegative_has_positive_bound ha
  · have hnega : qLE qZero (qNeg a) := by
      have h := qneg_reverses ha
      rw [qNeg_zero] at h
      exact h
    rcases nonnegative_has_positive_bound hnega with ⟨B, hB, hlower, hupper⟩
    refine ⟨B, hB, ?_⟩
    constructor
    · simpa only [qNeg_neg] using qneg_reverses hupper
    · simpa only [qNeg_neg] using qneg_reverses hlower

/-- Translating a rational difference back by its right endpoint cancels it. -/
theorem q_difference_cancel_right (x a : QBOMA) :
    qAdd (qAdd x (qNeg a)) a = x := by
  calc
    qAdd (qAdd x (qNeg a)) a = qAdd x (qAdd (qNeg a) a) :=
      qAdd_assoc x (qNeg a) a
    _ = qAdd x qZero := by rw [qAdd_neg_left]
    _ = x := qAdd_zero_right x

/-- One-close to a bounded point is bounded by the radius enlarged by one. -/
theorem qClose_one_expands_bound {B x a : QBOMA}
    (ha : qAbsBound B a) (hclose : qClose qOne x a) :
    qAbsBound (qAdd B qOne) x := by
  constructor
  · have hshift := qadd_mono_right hclose.1 a
    rw [q_difference_cancel_right] at hshift
    have hbase := qadd_mono_right ha.1 (qNeg qOne)
    rw [← qNeg_add, qAdd_comm a (qNeg qOne)] at hbase
    exact qle_trans hbase hshift
  · have hshift := qadd_mono_right hclose.2 a
    rw [q_difference_cancel_right, qAdd_comm qOne a] at hshift
    have hbase := qadd_mono_right ha.2 qOne
    exact qle_trans hshift hbase

/-- Eventual symmetric boundedness, with an explicit positive radius. -/
def EventuallyBounded (u : QSeq) : Prop :=
  ∃ B : QBOMA, qPos B ∧
    ∃ N : BOMANat, ∀ n : BOMANat, LE N n → qAbsBound B (u n)

/-- Every accepted-Q Cauchy sequence is eventually bounded. -/
theorem cauchy_eventually_bounded (u : CauchySeq) : EventuallyBounded u.seq := by
  rcases u.cauchy qOne qzero_lt_one with ⟨N, hN⟩
  rcases rational_has_positive_bound (u.seq N) with ⟨B, hB, hBN⟩
  refine ⟨qAdd B qOne, qAdd_one_positive hB, N, ?_⟩
  intro n hn
  exact qClose_one_expands_bound hBN (hN n N hn (le_refl N))

/-- Independently assembled boundedness milestone, retaining the prior
    additive certificate as an explicit dependency. -/
structure CauchyBoundedCertificate where
  additiveCertificate : CauchyAdditiveCertificate
  eventualBounded : ∀ u : CauchySeq, EventuallyBounded u.seq

theorem cauchyBoundedCertificate : CauchyBoundedCertificate where
  additiveCertificate := cauchyAdditiveCertificate
  eventualBounded := cauchy_eventually_bounded

end BOMA.R.StageTwo.CauchyBounded003
