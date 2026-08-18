/- Cross-route convergence for signed integer addition and multiplication. -/
namespace BOMA.Z.Arithmetic001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001
open BOMA.NArithmetic.Multiplication001
open BOMA.Z.Rep001
open BOMA.Z.Rep001.ZSigned

/-- The direct and pair-mediated addition routes agree pointwise. -/
theorem zadd_routes_converge (x y : ZSigned) : zaddD x y = zaddP x y := by
  cases x <;> cases y <;>
    simp [zaddD, zaddP, pairAdd, pairOfSigned, normalizePair,
      diff, add_s_left, add_s_right]

/-- Pair normalization of a natural product against zero is the direct embedded product. -/
theorem normalize_positive_pair (n : BOMANat) :
    normalizePair ⟨n, z⟩ = embedN n := by
  exact diff_nat_zero n

/-- Pair normalization of zero against a natural is its signed negation. -/
theorem normalize_negative_pair (n : BOMANat) :
    normalizePair ⟨z, n⟩ = zneg (embedN n) := by
  exact diff_zero_nat n

/-- The direct and pair-mediated multiplication routes agree pointwise. -/
theorem zmul_routes_converge (x y : ZSigned) : zmulD x y = zmulP x y := by
  cases x <;> cases y <;>
    simp [zmulD, zmulP, pairMul, pairOfSigned, normalizePair,
      normalize_positive_pair, normalize_negative_pair,
      diff_nat_zero, diff_zero_nat]

end BOMA.Z.Arithmetic001
