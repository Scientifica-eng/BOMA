/- Rational representation/generation certificate. -/
namespace BOMA.Q.Generation001

open BOMA.Z.Rep001
open BOMA.Q.Fraction001
open BOMA.Q.Quotient001

/-- QA-16 core representation theorem: every formal rational is the quotient
class of an explicit accepted-integer numerator and structurally positive
natural denominator. This is a representation theorem, not a universal property. -/
theorem every_q_has_integer_fraction (q : QBOMA) :
    ∃ a : BOMA.Z.Rep001.ZSigned, ∃ d : PosDen,
      q = qmk ⟨a, d⟩ := by
  refine Quotient.inductionOn q ?_
  intro x
  exact ⟨x.num, x.den, rfl⟩

/-- The representation is faithful modulo exactly FracEquiv: equality of two
explicit fraction classes is neither stronger nor weaker than the certified
cross-product relation. -/
theorem integer_fraction_classes_equal_iff
    (a b : BOMA.Z.Rep001.ZSigned) (d e : PosDen) :
    qmk ⟨a, d⟩ = qmk ⟨b, e⟩ ↔
      BOMA.Z.Arithmetic001.zmul a (denZ e) =
      BOMA.Z.Arithmetic001.zmul b (denZ d) := by
  exact qmk_eq_iff

end BOMA.Q.Generation001
