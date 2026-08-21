/- C-stage accepted-R interface sufficiency probe.

Purpose:
  derive the order facts needed by likely C constructions from the accepted
  RStageIntegrationCertificate only, without unfolding LowerCut, CutEquiv,
  quotient representatives, or the selected Dedekind multiplication/inverse
  implementations.

This file does not construct a complex carrier and does not select C-DP-001.
-/
namespace BOMA.C.RInterfaceNoSquareProbe001

open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.StageIntegration002

private def cert : RStageIntegrationCertificate :=
  rStageIntegrationCertificate

/-- Zero is fixed by negation, derived only from the accepted additive interface. -/
theorem neg_zero_from_interface : rNeg rZero = rZero := by
  calc
    rNeg rZero = rAdd rZero (rNeg rZero) :=
      (cert.addZeroLeft (rNeg rZero)).symm
    _ = rZero := cert.addInverseRight rZero

/-- Additive inverse witnesses are unique, derived from the accepted additive laws. -/
theorem add_inverse_unique_from_interface
    {x y : RBOMA}
    (hxy : rAdd x y = rZero) :
    y = rNeg x := by
  calc
    y = rAdd rZero y := (cert.addZeroLeft y).symm
    _ = rAdd (rAdd x (rNeg x)) y := by
      rw [cert.addInverseRight x]
    _ = rAdd x (rAdd (rNeg x) y) :=
      cert.addAssoc x (rNeg x) y
    _ = rAdd x (rAdd y (rNeg x)) := by
      rw [cert.addComm (rNeg x) y]
    _ = rAdd (rAdd x y) (rNeg x) :=
      (cert.addAssoc x y (rNeg x)).symm
    _ = rAdd rZero (rNeg x) := by rw [hxy]
    _ = rNeg x := cert.addZeroLeft (rNeg x)

/-- Negation is involutive, derived from accepted additive commutativity and inverse uniqueness. -/
theorem neg_involutive_from_interface (x : RBOMA) :
    rNeg (rNeg x) = x := by
  have hleft : rAdd (rNeg x) x = rZero := by
    calc
      rAdd (rNeg x) x = rAdd x (rNeg x) := cert.addComm (rNeg x) x
      _ = rZero := cert.addInverseRight x
  exact (add_inverse_unique_from_interface hleft).symm

/-- Right zero-annihilation follows from distributivity and the accepted additive group laws. -/
theorem mul_zero_right_from_interface (x : RBOMA) :
    rMulCandidate x rZero = rZero := by
  let p : RBOMA := rMulCandidate x rZero
  have hdist := cert.distribRight x rZero rZero
  have h00 : rAdd rZero rZero = rZero := cert.addZeroLeft rZero
  have hp : p = rAdd p p := by
    unfold p
    rw [h00] at hdist
    exact hdist
  have hnegleft : rAdd (rNeg p) p = rZero := by
    calc
      rAdd (rNeg p) p = rAdd p (rNeg p) := cert.addComm (rNeg p) p
      _ = rZero := cert.addInverseRight p
  have hcancel := congrArg (fun t => rAdd (rNeg p) t) hp
  have hz_eq_p : rZero = p := by
    calc
      rZero = rAdd (rNeg p) p := hnegleft.symm
      _ = rAdd (rNeg p) (rAdd p p) := hcancel
      _ = rAdd (rAdd (rNeg p) p) p :=
        (cert.addAssoc (rNeg p) p p).symm
      _ = rAdd rZero p := by rw [hnegleft]
      _ = p := cert.addZeroLeft p
  exact hz_eq_p.symm

/-- Left zero-annihilation follows from accepted multiplication commutativity. -/
theorem mul_zero_left_from_interface (x : RBOMA) :
    rMulCandidate rZero x = rZero := by
  calc
    rMulCandidate rZero x = rMulCandidate x rZero := cert.mulComm rZero x
    _ = rZero := mul_zero_right_from_interface x

