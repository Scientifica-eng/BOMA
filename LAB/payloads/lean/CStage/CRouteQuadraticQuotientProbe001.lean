/- PDSA-C-003 Route Q: noncanonical quadratic-expression quotient probe.

This is a formal-expression / normalization / quotient-style adjunction
candidate. It is not a claim that a full polynomial ring R[X] has already
been constructed. All coefficient-normal-form declarations are local to this
namespace; the source does not import the Route P probe.
-/
namespace BOMA.C.RouteQuadraticQuotientProbe001

open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.StageIntegration002
open BOMA.C.RInterfaceNoSquareProbe001

/-- Route-Q-local quadratic normal form; independent of Route P declarations. -/
structure NormalForm where
  re : RBOMA
  im : RBOMA

def nfReal (a : RBOMA) : NormalForm := ⟨a, rZero⟩
def nfImag : NormalForm := ⟨rZero, rOne⟩

def nfNeg (u : NormalForm) : NormalForm :=
  ⟨rNeg u.re, rNeg u.im⟩

def nfAdd (u v : NormalForm) : NormalForm :=
  ⟨rAdd u.re v.re, rAdd u.im v.im⟩

def nfMul (u v : NormalForm) : NormalForm :=
  ⟨rAdd (rMulCandidate u.re v.re)
      (rNeg (rMulCandidate u.im v.im)),
   rAdd (rMulCandidate u.re v.im)
      (rMulCandidate u.im v.re)⟩

/-- Freely written finite quadratic-adjunction expressions. -/
inductive Expr where
  | coeff : RBOMA → Expr
  | generator : Expr
  | neg : Expr → Expr
  | add : Expr → Expr → Expr
  | mul : Expr → Expr → Expr

/-- Evaluation modulo the declared generator relation X² = -1. -/
def normalize : Expr → NormalForm
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

/-- Route-Q carrier: syntax modulo equal quadratic normal forms. -/
def QuotientCandidate : Type := Quotient exprSetoid

def qmk (e : Expr) : QuotientCandidate :=
  Quotient.mk exprSetoid e

theorem qmk_eq_iff {e f : Expr} :
    qmk e = qmk f ↔ normalize e = normalize f := by
  constructor
  · intro h
    exact Quotient.exact h
  · intro h
    exact Quotient.sound h

