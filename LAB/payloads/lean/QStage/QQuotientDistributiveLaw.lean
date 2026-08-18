/- Lift verified raw distributivity to formal QBOMA equality. -/
namespace BOMA.Q.Quotient001

open BOMA.Q.Fraction001

/-- Right distributivity on the selected quotient carrier. -/
theorem qMul_add_right (x y w : QBOMA) :
    qMul x (qAdd y w) = qAdd (qMul x y) (qMul x w) := by
  refine Quotient.inductionOn x ?_
  intro a
  refine Quotient.inductionOn y ?_
  intro b
  refine Quotient.inductionOn w ?_
  intro c
  change qmk (rawMul a (rawAdd b c)) =
    qmk (rawAdd (rawMul a b) (rawMul a c))
  exact qmk_sound (rawMul_add_right_equiv a b c)

/-- Left distributivity follows from quotient multiplication commutativity. -/
theorem qMul_add_left (x y w : QBOMA) :
    qMul (qAdd x y) w = qAdd (qMul x w) (qMul y w) := by
  calc
    qMul (qAdd x y) w = qMul w (qAdd x y) := qMul_comm _ _
    _ = qAdd (qMul w x) (qMul w y) := qMul_add_right w x y
    _ = qAdd (qMul x w) (qMul y w) := by
      rw [qMul_comm w x, qMul_comm w y]

end BOMA.Q.Quotient001