/-- Multiplication by an additive inverse on the right negates the product. -/
theorem mul_neg_right_from_interface (x y : RBOMA) :
    rMulCandidate x (rNeg y) = rNeg (rMulCandidate x y) := by
  have hd := cert.distribRight x y (rNeg y)
  have hy0 : rAdd y (rNeg y) = rZero := cert.addInverseRight y
  have hsum :
      rAdd (rMulCandidate x y) (rMulCandidate x (rNeg y)) = rZero := by
    calc
      rAdd (rMulCandidate x y) (rMulCandidate x (rNeg y)) =
          rMulCandidate x (rAdd y (rNeg y)) := hd.symm
      _ = rMulCandidate x rZero := by rw [hy0]
      _ = rZero := mul_zero_right_from_interface x
  exact add_inverse_unique_from_interface hsum

/-- Multiplication by an additive inverse on the left negates the product. -/
theorem mul_neg_left_from_interface (x y : RBOMA) :
    rMulCandidate (rNeg x) y = rNeg (rMulCandidate x y) := by
  calc
    rMulCandidate (rNeg x) y = rMulCandidate y (rNeg x) :=
      cert.mulComm (rNeg x) y
    _ = rNeg (rMulCandidate y x) := mul_neg_right_from_interface y x
    _ = rNeg (rMulCandidate x y) := by rw [cert.mulComm y x]

/-- Squaring a negated value gives the same square, using only accepted field laws. -/
theorem mul_neg_neg_same_from_interface (x : RBOMA) :
    rMulCandidate (rNeg x) (rNeg x) = rMulCandidate x x := by
  calc
    rMulCandidate (rNeg x) (rNeg x) =
        rNeg (rMulCandidate x (rNeg x)) :=
      mul_neg_left_from_interface x (rNeg x)
    _ = rNeg (rNeg (rMulCandidate x x)) := by
      rw [mul_neg_right_from_interface x x]
    _ = rMulCandidate x x := neg_involutive_from_interface _

/-- C-RL-001: every accepted-real square is nonnegative.

The proof branches only on the accepted total-order field of the integration
certificate. The negative branch replaces x by -x and uses only identities
proved above from the same accepted certificate. -/
theorem square_nonnegative_from_accepted_R (x : RBOMA) :
    rLE rZero (rMulCandidate x x) := by
  rcases cert.orderTotal rZero x with h0x | hx0
  · have h := cert.orderMulNonneg (a := rZero) (b := x) (c := x) h0x h0x
    rw [mul_zero_left_from_interface x] at h
    exact h
  · have h0nx0 := cert.negOrderReversing hx0
    have h0nx : rLE rZero (rNeg x) := by
      rw [neg_zero_from_interface] at h0nx0
      exact h0nx0
    have h := cert.orderMulNonneg
      (a := rZero) (b := rNeg x) (c := rNeg x) h0nx h0nx
    rw [mul_zero_left_from_interface (rNeg x),
        mul_neg_neg_same_from_interface x] at h
    exact h

/-- One is nonnegative as the square of one. -/
theorem zero_le_one_from_accepted_R : rLE rZero rOne := by
  have h := square_nonnegative_from_accepted_R rOne
  rw [cert.mulOneLeft rOne] at h
  exact h

/-- C-RL-002: -1 is not a square in the accepted real domain.

This is the route-neutral C boundary fact needed to prevent the future
imaginary generator from collapsing into the embedded real line. -/
theorem minus_one_not_square_from_accepted_R :
    ¬ ∃ x : RBOMA, rMulCandidate x x = rNeg rOne := by
  rintro ⟨x, hx⟩
  have hsq : rLE rZero (rNeg rOne) := by
    have h := square_nonnegative_from_accepted_R x
    rw [hx] at h
    exact h
  have h10raw := cert.negOrderReversing hsq
  have h10 : rLE rOne rZero := by
    rw [neg_involutive_from_interface rOne,
        neg_zero_from_interface] at h10raw
    exact h10raw
  have h01 : rLE rZero rOne := zero_le_one_from_accepted_R
  have hEq : rZero = rOne := cert.orderAntisymm h01 h10
  exact cert.nontrivial hEq

end BOMA.C.RInterfaceNoSquareProbe001
