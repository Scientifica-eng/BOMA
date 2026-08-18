/- Additive compatibility of the Stage-One rational order. -/
namespace BOMA.Q.OrderedField001

open BOMA.Z.Arithmetic001
open BOMA.Z.Order001
open BOMA.Q.Gateway001
open BOMA.Q.Fraction001
open BOMA.Q.Quotient001
open BOMA.Q.Order001

/-- Additive cancellation in QBOMA. -/
theorem qAdd_left_cancel {a b c : QBOMA}
    (h : qAdd a b = qAdd a c) : b = c := by
  have h' := congrArg (fun t => qAdd (qNeg a) t) h
  calc
    b = qAdd qZero b := (qAdd_zero_left b).symm
    _ = qAdd (qAdd (qNeg a) a) b := by rw [qAdd_neg_left]
    _ = qAdd (qNeg a) (qAdd a b) := qAdd_assoc (qNeg a) a b
    _ = qAdd (qNeg a) (qAdd a c) := h'
    _ = qAdd (qAdd (qNeg a) a) c := (qAdd_assoc (qNeg a) a c).symm
    _ = qAdd qZero c := by rw [qAdd_neg_left]
    _ = c := qAdd_zero_left c

/-- Any additive inverse equals the selected qNeg. -/
theorem qAdd_inverse_unique {x y : QBOMA}
    (h : qAdd x y = qZero) : y = qNeg x := by
  apply qAdd_left_cancel (a := x)
  calc
    qAdd x y = qZero := h
    _ = qAdd x (qNeg x) := (qAdd_neg_right x).symm

/-- Exchange the two middle terms of a four-term additive expression. -/
theorem qAdd_exchange (a b c d : QBOMA) :
    qAdd a (qAdd b (qAdd c d)) =
    qAdd a (qAdd c (qAdd b d)) := by
  apply congrArg (fun t => qAdd a t)
  calc
    qAdd b (qAdd c d) = qAdd (qAdd b c) d := (qAdd_assoc b c d).symm
    _ = qAdd (qAdd c b) d := congrArg (fun t => qAdd t d) (qAdd_comm b c)
    _ = qAdd c (qAdd b d) := qAdd_assoc c b d

/-- Negation distributes over addition. -/
theorem qNeg_add (x y : QBOMA) :
    qNeg (qAdd x y) = qAdd (qNeg x) (qNeg y) := by
  symm
  apply qAdd_inverse_unique (x := qAdd x y)
  calc
    qAdd (qAdd x y) (qAdd (qNeg x) (qNeg y)) =
        qAdd x (qAdd y (qAdd (qNeg x) (qNeg y))) :=
      qAdd_assoc x y (qAdd (qNeg x) (qNeg y))
    _ = qAdd x (qAdd (qNeg x) (qAdd y (qNeg y))) :=
      qAdd_exchange x y (qNeg x) (qNeg y)
    _ = qAdd x (qAdd (qNeg x) qZero) := by rw [qAdd_neg_right]
    _ = qAdd x (qNeg x) := by rw [qAdd_zero_right]
    _ = qZero := qAdd_neg_right x

/-- Ordered-additive-group bridge in accepted Z. -/
theorem zle_iff_zero_le_difference (a b : BOMA.Z.Rep001.ZSigned) :
    zLE a b ↔ zLE zzero (zadd b (zneg a)) := by
  constructor
  · intro h
    have ht := zadd_mono_left h (zneg a)
    rw [zadd_neg_left] at ht
    rw [zadd_comm (zneg a) b] at ht
    exact ht
  · intro h
    have ht := zadd_mono_left h a
    rw [zadd_zero_right] at ht
    have hright : zadd a (zadd b (zneg a)) = b := by
      calc
        zadd a (zadd b (zneg a)) = zadd (zadd a b) (zneg a) :=
          (zadd_assoc a b (zneg a)).symm
        _ = zadd (zadd b a) (zneg a) :=
          congrArg (fun t => zadd t (zneg a)) (zadd_comm a b)
        _ = zadd b (zadd a (zneg a)) := zadd_assoc b a (zneg a)
        _ = zadd b zzero := by rw [zadd_neg_right]
        _ = b := zadd_zero_right b
    rw [hright] at ht
    exact ht

/-- On an explicit fraction, nonnegativity is exactly numerator nonnegativity. -/
theorem qNonNeg_mk_iff (x : RawFrac) :
    qLE qZero (qmk x) ↔ zLE zzero x.num := by
  change qLE (qmk rawZero) (qmk x) ↔ zLE zzero x.num
  rw [qLE_mk_iff]
  change
    zLE (zmul zzero (denZ x.den)) (zmul x.num zone) ↔
    zLE zzero x.num
  rw [zmul_zero_left, zmul_one_right]

