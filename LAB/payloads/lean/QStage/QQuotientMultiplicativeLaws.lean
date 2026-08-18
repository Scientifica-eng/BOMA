/- Lift the already-proved raw multiplicative laws to formal QBOMA equality. -/
namespace BOMA.Q.Quotient001

open BOMA.Q.Fraction001

@[simp] theorem qMul_zero_left (x : QBOMA) : qMul qZero x = qZero := by
  refine Quotient.inductionOn x ?_
  intro a
  change qmk (rawMul rawZero a) = qmk rawZero
  exact qmk_sound (rawMul_zero_left_equiv a)

@[simp] theorem qMul_zero_right (x : QBOMA) : qMul x qZero = qZero := by
  refine Quotient.inductionOn x ?_
  intro a
  change qmk (rawMul a rawZero) = qmk rawZero
  exact qmk_sound (rawMul_zero_right_equiv a)

@[simp] theorem qMul_one_left (x : QBOMA) : qMul qOne x = x := by
  refine Quotient.inductionOn x ?_
  intro a
  change qmk (rawMul rawOne a) = qmk a
  exact qmk_sound (rawMul_one_left_equiv a)

@[simp] theorem qMul_one_right (x : QBOMA) : qMul x qOne = x := by
  refine Quotient.inductionOn x ?_
  intro a
  change qmk (rawMul a rawOne) = qmk a
  exact qmk_sound (rawMul_one_right_equiv a)

theorem qMul_comm (x y : QBOMA) : qMul x y = qMul y x := by
  refine Quotient.inductionOn x ?_
  intro a
  refine Quotient.inductionOn y ?_
  intro b
  change qmk (rawMul a b) = qmk (rawMul b a)
  exact qmk_sound (rawMul_comm_equiv a b)

theorem qMul_assoc (x y w : QBOMA) :
    qMul (qMul x y) w = qMul x (qMul y w) := by
  refine Quotient.inductionOn x ?_
  intro a
  refine Quotient.inductionOn y ?_
  intro b
  refine Quotient.inductionOn w ?_
  intro c
  change qmk (rawMul (rawMul a b) c) = qmk (rawMul a (rawMul b c))
  exact qmk_sound (rawMul_assoc_equiv a b c)

end BOMA.Q.Quotient001
