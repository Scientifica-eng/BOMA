/- Multiplicative laws on raw fractions modulo FracEquiv, before quotient lifting. -/
namespace BOMA.Q.Fraction001

open BOMA.Z.Rep001
open BOMA.Z.Rep001.ZSigned
open BOMA.Z.Arithmetic001

/-- Raw zero absorbs multiplication on the left modulo equivalence. -/
theorem rawMul_zero_left_equiv (x : RawFrac) :
    FracEquiv (rawMul rawZero x) rawZero := by
  change
    zmul (zmul zzero x.num) zone =
    zmul zzero (denZ (denMul oneDen x.den))
  rw [zmul_zero_left, zmul_zero_left, zmul_zero_left]

/-- Raw zero absorbs multiplication on the right modulo equivalence. -/
theorem rawMul_zero_right_equiv (x : RawFrac) :
    FracEquiv (rawMul x rawZero) rawZero := by
  change
    zmul (zmul x.num zzero) zone =
    zmul zzero (denZ (denMul x.den oneDen))
  rw [zmul_zero_right, zmul_zero_left, zmul_zero_left]

/-- Raw one is a left multiplicative identity modulo equivalence. -/
theorem rawMul_one_left_equiv (x : RawFrac) :
    FracEquiv (rawMul rawOne x) x := by
  change
    zmul (zmul zone x.num) (denZ x.den) =
    zmul x.num (denZ (denMul oneDen x.den))
  rw [zmul_one_left, denZ_mul, denZ_one, zmul_one_left]

/-- Raw one is a right multiplicative identity modulo equivalence. -/
theorem rawMul_one_right_equiv (x : RawFrac) :
    FracEquiv (rawMul x rawOne) x := by
  change
    zmul (zmul x.num zone) (denZ x.den) =
    zmul x.num (denZ (denMul x.den oneDen))
  rw [zmul_one_right, denZ_mul, denZ_one, zmul_one_right]

/-- Raw multiplication is commutative modulo equivalence. -/
theorem rawMul_comm_equiv (x y : RawFrac) :
    FracEquiv (rawMul x y) (rawMul y x) := by
  change
    zmul (zmul x.num y.num) (denZ (denMul y.den x.den)) =
    zmul (zmul y.num x.num) (denZ (denMul x.den y.den))
  rw [denZ_mul, denZ_mul]
  rw [zmul_comm x.num y.num]
  rw [zmul_comm (denZ y.den) (denZ x.den)]

/-- Raw multiplication is associative modulo equivalence. -/
theorem rawMul_assoc_equiv (x y w : RawFrac) :
    FracEquiv (rawMul (rawMul x y) w) (rawMul x (rawMul y w)) := by
  have hnum :
      zmul (zmul x.num y.num) w.num =
      zmul x.num (zmul y.num w.num) :=
    zmul_assoc x.num y.num w.num
  have hden :
      denZ (denMul (denMul x.den y.den) w.den) =
      denZ (denMul x.den (denMul y.den w.den)) := by
    rw [denZ_mul, denZ_mul, denZ_mul, denZ_mul]
    exact zmul_assoc (denZ x.den) (denZ y.den) (denZ w.den)
  change
    zmul
      (zmul (zmul x.num y.num) w.num)
      (denZ (denMul x.den (denMul y.den w.den))) =
    zmul
      (zmul x.num (zmul y.num w.num))
      (denZ (denMul (denMul x.den y.den) w.den))
  rw [hnum, hden]

end BOMA.Q.Fraction001
