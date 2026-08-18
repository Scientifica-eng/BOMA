/- Additive-inverse certification for the verified Dedekind negation candidate. -/
namespace BOMA.R.DedekindAdditiveInverse001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindAdditionEmbedding001
open BOMA.R.DedekindAdditionLaws001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindCutBracket001

/-- Rational negation fixes zero. -/
theorem qNeg_zero : qNeg qZero = qZero := by
  have h : qZero = qNeg qZero :=
    qAdd_inverse_unique (x := qZero) (y := qZero) (qAdd_zero_left qZero)
  exact h.symm

/-- Any member of A + (-A) is strictly below rational zero. This direction
uses no Archimedean bracketing theorem. -/
theorem cutAdd_neg_to_zero (A : LowerCut) {x : QBOMA}
    (hx : (cutAdd A (cutNeg A)).lower x) :
    (principalCut qZero).lower x := by
  rcases hx with ⟨a, b, ha, hbNeg, hxab⟩
  rcases hbNeg with ⟨r, hrOut, hbr⟩
  have har : qLE a r := by
    rcases qle_total a r with har | hra
    · exact har
    · exact False.elim (hrOut (A.downward ha hra))
  have habar : qLT (qAdd a b) (qAdd a (qNeg r)) := by
    have ht := qlt_add_right hbr a
    rw [qAdd_comm b a, qAdd_comm (qNeg r) a] at ht
    exact ht
  have har0 : qLE (qAdd a (qNeg r)) qZero := by
    have ht := qadd_mono_right har (qNeg r)
    rw [qAdd_neg_right] at ht
    exact ht
  exact qlt_le_trans (qlt_trans hxab habar) har0

/-- If x is strictly below zero, the fine cut-bracketing theorem supplies
witnesses showing x belongs to A + (-A). This is the direction that consumes
R-QARCH-BLOCK-001 through cut_bracket_approx. -/
theorem zero_to_cutAdd_neg (A : LowerCut) {x : QBOMA}
    (hx : (principalCut qZero).lower x) :
    (cutAdd A (cutNeg A)).lower x := by
  have hposNegX : qLT qZero (qNeg x) := by
    have ht := qneg_strict_reverses hx
    rw [qNeg_zero] at ht
    exact ht
  rcases cut_bracket_approx A (qNeg x) hposNegX with
    ⟨b, r, hb, hrOut, _hwidthPos, hwidthLt⟩
  have hx_bminusr : qLT x (qAdd b (qNeg r)) := by
    have ht := qneg_strict_reverses hwidthLt
    have hleft : qNeg (qNeg x) = x := qNeg_involutive x
    have hright : qNeg (qAdd r (qNeg b)) = qAdd b (qNeg r) := by
      rw [qNeg_add, qNeg_involutive]
      exact qAdd_comm (qNeg r) b
    rw [hleft, hright] at ht
    exact ht
  have hxb_negr : qLT (qAdd x (qNeg b)) (qNeg r) := by
    have ht := qlt_add_right hx_bminusr (qNeg b)
    have hright : qAdd (qAdd b (qNeg r)) (qNeg b) = qNeg r := by
      calc
        qAdd (qAdd b (qNeg r)) (qNeg b) =
            qAdd b (qAdd (qNeg r) (qNeg b)) :=
          qAdd_assoc b (qNeg r) (qNeg b)
        _ = qAdd b (qAdd (qNeg b) (qNeg r)) :=
          congrArg (fun t => qAdd b t) (qAdd_comm (qNeg r) (qNeg b))
        _ = qAdd (qAdd b (qNeg b)) (qNeg r) :=
          (qAdd_assoc b (qNeg b) (qNeg r)).symm
        _ = qAdd qZero (qNeg r) := by rw [qAdd_neg_right]
        _ = qNeg r := qAdd_zero_left _
    rw [hright] at ht
    exact ht
  rcases rational_order_dense hxb_negr with ⟨c, hxc, hcr⟩
  have hcNeg : (cutNeg A).lower c := ⟨r, hrOut, hcr⟩
  have hxsum : qLT x (qAdd b c) := qlt_add_back_left hxc
  exact ⟨b, c, hb, hcNeg, hxsum⟩

/-- Raw Dedekind addition with the verified negation candidate is extensionally
exactly the principal zero cut. -/
theorem cutAdd_neg_equiv_zero (A : LowerCut) :
    CutEquiv (cutAdd A (cutNeg A)) (principalCut qZero) := by
  intro x
  constructor
  · exact cutAdd_neg_to_zero A
  · exact zero_to_cutAdd_neg A

/-- The verified negation candidate is a right additive inverse on formal RBOMA. -/
theorem rAdd_neg_right (x : RBOMA) :
    rAdd x (rNeg x) = rZero := by
  refine Quotient.inductionOn x ?_
  intro A
  change rmk (cutAdd A (cutNeg A)) = rmk (principalCut qZero)
  exact rmk_sound (cutAdd_neg_equiv_zero A)

/-- By commutativity, it is also a left additive inverse. -/
theorem rAdd_neg_left (x : RBOMA) :
    rAdd (rNeg x) x = rZero := by
  calc
    rAdd (rNeg x) x = rAdd x (rNeg x) := rAdd_comm (rNeg x) x
    _ = rZero := rAdd_neg_right x

/-- Additive cancellation is now available on RBOMA. -/
theorem rAdd_left_cancel {a b c : RBOMA}
    (h : rAdd a b = rAdd a c) : b = c := by
  have h' := congrArg (fun t => rAdd (rNeg a) t) h
  calc
    b = rAdd rZero b := (rAdd_zero_left b).symm
    _ = rAdd (rAdd (rNeg a) a) b := by rw [rAdd_neg_left]
    _ = rAdd (rNeg a) (rAdd a b) := rAdd_assoc (rNeg a) a b
    _ = rAdd (rNeg a) (rAdd a c) := h'
    _ = rAdd (rAdd (rNeg a) a) c := (rAdd_assoc (rNeg a) a c).symm
    _ = rAdd rZero c := by rw [rAdd_neg_left]
    _ = c := rAdd_zero_left c

/-- Additive inverses are unique on the accepted real additive group. -/
theorem rAdd_inverse_unique {x y : RBOMA}
    (h : rAdd x y = rZero) : y = rNeg x := by
  apply rAdd_left_cancel (a := x)
  calc
    rAdd x y = rZero := h
    _ = rAdd x (rNeg x) := (rAdd_neg_right x).symm

/-- Real negation is involutive after inverse certification. -/
theorem rNeg_involutive (x : RBOMA) : rNeg (rNeg x) = x := by
  symm
  exact rAdd_inverse_unique
    (x := rNeg x)
    (y := x)
    (rAdd_neg_left x)

end BOMA.R.DedekindAdditiveInverse001
