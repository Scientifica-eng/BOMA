/-
BOMA TCT → R-B N-Core backend bridge candidate.

IMPORTANT CLASSIFICATION
------------------------
TCTNF / TCTNFPlus REPRESENT the canonical selected TCT normal-form grammar.
They are backend verification datatypes introduced after the formalization
boundary. They are not the pre-numerical TCT mathematical carrier.

On selected normal forms, PDSA-TCT-004 established that BR-010 structural
equivalence is reflected by selected-presentation identity. Accordingly,
backend equality on TCTNF represents ≈ only in this restricted selected-NF
verification scope.
-/

import «LAB».payloads.lean.NCore.BOMANat

namespace BOMA.NCore.TCTBridge

open BOMA.NCore
open BOMANat

/-- Backend representation of the non-empty selected grammar:
    NF+ ::= U | (NF+ ⊙ U). -/
inductive TCTNFPlus where
  | unit : TCTNFPlus
  | ext : TCTNFPlus → TCTNFPlus

/-- Backend representation of the selected grammar:
    NF ::= ε | NF+. -/
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

/-- Helper: construct the non-empty selected presentation corresponding
    to one formal successor above a BOMANat argument. -/
def plusFromBOMANat : BOMANat → TCTNFPlus
  | z => unit
  | s n => ext (plusFromBOMANat n)

/-- Reification used only to prove backend bridge faithfulness. -/
def reify : BOMANat → TCTNF
  | z => eps
  | s n => nonempty (plusFromBOMANat n)

@[simp] theorem realizePlus_plusFromBOMANat (n : BOMANat) :
    realizePlus (plusFromBOMANat n) = s n := by
  induction n with
  | z => rfl
  | s n ih =>
      simp [plusFromBOMANat, realizePlus, ih]

@[simp] theorem realize_reify (n : BOMANat) :
    realize (reify n) = n := by
  cases n with
  | z => rfl
  | s n =>
      simp [reify, realize, realizePlus_plusFromBOMANat]

@[simp] theorem plusFromBOMANat_realizePlus (p : TCTNFPlus) :
    plusFromBOMANat (match realizePlus p with | z => z | s n => n) = p := by
  induction p with
  | unit => rfl
  | ext p ih =>
      simp [realizePlus, plusFromBOMANat, ih]

@[simp] theorem reify_realize (a : TCTNF) :
    reify (realize a) = a := by
  cases a with
  | eps => rfl
  | nonempty p =>
      induction p with
      | unit => rfl
      | ext p ih =>
          simp [realize, realizePlus, reify, plusFromBOMANat, ih]

/-- NAC-06 faithfulness/reflection at the selected-NF backend representation. -/
theorem realize_injective {a b : TCTNF} (h : realize a = realize b) : a = b := by
  have h' := congrArg reify h
  simpa using h'

/-- Preservation of represented structural equivalence.
    Backend equality represents ≈ only for selected normal forms. -/
theorem realizes_equal_presentations {a b : TCTNF} (h : a = b) :
    realize a = realize b := by
  cases h
  rfl

/-- Reflection of formal carrier identity back to selected-presentation identity,
    the backend counterpart of the Stage-One faithfulness requirement. -/
theorem reflects_formal_identity {a b : TCTNF} (h : realize a = realize b) :
    a = b := realize_injective h

end BOMA.NCore.TCTBridge
