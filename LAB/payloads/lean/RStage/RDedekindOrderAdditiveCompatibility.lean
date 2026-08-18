/- Additive compatibility of the selected Dedekind real order. -/
namespace BOMA.R.DedekindOrderAdditive001

open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindAdditionLaws001

/-- Cut addition is monotone under cut inclusion in both arguments. -/
theorem cutAdd_mono
    {A A' B B' : LowerCut}
    (hA : CutLE A A')
    (hB : CutLE B B') :
    CutLE (cutAdd A B) (cutAdd A' B') := by
  intro q hq
  rcases hq with ⟨a, b, ha, hb, hqab⟩
  exact ⟨a, b, hA a ha, hB b hb, hqab⟩

/-- Formal real addition is monotone in both arguments. -/
theorem rAdd_mono
    {x x' y y' : RBOMA}
    (hx : rLE x x')
    (hy : rLE y y') :
    rLE (rAdd x y) (rAdd x' y') := by
  rcases hx with ⟨A, A', hxA, hxA', hAA'⟩
  rcases hy with ⟨B, B', hyB, hyB', hBB'⟩
  refine ⟨cutAdd A B, cutAdd A' B', ?_, ?_, cutAdd_mono hAA' hBB'⟩
  · rw [hxA, hyB]
    rfl
  · rw [hxA', hyB']
    rfl

/-- Addition by a common right translate preserves order. -/
theorem rAdd_mono_right {x y : RBOMA}
    (hxy : rLE x y) (c : RBOMA) :
    rLE (rAdd x c) (rAdd y c) :=
  rAdd_mono hxy (rLE_refl c)

/-- Addition by a common left translate preserves order. -/
theorem rAdd_mono_left {x y : RBOMA}
    (hxy : rLE x y) (c : RBOMA) :
    rLE (rAdd c x) (rAdd c y) :=
  rAdd_mono (rLE_refl c) hxy

/-- The sum of two nonnegative reals is nonnegative. -/
theorem rAdd_nonneg
    {x y : RBOMA}
    (h0x : rLE rZero x)
    (h0y : rLE rZero y) :
    rLE rZero (rAdd x y) := by
  have h := rAdd_mono h0x h0y
  rw [rAdd_zero_left] at h
  exact h

/-- The sum of two nonpositive reals is nonpositive. -/
theorem rAdd_nonpos
    {x y : RBOMA}
    (hx0 : rLE x rZero)
    (hy0 : rLE y rZero) :
    rLE (rAdd x y) rZero := by
  have h := rAdd_mono hx0 hy0
  rw [rAdd_zero_left] at h
  exact h

end BOMA.R.DedekindOrderAdditive001
