/- Pre-rational gateway: derive no-zero-divisor and nonzero cancellation
   from the accepted BOMA N/Z packages before fraction equivalence is formed. -/
namespace BOMA.Q.Gateway001

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001
open BOMA.NArithmetic.Multiplication001
open BOMA.Z.Rep001
open BOMA.Z.Rep001.ZSigned
open BOMA.Z.Arithmetic001

/-- A natural sum can be zero only when both summands are zero. -/
theorem n_add_eq_zero {a b : BOMANat} (h : add a b = z) : a = z ∧ b = z := by
  cases b with
  | z =>
      change a = z at h
      exact ⟨h, rfl⟩
  | s b =>
      change s (add a b) = z at h
      exact False.elim (s_ne_z (add a b) h)

/-- No zero divisors for the accepted natural multiplication. -/
theorem n_mul_eq_zero {a b : BOMANat} (h : mul a b = z) : a = z ∨ b = z := by
  cases b with
  | z => exact Or.inr rfl
  | s b =>
      change add (mul a b) a = z at h
      exact Or.inl (n_add_eq_zero h).2

/-- A product of two natural successors is nonzero. -/
theorem n_mul_succ_succ_ne_zero (a b : BOMANat) : mul (s a) (s b) ≠ z := by
  intro h
  rcases n_mul_eq_zero h with ha | hb
  · exact s_ne_z a ha
  · exact s_ne_z b hb

/-- A nonzero natural embeds to a nonzero selected integer. -/
theorem embedN_ne_zero_of_ne {n : BOMANat} (hn : n ≠ z) : embedN n ≠ zzero := by
  cases n with
  | z => exact False.elim (hn rfl)
  | s n =>
      intro h
      cases h

/-- Its signed negation is also nonzero. -/
theorem neg_embedN_ne_zero_of_ne {n : BOMANat} (hn : n ≠ z) :
    zneg (embedN n) ≠ zzero := by
  cases n with
  | z => exact False.elim (hn rfl)
  | s n =>
      intro h
      cases h

/-- Accepted integer multiplication has no zero divisors. -/
theorem zmul_eq_zero {x y : ZSigned} (h : zmul x y = zzero) :
    x = zzero ∨ y = zzero := by
  cases x with
  | zero => exact Or.inl rfl
  | pos a =>
      cases y with
      | zero => exact Or.inr rfl
      | pos b =>
          change embedN (mul (s a) (s b)) = zzero at h
          exact False.elim (embedN_ne_zero_of_ne (n_mul_succ_succ_ne_zero a b) h)
      | neg b =>
          change zneg (embedN (mul (s a) (s b))) = zzero at h
          exact False.elim (neg_embedN_ne_zero_of_ne (n_mul_succ_succ_ne_zero a b) h)
  | neg a =>
      cases y with
      | zero => exact Or.inr rfl
      | pos b =>
          change zneg (embedN (mul (s a) (s b))) = zzero at h
          exact False.elim (neg_embedN_ne_zero_of_ne (n_mul_succ_succ_ne_zero a b) h)
      | neg b =>
          change embedN (mul (s a) (s b)) = zzero at h
          exact False.elim (embedN_ne_zero_of_ne (n_mul_succ_succ_ne_zero a b) h)

/-- Left cancellation in the accepted additive group. -/
theorem zadd_left_cancel {a b c : ZSigned}
    (h : zadd a b = zadd a c) : b = c := by
  have h' := congrArg (fun t => zadd (zneg a) t) h
  calc
    b = zadd zzero b := (zadd_zero_left b).symm
    _ = zadd (zadd (zneg a) a) b := by rw [zadd_neg_left]
    _ = zadd (zneg a) (zadd a b) := zadd_assoc (zneg a) a b
    _ = zadd (zneg a) (zadd a c) := h'
    _ = zadd (zadd (zneg a) a) c := (zadd_assoc (zneg a) a c).symm
    _ = zadd zzero c := by rw [zadd_neg_left]
    _ = c := zadd_zero_left c

/-- Right cancellation in the accepted additive group. -/
theorem zadd_right_cancel {a b c : ZSigned}
    (h : zadd a c = zadd b c) : a = b := by
  apply zadd_left_cancel (a := c)
  calc
    zadd c a = zadd a c := zadd_comm c a
    _ = zadd b c := h
    _ = zadd c b := zadd_comm b c

/-- Any additive inverse is the selected negation. -/
theorem additive_inverse_unique {x y : ZSigned}
    (h : zadd x y = zzero) : y = zneg x := by
  apply zadd_left_cancel (a := x)
  calc
    zadd x y = zzero := h
    _ = zadd x (zneg x) := (zadd_neg_right x).symm

/-- Multiplication by a negated left factor is the negation of the product. -/
theorem zmul_neg_left (x c : ZSigned) :
    zmul (zneg x) c = zneg (zmul x c) := by
  apply additive_inverse_unique (x := zmul x c)
  calc
    zadd (zmul x c) (zmul (zneg x) c) =
        zmul (zadd x (zneg x)) c := (zmul_add_left x (zneg x) c).symm
    _ = zmul zzero c := congrArg (fun t => zmul t c) (zadd_neg_right x)
    _ = zzero := zmul_zero_left c

/-- Multiplication by a negated right factor. -/
theorem zmul_neg_right (x c : ZSigned) :
    zmul x (zneg c) = zneg (zmul x c) := by
  calc
    zmul x (zneg c) = zmul (zneg c) x := zmul_comm x (zneg c)
    _ = zneg (zmul c x) := zmul_neg_left c x
    _ = zneg (zmul x c) := congrArg zneg (zmul_comm c x)

/-- QG-01: cancellation by a nonzero right integer factor. -/
theorem zmul_right_cancel_nonzero {a b c : ZSigned}
    (hc : c ≠ zzero) (h : zmul a c = zmul b c) : a = b := by
  have hzero : zmul (zadd a (zneg b)) c = zzero := by
    calc
      zmul (zadd a (zneg b)) c =
          zadd (zmul a c) (zmul (zneg b) c) := zmul_add_left a (zneg b) c
      _ = zadd (zmul a c) (zneg (zmul b c)) :=
          congrArg (fun t => zadd (zmul a c) t) (zmul_neg_left b c)
      _ = zadd (zmul b c) (zneg (zmul b c)) :=
          congrArg (fun t => zadd t (zneg (zmul b c))) h
      _ = zzero := zadd_neg_right (zmul b c)
  rcases zmul_eq_zero hzero with hab | hc0
  · apply zadd_right_cancel (c := zneg b)
    calc
      zadd a (zneg b) = zzero := hab
      _ = zadd b (zneg b) := (zadd_neg_right b).symm
  · exact False.elim (hc hc0)

/-- Left-factor cancellation follows from commutativity. -/
theorem zmul_left_cancel_nonzero {a b c : ZSigned}
    (hc : c ≠ zzero) (h : zmul c a = zmul c b) : a = b := by
  apply zmul_right_cancel_nonzero hc
  calc
    zmul a c = zmul c a := zmul_comm a c
    _ = zmul c b := h
    _ = zmul b c := zmul_comm c b

/-- Product nonzeroness, the convenient fraction-denominator form. -/
theorem zmul_ne_zero {a b : ZSigned} (ha : a ≠ zzero) (hb : b ≠ zzero) :
    zmul a b ≠ zzero := by
  intro h
  rcases zmul_eq_zero h with ha0 | hb0
  · exact ha ha0
  · exact hb hb0

end BOMA.Q.Gateway001
