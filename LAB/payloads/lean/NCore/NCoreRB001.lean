/-
BOMA R-B N-Core candidate 001 — unified backend payload.

This file IMPLEMENTS the formal candidate N-RB-CAND-001 under
BOMA-RB-FORMAL-001. It is not the canonical pre-numerical TCT definition.
It deliberately defines a fresh carrier and does not use Lean's built-in Nat
as the N-Core carrier.

Any TCTNF datatype below REPRESENTS selected TCT normal forms for backend
verification only.
-/

namespace BOMA.NCore.RB001

universe u

/-! ## Fresh R-B carrier -/

inductive BOMANat where
  | z : BOMANat
  | s : BOMANat → BOMANat

open BOMANat

/-! ## No-confusion obligations -/

theorem s_ne_z (n : BOMANat) : s n ≠ z := by
  intro h
  cases h

theorem s_injective {a b : BOMANat} (h : s a = s b) : a = b := by
  cases h
  rfl

/-! ## Dependent elimination / induction -/

def ind {P : BOMANat → Type u}
    (hz : P z)
    (hs : ∀ n, P n → P (s n)) :
    ∀ n, P n
  | z => hz
  | s n => hs n (ind hz hs n)

theorem induction_adequacy
    (P : BOMANat → Prop)
    (hz : P z)
    (hs : ∀ n, P n → P (s n)) :
    ∀ n, P n :=
  ind hz hs

/-! ## Nondependent recursion and pointwise uniqueness -/

def fold {X : Type u} (x0 : X) (step : X → X) : BOMANat → X
  | z => x0
  | s n => step (fold x0 step n)

@[simp] theorem fold_z {X : Type u} (x0 : X) (step : X → X) :
    fold x0 step z = x0 := rfl

@[simp] theorem fold_s {X : Type u} (x0 : X) (step : X → X) (n : BOMANat) :
    fold x0 step (s n) = step (fold x0 step n) := rfl

theorem fold_unique
    {X : Type u}
    (x0 : X)
    (step : X → X)
    (h : BOMANat → X)
    (hz : h z = x0)
    (hs : ∀ n, h (s n) = step (h n)) :
    ∀ n, h n = fold x0 step n := by
  intro n
  induction n with
  | z => exact hz
  | s n ih =>
      calc
        h (s n) = step (h n) := hs n
        _ = step (fold x0 step n) := congrArg step ih
        _ = fold x0 step (s n) := by rfl

/-! ## Backend representation of selected TCT normal forms -/

inductive TCTNFPlus where
  | unit : TCTNFPlus
  | ext : TCTNFPlus → TCTNFPlus

inductive TCTNF where
  | eps : TCTNF
  | nonempty : TCTNFPlus → TCTNF

open TCTNFPlus TCTNF

/-- REPRESENTS selected-presentation terminal extension. -/
def extU : TCTNF → TCTNF
  | eps => nonempty unit
  | nonempty p => nonempty (ext p)

/-- Formal realization of non-empty selected TCT presentation syntax. -/
def realizePlus : TCTNFPlus → BOMANat
  | unit => s z
  | ext p => s (realizePlus p)

/-- RB-B01/RB-B02 realization of selected TCT presentation syntax. -/
def realize : TCTNF → BOMANat
  | eps => z
  | nonempty p => realizePlus p

@[simp] theorem realize_eps : realize eps = z := rfl

@[simp] theorem realize_extU (a : TCTNF) :
    realize (extU a) = s (realize a) := by
  cases a <;> rfl

/-- Structural reification used to prove selected-NF bridge faithfulness. -/
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

theorem realize_injective {a b : TCTNF} (h : realize a = realize b) : a = b := by
  have h' := congrArg reify h
  simpa using h'

/-!
For selected normal forms only, canonical PDSA-TCT-004 proves that BR-010
structural equivalence is equivalent to selected-presentation identity.
Therefore backend equality on TCTNF represents ≈ in this restricted scope.
-/

theorem bridge_preserves_selected_identity {a b : TCTNF} (h : a = b) :
    realize a = realize b := by
  cases h
  rfl

theorem bridge_reflects_formal_identity {a b : TCTNF}
    (h : realize a = realize b) : a = b :=
  realize_injective h

/-! ## Unary-algebra initiality / recursion characterization -/

structure UnaryAlgebra where
  Carrier : Type u
  base : Carrier
  step : Carrier → Carrier

structure Hom (A B : UnaryAlgebra) where
  toFun : A.Carrier → B.Carrier
  map_base : toFun A.base = B.base
  map_step : ∀ x, toFun (A.step x) = B.step (toFun x)

/-- The formal BOMA candidate viewed as a unary algebra. -/
def bomaAlg : UnaryAlgebra where
  Carrier := BOMANat
  base := z
  step := s

def idHom (A : UnaryAlgebra) : Hom A A where
  toFun := fun x => x
  map_base := rfl
  map_step := by intro x; rfl

def compHom {A B C : UnaryAlgebra} (g : Hom B C) (f : Hom A B) : Hom A C where
  toFun := fun x => g.toFun (f.toFun x)
  map_base := by
    calc
      g.toFun (f.toFun A.base) = g.toFun B.base := congrArg g.toFun f.map_base
      _ = C.base := g.map_base
  map_step := by
    intro x
    calc
      g.toFun (f.toFun (A.step x)) = g.toFun (B.step (f.toFun x)) :=
        congrArg g.toFun (f.map_step x)
      _ = C.step (g.toFun (f.toFun x)) := g.map_step (f.toFun x)

/-- Existence of the canonical homomorphism from the BOMA candidate. -/
def foldHom (A : UnaryAlgebra) : Hom bomaAlg A where
  toFun := fold A.base A.step
  map_base := rfl
  map_step := by intro n; rfl

/-- Pointwise uniqueness of homomorphisms from the BOMA candidate. -/
theorem foldHom_unique (A : UnaryAlgebra) (h : Hom bomaAlg A) :
    ∀ n, h.toFun n = (foldHom A).toFun n :=
  fold_unique A.base A.step h.toFun h.map_base h.map_step

/-- Pointwise initiality avoids requiring function extensionality. -/
def PointwiseInitial (A : UnaryAlgebra) : Prop :=
  ∀ B : UnaryAlgebra,
    ∃ h : Hom A B,
      ∀ k : Hom A B, ∀ x, k.toFun x = h.toFun x

theorem boma_pointwise_initial : PointwiseInitial bomaAlg := by
  intro B
  refine ⟨foldHom B, ?_⟩
  intro k x
  exact foldHom_unique B k x

/-- Any two pointwise-initial unary algebras are pointwise inverse-isomorphic. -/
theorem pointwise_initial_unique
    (A B : UnaryAlgebra)
    (hA : PointwiseInitial A)
    (hB : PointwiseInitial B) :
    ∃ f : Hom A B, ∃ g : Hom B A,
      (∀ x, g.toFun (f.toFun x) = x) ∧
      (∀ y, f.toFun (g.toFun y) = y) := by
  obtain ⟨f, _hf⟩ := hA B
  obtain ⟨g, _hg⟩ := hB A
  refine ⟨f, g, ?_, ?_⟩
  · obtain ⟨hAA, huniqA⟩ := hA A
    intro x
    have hcomp := huniqA (compHom g f) x
    have hid := huniqA (idHom A) x
    exact hcomp.trans hid.symm
  · obtain ⟨hBB, huniqB⟩ := hB B
    intro y
    have hcomp := huniqB (compHom f g) y
    have hid := huniqB (idHom B) y
    exact hcomp.trans hid.symm

end BOMA.NCore.RB001
