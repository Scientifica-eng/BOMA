/- Algebraic laws for the nonnegative-envelope Dedekind multiplication kernel.
These laws are proved before lifting the selected signed multiplication candidate. -/
namespace BOMA.R.DedekindNonnegativeMulLaws001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindPositivePart001
open BOMA.R.DedekindNonnegativeMul001
open BOMA.R.QPositiveMultiplicativeApprox001

/-- The principal zero cut is included in every nonnegative multiplication kernel. -/
theorem cutZero_le_mulNonneg (A B : LowerCut) :
    CutLE (principalCut qZero) (cutMulNonnegEnvelope A B) := by
  intro q hq
  exact Or.inl hq

/-- A nonnegative multiplication kernel is already fixed by positive-envelope closure. -/
theorem cutPosPart_mulNonneg (A B : LowerCut) :
    CutEquiv
      (cutPosPart (cutMulNonnegEnvelope A B))
      (cutMulNonnegEnvelope A B) :=
  cutPosPart_of_nonneg (cutZero_le_mulNonneg A B)

/-- Zero annihilates the nonnegative kernel on the left. -/
theorem cutMulNonnegEnvelope_zero_left (A : LowerCut) :
    CutEquiv
      (cutMulNonnegEnvelope (principalCut qZero) A)
      (principalCut qZero) := by
  intro q
  constructor
  · intro hq
    rcases hq with hqNeg | hqProd
    · exact hqNeg
    · rcases hqProd with ⟨a, _b, ha, _hb, h0a, _h0b, _hq⟩
      have haNeg : qLT a qZero := by
        rcases ha with ha0 | ha0
        · exact ha0
        · exact ha0
      exact False.elim ((qlt_asymm h0a) haNeg)
  · intro hq
    exact Or.inl hq

/-- Zero annihilates the nonnegative kernel on the right. -/
theorem cutMulNonnegEnvelope_zero_right (A : LowerCut) :
    CutEquiv
      (cutMulNonnegEnvelope A (principalCut qZero))
      (principalCut qZero) :=
  cutEquiv_trans
    (cutMulNonnegEnvelope_comm A (principalCut qZero))
    (cutMulNonnegEnvelope_zero_left A)

@[simp] theorem rMulNonnegEnvelope_zero_left (x : RBOMA) :
    rMulNonnegEnvelope rZero x = rZero := by
  refine Quotient.inductionOn x ?_
  intro A
  change
    rmk (cutMulNonnegEnvelope (principalCut qZero) A) =
    rmk (principalCut qZero)
  exact rmk_sound (cutMulNonnegEnvelope_zero_left A)

@[simp] theorem rMulNonnegEnvelope_zero_right (x : RBOMA) :
    rMulNonnegEnvelope x rZero = rZero := by
  rw [rMulNonnegEnvelope_comm]
  exact rMulNonnegEnvelope_zero_left x

/-- A rational is either strictly negative or nonnegative. This packages the
sign split needed only inside proof logic, not in the multiplication definition. -/
theorem qlt_zero_or_nonneg (q : QBOMA) :
    qLT q qZero ∨ qLE qZero q := by
  rcases qlt_trichotomy q qZero with hneg | heq | hpos
  · exact Or.inl hneg
  · right
    rw [heq]
    exact qle_refl qZero
  · exact Or.inr hpos.1

/-- Multiplying the principal one cut by an arbitrary input returns the
positive envelope of that input. This is the correct unit law for the
nonnegative kernel before the signed decomposition is reassembled. -/
theorem cutMulNonnegEnvelope_one_left (A : LowerCut) :
    CutEquiv
      (cutMulNonnegEnvelope (principalCut qOne) A)
      (cutPosPart A) := by
  intro q
  constructor
  · intro hq
    rcases hq with hqNeg | hqProd
    · exact Or.inr hqNeg
    · rcases hqProd with ⟨a, b, ha, hb, h0a, h0b, hqab⟩
      have ha1 : qLT a qOne := by
        rcases ha with ha1 | ha0
        · exact ha1
        · exact qlt_trans ha0 qzero_lt_one
      have hab_b : qLT (qMul a b) b := by
        have ht := qmul_lt_right_positive ha1 h0b
        rw [qMul_one_left] at ht
        exact ht
      have hqb : qLT q b := qlt_trans hqab hab_b
      exact (cutPosPart A).downward hb hqb.1
  · intro hq
    rcases qlt_zero_or_nonneg q with hqNeg | h0q
    · exact Or.inl hqNeg
    · rcases (cutPosPart A).rounded hq with ⟨b, hb, hqb⟩
      have h0b : qLT qZero b := qlt_zero_of_nonneg_lt h0q hqb
      have hq1b : qLT q (qMul qOne b) := by
        rw [qMul_one_left]
        exact hqb
      rcases q_positive_product_inner_approx h0q h0b hq1b with
        ⟨a, b', h0a, ha1, h0b', hb'b, hqab'⟩
      have ha : (cutPosPart (principalCut qOne)).lower a :=
        Or.inl ha1
      have hb' : (cutPosPart A).lower b' :=
        (cutPosPart A).downward hb hb'b.1
      exact Or.inr ⟨a, b', ha, hb', h0a, h0b', hqab'⟩

/-- Right one law for the nonnegative kernel. -/
theorem cutMulNonnegEnvelope_one_right (A : LowerCut) :
    CutEquiv
      (cutMulNonnegEnvelope A (principalCut qOne))
      (cutPosPart A) :=
  cutEquiv_trans
    (cutMulNonnegEnvelope_comm A (principalCut qOne))
    (cutMulNonnegEnvelope_one_left A)

