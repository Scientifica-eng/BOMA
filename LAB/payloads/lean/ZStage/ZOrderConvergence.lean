/- Convergence of direct signed order and pair cross-sum order. -/
namespace BOMA.Z.Order001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001
open BOMA.NArithmetic.Order001
open BOMA.Z.Rep001
open BOMA.Z.Rep001.ZSigned

/-- The direct sign/magnitude order and pair cross-sum order agree pointwise. -/
theorem zorder_routes_converge (x y : ZSigned) : zLEd x y ↔ zLEp x y := by
  cases x <;> cases y <;>
    simp [zLEd, zLEp, pairLE, pairOfSigned,
      add_z_left, add_z_right, le_s_iff, z_le, not_s_le_z]

end BOMA.Z.Order001
