/- Additive laws on raw fractions modulo FracEquiv, before quotient lifting. -/
namespace BOMA.Q.Fraction001

open BOMA.Z.Rep001
open BOMA.Z.Rep001.ZSigned
open BOMA.Z.Arithmetic001

/-- Raw zero is a left additive identity modulo fraction equivalence. -/
theorem rawAdd_zero_left_equiv (x : RawFrac) :
    FracEquiv (rawAdd rawZero x) x := by
  change
    zmul
      (zadd (zmul zzero (denZ x.den)) (zmul x.num zone))
      (denZ x.den) =
    zmul x.num (denZ (denMul oneDen x.den))
  rw [zmul_zero_left, zmul_one_right, zadd_zero_left, denZ_mul, denZ_one, zmul_one_left]

/-- Raw zero is a right identity modulo equivalence. -/
theorem rawAdd_zero_right_equiv (x : RawFrac) :
    FracEquiv (rawAdd x rawZero) x := by
  change
    zmul
      (zadd (zmul x.num zone) (zmul zzero (denZ x.den)))
      (denZ x.den) =
    zmul x.num (denZ (denMul x.den oneDen))
  rw [zmul_one_right, zmul_zero_left, zadd_zero_right, denZ_mul, denZ_one, zmul_one_right]

/-- Raw addition is commutative modulo equivalence. -/
theorem rawAdd_comm_equiv (x y : RawFrac) :
    FracEquiv (rawAdd x y) (rawAdd y x) := by
  change
    zmul
      (zadd (zmul x.num (denZ y.den)) (zmul y.num (denZ x.den)))
      (denZ (denMul y.den x.den)) =
    zmul
      (zadd (zmul y.num (denZ x.den)) (zmul x.num (denZ y.den)))
      (denZ (denMul x.den y.den))
  rw [denZ_mul, denZ_mul]
  rw [zadd_comm (zmul x.num (denZ y.den)) (zmul y.num (denZ x.den))]
  rw [zmul_comm (denZ y.den) (denZ x.den)]

/-- Raw addition is associative modulo equivalence. -/
theorem rawAdd_assoc_equiv (x y w : RawFrac) :
    FracEquiv (rawAdd (rawAdd x y) w) (rawAdd x (rawAdd y w)) := by
  have hnum :
      zadd
        (zmul
          (zadd (zmul x.num (denZ y.den)) (zmul y.num (denZ x.den)))
          (denZ w.den))
        (zmul w.num (zmul (denZ x.den) (denZ y.den))) =
      zadd
        (zmul x.num (zmul (denZ y.den) (denZ w.den)))
        (zmul
          (zadd (zmul y.num (denZ w.den)) (zmul w.num (denZ y.den)))
          (denZ x.den)) := by
    calc
      zadd
          (zmul
            (zadd (zmul x.num (denZ y.den)) (zmul y.num (denZ x.den)))
            (denZ w.den))
          (zmul w.num (zmul (denZ x.den) (denZ y.den))) =
        zadd
          (zadd
            (zmul (zmul x.num (denZ y.den)) (denZ w.den))
            (zmul (zmul y.num (denZ x.den)) (denZ w.den)))
          (zmul w.num (zmul (denZ x.den) (denZ y.den))) :=
        congrArg
          (fun t => zadd t (zmul w.num (zmul (denZ x.den) (denZ y.den))))
          (zmul_add_left
            (zmul x.num (denZ y.den))
            (zmul y.num (denZ x.den))
            (denZ w.den))
      _ = zadd
          (zadd
            (zmul x.num (zmul (denZ y.den) (denZ w.den)))
            (zmul (zmul y.num (denZ w.den)) (denZ x.den)))
          (zmul (zmul w.num (denZ y.den)) (denZ x.den)) := by
        rw [zmul_assoc]
        rw [zmul_swap_last y.num (denZ x.den) (denZ w.den)]
        rw [← zmul_assoc w.num (denZ y.den) (denZ x.den)]
        rw [zmul_swap_last w.num (denZ x.den) (denZ y.den)]
      _ = zadd
          (zmul x.num (zmul (denZ y.den) (denZ w.den)))
          (zadd
            (zmul (zmul y.num (denZ w.den)) (denZ x.den))
            (zmul (zmul w.num (denZ y.den)) (denZ x.den))) :=
        zadd_assoc
          (zmul x.num (zmul (denZ y.den) (denZ w.den)))
          (zmul (zmul y.num (denZ w.den)) (denZ x.den))
          (zmul (zmul w.num (denZ y.den)) (denZ x.den))
      _ = zadd
          (zmul x.num (zmul (denZ y.den) (denZ w.den)))
          (zmul
            (zadd (zmul y.num (denZ w.den)) (zmul w.num (denZ y.den)))
            (denZ x.den)) := by
        rw [zmul_add_left]

  have hden :
      denZ (denMul (denMul x.den y.den) w.den) =
      denZ (denMul x.den (denMul y.den w.den)) := by
    rw [denZ_mul, denZ_mul, denZ_mul, denZ_mul]
    exact zmul_assoc (denZ x.den) (denZ y.den) (denZ w.den)

  change
    zmul
      (zadd
        (zmul
          (zadd (zmul x.num (denZ y.den)) (zmul y.num (denZ x.den)))
          (denZ w.den))
        (zmul w.num (denZ (denMul x.den y.den))))
      (denZ (denMul x.den (denMul y.den w.den))) =
    zmul
      (zadd
        (zmul x.num (denZ (denMul y.den w.den)))
        (zmul
          (zadd (zmul y.num (denZ w.den)) (zmul w.num (denZ y.den)))
          (denZ x.den)))
      (denZ (denMul (denMul x.den y.den) w.den))
  rw [denZ_mul, denZ_mul]
  rw [hnum, hden]

/-- Raw negation supplies additive inverse modulo equivalence. -/
theorem rawAdd_neg_equiv_zero (x : RawFrac) :
    FracEquiv (rawAdd x (rawNeg x)) rawZero := by
  change
    zmul
      (zadd
        (zmul x.num (denZ x.den))
        (zmul (zneg x.num) (denZ x.den)))
      zone =
    zmul zzero (denZ (denMul x.den x.den))
  rw [BOMA.Q.Gateway001.zmul_neg_left]
  rw [← zadd_neg_right (zmul x.num (denZ x.den))]
  rw [zmul_zero_left, zmul_zero_left]

end BOMA.Q.Fraction001
