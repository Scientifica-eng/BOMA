/- First reusable Archimedean probe for accepted QBOMA: every rational has a natural upper bound. -/
namespace BOMA.R.QArchimedeanUpperBound001

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Order001
open BOMA.Z.Rep001
open BOMA.Z.Rep001.ZSigned
open BOMA.Z.Arithmetic001
open BOMA.Z.Order001
open BOMA.Q.Fraction001
open BOMA.Q.Quotient001
open BOMA.Q.Embedding001
open BOMA.Q.Order001

/-- Every structurally positive rational denominator is at least integer one. -/
theorem denZ_ge_one (d : PosDen) : zLE zone (denZ d) := by
  unfold denZ denNat
  change zLE (embedN (s z)) (embedN (s d.pred))
  exact (embedN_order (s z) (s d.pred)).2
    ((le_s_iff).2 (z_le d.pred))

/-- Every raw fraction lies below a canonically embedded natural.
For a positive numerator, the numerator magnitude itself is enough because
the denominator is at least one. Zero and negative numerators are bounded by 0. -/
theorem rawFrac_le_natural (x : RawFrac) :
    ∃ n : BOMANat, RawLE x (fracOfZ (embedN n)) := by
  cases x with
  | mk num den =>
      cases num with
      | zero =>
          refine ⟨z, ?_⟩
          change zLE (zmul zzero zone) (zmul (embedN z) (denZ den))
          simp
      | neg p =>
          refine ⟨z, ?_⟩
          change zLE (zmul (neg p) zone) (zmul (embedN z) (denZ den))
          rw [zmul_one_right, embedN_zero, zmul_zero_left]
          change True
          exact True.intro
      | pos p =>
          refine ⟨s p, ?_⟩
          change zLE (zmul (pos p) zone)
            (zmul (embedN (s p)) (denZ den))
          rw [zmul_one_right]
          have hnum : NonNeg (embedN (s p)) := by
            unfold NonNeg
            exact (embedN_order z (s p)).2 (z_le (s p))
          have hm := zmul_mono_left_nonneg (denZ_ge_one den) hnum
          rw [zmul_one_right] at hm
          exact hm

/-- Reusable Archimedean upper-bound interface on the accepted quotient rational carrier. -/
theorem q_le_natural_upper (q : QBOMA) :
    ∃ n : BOMANat, qLE q (qOfN n) := by
  refine Quotient.inductionOn q ?_
  intro x
  rcases rawFrac_le_natural x with ⟨n, hn⟩
  refine ⟨n, ?_⟩
  change qLE (qmk x) (qmk (fracOfZ (embedN n)))
  exact (qLE_mk_iff x (fracOfZ (embedN n))).2 hn

end BOMA.R.QArchimedeanUpperBound001
