/- Arithmetic on raw valid rational fractions, before any quotient identity commitment. -/
namespace BOMA.Q.Fraction001

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001
open BOMA.NArithmetic.Multiplication001
open BOMA.Z.Rep001
open BOMA.Z.Rep001.ZSigned
open BOMA.Z.Arithmetic001

/-- Multiplication of structurally positive denominators remains structurally positive. -/
def denMul (d e : PosDen) : PosDen :=
  ⟨add (mul (s d.pred) e.pred) d.pred⟩

/-- The denominator syntax computes exactly to natural multiplication. -/
theorem denNat_mul (d e : PosDen) :
    denNat (denMul d e) = mul (denNat d) (denNat e) := by
  rfl

/-- Integer interpretation of denominator multiplication. -/
theorem denZ_mul (d e : PosDen) :
    denZ (denMul d e) = zmul (denZ d) (denZ e) := by
  change embedN (denNat (denMul d e)) = zmul (embedN (denNat d)) (embedN (denNat e))
  rw [denNat_mul]
  exact embedN_mul (denNat d) (denNat e)

/-- Raw rational zero and one. -/
def rawZero : RawFrac := fracOfZ zzero
def rawOne : RawFrac := fracOfZ zone

/-- Raw negation. -/
def rawNeg (x : RawFrac) : RawFrac := ⟨zneg x.num, x.den⟩

/-- Standard cross-denominator raw addition. -/
def rawAdd (x y : RawFrac) : RawFrac :=
  ⟨zadd (zmul x.num (denZ y.den))
         (zmul y.num (denZ x.den)),
   denMul x.den y.den⟩

/-- Standard raw multiplication. -/
def rawMul (x y : RawFrac) : RawFrac :=
  ⟨zmul x.num y.num, denMul x.den y.den⟩

/-- Four-factor interchange in the accepted commutative multiplication. -/
theorem zmul4_swap_middle (a b c d : ZSigned) :
    zmul (zmul a b) (zmul c d) =
    zmul (zmul a c) (zmul b d) := by
  calc
    zmul (zmul a b) (zmul c d) = zmul a (zmul b (zmul c d)) :=
      zmul_assoc a b (zmul c d)
    _ = zmul a (zmul (zmul b c) d) :=
      congrArg (fun t => zmul a t) (zmul_assoc b c d).symm
    _ = zmul a (zmul (zmul c b) d) :=
      congrArg (fun t => zmul a (zmul t d)) (zmul_comm b c)
    _ = zmul a (zmul c (zmul b d)) :=
      congrArg (fun t => zmul a t) (zmul_assoc c b d)
    _ = zmul (zmul a c) (zmul b d) :=
      (zmul_assoc a c (zmul b d)).symm

/-- Raw negation respects fraction equivalence. -/
theorem rawNeg_respects {x y : RawFrac} (h : FracEquiv x y) :
    FracEquiv (rawNeg x) (rawNeg y) := by
  change zmul (zneg x.num) (denZ y.den) =
    zmul (zneg y.num) (denZ x.den)
  calc
    zmul (zneg x.num) (denZ y.den) = zneg (zmul x.num (denZ y.den)) :=
      BOMA.Q.Gateway001.zmul_neg_left x.num (denZ y.den)
    _ = zneg (zmul y.num (denZ x.den)) := congrArg zneg h
    _ = zmul (zneg y.num) (denZ x.den) :=
      (BOMA.Q.Gateway001.zmul_neg_left y.num (denZ x.den)).symm

