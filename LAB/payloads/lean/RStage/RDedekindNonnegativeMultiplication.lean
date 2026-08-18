/- Multiplication kernel for nonnegative Dedekind envelopes.
This is not yet the final signed real multiplication. -/
namespace BOMA.R.DedekindNonnegativeMul001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindPositivePart001

/-- Any point outside max(A,0) is rationally nonnegative. -/
theorem outside_posPart_nonneg (A : LowerCut) {u : QBOMA}
    (hu : ¬ (cutPosPart A).lower u) : qLE qZero u := by
  rcases qlt_trichotomy u qZero with hneg | heq | hpos
  · exact False.elim (hu (Or.inr hneg))
  · rw [heq]
    exact qle_refl qZero
  · exact hpos.1

/-- Every member of a lower cut lies below every point known outside it. -/
theorem member_le_outside {P : LowerCut} {a u : QBOMA}
    (ha : P.lower a) (hu : ¬ P.lower u) : qLE a u := by
  rcases qle_total a u with hau | hua
  · exact hau
  · exact False.elim (hu (P.downward ha hua))

/-- Positive-envelope product.
Negative rationals are included automatically; nonnegative content is generated
strictly below products of positive witnesses from the two positive envelopes. -/
def cutMulNonnegEnvelope (A B : LowerCut) : LowerCut where
  lower := fun q =>
    qLT q qZero ∨
    ∃ a b : QBOMA,
      (cutPosPart A).lower a ∧
      (cutPosPart B).lower b ∧
      qLT qZero a ∧
      qLT qZero b ∧
      qLT q (qMul a b)
  nonempty := by
    let m := qAdd qZero (qNeg qOne)
    refine ⟨m, Or.inl ?_⟩
    exact BOMA.R.DedekindProbe001.q_minus_one_lt qZero
  proper := by
    rcases (cutPosPart A).proper with ⟨uA, huA⟩
    rcases (cutPosPart B).proper with ⟨uB, huB⟩
    let U := qAdd uA qOne
    let V := qAdd uB qOne
    let M := qAdd (qMul U V) qOne
    have h0uA : qLE qZero uA := outside_posPart_nonneg A huA
    have h0uB : qLE qZero uB := outside_posPart_nonneg B huB
    have huA_U : qLE uA U := by
      have h := qadd_mono_right qzero_le_one uA
      change qLE (qAdd qZero uA) (qAdd qOne uA) at h
      rw [qAdd_zero_left, qAdd_comm qOne uA] at h
      exact h
    have huB_V : qLE uB V := by
      have h := qadd_mono_right qzero_le_one uB
      change qLE (qAdd qZero uB) (qAdd qOne uB) at h
      rw [qAdd_zero_left, qAdd_comm qOne uB] at h
      exact h
    have h0U : qLE qZero U := qle_trans h0uA huA_U
    have h0V : qLE qZero V := qle_trans h0uB huB_V
    have h0UV : qLE qZero (qMul U V) := qmul_nonneg h0U h0V
    have hUV_M : qLT (qMul U V) M := by
      have h := qlt_add_right qzero_lt_one (qMul U V)
      change qLT (qAdd qZero (qMul U V)) (qAdd qOne (qMul U V)) at h
      rw [qAdd_zero_left, qAdd_comm qOne (qMul U V)] at h
      exact h
    have h0M : qLT qZero M :=
      BOMA.R.DedekindAddition001.qle_lt_trans h0UV hUV_M
    refine ⟨M, ?_⟩
    intro hM
    rcases hM with hMneg | hMprod
    · exact qlt_asymm h0M hMneg
    · rcases hMprod with ⟨a, b, ha, hb, h0a, h0b, hMab⟩
      have ha_uA : qLE a uA := member_le_outside ha huA
      have hb_uB : qLE b uB := member_le_outside hb huB
      have haU : qLE a U := qle_trans ha_uA huA_U
      have hbV : qLE b V := qle_trans hb_uB huB_V
      have hab_Ub : qLE (qMul a b) (qMul U b) := by
        have h := qmul_mono_left_nonneg haU h0b.1
        rw [qMul_comm b a, qMul_comm b U] at h
        exact h
      have hUb_UV : qLE (qMul U b) (qMul U V) :=
        qmul_mono_left_nonneg hbV h0U
      have hab_UV : qLE (qMul a b) (qMul U V) :=
        qle_trans hab_Ub hUb_UV
      have hMUV : qLT M (qMul U V) :=
        BOMA.R.DedekindAddition001.qlt_le_trans hMab hab_UV
      exact qlt_asymm hUV_M hMUV
  downward := by
    intro p q hq hpq
    rcases hq with hqNeg | hqProd
    · exact Or.inl (BOMA.R.DedekindAddition001.qle_lt_trans hpq hqNeg)
    · rcases hqProd with ⟨a, b, ha, hb, h0a, h0b, hq⟩
      exact Or.inr ⟨a, b, ha, hb, h0a, h0b,
        BOMA.R.DedekindAddition001.qle_lt_trans hpq hq⟩
  rounded := by
    intro q hq
    rcases hq with hqNeg | hqProd
    · rcases rational_order_dense hqNeg with ⟨r, hqr, hr0⟩
      exact ⟨r, Or.inl hr0, hqr⟩
    · rcases hqProd with ⟨a, b, ha, hb, h0a, h0b, hq⟩
      rcases rational_order_dense hq with ⟨r, hqr, hrab⟩
      exact ⟨r, Or.inr ⟨a, b, ha, hb, h0a, h0b, hrab⟩, hqr⟩

