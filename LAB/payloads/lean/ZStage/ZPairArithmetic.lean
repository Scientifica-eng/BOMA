/- Difference-pair arithmetic used as a retained semantic/producer route.
   This file does not create a quotient carrier. -/
namespace BOMA.Z.Rep001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001
open BOMA.NArithmetic.Multiplication001

/-- Useful commutative-monoid reassociation lemmas for the accepted N addition. -/
theorem z_add_left_comm (a b c : BOMANat) : add a (add b c) = add b (add a c) := by
  calc
    add a (add b c) = add (add a b) c := (add_assoc a b c).symm
    _ = add (add b a) c := congrArg (fun t => add t c) (add_comm a b)
    _ = add b (add a c) := add_assoc b a c

theorem z_add4_swap_middle (a b c d : BOMANat) :
    add (add a b) (add c d) = add (add a c) (add b d) := by
  calc
    add (add a b) (add c d) = add a (add b (add c d)) := add_assoc a b (add c d)
    _ = add a (add c (add b d)) := congrArg (fun t => add a t) (z_add_left_comm b c d)
    _ = add (add a c) (add b d) := (add_assoc a c (add b d)).symm

theorem z_add4_swap_last (a b c d : BOMANat) :
    add (add a b) (add c d) = add (add a d) (add b c) := by
  calc
    add (add a b) (add c d) = add (add a b) (add d c) :=
      congrArg (fun t => add (add a b) t) (add_comm c d)
    _ = add (add a d) (add b c) := z_add4_swap_middle a b d c

/-- Left commutativity for accepted N multiplication, made explicit so the
proof backend can normalize triple products without guessing an AC normal form. -/
theorem z_mul_left_comm (a b c : BOMANat) : mul a (mul b c) = mul b (mul a c) := by
  calc
    mul a (mul b c) = mul (mul a b) c := (mul_assoc a b c).symm
    _ = mul (mul b a) c := congrArg (fun t => mul t c) (mul_comm a b)
    _ = mul b (mul a c) := mul_assoc b a c

def pairZero : ZPair := ⟨z, z⟩
def pairOne : ZPair := ⟨s z, z⟩
def pairNeg (x : ZPair) : ZPair := ⟨x.n, x.p⟩
def pairAdd (x y : ZPair) : ZPair := ⟨add x.p y.p, add x.n y.n⟩
def pairMul (x y : ZPair) : ZPair :=
  ⟨add (mul x.p y.p) (mul x.n y.n),
   add (mul x.p y.n) (mul x.n y.p)⟩

@[simp] theorem pairAdd_zero_left (x : ZPair) : pairAdd pairZero x = x := by
  cases x <;> simp [pairAdd, pairZero]

@[simp] theorem pairAdd_zero_right (x : ZPair) : pairAdd x pairZero = x := by
  cases x <;> simp [pairAdd, pairZero]

theorem pairAdd_comm (x y : ZPair) : pairAdd x y = pairAdd y x := by
  cases x <;> cases y <;> simp [pairAdd, add_comm]

theorem pairAdd_assoc (x y w : ZPair) : pairAdd (pairAdd x y) w = pairAdd x (pairAdd y w) := by
  cases x <;> cases y <;> cases w <;> simp [pairAdd, add_assoc]

@[simp] theorem pairNeg_involutive (x : ZPair) : pairNeg (pairNeg x) = x := by
  cases x <;> rfl

theorem pairNeg_respects {x y : ZPair} (h : ZEquiv x y) : ZEquiv (pairNeg x) (pairNeg y) := by
  change add x.n y.p = add y.n x.p
  calc
    add x.n y.p = add y.p x.n := add_comm _ _
    _ = add x.p y.n := h.symm
    _ = add y.n x.p := add_comm _ _

/-- Pair addition is well-defined modulo the explicit difference relation. -/
theorem pairAdd_respects {x x' y y' : ZPair}
    (hx : ZEquiv x x') (hy : ZEquiv y y') :
    ZEquiv (pairAdd x y) (pairAdd x' y') := by
  cases x with
  | mk a b =>
    cases x' with
    | mk c d =>
      cases y with
      | mk e f =>
        cases y' with
        | mk g h =>
          change add (add a e) (add d h) = add (add c g) (add b f)
          calc
            add (add a e) (add d h) = add (add a d) (add e h) :=
              z_add4_swap_middle a e d h
            _ = add (add c b) (add e h) := congrArg (fun t => add t (add e h)) hx
            _ = add (add c b) (add g f) := congrArg (fun t => add (add c b) t) hy
            _ = add (add c g) (add b f) := z_add4_swap_middle c b g f

