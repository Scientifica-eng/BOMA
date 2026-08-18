/-
BOMA selected-normal-form TCT → R-B N-Core backend bridge.

CLASSIFICATION
TCTNF / TCTNFPlus REPRESENT the canonical selected TCT normal-form grammar.
They are backend verification datatypes introduced after the formalization
boundary. They are not the pre-numerical TCT mathematical carrier.

PDSA-TCT-004 established, on selected normal forms, that BR-010 structural
equivalence is equivalent to selected-presentation identity. Accordingly,
backend equality on TCTNF represents ≈ only in this restricted selected-NF
verification scope.
-/

import LAB.payloads.lean.NCore.BOMANat

namespace BOMA.NCore.TCTBridge

open BOMA.NCore
open BOMANat

/-- Backend representation of NF+ ::= U | (NF+ ⊙ U). -/
inductive TCTNFPlus where
  | unit : TCTNFPlus
  | ext : TCTNFPlus → TCTNFPlus

/-- Backend representation of NF ::= ε | NF+. -/
inductive TCTNF where
  | eps : TCTNF
  | nonempty : TCTNFPlus → TCTNF

open TCTNFPlus TCTNF

/-- Selected-presentation terminal extension. -/
def extU : TCTNF → TCTNF
  | eps => nonempty unit
  | nonempty p => nonempty (ext p)

/-- Formal realization of a non-empty selected TCT presentation. -/
def realizePlus : TCTNFPlus → BOMANat
  | unit => s z
  | ext p => s (realizePlus p)

/-- RB-B01/RB-B02 realization of selected TCT presentations. -/
def realize : TCTNF → BOMANat
  | eps => z
  | nonempty p => realizePlus p

@[simp] theorem realize_eps : realize eps = z := rfl

@[simp] theorem realize_extU (a : TCTNF) :
    realize (extU a) = s (realize a) := by
  cases a <;> rfl

/-- Structural reification used to prove bridge faithfulness. -/
def reify : BOMANat → TCTNF
  | z => eps
  | s n => extU (reify n)

@[simp] theorem realize_reify (n : BOMANat) :
    realize (reify n) = n := by
  induction n with
  | z => rfl
  | s n ih => simp [reify, ih]

@[simp] theorem reify_realizePlus (p : TCTNFPlus) :
    reify (realizePlus p) = nonempty p := by
  induction p with
  | unit => rfl
  | ext p ih => simp [realizePlus, reify, extU, ih]

@[simp] theorem reify_realize (a : TCTNF) :
    reify (realize a) = a := by
  cases a with
  | eps => rfl
  | nonempty p => exact reify_realizePlus p

/-- NAC-06 reflection/faithfulness on the selected-NF backend representation. -/
theorem realize_injective {a b : TCTNF} (h : realize a = realize b) : a = b := by
  have h' := congrArg reify h
  simpa using h'

/-- Preservation of represented structural equivalence on selected NF. -/
theorem realizes_equal_presentations {a b : TCTNF} (h : a = b) :
    realize a = realize b := by
  cases h
  rfl

/-- Reflection of formal identity back to selected-presentation identity. -/
theorem reflects_formal_identity {a b : TCTNF} (h : realize a = realize b) :
    a = b := realize_injective h

end BOMA.NCore.TCTBridge
