/- Nonzero rational inverses as unique witnesses, avoiding any Choice commitment. -/
namespace BOMA.Q.Inverse001

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.Z.Rep001
open BOMA.Z.Rep001.ZSigned
open BOMA.Z.Arithmetic001
open BOMA.Q.Gateway001
open BOMA.Q.Fraction001
open BOMA.Q.Quotient001

/-- A raw positive-denominator fraction is equivalent to zero exactly when its
integer numerator is zero. -/
theorem raw_equiv_zero_iff_num_zero (x : RawFrac) :
    FracEquiv x rawZero ↔ x.num = zzero := by
  constructor
  · intro h
    change zmul x.num zone = zmul zzero (denZ x.den) at h
    rw [zmul_one_right, zmul_zero_left] at h
    exact h
  · intro h
    change zmul x.num zone = zmul zzero (denZ x.den)
    rw [h, zmul_zero_left, zmul_zero_left]

/-- Reciprocal raw witness for a positive signed numerator `+(n+1)`. -/
def rawRecipPos (d : PosDen) (n : BOMANat) : RawFrac :=
  ⟨denZ d, ⟨n⟩⟩

/-- Reciprocal raw witness for a negative signed numerator `-(n+1)`. -/
def rawRecipNeg (d : PosDen) (n : BOMANat) : RawFrac :=
  ⟨zneg (denZ d), ⟨n⟩⟩

/-- A positive raw fraction times its reciprocal witness is one modulo FracEquiv. -/
theorem rawMul_recip_pos_equiv_one (d : PosDen) (n : BOMANat) :
    FracEquiv
      (rawMul ⟨pos n, d⟩ (rawRecipPos d n))
      rawOne := by
  change
    zmul (zmul (pos n) (denZ d)) zone =
    zmul zone (denZ (denMul d ⟨n⟩))
  rw [zmul_one_right, zmul_one_left, denZ_mul]
  change zmul (pos n) (denZ d) = zmul (denZ d) (pos n)
  exact zmul_comm _ _

/-- A negative raw fraction times its sign-normalized reciprocal witness is one. -/
theorem rawMul_recip_neg_equiv_one (d : PosDen) (n : BOMANat) :
    FracEquiv
      (rawMul ⟨neg n, d⟩ (rawRecipNeg d n))
      rawOne := by
  change
    zmul (zmul (neg n) (zneg (denZ d))) zone =
    zmul zone (denZ (denMul d ⟨n⟩))
  rw [zmul_one_right, zmul_one_left, denZ_mul]
  change zmul (neg n) (zneg (denZ d)) = zmul (denZ d) (pos n)
  calc
    zmul (neg n) (zneg (denZ d)) =
        zneg (zmul (pos n) (zneg (denZ d))) :=
      zmul_neg_left (pos n) (zneg (denZ d))
    _ = zneg (zneg (zmul (pos n) (denZ d))) :=
      congrArg zneg (zmul_neg_right (pos n) (denZ d))
    _ = zmul (pos n) (denZ d) := zneg_involutive _
    _ = zmul (denZ d) (pos n) := zmul_comm _ _

/-- Quotient-level multiplicative-inverse relation. -/
def QInvRel (q r : QBOMA) : Prop := qMul q r = qOne

/-- Every nonzero quotient rational has an explicitly constructed inverse witness.
The proof eliminates the quotient only into a proposition, so it requires no
representative-choice axiom. -/
theorem q_inverse_exists (q : QBOMA) (hq : q ≠ qZero) :
    ∃ r : QBOMA, QInvRel q r := by
  refine Quotient.inductionOn q ?_ hq
  intro x hx
  have hnum : x.num ≠ zzero := by
    intro hzero
    apply hx
    exact qmk_sound ((raw_equiv_zero_iff_num_zero x).2 hzero)
  cases x with
  | mk num den =>
      cases num with
      | zero => exact False.elim (hnum rfl)
      | pos n =>
          refine ⟨qmk (rawRecipPos den n), ?_⟩
          change qmk (rawMul ⟨pos n, den⟩ (rawRecipPos den n)) = qmk rawOne
          exact qmk_sound (rawMul_recip_pos_equiv_one den n)
      | neg n =>
          refine ⟨qmk (rawRecipNeg den n), ?_⟩
          change qmk (rawMul ⟨neg n, den⟩ (rawRecipNeg den n)) = qmk rawOne
          exact qmk_sound (rawMul_recip_neg_equiv_one den n)

/-- Multiplicative inverse witnesses are unique in the commutative monoid. -/
theorem q_inverse_unique {q r s : QBOMA}
    (hr : QInvRel q r) (hs : QInvRel q s) : r = s := by
  unfold QInvRel at hr hs
  calc
    r = qMul qOne r := (qMul_one_left r).symm
    _ = qMul (qMul q s) r := congrArg (fun t => qMul t r) hs.symm
    _ = qMul q (qMul s r) := qMul_assoc q s r
    _ = qMul q (qMul r s) := congrArg (fun t => qMul q t) (qMul_comm s r)
    _ = qMul (qMul q r) s := (qMul_assoc q r s).symm
    _ = qMul qOne s := congrArg (fun t => qMul t s) hr
    _ = s := qMul_one_left s

/-- QA-09 constructive interface: each nonzero rational has one inverse witness,
and every inverse witness is equal to it. This avoids `∃!` notation and any
Choice-based global selector. -/
theorem q_inverse_exists_unique (q : QBOMA) (hq : q ≠ qZero) :
    ∃ r : QBOMA, QInvRel q r ∧ ∀ s : QBOMA, QInvRel q s → s = r := by
  rcases q_inverse_exists q hq with ⟨r, hr⟩
  refine ⟨r, hr, ?_⟩
  intro s hs
  exact q_inverse_unique hs hr

end BOMA.Q.Inverse001
