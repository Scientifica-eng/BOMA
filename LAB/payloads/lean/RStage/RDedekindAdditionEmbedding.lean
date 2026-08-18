/- Rational embedding preservation for selected Dedekind real addition. -/
namespace BOMA.R.DedekindAdditionEmbedding001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001

/-- Translating x < q+r by -r yields x-r < q. -/
theorem qlt_sub_right_of_lt_add {x q r : QBOMA}
    (h : qLT x (qAdd q r)) :
    qLT (qAdd x (qNeg r)) q := by
  have ht := qlt_add_right h (qNeg r)
  have hright : qAdd (qAdd q r) (qNeg r) = q := by
    calc
      qAdd (qAdd q r) (qNeg r) = qAdd q (qAdd r (qNeg r)) :=
        qAdd_assoc q r (qNeg r)
      _ = qAdd q qZero := by rw [qAdd_neg_right]
      _ = q := qAdd_zero_right q
  rw [hright] at ht
  exact ht

/-- Translating x-r < a back by r yields x < a+r. -/
theorem qlt_add_back_right {x a r : QBOMA}
    (h : qLT (qAdd x (qNeg r)) a) :
    qLT x (qAdd a r) := by
  have ht := qlt_add_right h r
  have hleft : qAdd (qAdd x (qNeg r)) r = x := by
    calc
      qAdd (qAdd x (qNeg r)) r = qAdd x (qAdd (qNeg r) r) :=
        qAdd_assoc x (qNeg r) r
      _ = qAdd x qZero := by rw [qAdd_neg_left]
      _ = x := qAdd_zero_right x
  rw [hleft] at ht
  exact ht

/-- Translating x < a+r by -a yields x-a < r. -/
theorem qlt_sub_left_of_lt_add {x a r : QBOMA}
    (h : qLT x (qAdd a r)) :
    qLT (qAdd x (qNeg a)) r := by
  have ht := qlt_add_right h (qNeg a)
  have hright : qAdd (qAdd a r) (qNeg a) = r := by
    calc
      qAdd (qAdd a r) (qNeg a) = qAdd a (qAdd r (qNeg a)) :=
        qAdd_assoc a r (qNeg a)
      _ = qAdd a (qAdd (qNeg a) r) :=
        congrArg (fun t => qAdd a t) (qAdd_comm r (qNeg a))
      _ = qAdd (qAdd a (qNeg a)) r :=
        (qAdd_assoc a (qNeg a) r).symm
      _ = qAdd qZero r := by rw [qAdd_neg_right]
      _ = r := qAdd_zero_left r
  rw [hright] at ht
  exact ht

/-- Translating x-a < b back by a yields x < a+b. -/
theorem qlt_add_back_left {x a b : QBOMA}
    (h : qLT (qAdd x (qNeg a)) b) :
    qLT x (qAdd a b) := by
  have ht := qlt_add_right h a
  have hleft : qAdd (qAdd x (qNeg a)) a = x := by
    calc
      qAdd (qAdd x (qNeg a)) a = qAdd x (qAdd (qNeg a) a) :=
        qAdd_assoc x (qNeg a) a
      _ = qAdd x qZero := by rw [qAdd_neg_left]
      _ = x := qAdd_zero_right x
  have hright : qAdd b a = qAdd a b := qAdd_comm b a
  rw [hleft, hright] at ht
  exact ht

/-- The Dedekind sum of two principal rational cuts is extensionally the
principal cut of the accepted rational sum. -/
theorem cutAdd_principal (q r : QBOMA) :
    CutEquiv
      (cutAdd (principalCut q) (principalCut r))
      (principalCut (qAdd q r)) := by
  intro x
  constructor
  · intro hx
    rcases hx with ⟨a, b, ha, hb, hxab⟩
    have hab : qLE (qAdd a b) (qAdd q r) :=
      qadd_mono ha.1 hb.1
    exact qlt_le_trans hxab hab
  · intro hx
    have hxq : qLT (qAdd x (qNeg r)) q :=
      qlt_sub_right_of_lt_add hx
    rcases rational_order_dense hxq with ⟨a, hxa, haq⟩
    have hxar : qLT x (qAdd a r) := qlt_add_back_right hxa
    have hxr : qLT (qAdd x (qNeg a)) r :=
      qlt_sub_left_of_lt_add hxar
    rcases rational_order_dense hxr with ⟨b, hxb, hbr⟩
    have hxab : qLT x (qAdd a b) := qlt_add_back_left hxb
    exact ⟨a, b, haq, hbr, hxab⟩

/-- The accepted rational embedding into RBOMA preserves addition. -/
theorem rOfQ_add (q r : QBOMA) :
    rAdd (rOfQ q) (rOfQ r) = rOfQ (qAdd q r) := by
  change
    rmk (cutAdd (principalCut q) (principalCut r)) =
    rmk (principalCut (qAdd q r))
  exact rmk_sound (cutAdd_principal q r)

/-- The real zero spelling agrees with the rational embedding of qZero. -/
@[simp] theorem rZero_eq_rOfQ_zero : rZero = rOfQ qZero := rfl

/-- The real one spelling agrees with the rational embedding of qOne. -/
@[simp] theorem rOne_eq_rOfQ_one : rOne = rOfQ qOne := rfl

end BOMA.R.DedekindAdditionEmbedding001
