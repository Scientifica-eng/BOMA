/- Direct positive reciprocal candidate for the selected Dedekind route.
The lower predicate uses positive rational outside witnesses and their accepted
Q inverse witnesses. The source-positivity proof is consumed only by validity. -/
namespace BOMA.R.DedekindPositiveReciprocal001

open BOMA.Q.Quotient001
open BOMA.Q.Inverse001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.QPositiveMultiplicativeApprox001
open BOMA.R.QInverseOrder001

/-- Local non-strict/strict transitivity used to keep this reciprocal gate
independent of later R-stage helper files. -/
theorem qle_lt_trans_recip {x y z : QBOMA}
    (hxy : qLE x y) (hyz : qLT y z) : qLT x z := by
  refine ⟨qle_trans hxy hyz.1, ?_⟩
  intro hxz
  have hzy : qLE z y := by
    rw [← hxz]
    exact hxy
  have hyzEq : y = z := qle_antisymm hyz.1 hzy
  exact hyz.2 hyzEq

/-- Representation-level witness that a lower cut contains a strictly positive rational. -/
def CutHasPositive (A : LowerCut) : Prop :=
  ∃ a : QBOMA, A.lower a ∧ qLT qZero a

/-- Any inside point of a lower cut lies strictly below any outside point. -/
theorem cut_inside_lt_outside
    {A : LowerCut} {a r : QBOMA}
    (ha : A.lower a)
    (hr : ¬ A.lower r) :
    qLT a r := by
  rcases qle_total a r with har | hra
  · refine ⟨har, ?_⟩
    intro harEq
    apply hr
    rw [← harEq]
    exact ha
  · exact False.elim (hr (A.downward ha hra))

/-- Direct reciprocal lower cut for a source cut with an explicit positive-inside witness.
The `hApos` proof does not occur in the lower predicate itself. -/
def cutRecipPos (A : LowerCut) (hApos : CutHasPositive A) : LowerCut where
  lower := fun q =>
    qLT q qZero ∨
    ∃ r rinv : QBOMA,
      ¬ A.lower r ∧
      qLT qZero r ∧
      QInvRel r rinv ∧
      qLT q rinv
  nonempty := by
    have hneg : qLT (qNeg qOne) qZero := by
      have ht := qlt_add_right qzero_lt_one (qNeg qOne)
      rw [qAdd_zero_left, qAdd_neg_right] at ht
      exact ht
    exact ⟨qNeg qOne, Or.inl hneg⟩
  proper := by
    rcases hApos with ⟨a, haA, h0a⟩
    have haNZ : a ≠ qZero := by
      intro ha0
      exact h0a.2 ha0.symm
    rcases q_inverse_exists a haNZ with ⟨ainv, hainv⟩
    refine ⟨ainv, ?_⟩
    intro hain
    rcases hain with hainNeg | ⟨r, rinv, hrOut, h0r, hrinv, hain_lt_rinv⟩
    · have h0ainv : qLT qZero ainv := qlt_zero_inverse h0a hainv
      exact (qlt_asymm h0ainv) hainNeg
    · have har : qLT a r := cut_inside_lt_outside haA hrOut
      have hrev : qLT rinv ainv :=
        q_inverse_strict_antitone h0a har hainv hrinv
      exact (qlt_asymm hain_lt_rinv) hrev
  downward := by
    intro p q hq hpq
    rcases hq with hqNeg | ⟨r, rinv, hrOut, h0r, hrinv, hqInv⟩
    · exact Or.inl (qle_lt_trans_recip hpq hqNeg)
    · exact Or.inr ⟨r, rinv, hrOut, h0r, hrinv, qle_lt_trans_recip hpq hqInv⟩
  rounded := by
    intro q hq
    rcases hq with hqNeg | ⟨r, rinv, hrOut, h0r, hrinv, hqInv⟩
    · rcases rational_order_dense hqNeg with ⟨m, hqm, hm0⟩
      exact ⟨m, Or.inl hm0, hqm⟩
    · rcases rational_order_dense hqInv with ⟨m, hqm, hmInv⟩
      exact ⟨m, Or.inr ⟨r, rinv, hrOut, h0r, hrinv, hmInv⟩, hqm⟩

/-- The reciprocal candidate is independent of which proof of source positivity is supplied. -/
theorem cutRecipPos_proof_independent
    (A : LowerCut)
    (h1 h2 : CutHasPositive A) :
    CutEquiv (cutRecipPos A h1) (cutRecipPos A h2) := by
  intro q
  rfl

/-- Extensional source identity transports the positive reciprocal candidate. -/
theorem cutRecipPos_respects
    {A B : LowerCut}
    (hAB : CutEquiv A B)
    (hApos : CutHasPositive A)
    (hBpos : CutHasPositive B) :
    CutEquiv (cutRecipPos A hApos) (cutRecipPos B hBpos) := by
  intro q
  constructor
  · intro hq
    rcases hq with hqNeg | ⟨r, rinv, hrA, h0r, hrinv, hqinv⟩
    · exact Or.inl hqNeg
    · have hrB : ¬ B.lower r := by
        intro hBr
        exact hrA ((hAB r).mpr hBr)
      exact Or.inr ⟨r, rinv, hrB, h0r, hrinv, hqinv⟩
  · intro hq
    rcases hq with hqNeg | ⟨r, rinv, hrB, h0r, hrinv, hqinv⟩
    · exact Or.inl hqNeg
    · have hrA : ¬ A.lower r := by
        intro hAr
        exact hrB ((hAB r).mp hAr)
      exact Or.inr ⟨r, rinv, hrA, h0r, hrinv, hqinv⟩

end BOMA.R.DedekindPositiveReciprocal001
