/- ST2-EXP-015 Gate B: Cauchy-native Route-Q syntax, canonical normalization,
   quotient carrier, coordinate semantics, and explicit extractor.

This source consumes only the independently verified Cauchy-real producer and
Lean quotient/setoid infrastructure. It does not consume Dedekind completion,
ST2-EXP-002 Route-Q producers, H5 transport, or the Route-P complex field. -/
namespace BOMA.C.StageTwo.CauchyQRoute015

open BOMA.Q.Quotient001
open BOMA.Q.Integration001
open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyAdditive003
open BOMA.R.StageTwo.CauchyMultiplicative003

/-- Canonical quadratic normal form over the fixed Cauchy real scalar. -/
structure CauchyQNormal where
  re : RCBOMA
  im : RCBOMA

/-- Coordinate equality is the normal-form identity. -/
theorem normal_ext {u v : CauchyQNormal}
    (hre : u.re = v.re) (him : u.im = v.im) : u = v := by
  cases u
  cases v
  cases hre
  cases him
  rfl

def nfReal (a : RCBOMA) : CauchyQNormal := ⟨a, rCZero⟩
def nfImag : CauchyQNormal := ⟨rCZero, rCOne⟩
def nfNeg (u : CauchyQNormal) : CauchyQNormal := ⟨rCNeg u.re, rCNeg u.im⟩
def nfAdd (u v : CauchyQNormal) : CauchyQNormal :=
  ⟨rCAdd u.re v.re, rCAdd u.im v.im⟩
def nfMul (u v : CauchyQNormal) : CauchyQNormal :=
  ⟨rCAdd (rCMul u.re v.re) (rCNeg (rCMul u.im v.im)),
   rCAdd (rCMul u.re v.im) (rCMul u.im v.re)⟩

/-- Frozen Route-Q raw expression syntax over RCBOMA. -/
inductive Expr where
  | coeff : RCBOMA → Expr
  | generator : Expr
  | neg : Expr → Expr
  | add : Expr → Expr → Expr
  | mul : Expr → Expr → Expr

/-- Canonical evaluation modulo X^2 = -1. -/
def normalize : Expr → CauchyQNormal
  | .coeff a => nfReal a
  | .generator => nfImag
  | .neg e => nfNeg (normalize e)
  | .add e f => nfAdd (normalize e) (normalize f)
  | .mul e f => nfMul (normalize e) (normalize f)

def exprEquiv (e f : Expr) : Prop := normalize e = normalize f

def exprSetoid : Setoid Expr where
  r := exprEquiv
  iseqv :=
    ⟨(fun _ => rfl),
      (fun h => h.symm),
      (fun h₁ h₂ => h₁.trans h₂)⟩

/-- Genuine syntax quotient; this is not the Route-P pair carrier. -/
def CauchyQBOMA : Type := Quotient exprSetoid

def qmk (e : Expr) : CauchyQBOMA := Quotient.mk exprSetoid e

theorem qmk_eq_iff {e f : Expr} :
    qmk e = qmk f ↔ normalize e = normalize f := by
  constructor
  · intro h
    exact Quotient.exact h
  · intro h
    exact Quotient.sound h

