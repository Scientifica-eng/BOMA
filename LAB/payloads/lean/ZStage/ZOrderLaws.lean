/- Canonical integer order laws after direct/pair route convergence. -/
namespace BOMA.Z.Order001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001
open BOMA.NArithmetic.Multiplication001
open BOMA.NArithmetic.Order001
open BOMA.Z.Rep001
open BOMA.Z.Rep001.ZSigned
open BOMA.Z.Arithmetic001

/-- Canonical integer order spelling after route convergence. -/
def zLE : ZSigned → ZSigned → Prop := zLEd

def NonNeg (x : ZSigned) : Prop := zLE zzero x

/-- Canonical order is exactly the pair cross-sum order on canonical representatives. -/
theorem zle_iff_pair (x y : ZSigned) :
    zLE x y ↔ pairLE (pairOfSigned x) (pairOfSigned y) := by
  change zLEd x y ↔ zLEp x y
  exact zorder_routes_converge x y

/-- Natural-order cancellation by a common right addend. -/
theorem n_le_cancel_right {a b c : BOMANat}
    (h : LE (add a c) (add b c)) : LE a b := by
  change LEAdd (add a c) (add b c) at h
  change LEAdd a b
  rcases h with ⟨k, hk⟩
  refine ⟨k, ?_⟩
  apply add_right_cancel (add a k) b c
  calc
    add (add a k) c = add a (add k c) := add_assoc a k c
    _ = add a (add c k) := congrArg (fun t => add a t) (add_comm k c)
    _ = add (add a c) k := (add_assoc a c k).symm
    _ = add b c := hk

