/- Distributivity of the selected signed Dedekind multiplication.
The proof reduces to the certified nonnegative-kernel distributivity plus
additive-group identities and localized sign classification. -/
namespace BOMA.R.DedekindSignedMulDistributivity001

open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindOrderClassical001
open BOMA.R.DedekindOrderAdditive001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindAdditionLaws001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindAdditiveInverse001
open BOMA.R.DedekindAdditiveDerived001
open BOMA.R.DedekindPositiveDecomposition001
open BOMA.R.DedekindNonnegativeMul001
open BOMA.R.DedekindNonnegativeMulDistributivity001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.DedekindSignedMulBasicLaws001
open BOMA.R.DedekindSignedMulSignLaws001

/-- Distributivity for a nonnegative left factor and two nonnegative summands. -/
theorem rMulCandidate_add_right_nonneg_nonneg
    {x y z : RBOMA}
    (h0x : rLE rZero x)
    (h0y : rLE rZero y)
    (h0z : rLE rZero z) :
    rMulCandidate x (rAdd y z) =
    rAdd (rMulCandidate x y) (rMulCandidate x z) := by
  have h0sum : rLE rZero (rAdd y z) := rAdd_nonneg h0y h0z
  calc
    rMulCandidate x (rAdd y z) =
        rMulNonnegEnvelope x (rAdd y z) :=
      rMulCandidate_of_nonneg_nonneg h0x h0sum
    _ = rAdd (rMulNonnegEnvelope x y) (rMulNonnegEnvelope x z) :=
      rMulNonnegEnvelope_add_right_of_nonneg x y z h0y h0z
    _ = rAdd (rMulCandidate x y) (rMulCandidate x z) := by
      rw [rMulCandidate_of_nonneg_nonneg h0x h0y,
          rMulCandidate_of_nonneg_nonneg h0x h0z]

/-- Distributivity for a nonnegative left factor and two nonpositive summands. -/
theorem rMulCandidate_add_right_nonpos_nonpos
    {x y z : RBOMA}
    (h0x : rLE rZero x)
    (hy0 : rLE y rZero)
    (hz0 : rLE z rZero) :
    rMulCandidate x (rAdd y z) =
    rAdd (rMulCandidate x y) (rMulCandidate x z) := by
  have hsum0 : rLE (rAdd y z) rZero := rAdd_nonpos hy0 hz0
  have h0ny : rLE rZero (rNeg y) := rNeg_nonneg_of_nonpos hy0
  have h0nz : rLE rZero (rNeg z) := rNeg_nonneg_of_nonpos hz0
  calc
    rMulCandidate x (rAdd y z) =
        rNeg (rMulNonnegEnvelope x (rNeg (rAdd y z))) :=
      rMulCandidate_of_nonneg_nonpos h0x hsum0
    _ = rNeg (rMulNonnegEnvelope x (rAdd (rNeg y) (rNeg z))) := by
      rw [rNeg_add]
    _ = rNeg (rAdd
          (rMulNonnegEnvelope x (rNeg y))
          (rMulNonnegEnvelope x (rNeg z))) := by
      rw [rMulNonnegEnvelope_add_right_of_nonneg x (rNeg y) (rNeg z) h0ny h0nz]
    _ = rAdd
          (rNeg (rMulNonnegEnvelope x (rNeg y)))
          (rNeg (rMulNonnegEnvelope x (rNeg z))) :=
      rNeg_add _ _
    _ = rAdd (rMulCandidate x y) (rMulCandidate x z) := by
      rw [rMulCandidate_of_nonneg_nonpos h0x hy0,
          rMulCandidate_of_nonneg_nonpos h0x hz0]

