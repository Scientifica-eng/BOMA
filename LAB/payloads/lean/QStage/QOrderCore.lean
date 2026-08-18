/- Stage-One rational order from positive-denominator cross products. -/
namespace BOMA.Q.Order001

open BOMA.Z.Rep001
open BOMA.Z.Arithmetic001
open BOMA.Z.Order001
open BOMA.Q.Gateway001
open BOMA.Q.Fraction001
open BOMA.Q.Quotient001

/-- Every selected rational denominator is nonnegative in accepted Z. -/
theorem denZ_nonneg (d : PosDen) : NonNeg (denZ d) := by
  unfold NonNeg denZ denNat
  exact (embedN_order BOMA.NCore.RB001.BOMANat.z
    (BOMA.NCore.RB001.BOMANat.s d.pred)).2
    (BOMA.NArithmetic.Order001.z_le _)

/-- Multiplication by a nonnegative nonzero integer reflects order. This is the
order analogue of the QG-01 cancellation gateway and is derived rather than
assumed. -/
theorem zmul_order_reflect_right_nonneg_nonzero {x y c : BOMA.Z.Rep001.ZSigned}
    (hcN : NonNeg c) (hc0 : c ≠ zzero)
    (h : zLE (zmul x c) (zmul y c)) : zLE x y := by
  rcases zle_total x y with hxy | hyx
  · exact hxy
  · have hback : zLE (zmul y c) (zmul x c) :=
      zmul_mono_right_nonneg hyx hcN
    have heq : zmul x c = zmul y c := zle_antisymm h hback
    have hxyEq : x = y := zmul_right_cancel_nonzero hc0 heq
    rw [hxyEq]
    exact zle_refl y

/-- Raw cross-product order. Positive denominator syntax fixes orientation. -/
def RawLE (x y : RawFrac) : Prop :=
  zLE (zmul x.num (denZ y.den)) (zmul y.num (denZ x.den))

