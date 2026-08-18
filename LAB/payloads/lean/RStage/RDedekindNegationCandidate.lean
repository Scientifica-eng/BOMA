/- Negation candidate on selected Dedekind lower cuts, before additive-inverse certification. -/
namespace BOMA.R.DedekindNegationCandidate001

open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001

/-- Rational negation is involutive on the accepted quotient carrier. -/
theorem qNeg_involutive (x : QBOMA) : qNeg (qNeg x) = x := by
  symm
  exact qAdd_inverse_unique
    (x := qNeg x)
    (y := x)
    (qAdd_neg_left x)

/-- Rational negation is injective. -/
theorem qNeg_injective {x y : QBOMA} (h : qNeg x = qNeg y) : x = y := by
  calc
    x = qNeg (qNeg x) := (qNeg_involutive x).symm
    _ = qNeg (qNeg y) := congrArg qNeg h
    _ = y := qNeg_involutive y

/-- Strict rational order reverses under negation. -/
theorem qneg_strict_reverses {x y : QBOMA} (h : qLT x y) :
    qLT (qNeg y) (qNeg x) := by
  refine ⟨qneg_reverses h.1, ?_⟩
  intro hneg
  have hyx : y = x := qNeg_injective hneg
  exact h.2 hyx.symm

/-- Dedekind negation candidate.
A rational q lies in -A when it lies strictly below -r for some rational r
outside A. This formulation does not require selecting a boundary point. -/
def cutNeg (A : LowerCut) : LowerCut where
  lower := fun q =>
    ∃ r : QBOMA, ¬ A.lower r ∧ qLT q (qNeg r)
  nonempty := by
    rcases A.proper with ⟨r, hr⟩
    let q := qAdd (qNeg r) (qNeg qOne)
    refine ⟨q, r, hr, ?_⟩
    change qLT (qAdd (qNeg r) (qNeg qOne)) (qNeg r)
    exact BOMA.R.DedekindProbe001.q_minus_one_lt (qNeg r)
  proper := by
    rcases A.nonempty with ⟨a, ha⟩
    refine ⟨qNeg a, ?_⟩
    rintro ⟨r, hrOut, hlt⟩
    have hraNeg : qLT (qNeg (qNeg r)) (qNeg (qNeg a)) :=
      qneg_strict_reverses hlt
    have hra : qLT r a := by
      rw [qNeg_involutive r, qNeg_involutive a] at hraNeg
      exact hraNeg
    exact hrOut (A.downward ha hra.1)
  downward := by
    intro p q hq hpq
    rcases hq with ⟨r, hrOut, hqr⟩
    exact ⟨r, hrOut, qle_lt_trans hpq hqr⟩
  rounded := by
    intro q hq
    rcases hq with ⟨r, hrOut, hqr⟩
    rcases rational_order_dense hqr with ⟨m, hqm, hmr⟩
    exact ⟨m, ⟨r, hrOut, hmr⟩, hqm⟩

/-- The negation candidate respects extensional cut identity. -/
theorem cutNeg_respects {A B : LowerCut} (hAB : CutEquiv A B) :
    CutEquiv (cutNeg A) (cutNeg B) := by
  intro q
  constructor
  · rintro ⟨r, hrA, hqr⟩
    have hrB : ¬ B.lower r := by
      intro hBr
      exact hrA ((hAB r).mpr hBr)
    exact ⟨r, hrB, hqr⟩
  · rintro ⟨r, hrB, hqr⟩
    have hrA : ¬ A.lower r := by
      intro hAr
      exact hrB ((hAB r).mp hAr)
    exact ⟨r, hrA, hqr⟩

/-- Formal negation candidate lifted to RBOMA after the respect theorem. -/
def rNeg : RBOMA → RBOMA :=
  Quotient.lift
    (fun A => rmk (cutNeg A))
    (fun _ _ h => rmk_sound (cutNeg_respects h))

@[simp] theorem rNeg_mk (A : LowerCut) :
    rNeg (rmk A) = rmk (cutNeg A) := rfl

/-- The negation of a principal rational cut is the principal cut of the
accepted rational negation. -/
theorem cutNeg_principal (q : QBOMA) :
    CutEquiv (cutNeg (principalCut q)) (principalCut (qNeg q)) := by
  intro x
  constructor
  · rintro ⟨r, hrNot, hxr⟩
    have hqr : qLE q r := by
      rcases qle_total q r with hqr | hrq
      · exact hqr
      · by_cases hEq : q = r
        · rw [hEq]
          exact qle_refl r
        · have hrltq : qLT r q :=
            ⟨hrq, fun hrqEq => hEq hrqEq.symm⟩
          exact False.elim (hrNot hrltq)
    have hneg : qLE (qNeg r) (qNeg q) := qneg_reverses hqr
    exact qlt_le_trans hxr hneg
  · intro hx
    exact ⟨q, qlt_irrefl q, hx⟩

/-- The accepted rational embedding preserves the negation candidate. -/
theorem rOfQ_neg (q : QBOMA) :
    rNeg (rOfQ q) = rOfQ (qNeg q) := by
  change rmk (cutNeg (principalCut q)) = rmk (principalCut (qNeg q))
  exact rmk_sound (cutNeg_principal q)

end BOMA.R.DedekindNegationCandidate001