/-- Mixed-sign distributivity for nonnegative x, nonnegative y, nonpositive z. -/
theorem rMulCandidate_add_right_nonneg_nonpos
    {x y z : RBOMA}
    (h0x : rLE rZero x)
    (h0y : rLE rZero y)
    (hz0 : rLE z rZero) :
    rMulCandidate x (rAdd y z) =
    rAdd (rMulCandidate x y) (rMulCandidate x z) := by
  have h0nz : rLE rZero (rNeg z) := rNeg_nonneg_of_nonpos hz0
  rcases rLE_total_classical rZero (rAdd y z) with h0sum | hsum0
  · -- y+z remains nonnegative: y=(y+z)+(-z)
    have hK := rMulNonnegEnvelope_add_right_of_nonneg
      x (rAdd y z) (rNeg z) h0sum h0nz
    rw [rAdd_sub_right y z] at hK
    have hsolve :
        rMulNonnegEnvelope x (rAdd y z) =
        rAdd (rMulNonnegEnvelope x y)
          (rNeg (rMulNonnegEnvelope x (rNeg z))) := by
      calc
        rMulNonnegEnvelope x (rAdd y z) =
            rAdd (rMulNonnegEnvelope x (rAdd y z)) rZero :=
          (rAdd_zero_right _).symm
        _ = rAdd (rMulNonnegEnvelope x (rAdd y z))
              (rAdd (rMulNonnegEnvelope x (rNeg z))
                (rNeg (rMulNonnegEnvelope x (rNeg z)))) := by
          exact congrArg
            (fun t => rAdd (rMulNonnegEnvelope x (rAdd y z)) t)
            (rAdd_neg_right (rMulNonnegEnvelope x (rNeg z))).symm
        _ = rAdd
              (rAdd (rMulNonnegEnvelope x (rAdd y z))
                (rMulNonnegEnvelope x (rNeg z)))
              (rNeg (rMulNonnegEnvelope x (rNeg z))) :=
          (rAdd_assoc _ _ _).symm
        _ = rAdd (rMulNonnegEnvelope x y)
              (rNeg (rMulNonnegEnvelope x (rNeg z))) := by
          rw [← hK]
    calc
      rMulCandidate x (rAdd y z) =
          rMulNonnegEnvelope x (rAdd y z) :=
        rMulCandidate_of_nonneg_nonneg h0x h0sum
      _ = rAdd (rMulNonnegEnvelope x y)
            (rNeg (rMulNonnegEnvelope x (rNeg z))) := hsolve
      _ = rAdd (rMulCandidate x y) (rMulCandidate x z) := by
        rw [rMulCandidate_of_nonneg_nonneg h0x h0y,
            rMulCandidate_of_nonneg_nonpos h0x hz0]
  · -- y+z is nonpositive: -z = y + (-(y+z))
    have h0nsum : rLE rZero (rNeg (rAdd y z)) :=
      rNeg_nonneg_of_nonpos hsum0
    have hK := rMulNonnegEnvelope_add_right_of_nonneg
      x y (rNeg (rAdd y z)) h0y h0nsum
    rw [rAdd_neg_sum_cancel_left y z] at hK
    have hsolve :
        rNeg (rMulNonnegEnvelope x (rNeg (rAdd y z))) =
        rAdd (rMulNonnegEnvelope x y)
          (rNeg (rMulNonnegEnvelope x (rNeg z))) := by
      calc
        rNeg (rMulNonnegEnvelope x (rNeg (rAdd y z))) =
            rAdd (rMulNonnegEnvelope x y)
              (rNeg (rAdd
                (rMulNonnegEnvelope x y)
                (rMulNonnegEnvelope x (rNeg (rAdd y z))))) :=
          (rAdd_neg_sum_cancel_left
            (rMulNonnegEnvelope x y)
            (rMulNonnegEnvelope x (rNeg (rAdd y z)))).symm
        _ = rAdd (rMulNonnegEnvelope x y)
              (rNeg (rMulNonnegEnvelope x (rNeg z))) := by
          rw [← hK]
    calc
      rMulCandidate x (rAdd y z) =
          rNeg (rMulNonnegEnvelope x (rNeg (rAdd y z))) :=
        rMulCandidate_of_nonneg_nonpos h0x hsum0
      _ = rAdd (rMulNonnegEnvelope x y)
            (rNeg (rMulNonnegEnvelope x (rNeg z))) := hsolve
      _ = rAdd (rMulCandidate x y) (rMulCandidate x z) := by
        rw [rMulCandidate_of_nonneg_nonneg h0x h0y,
            rMulCandidate_of_nonneg_nonpos h0x hz0]

