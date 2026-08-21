/- C-stage accepted-R interface sufficiency probe.

Purpose:
  derive the order facts needed by likely C constructions from an abstract
  RStageIntegrationCertificate first, then instantiate the result with the
  accepted R certificate. The abstract proof does not unfold LowerCut,
  CutEquiv, quotient representatives, or the selected Dedekind
  multiplication/inverse implementations.

This file does not construct a complex carrier and does not select C-DP-001.
-/
namespace BOMA.C.RInterfaceNoSquareProbe001

open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.StageIntegration002

/-- Zero is fixed by negation, derived only from the accepted additive interface. -/
theorem neg_zero_from_interface
    (C : RStageIntegrationCertificate) :
    rNeg rZero = rZero := by
  calc
    rNeg rZero = rAdd rZero (rNeg rZero) :=
      (C.addZeroLeft (rNeg rZero)).symm
    _ = rZero := C.addInverseRight rZero

/-- Additive inverse witnesses are unique, derived from the accepted additive laws. -/
theorem add_inverse_unique_from_interface
    (C : RStageIntegrationCertificate)
    {x y : RBOMA}
    (hxy : rAdd x y = rZero) :
    y = rNeg x := by
  calc
    y = rAdd rZero y := (C.addZeroLeft y).symm
    _ = rAdd (rAdd x (rNeg x)) y := by
      rw [C.addInverseRight x]
    _ = rAdd x (rAdd (rNeg x) y) :=
      C.addAssoc x (rNeg x) y
    _ = rAdd x (rAdd y (rNeg x)) := by
      rw [C.addComm (rNeg x) y]
    _ = rAdd (rAdd x y) (rNeg x) :=
      (C.addAssoc x y (rNeg x)).symm
    _ = rAdd rZero (rNeg x) := by rw [hxy]
    _ = rNeg x := C.addZeroLeft (rNeg x)

/-- Negation is involutive, derived from accepted additive commutativity and inverse uniqueness. -/
theorem neg_involutive_from_interface
    (C : RStageIntegrationCertificate)
    (x : RBOMA) :
    rNeg (rNeg x) = x := by
  have hleft : rAdd (rNeg x) x = rZero := by
    calc
      rAdd (rNeg x) x = rAdd x (rNeg x) := C.addComm (rNeg x) x
      _ = rZero := C.addInverseRight x
  exact (add_inverse_unique_from_interface C hleft).symm

/-- Right zero-annihilation follows from distributivity and the accepted additive group laws. -/
theorem mul_zero_right_from_interface
    (C : RStageIntegrationCertificate)
    (x : RBOMA) :
    rMulCandidate x rZero = rZero := by
  let p : RBOMA := rMulCandidate x rZero
  have hdist := C.distribRight x rZero rZero
  have h00 : rAdd rZero rZero = rZero := C.addZeroLeft rZero
  have hp : p = rAdd p p := by
    unfold p
    rw [h00] at hdist
    exact hdist
  have hnegleft : rAdd (rNeg p) p = rZero := by
    calc
      rAdd (rNeg p) p = rAdd p (rNeg p) := C.addComm (rNeg p) p
      _ = rZero := C.addInverseRight p
  have hcancel := congrArg (fun t => rAdd (rNeg p) t) hp
  have hz_eq_p : rZero = p := by
    calc
      rZero = rAdd (rNeg p) p := hnegleft.symm
      _ = rAdd (rNeg p) (rAdd p p) := hcancel
      _ = rAdd (rAdd (rNeg p) p) p :=
        (C.addAssoc (rNeg p) p p).symm
      _ = rAdd rZero p := by rw [hnegleft]
      _ = p := C.addZeroLeft p
  exact hz_eq_p.symm

/-- Left zero-annihilation follows from accepted multiplication commutativity. -/
theorem mul_zero_left_from_interface
    (C : RStageIntegrationCertificate)
    (x : RBOMA) :
    rMulCandidate rZero x = rZero := by
  calc
    rMulCandidate rZero x = rMulCandidate x rZero := C.mulComm rZero x
    _ = rZero := mul_zero_right_from_interface C x

/-- Multiplication by an additive inverse on the right negates the product. -/
theorem mul_neg_right_from_interface
    (C : RStageIntegrationCertificate)
    (x y : RBOMA) :
    rMulCandidate x (rNeg y) = rNeg (rMulCandidate x y) := by
  have hd := C.distribRight x y (rNeg y)
  have hy0 : rAdd y (rNeg y) = rZero := C.addInverseRight y
  have hsum :
      rAdd (rMulCandidate x y) (rMulCandidate x (rNeg y)) = rZero := by
    calc
      rAdd (rMulCandidate x y) (rMulCandidate x (rNeg y)) =
          rMulCandidate x (rAdd y (rNeg y)) := hd.symm
      _ = rMulCandidate x rZero := by rw [hy0]
      _ = rZero := mul_zero_right_from_interface C x
  exact add_inverse_unique_from_interface C hsum

