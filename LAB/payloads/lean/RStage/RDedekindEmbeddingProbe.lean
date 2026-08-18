/- Deeper Dedekind-route probe: principal rational lower cuts. -/
namespace BOMA.R.DedekindProbe001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001

/-- A concrete rational predecessor q-1 lies strictly below q. -/
theorem q_minus_one_lt (q : QBOMA) : qLT (qAdd q (qNeg qOne)) q := by
  have ht := qlt_add_right qzero_lt_one (qAdd q (qNeg qOne))
  have hright : qAdd qOne (qAdd q (qNeg qOne)) = q := by
    calc
      qAdd qOne (qAdd q (qNeg qOne)) =
          qAdd qOne (qAdd (qNeg qOne) q) :=
        congrArg (fun t => qAdd qOne t) (qAdd_comm q (qNeg qOne))
      _ = qAdd (qAdd qOne (qNeg qOne)) q :=
        (qAdd_assoc qOne (qNeg qOne) q).symm
      _ = qAdd qZero q := by rw [qAdd_neg_right]
      _ = q := qAdd_zero_left q
  rw [qAdd_zero_left, hright] at ht
  exact ht

/-- Principal lower cut associated with an accepted rational q. -/
def principalCut (q : QBOMA) : LowerCut where
  lower := fun a => qLT a q
  nonempty := ⟨qAdd q (qNeg qOne), q_minus_one_lt q⟩
  proper := ⟨q, qlt_irrefl q⟩
  downward := by
    intro a b hb hab
    refine ⟨qle_trans hab hb.1, ?_⟩
    intro haq
    rw [haq] at hab
    have hbq : b = q := qle_antisymm hb.1 hab
    exact hb.2 hbq
  rounded := by
    intro a ha
    rcases rational_order_dense ha with ⟨b, hab, hbq⟩
    exact ⟨b, hbq, hab⟩

/-- Principal-cut representation preserves rational equality. -/
theorem principalCut_preserves {q r : QBOMA} (h : q = r) :
    CutEquiv (principalCut q) (principalCut r) := by
  cases h
  exact cutEquiv_refl _

/-- Principal-cut representation reflects rational equality at the external
CutEquiv layer. This uses internal Q density, making the dependency explicit. -/
theorem principalCut_reflects {q r : QBOMA}
    (h : CutEquiv (principalCut q) (principalCut r)) : q = r := by
  rcases qlt_trichotomy q r with hqr | heq | hrq
  · rcases rational_order_dense hqr with ⟨m, hqm, hmr⟩
    have hmR : (principalCut r).lower m := hmr
    have hmQ : (principalCut q).lower m := (h m).2 hmR
    exact False.elim ((qlt_asymm hqm) hmQ)
  · exact heq
  · rcases rational_order_dense hrq with ⟨m, hrm, hmq⟩
    have hmQ : (principalCut q).lower m := hmq
    have hmR : (principalCut r).lower m := (h m).1 hmQ
    exact False.elim ((qlt_asymm hrm) hmR)

/-- Inclusion relation restricted to principal rational cuts. -/
def PrincipalLE (q r : QBOMA) : Prop :=
  ∀ a : QBOMA, (principalCut q).lower a → (principalCut r).lower a

/-- Principal-cut inclusion is exactly the accepted rational non-strict order. -/
theorem principalLE_iff_qLE (q r : QBOMA) : PrincipalLE q r ↔ qLE q r := by
  constructor
  · intro hInc
    by_cases hqr : qLE q r
    · exact hqr
    · rcases qle_total q r with hqr' | hrq
      · exact False.elim (hqr hqr')
      · have hrneq : r ≠ q := by
          intro heq
          apply hqr
          rw [← heq]
          exact qle_refl r
        have hrltq : qLT r q := ⟨hrq, hrneq⟩
        rcases rational_order_dense hrltq with ⟨m, hrm, hmq⟩
        have hmQ : (principalCut q).lower m := hmq
        have hmR : (principalCut r).lower m := hInc m hmQ
        exact False.elim ((qlt_asymm hrm) hmR)
  · intro hqr a haq
    refine ⟨qle_trans haq.1 hqr, ?_⟩
    intro har
    have hqa : qLE q a := by
      rw [har]
      exact hqr
    have hqaEq : q = a := qle_antisymm hqa haq.1
    exact haq.2 hqaEq.symm

end BOMA.R.DedekindProbe001