theorem neg_respects {e e' : Expr} (h : exprEquiv e e') :
    exprEquiv (.neg e) (.neg e') := by
  change nfNeg (normalize e) = nfNeg (normalize e')
  rw [h]

theorem add_respects {e e' f f' : Expr}
    (he : exprEquiv e e') (hf : exprEquiv f f') :
    exprEquiv (.add e f) (.add e' f') := by
  change nfAdd (normalize e) (normalize f) =
    nfAdd (normalize e') (normalize f')
  rw [he, hf]

theorem mul_respects {e e' f f' : Expr}
    (he : exprEquiv e e') (hf : exprEquiv f f') :
    exprEquiv (.mul e f) (.mul e' f') := by
  change nfMul (normalize e) (normalize f) =
    nfMul (normalize e') (normalize f')
  rw [he, hf]

def qNeg : CauchyQBOMA → CauchyQBOMA :=
  Quotient.lift
    (fun e => qmk (.neg e))
    (fun _ _ h => Quotient.sound (neg_respects h))

def qAdd : CauchyQBOMA → CauchyQBOMA → CauchyQBOMA :=
  Quotient.lift₂
    (fun e f => qmk (.add e f))
    (fun _ _ _ _ he hf => Quotient.sound (add_respects he hf))

def qMul : CauchyQBOMA → CauchyQBOMA → CauchyQBOMA :=
  Quotient.lift₂
    (fun e f => qmk (.mul e f))
    (fun _ _ _ _ he hf => Quotient.sound (mul_respects he hf))

def qOfR (a : RCBOMA) : CauchyQBOMA := qmk (.coeff a)
def qZero : CauchyQBOMA := qOfR rCZero
def qOne : CauchyQBOMA := qOfR rCOne
def qI : CauchyQBOMA := qmk .generator

/-- Right additive zero from the independent Cauchy additive laws. -/
theorem scalar_add_zero_right (x : RCBOMA) : rCAdd x rCZero = x := by
  rw [rCAdd_comm x rCZero, rCAdd_zero_left]

/-- Right multiplicative unit from the independent Cauchy multiplicative laws. -/
theorem scalar_mul_one_right (x : RCBOMA) : rCMul x rCOne = x := by
  rw [rCMul_comm x rCOne, rCMul_one_left]

/-- Right multiplicative zero from commutativity. -/
theorem scalar_mul_zero_right (x : RCBOMA) : rCMul x rCZero = rCZero := by
  rw [rCMul_comm x rCZero, rCMul_zero_left]

/-- Cauchy-real negation fixes zero. -/
theorem scalar_neg_zero : rCNeg rCZero = rCZero := by
  have h := rCAdd_neg_right rCZero
  rw [rCAdd_zero_left] at h
  exact h

/-- The alternative real zero and one remain distinct. -/
theorem scalar_nontrivial : rCZero ≠ rCOne := by
  intro h
  have hq :
      rCOfQ BOMA.Q.Quotient001.qZero =
        rCOfQ BOMA.Q.Quotient001.qOne := h
  exact q_nontrivial (rCOfQ_injective hq)

/-- Quotient identity preserves faithful Cauchy-real coefficients. -/
theorem q_ofR_injective {a b : RCBOMA} (h : qOfR a = qOfR b) : a = b := by
  have hn : normalize (.coeff a) = normalize (.coeff b) := Quotient.exact h
  exact congrArg CauchyQNormal.re hn

/-- Canonical normal form of an embedded real-plus-imaginary expression. -/
theorem normalized_coordinate_expression (a b : RCBOMA) :
    normalize (.add (.coeff a) (.mul (.coeff b) .generator)) = ⟨a, b⟩ := by
  apply normal_ext
  · change
      rCAdd a
        (rCAdd (rCMul b rCZero)
          (rCNeg (rCMul rCZero rCOne))) = a
    rw [scalar_mul_zero_right b,
        rCMul_zero_left rCOne,
        scalar_neg_zero,
        rCAdd_zero_left,
        scalar_add_zero_right a]
  · change
      rCAdd rCZero
        (rCAdd (rCMul b rCOne)
          (rCMul rCZero rCZero)) = b
    rw [scalar_mul_one_right b,
        rCMul_zero_left rCZero,
        scalar_add_zero_right b,
        rCAdd_zero_left]

/-- The quotient generator satisfies the frozen quadratic relation. -/
theorem q_i_squared : qMul qI qI = qNeg qOne := by
  apply Quotient.sound
  change nfMul nfImag nfImag = nfNeg (nfReal rCOne)
  apply normal_ext
  · change
      rCAdd (rCMul rCZero rCZero)
        (rCNeg (rCMul rCOne rCOne)) = rCNeg rCOne
    rw [rCMul_zero_left rCZero, rCMul_one_left rCOne, rCAdd_zero_left]
  · change
      rCAdd (rCMul rCZero rCOne)
        (rCMul rCOne rCZero) = rCNeg rCZero
    rw [rCMul_zero_left rCOne, scalar_mul_zero_right rCOne,
        rCAdd_zero_left, scalar_neg_zero]

/-- Every syntax representative equals its canonical real-plus-imaginary form. -/
theorem representative_decomposition (e : Expr) :
    qmk e =
      qAdd (qOfR (normalize e).re)
        (qMul (qOfR (normalize e).im) qI) := by
  apply Quotient.sound
  change
    normalize e =
      normalize
        (.add (.coeff (normalize e).re)
          (.mul (.coeff (normalize e).im) .generator))
  rw [normalized_coordinate_expression (normalize e).re (normalize e).im]

/-- Every quotient value has explicit RCBOMA coordinates. -/
theorem q_generation (z : CauchyQBOMA) :
    ∃ a b : RCBOMA, z = qAdd (qOfR a) (qMul (qOfR b) qI) := by
  refine Quotient.inductionOn z ?_
  intro e
  exact ⟨(normalize e).re, (normalize e).im, representative_decomposition e⟩

/-- Quotient equality retains unique canonical coordinates. -/
theorem q_coordinate_unique {a b a' b' : RCBOMA}
    (h : qAdd (qOfR a) (qMul (qOfR b) qI) =
      qAdd (qOfR a') (qMul (qOfR b') qI)) :
    a = a' ∧ b = b' := by
  have hn :
      normalize (.add (.coeff a) (.mul (.coeff b) .generator)) =
      normalize (.add (.coeff a') (.mul (.coeff b') .generator)) :=
    Quotient.exact h
  rw [normalized_coordinate_expression a b,
      normalized_coordinate_expression a' b'] at hn
  exact ⟨congrArg CauchyQNormal.re hn, congrArg CauchyQNormal.im hn⟩