/-- Multiplication by an additive inverse on the left negates the product. -/
theorem mul_neg_left_from_interface
    (C : RStageIntegrationCertificate)
    (x y : RBOMA) :
    rMulCandidate (rNeg x) y = rNeg (rMulCandidate x y) := by
  calc
    rMulCandidate (rNeg x) y = rMulCandidate y (rNeg x) :=
      C.mulComm (rNeg x) y
    _ = rNeg (rMulCandidate y x) := mul_neg_right_from_interface C y x
    _ = rNeg (rMulCandidate x y) := by rw [C.mulComm y x]

/-- Squaring a negated value gives the same square, using only accepted field laws. -/
theorem mul_neg_neg_same_from_interface
    (C : RStageIntegrationCertificate)
    (x : RBOMA) :
    rMulCandidate (rNeg x) (rNeg x) = rMulCandidate x x := by
  calc
    rMulCandidate (rNeg x) (rNeg x) =
        rNeg (rMulCandidate x (rNeg x)) :=
      mul_neg_left_from_interface C x (rNeg x)
    _ = rNeg (rNeg (rMulCandidate x x)) := by
      rw [mul_neg_right_from_interface C x x]
    _ = rMulCandidate x x := neg_involutive_from_interface C _

/-- C-RL-001 at the abstract accepted-R interface level: every square is nonnegative.

The proof branches only on total order supplied by the certificate. The
negative branch replaces x by -x and uses identities proved above from the
same abstract interface. -/
theorem square_nonnegative_of_interface
    (C : RStageIntegrationCertificate)
    (x : RBOMA) :
    rLE rZero (rMulCandidate x x) := by
  rcases C.orderTotal rZero x with h0x | hx0
  · have h := C.orderMulNonneg (a := rZero) (b := x) (c := x) h0x h0x
    rw [mul_zero_left_from_interface C x] at h
    exact h
  · have h0nx0 := C.negOrderReversing hx0
    have h0nx : rLE rZero (rNeg x) := by
      rw [neg_zero_from_interface C] at h0nx0
      exact h0nx0
    have h := C.orderMulNonneg
      (a := rZero) (b := rNeg x) (c := rNeg x) h0nx h0nx
    rw [mul_zero_left_from_interface C (rNeg x),
        mul_neg_neg_same_from_interface C x] at h
    exact h

/-- One is nonnegative as the square of one, at the abstract interface level. -/
theorem zero_le_one_of_interface
    (C : RStageIntegrationCertificate) :
    rLE rZero rOne := by
  have h := square_nonnegative_of_interface C rOne
  rw [C.mulOneLeft rOne] at h
  exact h

/-- C-RL-002 at the abstract accepted-R interface level: -1 is not a square. -/
theorem minus_one_not_square_of_interface
    (C : RStageIntegrationCertificate) :
    ¬ ∃ x : RBOMA, rMulCandidate x x = rNeg rOne := by
  rintro ⟨x, hx⟩
  have hsq : rLE rZero (rNeg rOne) := by
    have h := square_nonnegative_of_interface C x
    rw [hx] at h
    exact h
  have h10raw := C.negOrderReversing hsq
  have h10 : rLE rOne rZero := by
    rw [neg_involutive_from_interface C rOne,
        neg_zero_from_interface C] at h10raw
    exact h10raw
  have h01 : rLE rZero rOne := zero_le_one_of_interface C
  have hEq : rZero = rOne := C.orderAntisymm h01 h10
  exact C.nontrivial hEq

/-- C-RL-001 instantiated on the accepted Stage-One R integration certificate. -/
theorem square_nonnegative_from_accepted_R (x : RBOMA) :
    rLE rZero (rMulCandidate x x) :=
  square_nonnegative_of_interface rStageIntegrationCertificate x

/-- C-RL-002 instantiated on the accepted Stage-One R integration certificate.

This is the route-neutral C boundary fact needed to prevent a future
imaginary generator from collapsing into the embedded real line. -/
theorem minus_one_not_square_from_accepted_R :
    ¬ ∃ x : RBOMA, rMulCandidate x x = rNeg rOne :=
  minus_one_not_square_of_interface rStageIntegrationCertificate

end BOMA.C.RInterfaceNoSquareProbe001