/-- The nonnegative-envelope product respects extensional identity. -/
theorem cutMulNonnegEnvelope_respects
    {A A' B B' : LowerCut}
    (hA : CutEquiv A A') (hB : CutEquiv B B') :
    CutEquiv
      (cutMulNonnegEnvelope A B)
      (cutMulNonnegEnvelope A' B') := by
  intro q
  constructor
  · intro hq
    rcases hq with hneg | hprod
    · exact Or.inl hneg
    · rcases hprod with ⟨a, b, ha, hb, h0a, h0b, hq⟩
      have hPA := cutPosPart_respects hA
      have hPB := cutPosPart_respects hB
      exact Or.inr ⟨a, b, (hPA a).mp ha, (hPB b).mp hb, h0a, h0b, hq⟩
  · intro hq
    rcases hq with hneg | hprod
    · exact Or.inl hneg
    · rcases hprod with ⟨a, b, ha, hb, h0a, h0b, hq⟩
      have hPA := cutPosPart_respects hA
      have hPB := cutPosPart_respects hB
      exact Or.inr ⟨a, b, (hPA a).mpr ha, (hPB b).mpr hb, h0a, h0b, hq⟩

/-- Symmetry of the nonnegative multiplication kernel. -/
theorem cutMulNonnegEnvelope_comm (A B : LowerCut) :
    CutEquiv (cutMulNonnegEnvelope A B) (cutMulNonnegEnvelope B A) := by
  intro q
  constructor
  · intro hq
    rcases hq with hneg | hprod
    · exact Or.inl hneg
    · rcases hprod with ⟨a, b, ha, hb, h0a, h0b, hq⟩
      have hq' : qLT q (qMul b a) := by
        rw [qMul_comm b a]
        exact hq
      exact Or.inr ⟨b, a, hb, ha, h0b, h0a, hq'⟩
  · intro hq
    rcases hq with hneg | hprod
    · exact Or.inl hneg
    · rcases hprod with ⟨b, a, hb, ha, h0b, h0a, hq⟩
      have hq' : qLT q (qMul a b) := by
        rw [qMul_comm a b]
        exact hq
      exact Or.inr ⟨a, b, ha, hb, h0a, h0b, hq'⟩

/-- Quotient lift of the nonnegative-envelope kernel. This is an intermediate
operation, not yet the final signed real multiplication. -/
def rMulNonnegEnvelope : RBOMA → RBOMA → RBOMA :=
  Quotient.lift₂
    (fun A B => rmk (cutMulNonnegEnvelope A B))
    (fun _ _ _ _ hA hB => rmk_sound (cutMulNonnegEnvelope_respects hA hB))

@[simp] theorem rMulNonnegEnvelope_mk (A B : LowerCut) :
    rMulNonnegEnvelope (rmk A) (rmk B) = rmk (cutMulNonnegEnvelope A B) := rfl

/-- The intermediate kernel is commutative. -/
theorem rMulNonnegEnvelope_comm (x y : RBOMA) :
    rMulNonnegEnvelope x y = rMulNonnegEnvelope y x := by
  refine Quotient.inductionOn x ?_
  intro A
  refine Quotient.inductionOn y ?_
  intro B
  change rmk (cutMulNonnegEnvelope A B) = rmk (cutMulNonnegEnvelope B A)
  exact rmk_sound (cutMulNonnegEnvelope_comm A B)

end BOMA.R.DedekindNonnegativeMul001
