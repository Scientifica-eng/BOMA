/- Associativity of the selected signed Dedekind multiplication.
The proof classifies signs with the isolated classical total-order witness and
reduces all eight quadrants to the certified nonnegative-kernel associativity. -/
namespace BOMA.R.DedekindSignedMulAssociativity001

open BOMA.Q.Quotient001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindOrderClassical001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindAdditiveInverse001
open BOMA.R.DedekindPositiveDecomposition001
open BOMA.R.DedekindNonnegativeMul001
open BOMA.R.DedekindNonnegativeMulLaws001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.DedekindSignedMulSignLaws001

/-- Every nonnegative-envelope kernel value is nonnegative. -/
theorem rMulNonnegEnvelope_nonneg (x y : RBOMA) :
    rLE rZero (rMulNonnegEnvelope x y) := by
  refine Quotient.inductionOn x ?_
  intro A
  refine Quotient.inductionOn y ?_
  intro B
  change
    rLE (rmk (principalCut qZero))
      (rmk (cutMulNonnegEnvelope A B))
  exact (rLE_mk_iff (principalCut qZero) (cutMulNonnegEnvelope A B)).2
    (cutZero_le_mulNonneg A B)

/-- Associativity of the selected signed multiplication. -/
theorem rMulCandidate_assoc (x y z : RBOMA) :
    rMulCandidate (rMulCandidate x y) z =
    rMulCandidate x (rMulCandidate y z) := by
  rcases rLE_total_classical rZero x with h0x | hx0
  · rcases rLE_total_classical rZero y with h0y | hy0
    · rcases rLE_total_classical rZero z with h0z | hz0
      · -- + + +
        have hxy := rMulCandidate_of_nonneg_nonneg h0x h0y
        have hyz := rMulCandidate_of_nonneg_nonneg h0y h0z
        have h0xy : rLE rZero (rMulCandidate x y) := by
          rw [hxy]
          exact rMulNonnegEnvelope_nonneg x y
        have h0yz : rLE rZero (rMulCandidate y z) := by
          rw [hyz]
          exact rMulNonnegEnvelope_nonneg y z
        calc
          rMulCandidate (rMulCandidate x y) z =
              rMulNonnegEnvelope (rMulCandidate x y) z :=
            rMulCandidate_of_nonneg_nonneg h0xy h0z
          _ = rMulNonnegEnvelope (rMulNonnegEnvelope x y) z := by rw [hxy]
          _ = rMulNonnegEnvelope x (rMulNonnegEnvelope y z) :=
            rMulNonnegEnvelope_assoc x y z
          _ = rMulNonnegEnvelope x (rMulCandidate y z) := by rw [hyz]
          _ = rMulCandidate x (rMulCandidate y z) :=
            (rMulCandidate_of_nonneg_nonneg h0x h0yz).symm
      · -- + + -
        have hxy := rMulCandidate_of_nonneg_nonneg h0x h0y
        have hyz := rMulCandidate_of_nonneg_nonpos h0y hz0
        have h0xy : rLE rZero (rMulCandidate x y) := by
          rw [hxy]
          exact rMulNonnegEnvelope_nonneg x y
        have hyz0 : rLE (rMulCandidate y z) rZero := by
          rw [hyz]
          exact rNeg_nonpos_of_nonneg (rMulNonnegEnvelope_nonneg y (rNeg z))
        calc
          rMulCandidate (rMulCandidate x y) z =
              rNeg (rMulNonnegEnvelope (rMulCandidate x y) (rNeg z)) :=
            rMulCandidate_of_nonneg_nonpos h0xy hz0
          _ = rNeg (rMulNonnegEnvelope (rMulNonnegEnvelope x y) (rNeg z)) := by
            rw [hxy]
          _ = rNeg (rMulNonnegEnvelope x
                (rMulNonnegEnvelope y (rNeg z))) := by
            rw [rMulNonnegEnvelope_assoc]
          _ = rNeg (rMulNonnegEnvelope x (rNeg (rMulCandidate y z))) := by
            rw [hyz, rNeg_involutive]
          _ = rMulCandidate x (rMulCandidate y z) :=
            (rMulCandidate_of_nonneg_nonpos h0x hyz0).symm
    · rcases rLE_total_classical rZero z with h0z | hz0
      · -- + - +
        have hxy := rMulCandidate_of_nonneg_nonpos h0x hy0
        have hyz := rMulCandidate_of_nonpos_nonneg hy0 h0z
        have hxy0 : rLE (rMulCandidate x y) rZero := by
          rw [hxy]
          exact rNeg_nonpos_of_nonneg (rMulNonnegEnvelope_nonneg x (rNeg y))
        have hyz0 : rLE (rMulCandidate y z) rZero := by
          rw [hyz]
          exact rNeg_nonpos_of_nonneg (rMulNonnegEnvelope_nonneg (rNeg y) z)
        calc
          rMulCandidate (rMulCandidate x y) z =
              rNeg (rMulNonnegEnvelope (rNeg (rMulCandidate x y)) z) :=
            rMulCandidate_of_nonpos_nonneg hxy0 h0z
          _ = rNeg (rMulNonnegEnvelope
                (rMulNonnegEnvelope x (rNeg y)) z) := by
            rw [hxy, rNeg_involutive]
          _ = rNeg (rMulNonnegEnvelope x
                (rMulNonnegEnvelope (rNeg y) z)) := by
            rw [rMulNonnegEnvelope_assoc]
          _ = rNeg (rMulNonnegEnvelope x (rNeg (rMulCandidate y z))) := by
            rw [hyz, rNeg_involutive]
          _ = rMulCandidate x (rMulCandidate y z) :=
            (rMulCandidate_of_nonneg_nonpos h0x hyz0).symm
      · -- + - -
        have hxy := rMulCandidate_of_nonneg_nonpos h0x hy0
        have hyz := rMulCandidate_of_nonpos_nonpos hy0 hz0
        have hxy0 : rLE (rMulCandidate x y) rZero := by
          rw [hxy]
          exact rNeg_nonpos_of_nonneg (rMulNonnegEnvelope_nonneg x (rNeg y))
        have h0yz : rLE rZero (rMulCandidate y z) := by
          rw [hyz]
          exact rMulNonnegEnvelope_nonneg (rNeg y) (rNeg z)
        calc
          rMulCandidate (rMulCandidate x y) z =
              rMulNonnegEnvelope (rNeg (rMulCandidate x y)) (rNeg z) :=
            rMulCandidate_of_nonpos_nonpos hxy0 hz0
          _ = rMulNonnegEnvelope (rMulNonnegEnvelope x (rNeg y)) (rNeg z) := by
            rw [hxy, rNeg_involutive]
          _ = rMulNonnegEnvelope x
                (rMulNonnegEnvelope (rNeg y) (rNeg z)) :=
            rMulNonnegEnvelope_assoc x (rNeg y) (rNeg z)
          _ = rMulNonnegEnvelope x (rMulCandidate y z) := by rw [hyz]
          _ = rMulCandidate x (rMulCandidate y z) :=
            (rMulCandidate_of_nonneg_nonneg h0x h0yz).symm
  · rcases rLE_total_classical rZero y with h0y | hy0
    · rcases rLE_total_classical rZero z with h0z | hz0
      · -- - + +
        have hxy := rMulCandidate_of_nonpos_nonneg hx0 h0y
        have hyz := rMulCandidate_of_nonneg_nonneg h0y h0z
        have hxy0 : rLE (rMulCandidate x y) rZero := by
          rw [hxy]
          exact rNeg_nonpos_of_nonneg (rMulNonnegEnvelope_nonneg (rNeg x) y)
        have h0yz : rLE rZero (rMulCandidate y z) := by
          rw [hyz]
          exact rMulNonnegEnvelope_nonneg y z
        calc
          rMulCandidate (rMulCandidate x y) z =
              rNeg (rMulNonnegEnvelope (rNeg (rMulCandidate x y)) z) :=
            rMulCandidate_of_nonpos_nonneg hxy0 h0z
          _ = rNeg (rMulNonnegEnvelope
                (rMulNonnegEnvelope (rNeg x) y) z) := by
            rw [hxy, rNeg_involutive]
          _ = rNeg (rMulNonnegEnvelope (rNeg x)
                (rMulNonnegEnvelope y z)) := by
            rw [rMulNonnegEnvelope_assoc]
          _ = rNeg (rMulNonnegEnvelope (rNeg x) (rMulCandidate y z)) := by
            rw [hyz]
          _ = rMulCandidate x (rMulCandidate y z) :=
            (rMulCandidate_of_nonpos_nonneg hx0 h0yz).symm
      · -- - + -
        have hxy := rMulCandidate_of_nonpos_nonneg hx0 h0y
        have hyz := rMulCandidate_of_nonneg_nonpos h0y hz0
        have hxy0 : rLE (rMulCandidate x y) rZero := by
          rw [hxy]
          exact rNeg_nonpos_of_nonneg (rMulNonnegEnvelope_nonneg (rNeg x) y)
        have hyz0 : rLE (rMulCandidate y z) rZero := by
          rw [hyz]
          exact rNeg_nonpos_of_nonneg (rMulNonnegEnvelope_nonneg y (rNeg z))
        calc
          rMulCandidate (rMulCandidate x y) z =
              rMulNonnegEnvelope (rNeg (rMulCandidate x y)) (rNeg z) :=
            rMulCandidate_of_nonpos_nonpos hxy0 hz0
          _ = rMulNonnegEnvelope (rMulNonnegEnvelope (rNeg x) y) (rNeg z) := by
            rw [hxy, rNeg_involutive]
          _ = rMulNonnegEnvelope (rNeg x)
                (rMulNonnegEnvelope y (rNeg z)) :=
            rMulNonnegEnvelope_assoc (rNeg x) y (rNeg z)
          _ = rMulNonnegEnvelope (rNeg x) (rNeg (rMulCandidate y z)) := by
            rw [hyz, rNeg_involutive]
          _ = rMulCandidate x (rMulCandidate y z) :=
            (rMulCandidate_of_nonpos_nonpos hx0 hyz0).symm
    · rcases rLE_total_classical rZero z with h0z | hz0
      · -- - - +
        have hxy := rMulCandidate_of_nonpos_nonpos hx0 hy0
        have hyz := rMulCandidate_of_nonpos_nonneg hy0 h0z
        have h0xy : rLE rZero (rMulCandidate x y) := by
          rw [hxy]
          exact rMulNonnegEnvelope_nonneg (rNeg x) (rNeg y)
        have hyz0 : rLE (rMulCandidate y z) rZero := by
          rw [hyz]
          exact rNeg_nonpos_of_nonneg (rMulNonnegEnvelope_nonneg (rNeg y) z)
        calc
          rMulCandidate (rMulCandidate x y) z =
              rMulNonnegEnvelope (rMulCandidate x y) z :=
            rMulCandidate_of_nonneg_nonneg h0xy h0z
          _ = rMulNonnegEnvelope
                (rMulNonnegEnvelope (rNeg x) (rNeg y)) z := by rw [hxy]
          _ = rMulNonnegEnvelope (rNeg x)
                (rMulNonnegEnvelope (rNeg y) z) :=
            rMulNonnegEnvelope_assoc (rNeg x) (rNeg y) z
          _ = rMulNonnegEnvelope (rNeg x) (rNeg (rMulCandidate y z)) := by
            rw [hyz, rNeg_involutive]
          _ = rMulCandidate x (rMulCandidate y z) :=
            (rMulCandidate_of_nonpos_nonpos hx0 hyz0).symm
      · -- - - -
        have hxy := rMulCandidate_of_nonpos_nonpos hx0 hy0
        have hyz := rMulCandidate_of_nonpos_nonpos hy0 hz0
        have h0xy : rLE rZero (rMulCandidate x y) := by
          rw [hxy]
          exact rMulNonnegEnvelope_nonneg (rNeg x) (rNeg y)
        have h0yz : rLE rZero (rMulCandidate y z) := by
          rw [hyz]
          exact rMulNonnegEnvelope_nonneg (rNeg y) (rNeg z)
        calc
          rMulCandidate (rMulCandidate x y) z =
              rNeg (rMulNonnegEnvelope (rMulCandidate x y) (rNeg z)) :=
            rMulCandidate_of_nonneg_nonpos h0xy hz0
          _ = rNeg (rMulNonnegEnvelope
                (rMulNonnegEnvelope (rNeg x) (rNeg y)) (rNeg z)) := by rw [hxy]
          _ = rNeg (rMulNonnegEnvelope (rNeg x)
                (rMulNonnegEnvelope (rNeg y) (rNeg z))) := by
            rw [rMulNonnegEnvelope_assoc]
          _ = rNeg (rMulNonnegEnvelope (rNeg x) (rMulCandidate y z)) := by rw [hyz]
          _ = rMulCandidate x (rMulCandidate y z) :=
            (rMulCandidate_of_nonpos_nonneg hx0 h0yz).symm

end BOMA.R.DedekindSignedMulAssociativity001
