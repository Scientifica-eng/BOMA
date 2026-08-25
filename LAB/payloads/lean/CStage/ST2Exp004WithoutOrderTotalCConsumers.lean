/- ST2-EXP-004 Gate E: C consumers over the ST2-EXP-001 production
interface with exactly `orderTotal` removed.

The source is research-only.  It proves representative selected-pair carrier,
embedding, generator, coordinate, nonreal, and comparison claims without an
order-totality field.  Field/integration are intentionally not asserted here;
the Gate-E workflow audits their existing ST2-EXP-001 proof closures separately. -/
namespace BOMA.C.StageTwo.TotalOrderRegime004.WithoutOrderTotal

open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.C.StageTwo.ComparisonInterface011

/-- Exact ST2-EXP-001 sixteen-property production interface minus only
`orderTotal`. -/
structure RWithoutOrderTotalCertificate where
  orderTrans : ∀ a b c : RBOMA, rLE a b → rLE b c → rLE a c
  orderAntisymm : ∀ a b : RBOMA, rLE a b → rLE b a → a = b
  nontrivial : rZero ≠ rOne
  addComm : ∀ a b : RBOMA, rAdd a b = rAdd b a
  addAssoc : ∀ a b c : RBOMA, rAdd (rAdd a b) c = rAdd a (rAdd b c)
  addZeroLeft : ∀ a : RBOMA, rAdd rZero a = a
  addInverseRight : ∀ a : RBOMA, rAdd a (rNeg a) = rZero
  addTranslateOrderIff : ∀ a b c : RBOMA,
    rLE (rAdd a c) (rAdd b c) ↔ rLE a b
  negOrderReversing : ∀ {a b : RBOMA}, rLE a b → rLE (rNeg b) (rNeg a)
  mulComm : ∀ a b : RBOMA, rMulCandidate a b = rMulCandidate b a
  mulAssoc : ∀ a b c : RBOMA,
    rMulCandidate (rMulCandidate a b) c = rMulCandidate a (rMulCandidate b c)
  mulOneLeft : ∀ a : RBOMA, rMulCandidate rOne a = a
  distribRight : ∀ a b c : RBOMA,
    rMulCandidate a (rAdd b c) =
      rAdd (rMulCandidate a b) (rMulCandidate a c)
  orderMulNonneg : ∀ {a b c : RBOMA},
    rLE a b → rLE rZero c →
    rLE (rMulCandidate a c) (rMulCandidate b c)
  inverseExists : ∀ a : RBOMA, a ≠ rZero →
    ∃ b : RBOMA, rMulCandidate a b = rOne

/-- Additive inverse of zero uses no order principle. -/
theorem neg_zero004 (C : RWithoutOrderTotalCertificate) :
    rNeg rZero = rZero := by
  calc
    rNeg rZero = rAdd rZero (rNeg rZero) :=
      (C.addZeroLeft (rNeg rZero)).symm
    _ = rZero := C.addInverseRight rZero

/-- Right additive identity from commutativity plus the left identity. -/
theorem add_zero_right004
    (C : RWithoutOrderTotalCertificate) (x : RBOMA) :
    rAdd x rZero = x := by
  calc
    rAdd x rZero = rAdd rZero x := C.addComm x rZero
    _ = x := C.addZeroLeft x

/-- Right multiplication by zero without totality. -/
theorem mul_zero_right004
    (C : RWithoutOrderTotalCertificate) (x : RBOMA) :
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

/-- Left multiplication by zero without totality. -/
theorem mul_zero_left004
    (C : RWithoutOrderTotalCertificate) (x : RBOMA) :
    rMulCandidate rZero x = rZero := by
  calc
    rMulCandidate rZero x = rMulCandidate x rZero := C.mulComm rZero x
    _ = rZero := mul_zero_right004 C x

/-- Right multiplicative unit without totality. -/
theorem mul_one_right004
    (C : RWithoutOrderTotalCertificate) (x : RBOMA) :
    rMulCandidate x rOne = x := by
  calc
    rMulCandidate x rOne = rMulCandidate rOne x := C.mulComm x rOne
    _ = x := C.mulOneLeft x

/-- Same rank-two carrier shape used by Route P, defined locally to avoid
importing a larger accepted C proof package. -/
structure Pair004 where
  re : RBOMA
  im : RBOMA

theorem pair_ext004 {z w : Pair004}
    (hre : z.re = w.re) (him : z.im = w.im) : z = w := by
  cases z
  cases w
  simp_all

