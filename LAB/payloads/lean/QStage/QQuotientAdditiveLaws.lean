/- Lift the already-proved raw additive laws to formal QBOMA equality. -/
namespace BOMA.Q.Quotient001

open BOMA.Q.Fraction001

@[simp] theorem qAdd_zero_left (x : QBOMA) : qAdd qZero x = x := by
  refine Quotient.inductionOn x ?_
  intro a
  change qmk (rawAdd rawZero a) = qmk a
  exact qmk_sound (rawAdd_zero_left_equiv a)

@[simp] theorem qAdd_zero_right (x : QBOMA) : qAdd x qZero = x := by
  refine Quotient.inductionOn x ?_
  intro a
  change qmk (rawAdd a rawZero) = qmk a
  exact qmk_sound (rawAdd_zero_right_equiv a)

theorem qAdd_comm (x y : QBOMA) : qAdd x y = qAdd y x := by
  refine Quotient.inductionOn x ?_
  intro a
  refine Quotient.inductionOn y ?_
  intro b
  change qmk (rawAdd a b) = qmk (rawAdd b a)
  exact qmk_sound (rawAdd_comm_equiv a b)

theorem qAdd_assoc (x y w : QBOMA) :
    qAdd (qAdd x y) w = qAdd x (qAdd y w) := by
  refine Quotient.inductionOn x ?_
  intro a
  refine Quotient.inductionOn y ?_
  intro b
  refine Quotient.inductionOn w ?_
  intro c
  change qmk (rawAdd (rawAdd a b) c) = qmk (rawAdd a (rawAdd b c))
  exact qmk_sound (rawAdd_assoc_equiv a b c)

@[simp] theorem qAdd_neg_right (x : QBOMA) : qAdd x (qNeg x) = qZero := by
  refine Quotient.inductionOn x ?_
  intro a
  change qmk (rawAdd a (rawNeg a)) = qmk rawZero
  exact qmk_sound (rawAdd_neg_equiv_zero a)

@[simp] theorem qAdd_neg_left (x : QBOMA) : qAdd (qNeg x) x = qZero := by
  rw [qAdd_comm]
  exact qAdd_neg_right x

end BOMA.Q.Quotient001
