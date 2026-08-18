/- Canonical integer arithmetic laws after direct/pair route convergence. -/
namespace BOMA.Z.Arithmetic001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001
open BOMA.NArithmetic.Multiplication001
open BOMA.Z.Rep001
open BOMA.Z.Rep001.ZSigned

/-- Canonical arithmetic spellings on the selected signed carrier.
The direct route is selected as the executable spelling only after route convergence. -/
def zadd : ZSigned → ZSigned → ZSigned := zaddD
def zmul : ZSigned → ZSigned → ZSigned := zmulD
def zzero : ZSigned := zero
def zone : ZSigned := embedN (s z)

/-- Semantic certificate for canonical addition in the retained pair model. -/
theorem zadd_pair_semantics (x y : ZSigned) :
    ZEquiv (pairOfSigned (zadd x y)) (pairAdd (pairOfSigned x) (pairOfSigned y)) := by
  unfold zadd
  rw [zadd_routes_converge]
  exact pair_roundtrip (pairAdd (pairOfSigned x) (pairOfSigned y))

/-- Semantic certificate for canonical multiplication in the retained pair model. -/
theorem zmul_pair_semantics (x y : ZSigned) :
    ZEquiv (pairOfSigned (zmul x y)) (pairMul (pairOfSigned x) (pairOfSigned y)) := by
  unfold zmul
  rw [zmul_routes_converge]
  exact pair_roundtrip (pairMul (pairOfSigned x) (pairOfSigned y))

/-- Equality of pair semantics gives equality on the selected canonical carrier. -/
theorem signed_eq_of_pair_equiv {x y : ZSigned}
    (h : ZEquiv (pairOfSigned x) (pairOfSigned y)) : x = y :=
  canonical_pair_separates h

@[simp] theorem zadd_zero_left (x : ZSigned) : zadd zzero x = x := by
  cases x <;> rfl

@[simp] theorem zadd_zero_right (x : ZSigned) : zadd x zzero = x := by
  cases x <;> rfl

theorem zadd_comm (x y : ZSigned) : zadd x y = zadd y x := by
  apply signed_eq_of_pair_equiv
  exact zeq_trans
    (zadd_pair_semantics x y)
    (zeq_trans
      (by rw [pairAdd_comm (pairOfSigned x) (pairOfSigned y)]; exact zeq_refl _)
      (zeq_symm (zadd_pair_semantics y x)))

theorem zadd_assoc (x y w : ZSigned) : zadd (zadd x y) w = zadd x (zadd y w) := by
  apply signed_eq_of_pair_equiv
  have hxy : ZEquiv (pairOfSigned (zadd x y))
      (pairAdd (pairOfSigned x) (pairOfSigned y)) := zadd_pair_semantics x y
  have hyw : ZEquiv (pairOfSigned (zadd y w))
      (pairAdd (pairOfSigned y) (pairOfSigned w)) := zadd_pair_semantics y w
  have hL : ZEquiv
      (pairAdd (pairOfSigned (zadd x y)) (pairOfSigned w))
      (pairAdd (pairAdd (pairOfSigned x) (pairOfSigned y)) (pairOfSigned w)) :=
    pairAdd_respects hxy (zeq_refl _)
  have hA : ZEquiv
      (pairAdd (pairAdd (pairOfSigned x) (pairOfSigned y)) (pairOfSigned w))
      (pairAdd (pairOfSigned x) (pairAdd (pairOfSigned y) (pairOfSigned w))) := by
    rw [pairAdd_assoc]
    exact zeq_refl _
  have hR : ZEquiv
      (pairAdd (pairOfSigned x) (pairAdd (pairOfSigned y) (pairOfSigned w)))
      (pairAdd (pairOfSigned x) (pairOfSigned (zadd y w))) :=
    pairAdd_respects (zeq_refl _) (zeq_symm hyw)
  exact zeq_trans (zadd_pair_semantics (zadd x y) w)
    (zeq_trans hL (zeq_trans hA (zeq_trans hR (zeq_symm (zadd_pair_semantics x (zadd y w))))))

@[simp] theorem zadd_neg_right (x : ZSigned) : zadd x (zneg x) = zzero := by
  cases x with
  | zero => rfl
  | pos n =>
      change diff (s n) (s n) = zero
      exact diff_self (s n)
  | neg n =>
      change diff (s n) (s n) = zero
      exact diff_self (s n)

@[simp] theorem zadd_neg_left (x : ZSigned) : zadd (zneg x) x = zzero := by
  rw [zadd_comm]
  exact zadd_neg_right x

/-- Natural one is preserved by the selected signed embedding. -/
@[simp] theorem zone_def : zone = pos z := rfl

@[simp] theorem zmul_zero_left (x : ZSigned) : zmul zzero x = zzero := by
  cases x <;> rfl

@[simp] theorem zmul_zero_right (x : ZSigned) : zmul x zzero = zzero := by
  cases x <;> rfl

