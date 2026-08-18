/- Rational Route F: raw integer fractions with structurally positive natural denominators.
   No quotient carrier is formed in this file. -/
namespace BOMA.Q.Fraction001

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001
open BOMA.NArithmetic.Multiplication001
open BOMA.Z.Rep001
open BOMA.Z.Rep001.ZSigned
open BOMA.Z.Arithmetic001
open BOMA.Q.Gateway001

/-- A denominator is positive by syntax: its natural value is always `s pred`.
This avoids a proof-bearing `d ≠ 0` field and prevents signed-denominator duplication. -/
structure PosDen where
  pred : BOMANat

/-- Positive natural denominator value. -/
def denNat (d : PosDen) : BOMANat := s d.pred

/-- Denominator interpreted in the accepted integer carrier. -/
def denZ (d : PosDen) : ZSigned := embedN (denNat d)

/-- Every structurally positive denominator is nonzero in Z. -/
theorem denZ_ne_zero (d : PosDen) : denZ d ≠ zzero := by
  apply embedN_ne_zero_of_ne
  exact s_ne_z d.pred

/-- Raw valid fraction representation. -/
structure RawFrac where
  num : ZSigned
  den : PosDen

/-- Cross-product representation equivalence. -/
def FracEquiv (x y : RawFrac) : Prop :=
  zmul x.num (denZ y.den) = zmul y.num (denZ x.den)

/-- Swap the last two factors in a triple product. -/
theorem zmul_swap_last (a b c : ZSigned) :
    zmul (zmul a b) c = zmul (zmul a c) b := by
  calc
    zmul (zmul a b) c = zmul a (zmul b c) := zmul_assoc a b c
    _ = zmul a (zmul c b) := congrArg (fun t => zmul a t) (zmul_comm b c)
    _ = zmul (zmul a c) b := (zmul_assoc a c b).symm

theorem frac_refl (x : RawFrac) : FracEquiv x x := rfl

theorem frac_symm {x y : RawFrac} (h : FracEquiv x y) : FracEquiv y x :=
  h.symm

/-- Transitivity is exactly where the pre-rational nonzero cancellation gateway
is consumed. It is not a free property of cross multiplication. -/
theorem frac_trans {x y w : RawFrac}
    (hxy : FracEquiv x y) (hyw : FracEquiv y w) : FracEquiv x w := by
  change zmul x.num (denZ y.den) = zmul y.num (denZ x.den) at hxy
  change zmul y.num (denZ w.den) = zmul w.num (denZ y.den) at hyw
  change zmul x.num (denZ w.den) = zmul w.num (denZ x.den)
  have h1 := congrArg (fun t => zmul t (denZ w.den)) hxy
  have h2 := congrArg (fun t => zmul t (denZ x.den)) hyw
  apply zmul_right_cancel_nonzero (denZ_ne_zero y.den)
  calc
    zmul (zmul x.num (denZ w.den)) (denZ y.den) =
        zmul (zmul x.num (denZ y.den)) (denZ w.den) :=
      (zmul_swap_last x.num (denZ y.den) (denZ w.den)).symm
    _ = zmul (zmul y.num (denZ x.den)) (denZ w.den) := h1
    _ = zmul (zmul y.num (denZ w.den)) (denZ x.den) :=
      zmul_swap_last y.num (denZ x.den) (denZ w.den)
    _ = zmul (zmul w.num (denZ y.den)) (denZ x.den) := h2
    _ = zmul (zmul w.num (denZ x.den)) (denZ y.den) :=
      zmul_swap_last w.num (denZ y.den) (denZ x.den)

/-- Integer embedding into raw fractions uses denominator 1. -/
def oneDen : PosDen := ⟨z⟩

def fracOfZ (a : ZSigned) : RawFrac := ⟨a, oneDen⟩

@[simp] theorem denNat_one : denNat oneDen = s z := rfl
@[simp] theorem denZ_one : denZ oneDen = zone := rfl

/-- The raw-fraction embedding is faithful modulo fraction equivalence. -/
theorem fracOfZ_reflects {a b : ZSigned}
    (h : FracEquiv (fracOfZ a) (fracOfZ b)) : a = b := by
  change zmul a zone = zmul b zone at h
  calc
    a = zmul a zone := (zmul_one_right a).symm
    _ = zmul b zone := h
    _ = b := zmul_one_right b

/-- Exact preservation of equality by the raw-fraction embedding. -/
theorem fracOfZ_preserves {a b : ZSigned} (h : a = b) :
    FracEquiv (fracOfZ a) (fracOfZ b) := by
  cases h
  exact frac_refl _

end BOMA.Q.Fraction001
