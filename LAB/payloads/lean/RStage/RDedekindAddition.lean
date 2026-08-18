/- Addition on selected Dedekind lower cuts and the formal RBOMA quotient. -/
namespace BOMA.R.DedekindAddition001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001

/-- Mixed non-strict/strict transitivity on accepted Q. -/
theorem qle_lt_trans {x y z : QBOMA} (hxy : qLE x y) (hyz : qLT y z) : qLT x z := by
  refine ⟨qle_trans hxy hyz.1, ?_⟩
  intro hxz
  have hzy : qLE z y := by
    have h := hxy
    rw [hxz] at h
    exact h
  have hyzEq : y = z := qle_antisymm hyz.1 hzy
  exact hyz.2 hyzEq

/-- Strict/non-strict transitivity on accepted Q. -/
theorem qlt_le_trans {x y z : QBOMA} (hxy : qLT x y) (hyz : qLE y z) : qLT x z := by
  refine ⟨qle_trans hxy.1 hyz, ?_⟩
  intro hxz
  have hyx : qLE y x := by
    have h := hyz
    rw [← hxz] at h
    exact h
  have hxyEq : x = y := qle_antisymm hxy.1 hyx
  exact hxy.2 hxyEq

/-- Addition is monotone in both accepted rational arguments. -/
theorem qadd_mono {a a' b b' : QBOMA}
    (ha : qLE a a') (hb : qLE b b') :
    qLE (qAdd a b) (qAdd a' b') := by
  have h1 : qLE (qAdd a b) (qAdd a' b) := qadd_mono_right ha b
  have h2raw : qLE (qAdd b a') (qAdd b' a') := qadd_mono_right hb a'
  have h2 : qLE (qAdd a' b) (qAdd a' b') := by
    rw [qAdd_comm a' b, qAdd_comm a' b']
    exact h2raw
  exact qle_trans h1 h2

/-- Raw Dedekind sum: q lies below A+B when it lies strictly below a+b for
some a in A and b in B. -/
def cutAdd (A B : LowerCut) : LowerCut where
  lower := fun q =>
    ∃ a b : QBOMA, A.lower a ∧ B.lower b ∧ qLT q (qAdd a b)
  nonempty := by
    rcases A.nonempty with ⟨a, ha⟩
    rcases B.nonempty with ⟨b, hb⟩
    let s := qAdd a b
    let q := qAdd s (qNeg qOne)
    refine ⟨q, a, b, ha, hb, ?_⟩
    change qLT (qAdd s (qNeg qOne)) s
    exact BOMA.R.DedekindProbe001.q_minus_one_lt s
  proper := by
    rcases A.proper with ⟨uA, huA⟩
    rcases B.proper with ⟨uB, huB⟩
    refine ⟨qAdd uA uB, ?_⟩
    intro hsum
    rcases hsum with ⟨a, b, ha, hb, hstrict⟩
    have haU : qLE a uA := by
      rcases qle_total a uA with h | h
      · exact h
      · exact False.elim (huA (A.downward ha h))
    have hbU : qLE b uB := by
      rcases qle_total b uB with h | h
      · exact h
      · exact False.elim (huB (B.downward hb h))
    have habU : qLE (qAdd a b) (qAdd uA uB) := qadd_mono haU hbU
    have heq : qAdd uA uB = qAdd a b := qle_antisymm hstrict.1 habU
    exact hstrict.2 heq
  downward := by
    intro p q hq hpq
    rcases hq with ⟨a, b, ha, hb, hqsum⟩
    exact ⟨a, b, ha, hb, qle_lt_trans hpq hqsum⟩
  rounded := by
    intro q hq
    rcases hq with ⟨a, b, ha, hb, hqsum⟩
    rcases rational_order_dense hqsum with ⟨m, hqm, hmsum⟩
    exact ⟨m, ⟨a, b, ha, hb, hmsum⟩, hqm⟩

/-- Raw cut addition respects extensional identity in both inputs. -/
theorem cutAdd_respects {A A' B B' : LowerCut}
    (hA : CutEquiv A A') (hB : CutEquiv B B') :
    CutEquiv (cutAdd A B) (cutAdd A' B') := by
  intro q
  constructor
  · intro hq
    rcases hq with ⟨a, b, ha, hb, hlt⟩
    exact ⟨a, b, (hA a).mp ha, (hB b).mp hb, hlt⟩
  · intro hq
    rcases hq with ⟨a, b, ha, hb, hlt⟩
    exact ⟨a, b, (hA a).mpr ha, (hB b).mpr hb, hlt⟩

/-- Formal real addition lifted through the verified CutEquiv respect theorem. -/
def rAdd : RBOMA → RBOMA → RBOMA :=
  Quotient.lift₂
    (fun A B => rmk (cutAdd A B))
    (fun _ _ _ _ hA hB => rmk_sound (cutAdd_respects hA hB))

@[simp] theorem rAdd_mk (A B : LowerCut) :
    rAdd (rmk A) (rmk B) = rmk (cutAdd A B) := rfl

/-- Candidate real zero and one inherited from the faithful rational embedding. -/
def rZero : RBOMA := rOfQ qZero
def rOne : RBOMA := rOfQ qOne

end BOMA.R.DedekindAddition001
