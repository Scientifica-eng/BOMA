/- Preservation laws for the accepted Z embedding into the rational quotient carrier. -/
namespace BOMA.Q.Embedding001

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.Z.Rep001
open BOMA.Z.Rep001.ZSigned
open BOMA.Z.Arithmetic001
open BOMA.Q.Fraction001
open BOMA.Q.Quotient001

@[simp] theorem qOfZ_zero : qOfZ zzero = qZero := rfl

@[simp] theorem qOfZ_one : qOfZ zone = qOne := rfl

/-- Integer negation is preserved exactly by the quotient embedding. -/
theorem qOfZ_neg (a : ZSigned) : qOfZ (zneg a) = qNeg (qOfZ a) := by
  rfl

/-- Integer addition is preserved by the rational embedding. -/
theorem qOfZ_add (a b : ZSigned) :
    qOfZ (zadd a b) = qAdd (qOfZ a) (qOfZ b) := by
  apply qmk_sound
  change
    zmul (zadd a b) (denZ (denMul oneDen oneDen)) =
    zmul (zadd (zmul a zone) (zmul b zone)) zone
  rw [denZ_mul, denZ_one, zmul_one_left, zmul_one_right]
  rw [zmul_one_right, zmul_one_right]

/-- Integer multiplication is preserved by the rational embedding. -/
theorem qOfZ_mul (a b : ZSigned) :
    qOfZ (zmul a b) = qMul (qOfZ a) (qOfZ b) := by
  apply qmk_sound
  change
    zmul (zmul a b) (denZ (denMul oneDen oneDen)) =
    zmul (zmul a b) zone
  rw [denZ_mul, denZ_one, zmul_one_left, zmul_one_right]

/-- The only Stage-One natural embedding into Q is the documented composition
N_BOMA -> Z_BOMA -> QBOMA. -/
def qOfN (n : BOMANat) : QBOMA := qOfZ (embedN n)

/-- Coherence with the direct fraction spelling `n/1`. -/
theorem qOfN_fraction (n : BOMANat) :
    qOfN n = qmk (fracOfZ (embedN n)) := rfl

@[simp] theorem qOfN_zero : qOfN z = qZero := rfl

@[simp] theorem qOfN_one : qOfN (s z) = qOne := rfl

/-- The composed natural embedding preserves accepted natural addition. -/
theorem qOfN_add (a b : BOMANat) :
    qOfN (BOMA.NArithmetic.Addition001.add a b) =
    qAdd (qOfN a) (qOfN b) := by
  unfold qOfN
  rw [BOMA.Z.Arithmetic001.embedN_add]
  exact qOfZ_add (embedN a) (embedN b)

/-- The composed natural embedding preserves accepted natural multiplication. -/
theorem qOfN_mul (a b : BOMANat) :
    qOfN (BOMA.NArithmetic.Multiplication001.mul a b) =
    qMul (qOfN a) (qOfN b) := by
  unfold qOfN
  rw [BOMA.Z.Arithmetic001.embedN_mul]
  exact qOfZ_mul (embedN a) (embedN b)

end BOMA.Q.Embedding001