/-- Changing the left fraction representative preserves raw order. -/
theorem rawLE_respects_left {x x' y : RawFrac}
    (hx : FracEquiv x x') (h : RawLE x y) : RawLE x' y := by
  change zmul x.num (denZ x'.den) =
    zmul x'.num (denZ x.den) at hx
  change zLE (zmul x.num (denZ y.den))
    (zmul y.num (denZ x.den)) at h
  change zLE (zmul x'.num (denZ y.den))
    (zmul y.num (denZ x'.den))
  have hm := zmul_mono_right_nonneg h (denZ_nonneg x'.den)
  have hleft :
      zmul (zmul x.num (denZ y.den)) (denZ x'.den) =
      zmul (zmul x'.num (denZ y.den)) (denZ x.den) := by
    calc
      zmul (zmul x.num (denZ y.den)) (denZ x'.den) =
          zmul (zmul x.num (denZ x'.den)) (denZ y.den) :=
        zmul_swap_last x.num (denZ y.den) (denZ x'.den)
      _ = zmul (zmul x'.num (denZ x.den)) (denZ y.den) :=
        congrArg (fun t => zmul t (denZ y.den)) hx
      _ = zmul (zmul x'.num (denZ y.den)) (denZ x.den) :=
        zmul_swap_last x'.num (denZ x.den) (denZ y.den)
  have hright :
      zmul (zmul y.num (denZ x.den)) (denZ x'.den) =
      zmul (zmul y.num (denZ x'.den)) (denZ x.den) :=
    zmul_swap_last y.num (denZ x.den) (denZ x'.den)
  rw [hleft, hright] at hm
  exact zmul_order_reflect_right_nonneg_nonzero
    (denZ_nonneg x.den) (denZ_ne_zero x.den) hm

/-- Changing the right fraction representative preserves raw order. -/
theorem rawLE_respects_right {x y y' : RawFrac}
    (hy : FracEquiv y y') (h : RawLE x y) : RawLE x y' := by
  change zmul y.num (denZ y'.den) =
    zmul y'.num (denZ y.den) at hy
  change zLE (zmul x.num (denZ y.den))
    (zmul y.num (denZ x.den)) at h
  change zLE (zmul x.num (denZ y'.den))
    (zmul y'.num (denZ x.den))
  have hm := zmul_mono_right_nonneg h (denZ_nonneg y'.den)
  have hleft :
      zmul (zmul x.num (denZ y.den)) (denZ y'.den) =
      zmul (zmul x.num (denZ y'.den)) (denZ y.den) :=
    zmul_swap_last x.num (denZ y.den) (denZ y'.den)
  have hright :
      zmul (zmul y.num (denZ x.den)) (denZ y'.den) =
      zmul (zmul y'.num (denZ x.den)) (denZ y.den) := by
    calc
      zmul (zmul y.num (denZ x.den)) (denZ y'.den) =
          zmul (zmul y.num (denZ y'.den)) (denZ x.den) :=
        zmul_swap_last y.num (denZ x.den) (denZ y'.den)
      _ = zmul (zmul y'.num (denZ y.den)) (denZ x.den) :=
        congrArg (fun t => zmul t (denZ x.den)) hy
      _ = zmul (zmul y'.num (denZ x.den)) (denZ y.den) :=
        zmul_swap_last y'.num (denZ y.den) (denZ x.den)
  rw [hleft, hright] at hm
  exact zmul_order_reflect_right_nonneg_nonzero
    (denZ_nonneg y.den) (denZ_ne_zero y.den) hm

theorem rawLE_respects {x x' y y' : RawFrac}
    (hx : FracEquiv x x') (hy : FracEquiv y y') (h : RawLE x y) :
    RawLE x' y' :=
  rawLE_respects_right hy (rawLE_respects_left hx h)

theorem rawLE_refl (x : RawFrac) : RawLE x x := zle_refl _

theorem rawLE_total (x y : RawFrac) : RawLE x y ∨ RawLE y x :=
  zle_total _ _

/-- Opposite raw inequalities force fraction equivalence. -/
theorem rawLE_antisymm_equiv {x y : RawFrac}
    (hxy : RawLE x y) (hyx : RawLE y x) : FracEquiv x y := by
  exact zle_antisymm hxy hyx

/-- Transitivity uses one positive middle denominator as a cancellable common
factor after multiplying the two cross inequalities. -/
theorem rawLE_trans {x y w : RawFrac}
    (hxy : RawLE x y) (hyw : RawLE y w) : RawLE x w := by
  change zLE (zmul x.num (denZ y.den))
    (zmul y.num (denZ x.den)) at hxy
  change zLE (zmul y.num (denZ w.den))
    (zmul w.num (denZ y.den)) at hyw
  change zLE (zmul x.num (denZ w.den))
    (zmul w.num (denZ x.den))
  have h1 := zmul_mono_right_nonneg hxy (denZ_nonneg w.den)
  have h2 := zmul_mono_right_nonneg hyw (denZ_nonneg x.den)
  rw [zmul_swap_last x.num (denZ y.den) (denZ w.den)] at h1
  rw [zmul_swap_last y.num (denZ x.den) (denZ w.den)] at h1
  rw [zmul_swap_last w.num (denZ y.den) (denZ x.den)] at h2
  have hcommon := zle_trans h1 h2
  exact zmul_order_reflect_right_nonneg_nonzero
    (denZ_nonneg y.den) (denZ_ne_zero y.den) hcommon

/-- Quotient order without proposition extensionality: witnesses are raw
representatives tied by formal quotient equality to the two endpoints. -/
def qLE (q r : QBOMA) : Prop :=
  ∃ x : RawFrac, ∃ y : RawFrac,
    q = qmk x ∧ r = qmk y ∧ RawLE x y

/-- On explicit quotient representatives, qLE is exactly the raw cross order. -/
theorem qLE_mk_iff (x y : RawFrac) :
    qLE (qmk x) (qmk y) ↔ RawLE x y := by
  constructor
  · rintro ⟨x', y', hxq, hyq, hle⟩
    have hx : FracEquiv x x' := (qmk_eq_iff).mp hxq
    have hy : FracEquiv y y' := (qmk_eq_iff).mp hyq
    exact rawLE_respects (frac_symm hx) (frac_symm hy) hle
  · intro h
    exact ⟨x, y, rfl, rfl, h⟩

theorem qle_refl (q : QBOMA) : qLE q q := by
  refine Quotient.inductionOn q ?_
  intro x
  exact (qLE_mk_iff x x).2 (rawLE_refl x)

theorem qle_trans {q r s : QBOMA} (hqr : qLE q r) (hrs : qLE r s) : qLE q s := by
  refine Quotient.inductionOn q ?_ hqr hrs
  intro x hxr hrs'
  refine Quotient.inductionOn r ?_ hxr hrs'
  intro y hxy hys
  refine Quotient.inductionOn s ?_ hxy hys
  intro w hxy' hyw'
  apply (qLE_mk_iff x w).2
  exact rawLE_trans ((qLE_mk_iff x y).1 hxy') ((qLE_mk_iff y w).1 hyw')

theorem qle_antisymm {q r : QBOMA} (hqr : qLE q r) (hrq : qLE r q) : q = r := by
  refine Quotient.inductionOn q ?_ hqr hrq
  intro x hxr hrx
  refine Quotient.inductionOn r ?_ hxr hrx
  intro y hxy hyx
  exact qmk_sound (rawLE_antisymm_equiv
    ((qLE_mk_iff x y).1 hxy) ((qLE_mk_iff y x).1 hyx))

theorem qle_total (q r : QBOMA) : qLE q r ∨ qLE r q := by
  refine Quotient.inductionOn q ?_
  intro x
  refine Quotient.inductionOn r ?_
  intro y
  rcases rawLE_total x y with h | h
  · exact Or.inl ((qLE_mk_iff x y).2 h)
  · exact Or.inr ((qLE_mk_iff y x).2 h)

/-- The rational order exactly extends the accepted integer order. -/
theorem qOfZ_order (a b : BOMA.Z.Rep001.ZSigned) :
    qLE (qOfZ a) (qOfZ b) ↔ zLE a b := by
  change qLE (qmk (fracOfZ a)) (qmk (fracOfZ b)) ↔ zLE a b
  rw [qLE_mk_iff]
  change zLE (zmul a zone) (zmul b zone) ↔ zLE a b
  rw [zmul_one_right, zmul_one_right]

end BOMA.Q.Order001