theorem rMulNonnegEnvelope_one_left (x : RBOMA) :
    rMulNonnegEnvelope rOne x = rPosPart x := by
  refine Quotient.inductionOn x ?_
  intro A
  change
    rmk (cutMulNonnegEnvelope (principalCut qOne) A) =
    rmk (cutPosPart A)
  exact rmk_sound (cutMulNonnegEnvelope_one_left A)

theorem rMulNonnegEnvelope_one_right (x : RBOMA) :
    rMulNonnegEnvelope x rOne = rPosPart x := by
  rw [rMulNonnegEnvelope_comm]
  exact rMulNonnegEnvelope_one_left x

/-- Associativity of the nonnegative-envelope kernel.
The strict witness semantics requires a fresh interior witness when reassociating;
that witness is supplied by the previously certified Q multiplicative-approximation interface. -/
theorem cutMulNonnegEnvelope_assoc (A B C : LowerCut) :
    CutEquiv
      (cutMulNonnegEnvelope (cutMulNonnegEnvelope A B) C)
      (cutMulNonnegEnvelope A (cutMulNonnegEnvelope B C)) := by
  intro q
  constructor
  · intro hq
    rcases hq with hqNeg | hqProd
    · exact Or.inl hqNeg
    · rcases hqProd with ⟨u, c, huPosPart, hc, h0u, h0c, hquc⟩
      have huK : (cutMulNonnegEnvelope A B).lower u :=
        ((cutPosPart_mulNonneg A B) u).mp huPosPart
      rcases huK with huNeg | huProd
      · exact False.elim ((qlt_asymm h0u) huNeg)
      · rcases huProd with ⟨a, b, ha, hb, h0a, h0b, huab⟩
        have huc_abc : qLT (qMul u c) (qMul (qMul a b) c) :=
          qmul_lt_right_positive huab h0c
        have hq_abc0 : qLT q (qMul (qMul a b) c) :=
          qlt_trans hquc huc_abc
        have hq_abc : qLT q (qMul a (qMul b c)) := by
          rw [← qMul_assoc a b c]
          exact hq_abc0
        rcases qlt_zero_or_nonneg q with hq0 | h0q
        · exact Or.inl hq0
        · have hbcPos : qLT qZero (qMul b c) := by
            have ht := qmul_lt_right_positive h0b h0c
            rw [qMul_zero_left] at ht
            exact ht
          rcases q_positive_product_inner_approx h0q hbcPos hq_abc with
            ⟨a', w, h0a', ha'a, h0w, hwbc, hqaw⟩
          have ha' : (cutPosPart A).lower a' :=
            (cutPosPart A).downward ha ha'a.1
          have hwK : (cutMulNonnegEnvelope B C).lower w :=
            Or.inr ⟨b, c, hb, hc, h0b, h0c, hwbc⟩
          have hwPosPart :
              (cutPosPart (cutMulNonnegEnvelope B C)).lower w :=
            Or.inl hwK
          exact Or.inr ⟨a', w, ha', hwPosPart, h0a', h0w, hqaw⟩
  · intro hq
    rcases hq with hqNeg | hqProd
    · exact Or.inl hqNeg
    · rcases hqProd with ⟨a, v, ha, hvPosPart, h0a, h0v, hqav⟩
      have hvK : (cutMulNonnegEnvelope B C).lower v :=
        ((cutPosPart_mulNonneg B C) v).mp hvPosPart
      rcases hvK with hvNeg | hvProd
      · exact False.elim ((qlt_asymm h0v) hvNeg)
      · rcases hvProd with ⟨b, c, hb, hc, h0b, h0c, hvbc⟩
        have hav_abc : qLT (qMul a v) (qMul a (qMul b c)) :=
          qmul_lt_left_positive hvbc h0a
        have hq_abc0 : qLT q (qMul a (qMul b c)) :=
          qlt_trans hqav hav_abc
        have hq_abc : qLT q (qMul (qMul a b) c) := by
          rw [qMul_assoc a b c]
          exact hq_abc0
        rcases qlt_zero_or_nonneg q with hq0 | h0q
        · exact Or.inl hq0
        · rcases q_positive_product_inner_approx h0q h0c hq_abc with
            ⟨u, c', h0u, huab, h0c', hc'c, hquc'⟩
          have huK : (cutMulNonnegEnvelope A B).lower u :=
            Or.inr ⟨a, b, ha, hb, h0a, h0b, huab⟩
          have huPosPart :
              (cutPosPart (cutMulNonnegEnvelope A B)).lower u :=
            Or.inl huK
          have hc' : (cutPosPart C).lower c' :=
            (cutPosPart C).downward hc hc'c.1
          exact Or.inr ⟨u, c', huPosPart, hc', h0u, h0c', hquc'⟩

/-- Quotient associativity of the nonnegative multiplication kernel. -/
theorem rMulNonnegEnvelope_assoc (x y z : RBOMA) :
    rMulNonnegEnvelope (rMulNonnegEnvelope x y) z =
    rMulNonnegEnvelope x (rMulNonnegEnvelope y z) := by
  refine Quotient.inductionOn x ?_
  intro A
  refine Quotient.inductionOn y ?_
  intro B
  refine Quotient.inductionOn z ?_
  intro C
  change
    rmk (cutMulNonnegEnvelope (cutMulNonnegEnvelope A B) C) =
    rmk (cutMulNonnegEnvelope A (cutMulNonnegEnvelope B C))
  exact rmk_sound (cutMulNonnegEnvelope_assoc A B C)

end BOMA.R.DedekindNonnegativeMulLaws001
