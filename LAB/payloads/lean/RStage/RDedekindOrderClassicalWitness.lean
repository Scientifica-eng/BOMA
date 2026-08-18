/- Isolated classical witness for total comparability of Dedekind lower cuts. -/
namespace BOMA.R.DedekindOrderClassical001

open BOMA.Q.Order001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindOrderConstructive001

/-- Classical excluded middle supplies the isolated CutComparability interface
for lower sets of the accepted linearly ordered rational carrier. The classical
commitment is explicit in the two calls to `Classical.em`. -/
theorem cutComparability_classical : CutComparability := by
  intro A B
  cases Classical.em (CutLE A B) with
  | inl hAB =>
      exact Or.inl hAB
  | inr hNotAB =>
      apply Or.inr
      intro q hqB
      cases Classical.em (A.lower q) with
      | inl hqA =>
          exact hqA
      | inr hNotAq =>
          exfalso
          apply hNotAB
          intro r hrA
          rcases qle_total r q with hrq | hqr
          · exact B.downward hqB hrq
          · exact False.elim (hNotAq (A.downward hrA hqr))

/-- Stage-One totality candidate obtained from the localized classical witness. -/
theorem rLE_total_classical (x y : RBOMA) : rLE x y ∨ rLE y x :=
  rLE_total_of_cutComparability cutComparability_classical x y

end BOMA.R.DedekindOrderClassical001