theorem zmul_comm (x y : ZSigned) : zmul x y = zmul y x := by
  apply signed_eq_of_pair_equiv
  exact zeq_trans
    (zmul_pair_semantics x y)
    (zeq_trans
      (by rw [pairMul_comm (pairOfSigned x) (pairOfSigned y)]; exact zeq_refl _)
      (zeq_symm (zmul_pair_semantics y x)))

theorem zmul_assoc (x y w : ZSigned) : zmul (zmul x y) w = zmul x (zmul y w) := by
  apply signed_eq_of_pair_equiv
  have hxy := zmul_pair_semantics x y
  have hyw := zmul_pair_semantics y w
  have hL := pairMul_respects hxy (zeq_refl (pairOfSigned w))
  have hA : ZEquiv
      (pairMul (pairMul (pairOfSigned x) (pairOfSigned y)) (pairOfSigned w))
      (pairMul (pairOfSigned x) (pairMul (pairOfSigned y) (pairOfSigned w))) := by
    rw [pairMul_assoc]
    exact zeq_refl _
  have hR := pairMul_respects (zeq_refl (pairOfSigned x)) (zeq_symm hyw)
  exact zeq_trans (zmul_pair_semantics (zmul x y) w)
    (zeq_trans hL (zeq_trans hA (zeq_trans hR (zeq_symm (zmul_pair_semantics x (zmul y w))))))

@[simp] theorem zmul_one_right (x : ZSigned) : zmul x zone = x := by
  cases x with
  | zero => rfl
  | pos n =>
      simp [zmul, zmulD, zone, embedN, mul_one_right]
  | neg n =>
      simp [zmul, zmulD, zone, embedN, zneg, mul_one_right]

@[simp] theorem zmul_one_left (x : ZSigned) : zmul zone x = x := by
  rw [zmul_comm]
  exact zmul_one_right x

/-- Right distributivity is transferred through the retained pair semantics. -/
theorem zmul_add_right (x y w : ZSigned) :
    zmul x (zadd y w) = zadd (zmul x y) (zmul x w) := by
  apply signed_eq_of_pair_equiv
  have hyw := zadd_pair_semantics y w
  have hxy := zmul_pair_semantics x y
  have hxw := zmul_pair_semantics x w
  have h1 := pairMul_respects (zeq_refl (pairOfSigned x)) hyw
  have h2 : ZEquiv
      (pairMul (pairOfSigned x) (pairAdd (pairOfSigned y) (pairOfSigned w)))
      (pairAdd (pairMul (pairOfSigned x) (pairOfSigned y))
               (pairMul (pairOfSigned x) (pairOfSigned w))) := by
    rw [pairMul_add_right]
    exact zeq_refl _
  have h3 := pairAdd_respects (zeq_symm hxy) (zeq_symm hxw)
  exact zeq_trans (zmul_pair_semantics x (zadd y w))
    (zeq_trans h1 (zeq_trans h2 (zeq_trans h3
      (zeq_symm (zadd_pair_semantics (zmul x y) (zmul x w))))))

theorem zmul_add_left (x y w : ZSigned) :
    zmul (zadd x y) w = zadd (zmul x w) (zmul y w) := by
  calc
    zmul (zadd x y) w = zmul w (zadd x y) := zmul_comm _ _
    _ = zadd (zmul w x) (zmul w y) := zmul_add_right w x y
    _ = zadd (zmul x w) (zmul y w) := by rw [zmul_comm w x, zmul_comm w y]

/-- The accepted N embedding preserves zero. -/
@[simp] theorem embedN_zero : embedN z = zzero := rfl

/-- The accepted N embedding preserves one. -/
@[simp] theorem embedN_one : embedN (s z) = zone := rfl

/-- The accepted N embedding preserves addition. -/
theorem embedN_add (a b : BOMANat) : embedN (add a b) = zadd (embedN a) (embedN b) := by
  cases a with
  | z => simp [zadd, zzero, embedN]
  | s a =>
      cases b with
      | z => simp [zadd, zzero, embedN]
      | s b =>
          simp [zadd, zaddD, embedN, add_s_left, add_s_right]

/-- The accepted N embedding preserves multiplication. -/
theorem embedN_mul (a b : BOMANat) : embedN (mul a b) = zmul (embedN a) (embedN b) := by
  cases a with
  | z => simp [zmul, zzero, embedN]
  | s a =>
      cases b with
      | z => simp [zmul, zzero, embedN]
      | s b => rfl

/-- Every selected signed integer is explicitly a difference of embedded naturals. -/
theorem generated_by_natural_difference (x : ZSigned) :
    ∃ a b : BOMANat, x = zadd (embedN a) (zneg (embedN b)) := by
  cases x with
  | zero => exact ⟨z, z, rfl⟩
  | pos n => exact ⟨s n, z, rfl⟩
  | neg n => exact ⟨z, s n, rfl⟩

end BOMA.Z.Arithmetic001
