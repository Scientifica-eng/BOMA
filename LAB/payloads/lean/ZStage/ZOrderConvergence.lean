/- Convergence of direct signed order and pair cross-sum order. -/
namespace BOMA.Z.Order001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001
open BOMA.NArithmetic.Order001
open BOMA.Z.Rep001
open BOMA.Z.Rep001.ZSigned

/-- The direct sign/magnitude order and pair cross-sum order agree pointwise.

The proof is deliberately case-explicit. Earlier `simp`-based closure rewrote
Iff-valued order lemmas through proposition extensionality. Here every Iff is
consumed with `.mp`/`.mpr`, so convergence itself does not require `propext`. -/
theorem zorder_routes_converge (x y : ZSigned) : zLEd x y ↔ zLEp x y := by
  cases x with
  | zero =>
      cases y with
      | zero =>
          change True ↔ LE z z
          constructor
          · intro _
            exact le_refl z
          · intro _
            exact True.intro
      | pos b =>
          change True ↔ LE z (s b)
          constructor
          · intro _
            exact z_le (s b)
          · intro _
            exact True.intro
      | neg b =>
          change False ↔ LE (s (add z b)) z
          constructor
          · intro h
            exact False.elim h
          · intro h
            exact (not_s_le_z (add z b)) h
  | pos a =>
      cases y with
      | zero =>
          change False ↔ LE (s a) z
          constructor
          · intro h
            exact False.elim h
          · intro h
            exact (not_s_le_z a) h
      | pos b =>
          change LE a b ↔ LE (s a) (s b)
          exact le_s_iff.symm
      | neg b =>
          change False ↔ LE (s (add (s a) b)) z
          constructor
          · intro h
            exact False.elim h
          · intro h
            exact (not_s_le_z (add (s a) b)) h
  | neg a =>
      cases y with
      | zero =>
          change True ↔ LE z (s (add z a))
          constructor
          · intro _
            exact z_le (s (add z a))
          · intro _
            exact True.intro
      | pos b =>
          change True ↔ LE z (s (add (s b) a))
          constructor
          · intro _
            exact z_le (s (add (s b) a))
          · intro _
            exact True.intro
      | neg b =>
          change LE b a ↔ LE (s (add z b)) (s (add z a))
          constructor
          · intro h
            apply le_s_iff.mpr
            rw [add_z_left b, add_z_left a]
            exact h
          · intro h
            have hbase : LE (add z b) (add z a) := le_s_iff.mp h
            rw [add_z_left b, add_z_left a] at hbase
            exact hbase

end BOMA.Z.Order001