/-- Rational order is equivalent to nonnegativity of y-x. -/
theorem qle_iff_nonneg_difference (x y : QBOMA) :
    qLE x y ↔ qLE qZero (qAdd y (qNeg x)) := by
  refine Quotient.inductionOn x ?_
  intro a
  refine Quotient.inductionOn y ?_
  intro b
  change qLE (qmk a) (qmk b) ↔
    qLE qZero (qmk (rawAdd b (rawNeg a)))
  rw [qLE_mk_iff, qNonNeg_mk_iff]
  change
    zLE (zmul a.num (denZ b.den)) (zmul b.num (denZ a.den)) ↔
    zLE zzero
      (zadd (zmul b.num (denZ a.den))
        (zmul (zneg a.num) (denZ b.den)))
  rw [BOMA.Q.Gateway001.zmul_neg_left]
  exact zle_iff_zero_le_difference
    (zmul a.num (denZ b.den))
    (zmul b.num (denZ a.den))

/-- Translating both sides by the same rational leaves their difference unchanged. -/
theorem q_difference_translate (x y c : QBOMA) :
    qAdd (qAdd y c) (qNeg (qAdd x c)) = qAdd y (qNeg x) := by
  rw [qNeg_add]
  calc
    qAdd (qAdd y c) (qAdd (qNeg x) (qNeg c)) =
        qAdd y (qAdd c (qAdd (qNeg x) (qNeg c))) :=
      qAdd_assoc y c (qAdd (qNeg x) (qNeg c))
    _ = qAdd y (qAdd (qNeg x) (qAdd c (qNeg c))) :=
      qAdd_exchange y c (qNeg x) (qNeg c)
    _ = qAdd y (qAdd (qNeg x) qZero) := by rw [qAdd_neg_right]
    _ = qAdd y (qNeg x) := by rw [qAdd_zero_right]

/-- Addition monotonicity by a common right translate. -/
theorem qadd_mono_right {x y : QBOMA} (h : qLE x y) (c : QBOMA) :
    qLE (qAdd x c) (qAdd y c) := by
  apply (qle_iff_nonneg_difference (qAdd x c) (qAdd y c)).2
  have hd := (qle_iff_nonneg_difference x y).1 h
  rw [q_difference_translate x y c]
  exact hd

/-- Full addition translation invariance. -/
theorem qadd_translate_iff (x y c : QBOMA) :
    qLE (qAdd x c) (qAdd y c) ↔ qLE x y := by
  constructor
  · intro h
    have hb := qadd_mono_right h (qNeg c)
    have hx : qAdd (qAdd x c) (qNeg c) = x := by
      calc
        qAdd (qAdd x c) (qNeg c) = qAdd x (qAdd c (qNeg c)) :=
          qAdd_assoc x c (qNeg c)
        _ = qAdd x qZero := by rw [qAdd_neg_right]
        _ = x := qAdd_zero_right x
    have hy : qAdd (qAdd y c) (qNeg c) = y := by
      calc
        qAdd (qAdd y c) (qNeg c) = qAdd y (qAdd c (qNeg c)) :=
          qAdd_assoc y c (qNeg c)
        _ = qAdd y qZero := by rw [qAdd_neg_right]
        _ = y := qAdd_zero_right y
    rw [hx, hy] at hb
    exact hb
  · intro h
    exact qadd_mono_right h c

/-- Negation reverses rational order. -/
theorem qneg_reverses {x y : QBOMA} (h : qLE x y) :
    qLE (qNeg y) (qNeg x) := by
  have ht := qadd_mono_right h (qAdd (qNeg x) (qNeg y))
  have hleft : qAdd x (qAdd (qNeg x) (qNeg y)) = qNeg y := by
    calc
      qAdd x (qAdd (qNeg x) (qNeg y)) =
          qAdd (qAdd x (qNeg x)) (qNeg y) :=
        (qAdd_assoc x (qNeg x) (qNeg y)).symm
      _ = qAdd qZero (qNeg y) := by rw [qAdd_neg_right]
      _ = qNeg y := qAdd_zero_left _
  have hright : qAdd y (qAdd (qNeg x) (qNeg y)) = qNeg x := by
    calc
      qAdd y (qAdd (qNeg x) (qNeg y)) =
          qAdd y (qAdd (qNeg y) (qNeg x)) :=
        congrArg (fun t => qAdd y t) (qAdd_comm (qNeg x) (qNeg y))
      _ = qAdd (qAdd y (qNeg y)) (qNeg x) :=
        (qAdd_assoc y (qNeg y) (qNeg x)).symm
      _ = qAdd qZero (qNeg x) := by rw [qAdd_neg_right]
      _ = qNeg x := qAdd_zero_left _
  rw [hleft, hright] at ht
  exact ht

end BOMA.Q.OrderedField001