abbrev zero004 : Pair004 := ⟨rZero, rZero⟩
abbrev one004 : Pair004 := ⟨rOne, rZero⟩
abbrev ofR004 (a : RBOMA) : Pair004 := ⟨a, rZero⟩
abbrev imag004 : Pair004 := ⟨rZero, rOne⟩
abbrev neg004 (z : Pair004) : Pair004 := ⟨rNeg z.re, rNeg z.im⟩
abbrev add004 (z w : Pair004) : Pair004 :=
  ⟨rAdd z.re w.re, rAdd z.im w.im⟩
abbrev mul004 (z w : Pair004) : Pair004 :=
  ⟨rAdd (rMulCandidate z.re w.re) (rNeg (rMulCandidate z.im w.im)),
   rAdd (rMulCandidate z.re w.im) (rMulCandidate z.im w.re)⟩

/-- C-CL-REMBED-001 representative: faithful real embedding. -/
theorem ofR_injective004 {a b : RBOMA}
    (h : ofR004 a = ofR004 b) : a = b :=
  congrArg Pair004.re h

theorem ofR_zero004 : ofR004 rZero = zero004 := rfl
theorem ofR_one004 : ofR004 rOne = one004 := rfl

theorem ofR_neg004
    (C : RWithoutOrderTotalCertificate) (a : RBOMA) :
    ofR004 (rNeg a) = neg004 (ofR004 a) := by
  apply pair_ext004
  · rfl
  · exact (neg_zero004 C).symm

theorem ofR_add004
    (C : RWithoutOrderTotalCertificate) (a b : RBOMA) :
    ofR004 (rAdd a b) = add004 (ofR004 a) (ofR004 b) := by
  apply pair_ext004
  · rfl
  · exact (C.addZeroLeft rZero).symm

theorem ofR_mul004
    (C : RWithoutOrderTotalCertificate) (a b : RBOMA) :
    ofR004 (rMulCandidate a b) = mul004 (ofR004 a) (ofR004 b) := by
  apply pair_ext004
  · change rMulCandidate a b =
      rAdd (rMulCandidate a b) (rNeg (rMulCandidate rZero rZero))
    rw [mul_zero_left004 C rZero, neg_zero004 C,
      add_zero_right004 C (rMulCandidate a b)]
  · change rZero =
      rAdd (rMulCandidate a rZero) (rMulCandidate rZero b)
    rw [mul_zero_right004 C a, mul_zero_left004 C b,
      C.addZeroLeft rZero]

/-- Coordinate normal form; this powers generation and uniqueness. -/
theorem coordinate_expression004
    (C : RWithoutOrderTotalCertificate) (a b : RBOMA) :
    add004 (ofR004 a) (mul004 (ofR004 b) imag004) = ⟨a, b⟩ := by
  apply pair_ext004
  · change rAdd a
      (rAdd (rMulCandidate b rZero)
        (rNeg (rMulCandidate rZero rOne))) = a
    rw [mul_zero_right004 C b, mul_zero_left004 C rOne,
      neg_zero004 C, C.addZeroLeft rZero, add_zero_right004 C a]
  · change rAdd rZero
      (rAdd (rMulCandidate b rOne)
        (rMulCandidate rZero rZero)) = b
    rw [mul_one_right004 C b, mul_zero_left004 C rZero,
      add_zero_right004 C b, C.addZeroLeft b]

/-- C-CL-I-001 representative: i² = -1 without totality. -/
theorem imag_squared004
    (C : RWithoutOrderTotalCertificate) :
    mul004 imag004 imag004 = neg004 one004 := by
  apply pair_ext004
  · change rAdd (rMulCandidate rZero rZero)
      (rNeg (rMulCandidate rOne rOne)) = rNeg rOne
    rw [mul_zero_left004 C rZero, C.mulOneLeft rOne,
      C.addZeroLeft (rNeg rOne)]
  · change rAdd (rMulCandidate rZero rOne)
      (rMulCandidate rOne rZero) = rNeg rZero
    rw [mul_zero_left004 C rOne, C.mulOneLeft rZero,
      C.addZeroLeft rZero, neg_zero004 C]

/-- C-CL-GEN-001 representative. -/
theorem generation004
    (C : RWithoutOrderTotalCertificate) (z : Pair004) :
    ∃ a b : RBOMA,
      z = add004 (ofR004 a) (mul004 (ofR004 b) imag004) := by
  refine ⟨z.re, z.im, ?_⟩
  rw [coordinate_expression004 C z.re z.im]

