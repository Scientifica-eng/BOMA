/- ST2-EXP-003: route-independent rational epsilon algebra for Cauchy identity.
   Only the accepted rational ordered field and shared pre-real gateway are used. -/
namespace BOMA.R.StageTwo.CauchyCloseness003

open BOMA.Q.Quotient001
open BOMA.Q.Inverse001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001

/-- Negation is involutive in the already accepted rational additive group. -/
theorem qNeg_neg (x : QBOMA) : qNeg (qNeg x) = x := by
  symm
  exact qAdd_inverse_unique (x := qNeg x) (y := x) (qAdd_neg_left x)

/-- Reversing a rational difference negates it. -/
theorem qNeg_difference (x y : QBOMA) :
    qNeg (qAdd x (qNeg y)) = qAdd y (qNeg x) := by
  rw [qNeg_add, qNeg_neg, qAdd_comm]

/-- Accepted rational epsilon-closeness is symmetric. -/
theorem qClose_symm {eps x y : QBOMA} (h : qClose eps x y) :
    qClose eps y x := by
  rcases h with ⟨hlower, hupper⟩
  constructor
  · have hrev := qneg_reverses hupper
    rw [qNeg_difference] at hrev
    exact hrev
  · have hrev := qneg_reverses hlower
    rw [qNeg_difference, qNeg_neg] at hrev
    exact hrev

/-- Independent monotonicity in both arguments of rational addition. -/
theorem qAdd_mono {a b c d : QBOMA}
    (hab : qLE a b) (hcd : qLE c d) : qLE (qAdd a c) (qAdd b d) := by
  apply qle_trans (qadd_mono_right hab c)
  have h := qadd_mono_right hcd b
  rw [qAdd_comm c b, qAdd_comm d b] at h
  exact h

/-- Consecutive rational differences add without introducing a metric. -/
theorem q_difference_chain (x y z : QBOMA) :
    qAdd (qAdd x (qNeg y)) (qAdd y (qNeg z)) = qAdd x (qNeg z) := by
  calc
    qAdd (qAdd x (qNeg y)) (qAdd y (qNeg z)) =
        qAdd x (qAdd (qNeg y) (qAdd y (qNeg z))) :=
      qAdd_assoc x (qNeg y) (qAdd y (qNeg z))
    _ = qAdd x (qAdd (qAdd (qNeg y) y) (qNeg z)) := by
      rw [qAdd_assoc]
    _ = qAdd x (qAdd qZero (qNeg z)) := by rw [qAdd_neg_left]
    _ = qAdd x (qNeg z) := by rw [qAdd_zero_left]

/-- The epsilon triangle inequality stated using only accepted rational order. -/
theorem qClose_triangle {eps delta x y z : QBOMA}
    (hxy : qClose eps x y) (hyz : qClose delta y z) :
    qClose (qAdd eps delta) x z := by
  constructor
  · have h := qAdd_mono hxy.1 hyz.1
    rw [← qNeg_add, q_difference_chain] at h
    exact h
  · have h := qAdd_mono hxy.2 hyz.2
    rw [q_difference_chain] at h
    exact h

/-- Every positive accepted rational has a positive half, with exact sum. -/
theorem positive_half_exists {eps : QBOMA} (heps : qPos eps) :
    ∃ delta : QBOMA, qPos delta ∧ qAdd delta delta = eps := by
  rcases rational_half_exists with ⟨h, hinv, hhpos, _⟩
  have hepsPositive : QPositive eps :=
    ⟨heps.1, fun heq => heps.2 heq.symm⟩
  have hdelta := qlt_mul_left_positive hhpos hepsPositive
  rw [qMul_zero_right] at hdelta
  have hsum : qAdd h h = qOne := by
    calc
      qAdd h h = qAdd (qMul qOne h) (qMul qOne h) := by
        rw [qMul_one_left]
      _ = qMul (qAdd qOne qOne) h :=
        (qMul_add_left qOne qOne h).symm
      _ = qOne := hinv
  refine ⟨qMul eps h, hdelta, ?_⟩
  calc
    qAdd (qMul eps h) (qMul eps h) = qMul eps (qAdd h h) :=
      (qMul_add_right eps h h).symm
    _ = qMul eps qOne := by rw [hsum]
    _ = eps := qMul_one_right eps

/-- Closeness at every positive rational epsilon forces rational equality. -/
theorem qClose_all_positive_reflects {x y : QBOMA}
    (hclose : ∀ eps : QBOMA, qPos eps → qClose eps x y) : x = y := by
  rcases qlt_trichotomy x y with hxy | hxy | hyx
  · have hd := positive_difference_of_lt hxy
    have hdpos : qPos (qAdd y (qNeg x)) :=
      ⟨hd.1, fun heq => hd.2 heq.symm⟩
    rcases positive_half_exists hdpos with ⟨delta, hdelta, hsum⟩
    have hdiff := (qClose_symm (hclose delta hdelta)).2
    have hstrict := qlt_add_right hdelta delta
    rw [qAdd_zero_left, hsum] at hstrict
    exact False.elim (hstrict.2 (qle_antisymm hstrict.1 hdiff))
  · exact hxy
  · have hd := positive_difference_of_lt hyx
    have hdpos : qPos (qAdd x (qNeg y)) :=
      ⟨hd.1, fun heq => hd.2 heq.symm⟩
    rcases positive_half_exists hdpos with ⟨delta, hdelta, hsum⟩
    have hdiff := (hclose delta hdelta).2
    have hstrict := qlt_add_right hdelta delta
    rw [qAdd_zero_left, hsum] at hstrict
    exact False.elim (hstrict.2 (qle_antisymm hstrict.1 hdiff))

end BOMA.R.StageTwo.CauchyCloseness003
