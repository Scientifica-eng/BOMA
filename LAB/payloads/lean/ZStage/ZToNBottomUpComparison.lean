/- Bottom-up comparison layer for the post-Z reverse experiment.
   Unlike ZToNReverseCore.lean, this file is allowed to re-introduce N_BOMA
   explicitly as a frozen reference target. -/
namespace BOMA.Z.ReverseN001.Compare

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001
open BOMA.NArithmetic.Multiplication001
open BOMA.NArithmetic.Order001
open BOMA.Z.Rep001
open BOMA.Z.Rep001.ZSigned
open BOMA.Z.Arithmetic001
open BOMA.Z.Order001
open BOMA.Z.ReverseN001

universe u

/-- Comparison map from the already-accepted bottom-up N into the independently
defined reverse cone. This map is comparison evidence, not the cone definition. -/
def coneEncodeN (n : BOMANat) : NFromZCone :=
  ⟨embedN n, (embedN_order z n).mpr (z_le n)⟩

/-- Representation-aware decoder. Its use of `pos n` exposes that exact recovery
is available because the selected Stage-One signed Z carrier retains a BOMANat
magnitude payload. This is NOT presented as an abstract ordered-ring decoder. -/
def coneDecodeN (x : NFromZCone) : BOMANat :=
  match x.val with
  | zero => z
  | pos n => s n
  | neg _ => z

/-- Reverse cone equality is extensional in its Z value; nonnegativity evidence
is proof-only. -/
theorem cone_ext {x y : NFromZCone} (h : x.val = y.val) : x = y := by
  cases x with
  | mk xv hx =>
    cases y with
    | mk yv hy =>
      cases h
      rfl

/-- Exact N round trip through the reverse cone. -/
@[simp] theorem decode_encode (n : BOMANat) :
    coneDecodeN (coneEncodeN n) = n := by
  cases n <;> rfl

/-- Every reverse-cone element decodes and re-encodes to the same Z value.
The negative signed case is excluded by the cone proof. -/
theorem encode_decode_val (x : NFromZCone) :
    (coneEncodeN (coneDecodeN x)).val = x.val := by
  cases x with
  | mk val h =>
    cases val with
    | zero => rfl
    | pos n => rfl
    | neg n =>
        change False at h
        contradiction

/-- Full cone round trip; proof fields add no mathematical data. -/
@[simp] theorem encode_decode (x : NFromZCone) :
    coneEncodeN (coneDecodeN x) = x :=
  cone_ext (encode_decode_val x)

@[simp] theorem encode_zero : coneEncodeN z = coneZero := by
  apply cone_ext
  rfl

/-- The comparison map preserves successor. -/
theorem encode_succ (n : BOMANat) :
    coneEncodeN (s n) = coneSucc (coneEncodeN n) := by
  apply cone_ext
  change embedN (s n) = zadd (embedN n) zone
  simpa [zone] using embedN_add n (s z)

/-- The comparison map preserves accepted natural addition. -/
theorem encode_add (a b : BOMANat) :
    coneEncodeN (add a b) = coneAdd (coneEncodeN a) (coneEncodeN b) := by
  apply cone_ext
  exact embedN_add a b

/-- The comparison map preserves accepted natural multiplication. -/
theorem encode_mul (a b : BOMANat) :
    coneEncodeN (mul a b) = coneMul (coneEncodeN a) (coneEncodeN b) := by
  apply cone_ext
  exact embedN_mul a b

/-- The inherited cone order is exactly the accepted bottom-up N order under the
comparison map. -/
theorem encode_order (a b : BOMANat) :
    coneLE (coneEncodeN a) (coneEncodeN b) ↔ LE a b := by
  simpa [coneLE, coneEncodeN] using embedN_order a b

/-- Decoder also recognizes reverse successor. This theorem is representation-aware. -/
theorem decode_succ (x : NFromZCone) :
    coneDecodeN (coneSucc x) = s (coneDecodeN x) := by
  cases x with
  | mk val h =>
    cases val with
    | zero => rfl
    | pos n =>
        simp [coneDecodeN, coneSucc, zadd, zaddD, zone, embedN]
    | neg n =>
        change False at h
        contradiction

/-- Every bottom-up natural maps to a Z-generated reachable value. -/
theorem reach_encode (n : BOMANat) : ReachZ (coneEncodeN n).val := by
  induction n with
  | z => exact ReachZ.zero
  | s n ih =>
      have hs : ReachZ (coneSucc (coneEncodeN n)).val := ReachZ.succ ih
      rw [← encode_succ n]
      exact hs

/-- Comparison-assisted converse: every nonnegative cone value is reachable.
The proof passes through the representation-aware decoder; therefore this is
not counted as a Z-interface-only derivation of cone→reachability. -/
theorem cone_reachable_via_representation (x : NFromZCone) : ReachZ x.val := by
  have h := reach_encode (coneDecodeN x)
  rw [encode_decode_val x] at h
  exact h

/-- After the comparison layer is allowed, the two reverse candidates coincide
extensionally. The converse direction is explicitly representation-assisted. -/
theorem reach_iff_nonnegative_via_representation (x : ZSigned) :
    ReachZ x ↔ zLE zzero x := by
  constructor
  · exact reach_nonneg
  · intro hx
    exact cone_reachable_via_representation ⟨x, hx⟩

/-- Comparison-assisted successor no-confusion on the reverse cone. -/
theorem cone_succ_ne_zero (x : NFromZCone) : coneSucc x ≠ coneZero := by
  intro h
  have hd := congrArg coneDecodeN h
  rw [decode_succ] at hd
  change s (coneDecodeN x) = z at hd
  exact s_ne_z (coneDecodeN x) hd

/-- Comparison-assisted successor injectivity on the reverse cone. -/
theorem cone_succ_injective {x y : NFromZCone}
    (h : coneSucc x = coneSucc y) : x = y := by
  have hd := congrArg coneDecodeN h
  rw [decode_succ, decode_succ] at hd
  have hbase : coneDecodeN x = coneDecodeN y := s_injective hd
  calc
    x = coneEncodeN (coneDecodeN x) := (encode_decode x).symm
    _ = coneEncodeN (coneDecodeN y) := congrArg coneEncodeN hbase
    _ = y := encode_decode y

/-- A Type-valued recursor can be transported to the reverse cone only after
using the representation-aware decoder / bottom-up comparison. This theorem is
therefore evidence of recoverability-by-comparison, not autonomous recovery
from the abstract ordered-ring interface. -/
def coneFoldViaBottomUp {X : Type u}
    (x0 : X) (step : X → X) (x : NFromZCone) : X :=
  fold x0 step (coneDecodeN x)

@[simp] theorem coneFold_zero {X : Type u} (x0 : X) (step : X → X) :
    coneFoldViaBottomUp x0 step coneZero = x0 := rfl

@[simp] theorem coneFold_succ {X : Type u}
    (x0 : X) (step : X → X) (x : NFromZCone) :
    coneFoldViaBottomUp x0 step (coneSucc x) =
      step (coneFoldViaBottomUp x0 step x) := by
  unfold coneFoldViaBottomUp
  rw [decode_succ]
  rfl

end BOMA.Z.ReverseN001.Compare