/-- C-CL-COORDUNIQ-001 representative. -/
theorem coordinate_unique004
    (C : RWithoutOrderTotalCertificate)
    {a b c d : RBOMA}
    (h : add004 (ofR004 a) (mul004 (ofR004 b) imag004) =
      add004 (ofR004 c) (mul004 (ofR004 d) imag004)) :
    a = c ∧ b = d := by
  rw [coordinate_expression004 C a b,
      coordinate_expression004 C c d] at h
  exact ⟨congrArg Pair004.re h, congrArg Pair004.im h⟩

/-- C-CL-NONREAL-001 representative. -/
theorem imag_not_real004
    (C : RWithoutOrderTotalCertificate) :
    ¬ ∃ a : RBOMA, imag004 = ofR004 a := by
  rintro ⟨a, h⟩
  have h10 : rOne = rZero := congrArg Pair004.im h
  exact C.nontrivial h10.symm

/-- Scalar operation view used by the ST2-EXP-011 generic comparison layer. -/
def scalarOps004 : ScalarOps where
  carrier := RBOMA
  zero := rZero
  one := rOne
  neg := rNeg
  add := rAdd
  mul := rMulCandidate

/-- The local pair carrier satisfies the exact comparison coordinate contract
without any order law. -/
def comparisonPresentation004 : QuadraticPresentation scalarOps004 where
  carrier := Pair004
  zero := zero004
  one := one004
  neg := neg004
  add := add004
  mul := mul004
  ofScalar := ofR004
  imag := imag004
  coord := fun a b => ⟨a, b⟩
  coordinateGeneration := fun z => ⟨z.re, z.im, rfl⟩
  coordinateUnique := by
    intro a b c d h
    exact ⟨congrArg Pair004.re h, congrArg Pair004.im h⟩
  coordinateZero := rfl
  coordinateOne := rfl
  coordinateReal := fun _ => rfl
  coordinateImag := rfl
  coordinateNeg := fun _ _ => rfl
  coordinateAdd := fun _ _ _ _ => rfl
  coordinateMul := fun _ _ _ _ => rfl

/-- C-CL-COMPARE-001 negative control: comparison survives independently of
`orderTotal`; it consumes only the scalar operations plus coordinate laws. -/
def comparison004 :
    QuadraticComparisonCertificate comparisonPresentation004 comparisonPresentation004 :=
  quadraticComparison comparisonPresentation004 comparisonPresentation004

/-- Kernel witness for the seven accepted C Claim families expected to survive
removal of only `orderTotal`. -/
structure CSurvivorCertificate004 (C : RWithoutOrderTotalCertificate) : Prop where
  carrierExt : ∀ {z w : Pair004}, z.re = w.re → z.im = w.im → z = w
  embeddingInjective : ∀ {a b : RBOMA}, ofR004 a = ofR004 b → a = b
  embeddingZero : ofR004 rZero = zero004
  embeddingOne : ofR004 rOne = one004
  embeddingNeg : ∀ a : RBOMA, ofR004 (rNeg a) = neg004 (ofR004 a)
  embeddingAdd : ∀ a b : RBOMA,
    ofR004 (rAdd a b) = add004 (ofR004 a) (ofR004 b)
  embeddingMul : ∀ a b : RBOMA,
    ofR004 (rMulCandidate a b) = mul004 (ofR004 a) (ofR004 b)
  imagSquared : mul004 imag004 imag004 = neg004 one004
  generation : ∀ z : Pair004,
    ∃ a b : RBOMA, z = add004 (ofR004 a) (mul004 (ofR004 b) imag004)
  coordinateUnique : ∀ {a b c d : RBOMA},
    add004 (ofR004 a) (mul004 (ofR004 b) imag004) =
      add004 (ofR004 c) (mul004 (ofR004 d) imag004) → a = c ∧ b = d
  imagNotReal : ¬ ∃ a : RBOMA, imag004 = ofR004 a
  comparison :
    QuadraticComparisonCertificate comparisonPresentation004 comparisonPresentation004

/-- Seven-family survivor package over the fifteen-field interface. -/
def cSurvivorCertificate004
    (C : RWithoutOrderTotalCertificate) : CSurvivorCertificate004 C where
  carrierExt := @pair_ext004
  embeddingInjective := @ofR_injective004
  embeddingZero := ofR_zero004
  embeddingOne := ofR_one004
  embeddingNeg := ofR_neg004 C
  embeddingAdd := ofR_add004 C
  embeddingMul := ofR_mul004 C
  imagSquared := imag_squared004 C
  generation := generation004 C
  coordinateUnique := @coordinate_unique004 C
  imagNotReal := imag_not_real004 C
  comparison := comparison004

end BOMA.C.StageTwo.TotalOrderRegime004.WithoutOrderTotal