/-- Pair cross-sum order is invariant when its left representative changes within `~`. -/
theorem pairLE_respects_left {x x' y : ZPair}
    (hx : ZEquiv x x') (h : pairLE x y) : pairLE x' y := by
  cases x with
  | mk a b =>
    cases x' with
    | mk c d =>
      cases y with
      | mk e f =>
        change add a d = add c b at hx
        change LE (add a f) (add e b) at h
        change LE (add c f) (add e d)
        have hm : LE (add (add a f) d) (add (add e b) d) :=
          add_mono_right h d
        have hl : add (add a f) d = add (add c f) b := by
          calc
            add (add a f) d = add a (add f d) := add_assoc a f d
            _ = add a (add d f) := congrArg (fun t => add a t) (add_comm f d)
            _ = add (add a d) f := (add_assoc a d f).symm
            _ = add (add c b) f := congrArg (fun t => add t f) hx
            _ = add c (add b f) := add_assoc c b f
            _ = add c (add f b) := congrArg (fun t => add c t) (add_comm b f)
            _ = add (add c f) b := (add_assoc c f b).symm
        have hr : add (add e b) d = add (add e d) b := by
          calc
            add (add e b) d = add e (add b d) := add_assoc e b d
            _ = add e (add d b) := congrArg (fun t => add e t) (add_comm b d)
            _ = add (add e d) b := (add_assoc e d b).symm
        rw [hl, hr] at hm
        exact n_le_cancel_right hm

/-- Negation of pair representatives reverses pair order. -/
theorem pairLE_neg_flip (x y : ZPair) :
    pairLE x y ↔ pairLE (pairNeg y) (pairNeg x) := by
  cases x with
  | mk a b =>
    cases y with
    | mk c d =>
      simp [pairLE, pairNeg, add_comm]

/-- Pair cross-sum order is invariant when its right representative changes within `~`. -/
theorem pairLE_respects_right {x y y' : ZPair}
    (hy : ZEquiv y y') (h : pairLE x y) : pairLE x y' := by
  have hflip : pairLE (pairNeg y) (pairNeg x) :=
    (pairLE_neg_flip x y).mp h
  have hchanged : pairLE (pairNeg y') (pairNeg x) :=
    pairLE_respects_left (pairNeg_respects hy) hflip
  exact (pairLE_neg_flip x y').mpr hchanged

theorem pairLE_respects {x x' y y' : ZPair}
    (hx : ZEquiv x x') (hy : ZEquiv y y') (h : pairLE x y) : pairLE x' y' :=
  pairLE_respects_right hy (pairLE_respects_left hx h)

/-- The canonical pair of an embedded natural is exactly `(n,0)`. -/
theorem pairOfSigned_embedN (n : BOMANat) :
    pairOfSigned (embedN n) = ⟨n, z⟩ := by
  cases n <;> rfl

/-- Every pair is below itself plus an embedded natural gap. -/
theorem pairLE_add_embedded (x : ZPair) (k : BOMANat) :
    pairLE x (pairAdd x (pairOfSigned (embedN k))) := by
  rw [pairOfSigned_embedN]
  cases x with
  | mk a b =>
    change LE (add a (add b z)) (add (add a k) b)
    change LEAdd (add a b) (add (add a k) b)
    refine ⟨k, ?_⟩
    calc
      add (add a b) k = add a (add b k) := add_assoc a b k
      _ = add a (add k b) := congrArg (fun t => add a t) (add_comm b k)
      _ = add (add a k) b := (add_assoc a k b).symm

/-- Pair cross-sum order itself has an explicit natural-gap witness. -/
theorem pairLE_to_gap {x y : ZSigned}
    (h : pairLE (pairOfSigned x) (pairOfSigned y)) :
    ∃ k : BOMANat, zadd x (embedN k) = y := by
  change LEAdd
    (add (pairOfSigned x).p (pairOfSigned y).n)
    (add (pairOfSigned y).p (pairOfSigned x).n) at h
  rcases h with ⟨k, hk⟩
  refine ⟨k, ?_⟩
  apply signed_eq_of_pair_equiv
  have hs := zadd_pair_semantics x (embedN k)
  have hrel : ZEquiv
      (pairAdd (pairOfSigned x) (pairOfSigned (embedN k)))
      (pairOfSigned y) := by
    rw [pairOfSigned_embedN]
    change add (add (pairOfSigned x).p k) (pairOfSigned y).n =
      add (pairOfSigned y).p (add (pairOfSigned x).n z)
    calc
      add (add (pairOfSigned x).p k) (pairOfSigned y).n =
          add (add (pairOfSigned x).p (pairOfSigned y).n) k := by
            rw [add_assoc, add_assoc]
            exact congrArg (fun t => add (pairOfSigned x).p t)
              (add_comm k (pairOfSigned y).n)
      _ = add (pairOfSigned y).p (pairOfSigned x).n := hk
      _ = add (pairOfSigned y).p (add (pairOfSigned x).n z) := by
        rw [add_z_right]
  exact zeq_trans hs hrel

/-- Integer order is equivalent to existence of an embedded natural additive gap. -/
theorem zle_iff_natural_gap (x y : ZSigned) :
    zLE x y ↔ ∃ k : BOMANat, zadd x (embedN k) = y := by
  constructor
  · intro h
    exact pairLE_to_gap ((zle_iff_pair x y).mp h)
  · rintro ⟨k, hk⟩
    have hp : pairLE (pairOfSigned x)
        (pairAdd (pairOfSigned x) (pairOfSigned (embedN k))) :=
      pairLE_add_embedded (pairOfSigned x) k
    have hs := zadd_pair_semantics x (embedN k)
    have hp' : pairLE (pairOfSigned x) (pairOfSigned (zadd x (embedN k))) :=
      pairLE_respects_right (zeq_symm hs) hp
    have hz : zLE x (zadd x (embedN k)) := (zle_iff_pair _ _).mpr hp'
    rw [hk] at hz
    exact hz

theorem zle_refl (x : ZSigned) : zLE x x := by
  apply (zle_iff_natural_gap x x).mpr
  exact ⟨z, by simp [embedN_zero]⟩

theorem zle_trans {x y w : ZSigned} (hxy : zLE x y) (hyw : zLE y w) : zLE x w := by
  rcases (zle_iff_natural_gap x y).mp hxy with ⟨k, hk⟩
  rcases (zle_iff_natural_gap y w).mp hyw with ⟨l, hl⟩
  apply (zle_iff_natural_gap x w).mpr
  refine ⟨add k l, ?_⟩
  calc
    zadd x (embedN (add k l)) = zadd x (zadd (embedN k) (embedN l)) :=
      congrArg (fun t => zadd x t) (embedN_add k l)
    _ = zadd (zadd x (embedN k)) (embedN l) := (zadd_assoc x (embedN k) (embedN l)).symm
    _ = zadd y (embedN l) := congrArg (fun t => zadd t (embedN l)) hk
    _ = w := hl

theorem zle_antisymm {x y : ZSigned} (hxy : zLE x y) (hyx : zLE y x) : x = y := by
  cases x with
  | zero =>
      cases y with
      | zero => rfl
      | pos b =>
          change False at hyx
          contradiction
      | neg b =>
          change False at hxy
          contradiction
  | pos a =>
      cases y with
      | zero =>
          change False at hxy
          contradiction
      | neg b =>
          change False at hxy
          contradiction
      | pos b =>
          change LE a b at hxy
          change LE b a at hyx
          exact congrArg pos (le_antisymm hxy hyx)
  | neg a =>
      cases y with
      | zero =>
          change False at hyx
          contradiction
      | pos b =>
          change False at hyx
          contradiction
      | neg b =>
          change LE b a at hxy
          change LE a b at hyx
          exact congrArg neg (le_antisymm hyx hxy)

theorem zle_total (x y : ZSigned) : zLE x y ∨ zLE y x := by
  cases x with
  | zero =>
      cases y with
      | zero => exact Or.inl True.intro
      | pos b => exact Or.inl True.intro
      | neg b => exact Or.inr True.intro
  | pos a =>
      cases y with
      | zero => exact Or.inr True.intro
      | neg b => exact Or.inr True.intro
      | pos b => exact le_total a b
  | neg a =>
      cases y with
      | zero => exact Or.inl True.intro
      | pos b => exact Or.inl True.intro
      | neg b => exact le_total b a

/-- The selected integer order exactly extends the accepted natural order. -/
theorem embedN_order (a b : BOMANat) :
    zLE (embedN a) (embedN b) ↔ LE a b := by
  cases a <;> cases b <;>
    simp [zLE, zLEd, embedN, le_s_iff, z_le, not_s_le_z]

/-- Translation invariance / right addition monotonicity. -/
theorem zadd_mono_right {x y : ZSigned} (h : zLE x y) (c : ZSigned) :
    zLE (zadd x c) (zadd y c) := by
  rcases (zle_iff_natural_gap x y).mp h with ⟨k, hk⟩
  apply (zle_iff_natural_gap _ _).mpr
  refine ⟨k, ?_⟩
  calc
    zadd (zadd x c) (embedN k) = zadd x (zadd c (embedN k)) := zadd_assoc x c (embedN k)
    _ = zadd x (zadd (embedN k) c) :=
      congrArg (fun t => zadd x t) (zadd_comm c (embedN k))
    _ = zadd (zadd x (embedN k)) c := (zadd_assoc x (embedN k) c).symm
    _ = zadd y c := congrArg (fun t => zadd t c) hk

theorem zadd_mono_left {x y : ZSigned} (h : zLE x y) (c : ZSigned) :
    zLE (zadd c x) (zadd c y) := by
  simpa [zadd_comm c x, zadd_comm c y] using zadd_mono_right h c

/-- Negation reverses order. -/
theorem zneg_reverses {x y : ZSigned} (h : zLE x y) :
    zLE (zneg y) (zneg x) := by
  cases x <;> cases y <;> simp_all [zLE, zLEd, zneg]

/-- Nonnegative signed integers are exactly embedded naturals. -/
theorem nonneg_is_embedded (c : ZSigned) (h : NonNeg c) :
    ∃ n : BOMANat, c = embedN n := by
  cases c with
  | zero => exact ⟨z, rfl⟩
  | pos n => exact ⟨s n, rfl⟩
  | neg n =>
      change False at h
      contradiction

/-- Multiplication by a nonnegative integer preserves order on the right. -/
theorem zmul_mono_right_nonneg {x y c : ZSigned}
    (hxy : zLE x y) (hc : NonNeg c) :
    zLE (zmul x c) (zmul y c) := by
  rcases (zle_iff_natural_gap x y).mp hxy with ⟨k, hk⟩
  rcases nonneg_is_embedded c hc with ⟨m, rfl⟩
  apply (zle_iff_natural_gap _ _).mpr
  refine ⟨mul k m, ?_⟩
  calc
    zadd (zmul x (embedN m)) (embedN (mul k m)) =
        zadd (zmul x (embedN m)) (zmul (embedN k) (embedN m)) :=
      congrArg (fun t => zadd (zmul x (embedN m)) t) (embedN_mul k m)
    _ = zmul (zadd x (embedN k)) (embedN m) :=
      (zmul_add_left x (embedN k) (embedN m)).symm
    _ = zmul y (embedN m) := congrArg (fun t => zmul t (embedN m)) hk

theorem zmul_mono_left_nonneg {x y c : ZSigned}
    (hxy : zLE x y) (hc : NonNeg c) :
    zLE (zmul c x) (zmul c y) := by
  simpa [zmul_comm c x, zmul_comm c y] using zmul_mono_right_nonneg hxy hc

end BOMA.Z.Order001