/-- The quotient generator is not on the embedded Cauchy-real line. -/
theorem q_i_not_real : ¬ ∃ a : RCBOMA, qI = qOfR a := by
  rintro ⟨a, ha⟩
  have hn : normalize .generator = normalize (.coeff a) := Quotient.exact ha
  have h : rCOne = rCZero := congrArg CauchyQNormal.im hn
  exact scalar_nontrivial h.symm

/-- Canonical normalization descends to the quotient without representative choice. -/
def qNormal : CauchyQBOMA → CauchyQNormal :=
  Quotient.lift normalize (fun _ _ h => h)

/-- Equality of canonical normal forms determines quotient equality. -/
theorem q_ext {z w : CauchyQBOMA} (h : qNormal z = qNormal w) : z = w := by
  revert h
  refine Quotient.inductionOn₂ z w ?_
  intro e f h
  exact Quotient.sound h

theorem q_normal_zero : qNormal qZero = nfReal rCZero := rfl
theorem q_normal_one : qNormal qOne = nfReal rCOne := rfl
theorem q_normal_ofR (a : RCBOMA) : qNormal (qOfR a) = nfReal a := rfl
theorem q_normal_imag : qNormal qI = nfImag := rfl

theorem q_normal_neg (z : CauchyQBOMA) :
    qNormal (qNeg z) = nfNeg (qNormal z) := by
  refine Quotient.inductionOn z ?_
  intro e
  rfl

theorem q_normal_add (z w : CauchyQBOMA) :
    qNormal (qAdd z w) = nfAdd (qNormal z) (qNormal w) := by
  refine Quotient.inductionOn₂ z w ?_
  intro e f
  rfl

theorem q_normal_mul (z w : CauchyQBOMA) :
    qNormal (qMul z w) = nfMul (qNormal z) (qNormal w) := by
  refine Quotient.inductionOn₂ z w ?_
  intro e f
  rfl

def qCoord (a b : RCBOMA) : CauchyQBOMA :=
  qAdd (qOfR a) (qMul (qOfR b) qI)

theorem q_normal_coord (a b : RCBOMA) : qNormal (qCoord a b) = ⟨a, b⟩ := by
  exact normalized_coordinate_expression a b

def qRe (z : CauchyQBOMA) : RCBOMA := (qNormal z).re
def qIm (z : CauchyQBOMA) : RCBOMA := (qNormal z).im

/-- Explicit canonical extractor soundness; no quotient representative is selected. -/
theorem q_extract_sound (z : CauchyQBOMA) : z = qCoord (qRe z) (qIm z) := by
  apply q_ext
  rw [q_normal_coord]
  change qNormal z = ⟨(qNormal z).re, (qNormal z).im⟩
  cases qNormal z
  rfl

theorem q_zero_ne_one : qZero ≠ qOne := by
  intro h
  exact scalar_nontrivial (q_ofR_injective h)

/-- Gate-B research certificate: representation, quotient identity, coordinates, and extractor. -/
structure CauchyQRouteCertificate where
  nontrivial : qZero ≠ qOne
  embeddingInjective : ∀ {a b : RCBOMA}, qOfR a = qOfR b → a = b
  imagSquared : qMul qI qI = qNeg qOne
  generation : ∀ z : CauchyQBOMA,
    ∃ a b : RCBOMA, z = qCoord a b
  coordinateUnique : ∀ {a b a' b' : RCBOMA},
    qCoord a b = qCoord a' b' → a = a' ∧ b = b'
  imagNotReal : ¬ ∃ a : RCBOMA, qI = qOfR a
  extractorSound : ∀ z : CauchyQBOMA, z = qCoord (qRe z) (qIm z)

theorem cauchyQRouteCertificate : CauchyQRouteCertificate where
  nontrivial := q_zero_ne_one
  embeddingInjective := @q_ofR_injective
  imagSquared := q_i_squared
  generation := q_generation
  coordinateUnique := @q_coordinate_unique
  imagNotReal := q_i_not_real
  extractorSound := q_extract_sound

end BOMA.C.StageTwo.CauchyQRoute015
