/- Additive laws for the selected Dedekind real operation, before negation. -/
namespace BOMA.R.DedekindAdditionLaws001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindAdditionEmbedding001

/-- Raw Dedekind addition is commutative up to extensional cut identity. -/
theorem cutAdd_comm_equiv (A B : LowerCut) :
    CutEquiv (cutAdd A B) (cutAdd B A) := by
  intro x
  constructor
  · rintro ⟨a, b, ha, hb, hxab⟩
    have hxba : qLT x (qAdd b a) := by
      rw [qAdd_comm b a]
      exact hxab
    exact ⟨b, a, hb, ha, hxba⟩
  · rintro ⟨b, a, hb, ha, hxba⟩
    have hxab : qLT x (qAdd a b) := by
      rw [qAdd_comm a b]
      exact hxba
    exact ⟨a, b, ha, hb, hxab⟩

/-- The principal zero cut is a left identity for raw Dedekind addition. -/
theorem cutAdd_zero_left_equiv (A : LowerCut) :
    CutEquiv (cutAdd (principalCut qZero) A) A := by
  intro x
  constructor
  · rintro ⟨a, b, ha0, hb, hxab⟩
    have hab : qLE (qAdd a b) b := by
      have hmono := qadd_mono ha0.1 (qle_refl b)
      rw [qAdd_zero_left] at hmono
      exact hmono
    have hxb : qLT x b := qlt_le_trans hxab hab
    exact A.downward hb hxb.1
  · intro hxA
    rcases A.rounded x hxA with ⟨b, hbA, hxb⟩
    have hx0 : qLT (qAdd x (qNeg b)) qZero := by
      have ht : qLT (qAdd x (qNeg b)) qZero := by
        have hz : qAdd qZero b = b := qAdd_zero_left b
        have h0 := qlt_sub_right_of_lt_add (q := qZero) (r := b) (by
          rw [hz]
          exact hxb)
        exact h0
      exact ht
    rcases rational_order_dense hx0 with ⟨a, hxa, ha0⟩
    have hxab : qLT x (qAdd a b) := qlt_add_back_right hxa
    exact ⟨a, b, ha0, hbA, hxab⟩

/-- The principal zero cut is also a right identity. -/
theorem cutAdd_zero_right_equiv (A : LowerCut) :
    CutEquiv (cutAdd A (principalCut qZero)) A := by
  exact cutEquiv_trans
    (cutAdd_comm_equiv A (principalCut qZero))
    (cutAdd_zero_left_equiv A)

/-- Raw Dedekind addition is associative up to extensional cut identity. -/
theorem cutAdd_assoc_equiv (A B C : LowerCut) :
    CutEquiv (cutAdd (cutAdd A B) C) (cutAdd A (cutAdd B C)) := by
  intro x
  constructor
  · rintro ⟨s, c, hsAB, hc, hxsc⟩
    rcases hsAB with ⟨a, b, ha, hb, hsab⟩
    have hscABC : qLT (qAdd s c) (qAdd a (qAdd b c)) := by
      have ht := qlt_add_right hsab c
      rw [qAdd_assoc a b c] at ht
      exact ht
    have hxABC : qLT x (qAdd a (qAdd b c)) := qlt_trans hxsc hscABC
    have hxbc : qLT (qAdd x (qNeg a)) (qAdd b c) :=
      qlt_sub_left_of_lt_add hxABC
    rcases rational_order_dense hxbc with ⟨t, hxt, htbc⟩
    have htBC : (cutAdd B C).lower t := ⟨b, c, hb, hc, htbc⟩
    have hxat : qLT x (qAdd a t) := qlt_add_back_left hxt
    exact ⟨a, t, ha, htBC, hxat⟩
  · rintro ⟨a, t, ha, htBC, hxat⟩
    rcases htBC with ⟨b, c, hb, hc, htbc⟩
    have hatABC : qLT (qAdd a t) (qAdd a (qAdd b c)) := by
      have ht := qlt_add_right htbc a
      have hleft : qAdd t a = qAdd a t := qAdd_comm t a
      have hright : qAdd (qAdd b c) a = qAdd a (qAdd b c) :=
        qAdd_comm (qAdd b c) a
      rw [hleft, hright] at ht
      exact ht
    have hxABC : qLT x (qAdd a (qAdd b c)) := qlt_trans hxat hatABC
    have hxAssoc : qLT x (qAdd (qAdd a b) c) := by
      rw [qAdd_assoc a b c]
      exact hxABC
    have hxab : qLT (qAdd x (qNeg c)) (qAdd a b) :=
      qlt_sub_right_of_lt_add hxAssoc
    rcases rational_order_dense hxab with ⟨s, hxs, hsab⟩
    have hsAB : (cutAdd A B).lower s := ⟨a, b, ha, hb, hsab⟩
    have hxsc : qLT x (qAdd s c) := qlt_add_back_right hxs
    exact ⟨s, c, hsAB, hc, hxsc⟩

/-- Formal real addition is commutative. -/
theorem rAdd_comm (x y : RBOMA) : rAdd x y = rAdd y x := by
  refine Quotient.inductionOn x ?_
  intro A
  refine Quotient.inductionOn y ?_
  intro B
  change rmk (cutAdd A B) = rmk (cutAdd B A)
  exact rmk_sound (cutAdd_comm_equiv A B)

/-- Formal real addition is associative. -/
theorem rAdd_assoc (x y z : RBOMA) :
    rAdd (rAdd x y) z = rAdd x (rAdd y z) := by
  refine Quotient.inductionOn x ?_
  intro A
  refine Quotient.inductionOn y ?_
  intro B
  refine Quotient.inductionOn z ?_
  intro C
  change rmk (cutAdd (cutAdd A B) C) = rmk (cutAdd A (cutAdd B C))
  exact rmk_sound (cutAdd_assoc_equiv A B C)

/-- Formal real zero is a left additive identity. -/
@[simp] theorem rAdd_zero_left (x : RBOMA) : rAdd rZero x = x := by
  refine Quotient.inductionOn x ?_
  intro A
  change rmk (cutAdd (principalCut qZero) A) = rmk A
  exact rmk_sound (cutAdd_zero_left_equiv A)

/-- Formal real zero is a right additive identity. -/
@[simp] theorem rAdd_zero_right (x : RBOMA) : rAdd x rZero = x := by
  calc
    rAdd x rZero = rAdd rZero x := rAdd_comm x rZero
    _ = x := rAdd_zero_left x

end BOMA.R.DedekindAdditionLaws001
