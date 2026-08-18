/- Right distributivity on raw fractions modulo FracEquiv. -/
namespace BOMA.Q.Fraction001

open BOMA.Z.Rep001
open BOMA.Z.Rep001.ZSigned
open BOMA.Z.Arithmetic001

/-- The raw numerator on the expanded side is the left raw numerator multiplied
by the common denominator factor from x. -/
theorem raw_distrib_num_factor (x y w : RawFrac) :
    zadd
      (zmul (zmul x.num y.num) (zmul (denZ x.den) (denZ w.den)))
      (zmul (zmul x.num w.num) (zmul (denZ x.den) (denZ y.den))) =
    zmul (denZ x.den)
      (zmul x.num
        (zadd (zmul y.num (denZ w.den)) (zmul w.num (denZ y.den)))) := by
  calc
    zadd
        (zmul (zmul x.num y.num) (zmul (denZ x.den) (denZ w.den)))
        (zmul (zmul x.num w.num) (zmul (denZ x.den) (denZ y.den))) =
      zadd
        (zmul (zmul x.num (denZ x.den)) (zmul y.num (denZ w.den)))
        (zmul (zmul x.num (denZ x.den)) (zmul w.num (denZ y.den))) := by
      have h1 :=
        zmul4_swap_middle x.num y.num (denZ x.den) (denZ w.den)
      have h2 :=
        zmul4_swap_middle x.num w.num (denZ x.den) (denZ y.den)
      calc
        zadd
            (zmul (zmul x.num y.num) (zmul (denZ x.den) (denZ w.den)))
            (zmul (zmul x.num w.num) (zmul (denZ x.den) (denZ y.den))) =
          zadd
            (zmul (zmul x.num (denZ x.den)) (zmul y.num (denZ w.den)))
            (zmul (zmul x.num w.num) (zmul (denZ x.den) (denZ y.den))) :=
          congrArg
            (fun t => zadd t
              (zmul (zmul x.num w.num) (zmul (denZ x.den) (denZ y.den))))
            h1
        _ = zadd
            (zmul (zmul x.num (denZ x.den)) (zmul y.num (denZ w.den)))
            (zmul (zmul x.num (denZ x.den)) (zmul w.num (denZ y.den))) :=
          congrArg
            (fun t => zadd
              (zmul (zmul x.num (denZ x.den)) (zmul y.num (denZ w.den))) t)
            h2
    _ = zmul (zmul x.num (denZ x.den))
        (zadd (zmul y.num (denZ w.den)) (zmul w.num (denZ y.den))) :=
      (zmul_add_right
        (zmul x.num (denZ x.den))
        (zmul y.num (denZ w.den))
        (zmul w.num (denZ y.den))).symm
    _ = zmul (denZ x.den)
        (zmul x.num
          (zadd (zmul y.num (denZ w.den)) (zmul w.num (denZ y.den)))) := by
      calc
        zmul (zmul x.num (denZ x.den))
            (zadd (zmul y.num (denZ w.den)) (zmul w.num (denZ y.den))) =
          zmul x.num
            (zmul (denZ x.den)
              (zadd (zmul y.num (denZ w.den)) (zmul w.num (denZ y.den)))) :=
          zmul_assoc x.num (denZ x.den) _
        _ = zmul x.num
            (zmul
              (zadd (zmul y.num (denZ w.den)) (zmul w.num (denZ y.den)))
              (denZ x.den)) :=
          congrArg (fun t => zmul x.num t)
            (zmul_comm (denZ x.den)
              (zadd (zmul y.num (denZ w.den)) (zmul w.num (denZ y.den))))
        _ = zmul
            (zmul x.num
              (zadd (zmul y.num (denZ w.den)) (zmul w.num (denZ y.den))))
            (denZ x.den) :=
          (zmul_assoc x.num _ (denZ x.den)).symm
        _ = zmul (denZ x.den)
            (zmul x.num
              (zadd (zmul y.num (denZ w.den)) (zmul w.num (denZ y.den)))) :=
          zmul_comm _ _

/-- The expanded denominator carries the same extra x-denominator factor. -/
theorem raw_distrib_den_factor (x y w : RawFrac) :
    denZ (denMul (denMul x.den y.den) (denMul x.den w.den)) =
    zmul (denZ x.den)
      (denZ (denMul x.den (denMul y.den w.den))) := by
  rw [denZ_mul, denZ_mul, denZ_mul, denZ_mul, denZ_mul]
  calc
    zmul (zmul (denZ x.den) (denZ y.den))
        (zmul (denZ x.den) (denZ w.den)) =
      zmul (zmul (denZ x.den) (denZ x.den))
        (zmul (denZ y.den) (denZ w.den)) :=
      zmul4_swap_middle
        (denZ x.den) (denZ y.den) (denZ x.den) (denZ w.den)
    _ = zmul (denZ x.den)
        (zmul (denZ x.den) (zmul (denZ y.den) (denZ w.den))) :=
      zmul_assoc (denZ x.den) (denZ x.den)
        (zmul (denZ y.den) (denZ w.den))

/-- Raw multiplication distributes over raw addition modulo fraction equivalence. -/
theorem rawMul_add_right_equiv (x y w : RawFrac) :
    FracEquiv
      (rawMul x (rawAdd y w))
      (rawAdd (rawMul x y) (rawMul x w)) := by
  let nL :=
    zmul x.num
      (zadd (zmul y.num (denZ w.den)) (zmul w.num (denZ y.den)))
  let dL := denZ (denMul x.den (denMul y.den w.den))
  let nR :=
    zadd
      (zmul (zmul x.num y.num) (denZ (denMul x.den w.den)))
      (zmul (zmul x.num w.num) (denZ (denMul x.den y.den)))
  let dR := denZ (denMul (denMul x.den y.den) (denMul x.den w.den))

  have hn : nR = zmul (denZ x.den) nL := by
    unfold nR nL
    rw [denZ_mul, denZ_mul]
    exact raw_distrib_num_factor x y w

  have hd : dR = zmul (denZ x.den) dL := by
    unfold dR dL
    exact raw_distrib_den_factor x y w

  change zmul nL dR = zmul nR dL
  rw [hn, hd]
  calc
    zmul nL (zmul (denZ x.den) dL) =
      zmul (zmul nL (denZ x.den)) dL :=
      (zmul_assoc nL (denZ x.den) dL).symm
    _ = zmul (zmul (denZ x.den) nL) dL :=
      congrArg (fun t => zmul t dL) (zmul_comm nL (denZ x.den))

end BOMA.Q.Fraction001
