/- Representation convergence after signed + pair routes. -/
namespace BOMA.Z.Rep001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001
open ZSigned


def pairOfSigned : ZSigned → ZPair
  | zero => ⟨z, z⟩
  | pos n => ⟨s n, z⟩
  | neg n => ⟨z, s n⟩

def normalizePair (x : ZPair) : ZSigned := diff x.p x.n

@[simp] theorem signed_roundtrip (x : ZSigned) : normalizePair (pairOfSigned x) = x := by
  cases x <;> rfl

/-- Adding one common successor to both coordinates preserves the represented difference. -/
theorem zeq_common_s {q : ZPair} {a b : BOMANat}
    (h : ZEquiv q ⟨a,b⟩) : ZEquiv q ⟨s a, s b⟩ := by
  cases q with
  | mk p n =>
    calc
      add p (s b) = s (add p b) := add_s_right p b
      _ = s (add a n) := congrArg s h
      _ = add (s a) n := (add_s_left a n).symm

/-- Every pair normalizes to a canonical signed representative equivalent to it. -/
theorem pair_roundtrip (x : ZPair) : ZEquiv (pairOfSigned (normalizePair x)) x := by
  cases x with
  | mk p n =>
    induction p generalizing n with
    | z =>
        cases n <;> rfl
    | s p ih =>
        cases n with
        | z => rfl
        | s n =>
            exact zeq_common_s (ih n)

/-- Distinct signed normal forms cannot have equivalent canonical pairs. -/
theorem canonical_pair_separates {x y : ZSigned}
    (h : ZEquiv (pairOfSigned x) (pairOfSigned y)) : x = y := by
  cases x <;> cases y <;> simp_all [ZEquiv, pairOfSigned]

/-- Pair equivalence implies equality of signed normal forms. -/
theorem normalize_eq_of_equiv {x y : ZPair} (h : ZEquiv x y) :
    normalizePair x = normalizePair y := by
  apply canonical_pair_separates
  exact zeq_trans (zeq_trans (pair_roundtrip x) h) (zeq_symm (pair_roundtrip y))

/-- Equality of normal forms implies pair equivalence. -/
theorem equiv_of_normalize_eq {x y : ZPair}
    (h : normalizePair x = normalizePair y) : ZEquiv x y := by
  have hx : ZEquiv x (pairOfSigned (normalizePair x)) := zeq_symm (pair_roundtrip x)
  have hy : ZEquiv (pairOfSigned (normalizePair y)) y := pair_roundtrip y
  have hc : ZEquiv (pairOfSigned (normalizePair x)) (pairOfSigned (normalizePair y)) := by
    rw [h]
    exact zeq_refl _
  exact zeq_trans (zeq_trans hx hc) hy

theorem representation_converges (x y : ZPair) :
    ZEquiv x y ↔ normalizePair x = normalizePair y :=
  ⟨normalize_eq_of_equiv, equiv_of_normalize_eq⟩

end BOMA.Z.Rep001
