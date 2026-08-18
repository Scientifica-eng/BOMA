/- Isolated classical witness for total comparability of Dedekind lower cuts. -/
namespace BOMA.R.DedekindOrderClassical001

open BOMA.Q.Order001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindOrderConstructive001

/-- Classical reasoning supplies the isolated CutComparability interface for
lower sets of the accepted linearly ordered rational carrier. -/
theorem cutComparability_classical : CutComparability := by
  classical
  intro A B
  by_cases hAB : CutLE A B
  · exact Or.inl hAB
  · apply Or.inr
    intro q hqB
    by_contra hqA
    apply hAB
    intro r hrA
    rcases qle_total r q with hrq | hqr
    · exact B.downward hqB hrq
    · exact False.elim (hqA (A.downward hrA hqr))

/-- Stage-One totality candidate obtained from the localized classical witness. -/
theorem rLE_total_classical (x y : RBOMA) : rLE x y ∨ rLE y x :=
  rLE_total_of_cutComparability cutComparability_classical x y

end BOMA.R.DedekindOrderClassical001