theorem neg_respects {e e' : Expr}
    (h : exprEquiv e e') :
    exprEquiv (.neg e) (.neg e') := by
  change nfNeg (normalize e) = nfNeg (normalize e')
  rw [h]

theorem add_respects {e e' f f' : Expr}
    (he : exprEquiv e e')
    (hf : exprEquiv f f') :
    exprEquiv (.add e f) (.add e' f') := by
  change nfAdd (normalize e) (normalize f) =
    nfAdd (normalize e') (normalize f')
  rw [he, hf]

theorem mul_respects {e e' f f' : Expr}
    (he : exprEquiv e e')
    (hf : exprEquiv f f') :
    exprEquiv (.mul e f) (.mul e' f') := by
  change nfMul (normalize e) (normalize f) =
    nfMul (normalize e') (normalize f')
  rw [he, hf]

def neg : QuotientCandidate → QuotientCandidate :=
  Quotient.lift
    (fun e => qmk (.neg e))
    (fun _ _ h => Quotient.sound (neg_respects h))

def add : QuotientCandidate → QuotientCandidate → QuotientCandidate :=
  Quotient.lift₂
    (fun e f => qmk (.add e f))
    (fun _ _ _ _ he hf => Quotient.sound (add_respects he hf))

def mul : QuotientCandidate → QuotientCandidate → QuotientCandidate :=
  Quotient.lift₂
    (fun e f => qmk (.mul e f))
    (fun _ _ _ _ he hf => Quotient.sound (mul_respects he hf))

def ofR (a : RBOMA) : QuotientCandidate := qmk (.coeff a)
def zero : QuotientCandidate := ofR rZero
def one : QuotientCandidate := ofR rOne
def imag : QuotientCandidate := qmk .generator

theorem add_zero_right_from_interface
    (C : RStageIntegrationCertificate) (x : RBOMA) :
    rAdd x rZero = x := by
  calc
    rAdd x rZero = rAdd rZero x := C.addComm x rZero
    _ = x := C.addZeroLeft x

theorem mul_one_right_from_interface
    (C : RStageIntegrationCertificate) (x : RBOMA) :
    rMulCandidate x rOne = x := by
  calc
    rMulCandidate x rOne = rMulCandidate rOne x := C.mulComm x rOne
    _ = x := C.mulOneLeft x

/-- P/Q-03: quotient identity preserves faithful real coefficients. -/
theorem ofR_injective {a b : RBOMA}
    (h : ofR a = ofR b) : a = b := by
  have hn : normalize (.coeff a) = normalize (.coeff b) :=
    (qmk_eq_iff.mp h)
  exact congrArg NormalForm.re hn

/-- Route-local normal form of a formal real-plus-imaginary expression. -/
theorem normalized_coordinate_expression
    (C : RStageIntegrationCertificate) (a b : RBOMA) :
    normalize (.add (.coeff a) (.mul (.coeff b) .generator)) =
      ⟨a, b⟩ := by
  apply NormalForm.ext
  · change
      rAdd a
        (rAdd (rMulCandidate b rZero)
          (rNeg (rMulCandidate rZero rOne))) = a
    rw [mul_zero_right_from_interface C b,
        mul_zero_left_from_interface C rOne,
        neg_zero_from_interface C,
        C.addZeroLeft rZero,
        add_zero_right_from_interface C a]
  · change
      rAdd rZero
        (rAdd (rMulCandidate b rOne)
          (rMulCandidate rZero rZero)) = b
    rw [mul_one_right_from_interface C b,
        mul_zero_left_from_interface C rZero,
        add_zero_right_from_interface C b,
        C.addZeroLeft b]

/-- P/Q-06: quotient identity enforces the declared quadratic relation. -/
theorem imag_squared
    (C : RStageIntegrationCertificate) :
    mul imag imag = neg one := by
  apply Quotient.sound
  change nfMul nfImag nfImag = nfNeg (nfReal rOne)
  apply NormalForm.ext
  · change
      rAdd (rMulCandidate rZero rZero)
        (rNeg (rMulCandidate rOne rOne)) = rNeg rOne
    rw [mul_zero_left_from_interface C rZero,
        C.mulOneLeft rOne,
        C.addZeroLeft (rNeg rOne)]
  · change
      rAdd (rMulCandidate rZero rOne)
        (rMulCandidate rOne rZero) = rNeg rZero
    rw [mul_zero_left_from_interface C rOne,
        C.mulOneLeft rZero,
        C.addZeroLeft rZero,
        neg_zero_from_interface C]

/-- Every raw expression is equivalent to its declared quadratic normal form. -/
theorem representative_decomposition
    (C : RStageIntegrationCertificate) (e : Expr) :
    qmk e =
      add (ofR (normalize e).re)
        (mul (ofR (normalize e).im) imag) := by
  apply Quotient.sound
  change
    normalize e =
      normalize
        (.add (.coeff (normalize e).re)
          (.mul (.coeff (normalize e).im) .generator))
  rw [normalized_coordinate_expression C
      (normalize e).re (normalize e).im]
  cases normalize e
  rfl

/-- P/Q-07: every quotient value has a real/imaginary decomposition. -/
theorem decomposition
    (C : RStageIntegrationCertificate) (z : QuotientCandidate) :
    ∃ a b : RBOMA, z = add (ofR a) (mul (ofR b) imag) := by
  refine Quotient.inductionOn z ?_
  intro e
  exact ⟨(normalize e).re, (normalize e).im,
    representative_decomposition C e⟩

/-- P/Q-08: quotient equality retains unique real/imaginary coordinates. -/
theorem decomposition_unique
    (C : RStageIntegrationCertificate)
    {a b a' b' : RBOMA}
    (h : add (ofR a) (mul (ofR b) imag) =
      add (ofR a') (mul (ofR b') imag)) :
    a = a' ∧ b = b' := by
  have hn :
      normalize (.add (.coeff a) (.mul (.coeff b) .generator)) =
      normalize (.add (.coeff a') (.mul (.coeff b') .generator)) :=
    Quotient.exact h
  rw [normalized_coordinate_expression C a b,
      normalized_coordinate_expression C a' b'] at hn
  exact ⟨congrArg NormalForm.re hn,
         congrArg NormalForm.im hn⟩

/-- P/Q-09: the quotient generator cannot equal an embedded real. -/
theorem imag_not_real
    (C : RStageIntegrationCertificate) :
    ¬ ∃ a : RBOMA, imag = ofR a := by
  rintro ⟨a, ha⟩
  have hn : normalize .generator = normalize (.coeff a) :=
    Quotient.exact ha
  have h : rOne = rZero := congrArg NormalForm.im hn
  exact C.nontrivial h.symm

end BOMA.C.RouteQuadraticQuotientProbe001
