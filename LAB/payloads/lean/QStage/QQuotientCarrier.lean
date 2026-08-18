/- Stage-One rational formal identity: explicit quotient of verified raw fractions.
   This is the first accepted number-stage candidate to use quotient carrier formation. -/
namespace BOMA.Q.Quotient001

open BOMA.Z.Rep001
open BOMA.Z.Rep001.ZSigned
open BOMA.Z.Arithmetic001
open BOMA.Q.Fraction001

/-- The verified fraction equivalence packaged as a formal Setoid. -/
def fracSetoid : Setoid RawFrac where
  r := FracEquiv
  iseqv := ⟨frac_refl, @frac_symm, @frac_trans⟩

/-- Candidate Stage-One rational carrier. -/
def QBOMA : Type := Quotient fracSetoid

/-- Canonical injection of a raw valid fraction into the quotient carrier. -/
def qmk (x : RawFrac) : QBOMA := Quotient.mk fracSetoid x

/-- Representation-equivalent raw fractions become formally equal in QBOMA. -/
theorem qmk_sound {x y : RawFrac} (h : FracEquiv x y) : qmk x = qmk y :=
  Quotient.sound h

/-- Conversely, quotient equality reflects the verified raw equivalence. -/
theorem qmk_eq_iff {x y : RawFrac} : qmk x = qmk y ↔ FracEquiv x y := by
  constructor
  · intro h
    exact Quotient.exact h
  · exact qmk_sound

/-- Lift raw negation through the verified respect proof. -/
def qNeg : QBOMA → QBOMA :=
  Quotient.lift
    (fun a => qmk (rawNeg a))
    (fun _ _ h => qmk_sound (rawNeg_respects h))

/-- Lift raw addition through the verified binary respect proof. -/
def qAdd : QBOMA → QBOMA → QBOMA :=
  Quotient.lift₂
    (fun a b => qmk (rawAdd a b))
    (fun _ _ _ _ ha hb => qmk_sound (rawAdd_respects ha hb))

/-- Lift raw multiplication through the verified binary respect proof. -/
def qMul : QBOMA → QBOMA → QBOMA :=
  Quotient.lift₂
    (fun a b => qmk (rawMul a b))
    (fun _ _ _ _ ha hb => qmk_sound (rawMul_respects ha hb))

/-- Quotient zero and one. -/
def qZero : QBOMA := qmk rawZero
def qOne : QBOMA := qmk rawOne

/-- Accepted integer embedding into the quotient rational carrier. -/
def qOfZ (a : ZSigned) : QBOMA := qmk (fracOfZ a)

/-- Integer embedding remains injective after quotienting. -/
theorem qOfZ_injective {a b : ZSigned} (h : qOfZ a = qOfZ b) : a = b := by
  apply fracOfZ_reflects
  exact Quotient.exact h

/-- Quotient operations compute on raw representatives exactly as intended. -/
@[simp] theorem qNeg_mk (x : RawFrac) : qNeg (qmk x) = qmk (rawNeg x) := rfl

@[simp] theorem qAdd_mk (x y : RawFrac) :
    qAdd (qmk x) (qmk y) = qmk (rawAdd x y) := rfl

@[simp] theorem qMul_mk (x y : RawFrac) :
    qMul (qmk x) (qmk y) = qmk (rawMul x y) := rfl

end BOMA.Q.Quotient001