/-- Raw multiplication respects fraction equivalence in both arguments. -/
theorem rawMul_respects {x x' y y' : RawFrac}
    (hx : FracEquiv x x') (hy : FracEquiv y y') :
    FracEquiv (rawMul x y) (rawMul x' y') := by
  change zmul x.num (denZ x'.den) = zmul x'.num (denZ x.den) at hx
  change zmul y.num (denZ y'.den) = zmul y'.num (denZ y.den) at hy
  change
    zmul (zmul x.num y.num) (denZ (denMul x'.den y'.den)) =
    zmul (zmul x'.num y'.num) (denZ (denMul x.den y.den))
  rw [denZ_mul, denZ_mul]
  calc
    zmul (zmul x.num y.num) (zmul (denZ x'.den) (denZ y'.den)) =
        zmul (zmul x.num (denZ x'.den)) (zmul y.num (denZ y'.den)) :=
      zmul4_swap_middle x.num y.num (denZ x'.den) (denZ y'.den)
    _ = zmul (zmul x'.num (denZ x.den)) (zmul y.num (denZ y'.den)) :=
      congrArg (fun t => zmul t (zmul y.num (denZ y'.den))) hx
    _ = zmul (zmul x'.num (denZ x.den)) (zmul y'.num (denZ y.den)) :=
      congrArg (fun t => zmul (zmul x'.num (denZ x.den)) t) hy
    _ = zmul (zmul x'.num y'.num) (zmul (denZ x.den) (denZ y.den)) :=
      (zmul4_swap_middle x'.num (denZ x.den) y'.num (denZ y.den)).symm

/-- First scaled numerator term used in addition well-definedness. -/
theorem rawAdd_term_left {x x' y y' : RawFrac}
    (hx : FracEquiv x x') :
    zmul (zmul x.num (denZ y.den))
      (zmul (denZ x'.den) (denZ y'.den)) =
    zmul (zmul x'.num (denZ y'.den))
      (zmul (denZ x.den) (denZ y.den)) := by
  change zmul x.num (denZ x'.den) = zmul x'.num (denZ x.den) at hx
  calc
    zmul (zmul x.num (denZ y.den))
        (zmul (denZ x'.den) (denZ y'.den)) =
      zmul (zmul x.num (denZ x'.den))
        (zmul (denZ y.den) (denZ y'.den)) :=
      zmul4_swap_middle x.num (denZ y.den) (denZ x'.den) (denZ y'.den)
    _ = zmul (zmul x'.num (denZ x.den))
        (zmul (denZ y.den) (denZ y'.den)) :=
      congrArg (fun t => zmul t (zmul (denZ y.den) (denZ y'.den))) hx
    _ = zmul (zmul x'.num (denZ x.den))
        (zmul (denZ y'.den) (denZ y.den)) :=
      congrArg (fun t => zmul (zmul x'.num (denZ x.den)) t)
        (zmul_comm (denZ y.den) (denZ y'.den))
    _ = zmul (zmul x'.num (denZ y'.den))
        (zmul (denZ x.den) (denZ y.den)) :=
      zmul4_swap_middle x'.num (denZ x.den) (denZ y'.den) (denZ y.den)

/-- Second scaled numerator term used in addition well-definedness. -/
theorem rawAdd_term_right {x x' y y' : RawFrac}
    (hy : FracEquiv y y') :
    zmul (zmul y.num (denZ x.den))
      (zmul (denZ x'.den) (denZ y'.den)) =
    zmul (zmul y'.num (denZ x'.den))
      (zmul (denZ x.den) (denZ y.den)) := by
  change zmul y.num (denZ y'.den) = zmul y'.num (denZ y.den) at hy
  calc
    zmul (zmul y.num (denZ x.den))
        (zmul (denZ x'.den) (denZ y'.den)) =
      zmul (zmul y.num (denZ y'.den))
        (zmul (denZ x.den) (denZ x'.den)) := by
          calc
            zmul (zmul y.num (denZ x.den))
                (zmul (denZ x'.den) (denZ y'.den)) =
              zmul (zmul y.num (denZ y'.den))
                (zmul (denZ x.den) (denZ x'.den)) :=
              zmul4_swap_middle y.num (denZ x.den) (denZ y'.den) (denZ x'.den)
    _ = zmul (zmul y'.num (denZ y.den))
        (zmul (denZ x.den) (denZ x'.den)) :=
      congrArg (fun t => zmul t (zmul (denZ x.den) (denZ x'.den))) hy
    _ = zmul (zmul y'.num (denZ y.den))
        (zmul (denZ x'.den) (denZ x.den)) :=
      congrArg (fun t => zmul (zmul y'.num (denZ y.den)) t)
        (zmul_comm (denZ x.den) (denZ x'.den))
    _ = zmul (zmul y'.num (denZ x'.den))
        (zmul (denZ y.den) (denZ x.den)) :=
      zmul4_swap_middle y'.num (denZ y.den) (denZ x'.den) (denZ x.den)
    _ = zmul (zmul y'.num (denZ x'.den))
        (zmul (denZ x.den) (denZ y.den)) :=
      congrArg (fun t => zmul (zmul y'.num (denZ x'.den)) t)
        (zmul_comm (denZ y.den) (denZ x.den))

/-- Raw addition respects fraction equivalence in both arguments. -/
theorem rawAdd_respects {x x' y y' : RawFrac}
    (hx : FracEquiv x x') (hy : FracEquiv y y') :
    FracEquiv (rawAdd x y) (rawAdd x' y') := by
  change
    zmul
      (zadd (zmul x.num (denZ y.den)) (zmul y.num (denZ x.den)))
      (denZ (denMul x'.den y'.den)) =
    zmul
      (zadd (zmul x'.num (denZ y'.den)) (zmul y'.num (denZ x'.den)))
      (denZ (denMul x.den y.den))
  rw [denZ_mul, denZ_mul]
  calc
    zmul
        (zadd (zmul x.num (denZ y.den)) (zmul y.num (denZ x.den)))
        (zmul (denZ x'.den) (denZ y'.den)) =
      zadd
        (zmul (zmul x.num (denZ y.den))
          (zmul (denZ x'.den) (denZ y'.den)))
        (zmul (zmul y.num (denZ x.den))
          (zmul (denZ x'.den) (denZ y'.den))) :=
      zmul_add_left
        (zmul x.num (denZ y.den))
        (zmul y.num (denZ x.den))
        (zmul (denZ x'.den) (denZ y'.den))
    _ = zadd
        (zmul (zmul x'.num (denZ y'.den))
          (zmul (denZ x.den) (denZ y.den)))
        (zmul (zmul y'.num (denZ x'.den))
          (zmul (denZ x.den) (denZ y.den))) :=
      congrArg₂ zadd (rawAdd_term_left hx) (rawAdd_term_right hy)
    _ = zmul
        (zadd (zmul x'.num (denZ y'.den)) (zmul y'.num (denZ x'.den)))
        (zmul (denZ x.den) (denZ y.den)) :=
      (zmul_add_left
        (zmul x'.num (denZ y'.den))
        (zmul y'.num (denZ x'.den))
        (zmul (denZ x.den) (denZ y.den))).symm

end BOMA.Q.Fraction001