/-- Full right distributivity for any nonnegative left factor. -/
theorem rMulCandidate_add_right_of_nonneg_left
    {x : RBOMA}
    (h0x : rLE rZero x)
    (y z : RBOMA) :
    rMulCandidate x (rAdd y z) =
    rAdd (rMulCandidate x y) (rMulCandidate x z) := by
  rcases rLE_total_classical rZero y with h0y | hy0
  · rcases rLE_total_classical rZero z with h0z | hz0
    · exact rMulCandidate_add_right_nonneg_nonneg h0x h0y h0z
    · exact rMulCandidate_add_right_nonneg_nonpos h0x h0y hz0
  · rcases rLE_total_classical rZero z with h0z | hz0
    · calc
        rMulCandidate x (rAdd y z) = rMulCandidate x (rAdd z y) := by
          rw [rAdd_comm y z]
        _ = rAdd (rMulCandidate x z) (rMulCandidate x y) :=
          rMulCandidate_add_right_nonneg_nonpos h0x h0z hy0
        _ = rAdd (rMulCandidate x y) (rMulCandidate x z) :=
          rAdd_comm _ _
    · exact rMulCandidate_add_right_nonpos_nonpos h0x hy0 hz0

/-- For a nonpositive left factor, multiplication equals the negative of
multiplication by its nonnegative opposite. -/
theorem rMulCandidate_nonpos_left_as_neg
    {x : RBOMA}
    (hx0 : rLE x rZero)
    (y : RBOMA) :
    rMulCandidate x y = rNeg (rMulCandidate (rNeg x) y) := by
  have h0nx : rLE rZero (rNeg x) := rNeg_nonneg_of_nonpos hx0
  rcases rLE_total_classical rZero y with h0y | hy0
  · calc
      rMulCandidate x y = rNeg (rMulNonnegEnvelope (rNeg x) y) :=
        rMulCandidate_of_nonpos_nonneg hx0 h0y
      _ = rNeg (rMulCandidate (rNeg x) y) := by
        rw [rMulCandidate_of_nonneg_nonneg h0nx h0y]
  · calc
      rMulCandidate x y = rMulNonnegEnvelope (rNeg x) (rNeg y) :=
        rMulCandidate_of_nonpos_nonpos hx0 hy0
      _ = rNeg (rNeg (rMulNonnegEnvelope (rNeg x) (rNeg y))) := by
        rw [rNeg_involutive]
      _ = rNeg (rMulCandidate (rNeg x) y) := by
        rw [rMulCandidate_of_nonneg_nonpos h0nx hy0]

/-- Full right distributivity for the selected signed multiplication. -/
theorem rMulCandidate_add_right (x y z : RBOMA) :
    rMulCandidate x (rAdd y z) =
    rAdd (rMulCandidate x y) (rMulCandidate x z) := by
  rcases rLE_total_classical rZero x with h0x | hx0
  · exact rMulCandidate_add_right_of_nonneg_left h0x y z
  · have h0nx : rLE rZero (rNeg x) := rNeg_nonneg_of_nonpos hx0
    have hd := rMulCandidate_add_right_of_nonneg_left h0nx y z
    have hsum := rMulCandidate_nonpos_left_as_neg hx0 (rAdd y z)
    have hy := rMulCandidate_nonpos_left_as_neg hx0 y
    have hz := rMulCandidate_nonpos_left_as_neg hx0 z
    calc
      rMulCandidate x (rAdd y z) =
          rNeg (rMulCandidate (rNeg x) (rAdd y z)) := hsum
      _ = rNeg (rAdd
            (rMulCandidate (rNeg x) y)
            (rMulCandidate (rNeg x) z)) := by rw [hd]
      _ = rAdd
            (rNeg (rMulCandidate (rNeg x) y))
            (rNeg (rMulCandidate (rNeg x) z)) :=
        rNeg_add _ _
      _ = rAdd (rMulCandidate x y) (rMulCandidate x z) := by
        rw [← hy, ← hz]

/-- Left distributivity follows from multiplication commutativity. -/
theorem rMulCandidate_add_left (x y z : RBOMA) :
    rMulCandidate (rAdd x y) z =
    rAdd (rMulCandidate x z) (rMulCandidate y z) := by
  calc
    rMulCandidate (rAdd x y) z = rMulCandidate z (rAdd x y) :=
      rMulCandidate_comm _ _
    _ = rAdd (rMulCandidate z x) (rMulCandidate z y) :=
      rMulCandidate_add_right z x y
    _ = rAdd (rMulCandidate x z) (rMulCandidate y z) := by
      rw [rMulCandidate_comm z x, rMulCandidate_comm z y]

end BOMA.R.DedekindSignedMulDistributivity001