/-- Multiplication on pairs is exactly commutative before quotienting. -/
theorem pairMul_comm (x y : ZPair) : pairMul x y = pairMul y x := by
  cases x <;> cases y <;>
    simp [pairMul, mul_comm, add_comm]

/-- Respect of multiplication in the first representative argument. -/
theorem pairMul_respects_left {x x' y : ZPair}
    (hx : ZEquiv x x') : ZEquiv (pairMul x y) (pairMul x' y) := by
  cases x with
  | mk a b =>
    cases x' with
    | mk c d =>
      cases y with
      | mk e f =>
        have he : add (mul a e) (mul d e) = add (mul c e) (mul b e) := by
          calc
            add (mul a e) (mul d e) = mul (add a d) e := (mul_add_left a d e).symm
            _ = mul (add c b) e := congrArg (fun t => mul t e) hx
            _ = add (mul c e) (mul b e) := mul_add_left c b e
        have hf : add (mul a f) (mul d f) = add (mul c f) (mul b f) := by
          calc
            add (mul a f) (mul d f) = mul (add a d) f := (mul_add_left a d f).symm
            _ = mul (add c b) f := congrArg (fun t => mul t f) hx
            _ = add (mul c f) (mul b f) := mul_add_left c b f
        have hf' : add (mul b f) (mul c f) = add (mul d f) (mul a f) := by
          calc
            add (mul b f) (mul c f) = add (mul c f) (mul b f) := add_comm _ _
            _ = add (mul a f) (mul d f) := hf.symm
            _ = add (mul d f) (mul a f) := add_comm _ _
        change
          add (add (mul a e) (mul b f)) (add (mul c f) (mul d e)) =
          add (add (mul c e) (mul d f)) (add (mul a f) (mul b e))
        calc
          add (add (mul a e) (mul b f)) (add (mul c f) (mul d e)) =
              add (add (mul a e) (mul d e)) (add (mul b f) (mul c f)) :=
            z_add4_swap_last (mul a e) (mul b f) (mul c f) (mul d e)
          _ = add (add (mul c e) (mul b e)) (add (mul b f) (mul c f)) :=
            congrArg (fun t => add t (add (mul b f) (mul c f))) he
          _ = add (add (mul c e) (mul b e)) (add (mul d f) (mul a f)) :=
            congrArg (fun t => add (add (mul c e) (mul b e)) t) hf'
          _ = add (add (mul c e) (mul d f)) (add (mul b e) (mul a f)) :=
            z_add4_swap_middle (mul c e) (mul b e) (mul d f) (mul a f)
          _ = add (add (mul c e) (mul d f)) (add (mul a f) (mul b e)) :=
            congrArg (fun t => add (add (mul c e) (mul d f)) t) (add_comm _ _)

/-- Respect in the second argument follows from exact pair multiplication commutativity. -/
theorem pairMul_respects_right {x y y' : ZPair}
    (hy : ZEquiv y y') : ZEquiv (pairMul x y) (pairMul x y') := by
  rw [pairMul_comm x y, pairMul_comm x y']
  exact pairMul_respects_left hy

theorem pairMul_respects {x x' y y' : ZPair}
    (hx : ZEquiv x x') (hy : ZEquiv y y') :
    ZEquiv (pairMul x y) (pairMul x' y') := by
  exact zeq_trans (pairMul_respects_left hx) (pairMul_respects_right hy)

/-- Raw pair multiplication is associative by the accepted N commutative-semiring laws. -/
theorem pairMul_assoc (x y w : ZPair) : pairMul (pairMul x y) w = pairMul x (pairMul y w) := by
  cases x <;> cases y <;> cases w <;>
    simp [pairMul, mul_add_left, mul_add_right, mul_assoc, mul_comm, z_mul_left_comm,
      add_assoc, add_comm, z_add_left_comm]

/-- Raw pair multiplication distributes over raw pair addition. -/
theorem pairMul_add_right (x y w : ZPair) :
    pairMul x (pairAdd y w) = pairAdd (pairMul x y) (pairMul x w) := by
  cases x <;> cases y <;> cases w <;>
    simp [pairMul, pairAdd, mul_add_left, mul_add_right, mul_assoc, mul_comm, z_mul_left_comm,
      add_assoc, add_comm, z_add_left_comm]

/-- Additive inverse is represented by coordinate swap. -/
theorem pair_add_neg_equiv_zero (x : ZPair) : ZEquiv (pairAdd x (pairNeg x)) pairZero := by
  cases x with
  | mk a b =>
    change add (add a b) z = add z (add b a)
    simpa [add_comm]

end BOMA.Z.Rep001
