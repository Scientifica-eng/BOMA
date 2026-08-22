/- PDSA-C-006: representation-neutral quadratic-field comparison.

Every accepted quadratic presentation has a canonical, total, single-valued,
invertible algebra-equivalence graph. Genuine inverse functions are obtained
only when both candidates provide constructive coordinate extractors as data.
-/
namespace BOMA.C.QuadraticComparison001

open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.StageIntegration002
open BOMA.C.PairCore001
open BOMA.C.PairNormInverse001

/-- Common mathematical quadratic-field interface, independent of carrier identity. -/
structure QuadraticFieldPresentation (R : RStageIntegrationCertificate) where
  carrier : Type
  zero : carrier
  one : carrier
  neg : carrier → carrier
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  ofR : RBOMA → carrier
  imag : carrier
  coord : RBOMA → RBOMA → carrier
  nontrivial : zero ≠ one
  addComm : ∀ x y : carrier, add x y = add y x
  addAssoc : ∀ x y z : carrier, add (add x y) z = add x (add y z)
  addZeroLeft : ∀ x : carrier, add zero x = x
  addInverseRight : ∀ x : carrier, add x (neg x) = zero
  mulComm : ∀ x y : carrier, mul x y = mul y x
  mulAssoc : ∀ x y z : carrier, mul (mul x y) z = mul x (mul y z)
  mulOneLeft : ∀ x : carrier, mul one x = x
  distribRight : ∀ x y z : carrier, mul x (add y z) = add (mul x y) (mul x z)
  inverseExists : ∀ x : carrier, x ≠ zero → ∃ y : carrier, mul x y = one
  inverseUnique : ∀ {x y z : carrier}, mul x y = one → mul x z = one → y = z
  embeddingInjective : ∀ {a b : RBOMA}, ofR a = ofR b → a = b
  embeddingZero : ofR rZero = zero
  embeddingOne : ofR rOne = one
  embeddingNeg : ∀ a : RBOMA, ofR (rNeg a) = neg (ofR a)
  embeddingAdd : ∀ a b : RBOMA, ofR (rAdd a b) = add (ofR a) (ofR b)
  embeddingMul : ∀ a b : RBOMA,
    ofR (rMulCandidate a b) = mul (ofR a) (ofR b)
  imagSquared : mul imag imag = neg one
  coordinateExpression : ∀ a b : RBOMA,
    coord a b = add (ofR a) (mul (ofR b) imag)
  coordinateGeneration : ∀ x : carrier, ∃ a b : RBOMA, x = coord a b
  coordinateUnique : ∀ {a b c d : RBOMA},
    coord a b = coord c d → a = c ∧ b = d
  coordinateZero : coord rZero rZero = zero
  coordinateOne : coord rOne rZero = one
  coordinateReal : ∀ a : RBOMA, coord a rZero = ofR a
  coordinateImag : coord rZero rOne = imag
  coordinateNeg : ∀ a b : RBOMA,
    neg (coord a b) = coord (rNeg a) (rNeg b)
  coordinateAdd : ∀ a b c d : RBOMA,
    add (coord a b) (coord c d) = coord (rAdd a c) (rAdd b d)
  coordinateMul : ∀ a b c d : RBOMA,
    mul (coord a b) (coord c d) =
      coord
        (rAdd (rMulCandidate a c) (rNeg (rMulCandidate b d)))
        (rAdd (rMulCandidate a d) (rMulCandidate b c))

/-- The selected Route P field instantiates the carrier-neutral common contract. -/
def selectedPresentation
    (R : RStageIntegrationCertificate) : QuadraticFieldPresentation R where
  carrier := CBOMA
  zero := cZero
  one := cOne
  neg := cNeg
  add := cAdd
  mul := cMul
  ofR := cOfR
  imag := cI
  coord := fun a b => ⟨a, b⟩
  nontrivial := c_zero_ne_one R
  addComm := c_add_comm R
  addAssoc := c_add_assoc R
  addZeroLeft := c_add_zero_left R
  addInverseRight := c_add_neg_right R
  mulComm := c_mul_comm R
  mulAssoc := c_mul_assoc R
  mulOneLeft := c_mul_one_left R
  distribRight := c_mul_add_right R
  inverseExists := c_inverse_exists R
  inverseUnique := @c_inverse_unique R
  embeddingInjective := @c_ofR_injective
  embeddingZero := c_ofR_zero
  embeddingOne := c_ofR_one
  embeddingNeg := c_ofR_neg R
  embeddingAdd := c_ofR_add R
  embeddingMul := c_ofR_mul R
  imagSquared := c_i_squared R
  coordinateExpression := by
    intro a b
    exact (BOMA.C.RoutePairProbe001.coordinate_expression R a b).symm
  coordinateGeneration := by
    intro z
    exact ⟨z.re, z.im, by cases z; rfl⟩
  coordinateUnique := by
    intro a b c d h
    exact ⟨congrArg BOMA.C.RoutePairProbe001.PairCandidate.re h,
      congrArg BOMA.C.RoutePairProbe001.PairCandidate.im h⟩
  coordinateZero := rfl
  coordinateOne := rfl
  coordinateReal := by intro a; rfl
  coordinateImag := rfl
  coordinateNeg := by intro a b; rfl
  coordinateAdd := by intro a b c d; rfl
  coordinateMul := by intro a b c d; rfl

/-- Same accepted-real coefficients define the canonical comparison graph. -/
def Related {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R)
    (x : A.carrier) (y : B.carrier) : Prop :=
  ∃ a b : RBOMA, x = A.coord a b ∧ y = B.coord a b

theorem related_total_left {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R) (x : A.carrier) :
    ∃ y : B.carrier, Related A B x y := by
  rcases A.coordinateGeneration x with ⟨a, b, hx⟩
  exact ⟨B.coord a b, a, b, hx, rfl⟩

theorem related_total_right {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R) (y : B.carrier) :
    ∃ x : A.carrier, Related A B x y := by
  rcases B.coordinateGeneration y with ⟨a, b, hy⟩
  exact ⟨A.coord a b, a, b, rfl, hy⟩

theorem related_right_unique {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R)
    {x : A.carrier} {y z : B.carrier}
    (hy : Related A B x y) (hz : Related A B x z) : y = z := by
  rcases hy with ⟨a, b, hxa, hya⟩
  rcases hz with ⟨c, d, hxc, hzc⟩
  rcases A.coordinateUnique (hxa.symm.trans hxc) with ⟨hac, hbd⟩
  cases hac
  cases hbd
  exact hya.trans hzc.symm

theorem related_left_unique {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R)
    {x z : A.carrier} {y : B.carrier}
    (hx : Related A B x y) (hz : Related A B z y) : x = z := by
  rcases hx with ⟨a, b, hxa, hya⟩
  rcases hz with ⟨c, d, hzc, hyc⟩
  rcases B.coordinateUnique (hya.symm.trans hyc) with ⟨hac, hbd⟩
  cases hac
  cases hbd
  exact hxa.trans hzc.symm

theorem related_symm {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R)
    {x : A.carrier} {y : B.carrier}
    (h : Related A B x y) : Related B A y x := by
  rcases h with ⟨a, b, hx, hy⟩
  exact ⟨a, b, hy, hx⟩

theorem related_zero {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R) :
    Related A B A.zero B.zero :=
  ⟨rZero, rZero, A.coordinateZero.symm, B.coordinateZero.symm⟩

theorem related_one {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R) :
    Related A B A.one B.one :=
  ⟨rOne, rZero, A.coordinateOne.symm, B.coordinateOne.symm⟩

theorem related_real {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R) (a : RBOMA) :
    Related A B (A.ofR a) (B.ofR a) :=
  ⟨a, rZero, (A.coordinateReal a).symm, (B.coordinateReal a).symm⟩

theorem related_imag {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R) :
    Related A B A.imag B.imag :=
  ⟨rZero, rOne, A.coordinateImag.symm, B.coordinateImag.symm⟩

theorem related_neg {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R)
    {x : A.carrier} {y : B.carrier}
    (h : Related A B x y) : Related A B (A.neg x) (B.neg y) := by
  rcases h with ⟨a, b, hx, hy⟩
  refine ⟨rNeg a, rNeg b, ?_, ?_⟩
  · rw [hx, A.coordinateNeg a b]
  · rw [hy, B.coordinateNeg a b]

theorem related_add {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R)
    {x z : A.carrier} {y w : B.carrier}
    (hxy : Related A B x y) (hzw : Related A B z w) :
    Related A B (A.add x z) (B.add y w) := by
  rcases hxy with ⟨a, b, hx, hy⟩
  rcases hzw with ⟨c, d, hz, hw⟩
  refine ⟨rAdd a c, rAdd b d, ?_, ?_⟩
  · rw [hx, hz, A.coordinateAdd a b c d]
  · rw [hy, hw, B.coordinateAdd a b c d]

theorem related_mul {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R)
    {x z : A.carrier} {y w : B.carrier}
    (hxy : Related A B x y) (hzw : Related A B z w) :
    Related A B (A.mul x z) (B.mul y w) := by
  rcases hxy with ⟨a, b, hx, hy⟩
  rcases hzw with ⟨c, d, hz, hw⟩
  refine ⟨rAdd (rMulCandidate a c) (rNeg (rMulCandidate b d)),
    rAdd (rMulCandidate a d) (rMulCandidate b c), ?_, ?_⟩
  · rw [hx, hz, A.coordinateMul a b c d]
  · rw [hy, hw, B.coordinateMul a b c d]

theorem related_inverse_witness {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R)
    {x z : A.carrier} {y w : B.carrier}
    (hxy : Related A B x y) (hzw : Related A B z w)
    (hxz : A.mul x z = A.one) : B.mul y w = B.one := by
  have h := related_mul A B hxy hzw
  rw [hxz] at h
  exact related_right_unique A B h (related_one A B)

/-- Universal comparison package: an invertible field/algebra graph relation. -/
structure QuadraticComparisonCertificate {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R) where
  totalLeft : ∀ x : A.carrier, ∃ y : B.carrier, Related A B x y
  totalRight : ∀ y : B.carrier, ∃ x : A.carrier, Related A B x y
  uniqueRight : ∀ {x : A.carrier} {y z : B.carrier},
    Related A B x y → Related A B x z → y = z
  uniqueLeft : ∀ {x z : A.carrier} {y : B.carrier},
    Related A B x y → Related A B z y → x = z
  preserveZero : Related A B A.zero B.zero
  preserveOne : Related A B A.one B.one
  preserveReal : ∀ a : RBOMA, Related A B (A.ofR a) (B.ofR a)
  preserveImag : Related A B A.imag B.imag
  preserveNeg : ∀ {x : A.carrier} {y : B.carrier},
    Related A B x y → Related A B (A.neg x) (B.neg y)
  preserveAdd : ∀ {x z : A.carrier} {y w : B.carrier},
    Related A B x y → Related A B z w →
      Related A B (A.add x z) (B.add y w)
  preserveMul : ∀ {x z : A.carrier} {y w : B.carrier},
    Related A B x y → Related A B z w →
      Related A B (A.mul x z) (B.mul y w)
  preserveInverse : ∀ {x z : A.carrier} {y w : B.carrier},
    Related A B x y → Related A B z w →
      A.mul x z = A.one → B.mul y w = B.one

/-- Any two accepted common presentations admit a canonical algebra-equivalence graph. -/
theorem quadraticComparison
    {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R) :
    QuadraticComparisonCertificate A B where
  totalLeft := related_total_left A B
  totalRight := related_total_right A B
  uniqueRight := @related_right_unique R A B
  uniqueLeft := @related_left_unique R A B
  preserveZero := related_zero A B
  preserveOne := related_one A B
  preserveReal := related_real A B
  preserveImag := related_imag A B
  preserveNeg := @related_neg R A B
  preserveAdd := @related_add R A B
  preserveMul := @related_mul R A B
  preserveInverse := @related_inverse_witness R A B

/-- Explicit constructive coordinate data; not inferred from propositional existence. -/
structure CoordinateExtractor {R : RStageIntegrationCertificate}
    (A : QuadraticFieldPresentation R) where
  re : A.carrier → RBOMA
  im : A.carrier → RBOMA
  sound : ∀ x : A.carrier, x = A.coord (re x) (im x)

/-- Route P supplies projections directly; no global selection principle is used. -/
def selectedExtractor
    (R : RStageIntegrationCertificate) :
    CoordinateExtractor (selectedPresentation R) where
  re := fun z => z.re
  im := fun z => z.im
  sound := by intro z; cases z; rfl

/-- A genuine comparison function exists when its source supplies extraction data. -/
def coordinateMap {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R)
    (E : CoordinateExtractor A) (x : A.carrier) : B.carrier :=
  B.coord (E.re x) (E.im x)

theorem coordinate_map_related {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R)
    (E : CoordinateExtractor A) (x : A.carrier) :
    Related A B x (coordinateMap A B E x) :=
  ⟨E.re x, E.im x, E.sound x, rfl⟩

theorem coordinate_map_zero {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R) (E : CoordinateExtractor A) :
    coordinateMap A B E A.zero = B.zero :=
  related_right_unique A B
    (coordinate_map_related A B E A.zero) (related_zero A B)

theorem coordinate_map_one {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R) (E : CoordinateExtractor A) :
    coordinateMap A B E A.one = B.one :=
  related_right_unique A B
    (coordinate_map_related A B E A.one) (related_one A B)

theorem coordinate_map_real {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R) (E : CoordinateExtractor A)
    (a : RBOMA) :
    coordinateMap A B E (A.ofR a) = B.ofR a :=
  related_right_unique A B
    (coordinate_map_related A B E (A.ofR a)) (related_real A B a)

theorem coordinate_map_imag {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R) (E : CoordinateExtractor A) :
    coordinateMap A B E A.imag = B.imag :=
  related_right_unique A B
    (coordinate_map_related A B E A.imag) (related_imag A B)

theorem coordinate_map_neg {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R) (E : CoordinateExtractor A)
    (x : A.carrier) :
    coordinateMap A B E (A.neg x) = B.neg (coordinateMap A B E x) :=
  related_right_unique A B
    (coordinate_map_related A B E (A.neg x))
    (related_neg A B (coordinate_map_related A B E x))

theorem coordinate_map_add {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R) (E : CoordinateExtractor A)
    (x y : A.carrier) :
    coordinateMap A B E (A.add x y) =
      B.add (coordinateMap A B E x) (coordinateMap A B E y) :=
  related_right_unique A B
    (coordinate_map_related A B E (A.add x y))
    (related_add A B
      (coordinate_map_related A B E x)
      (coordinate_map_related A B E y))

theorem coordinate_map_mul {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R) (E : CoordinateExtractor A)
    (x y : A.carrier) :
    coordinateMap A B E (A.mul x y) =
      B.mul (coordinateMap A B E x) (coordinateMap A B E y) :=
  related_right_unique A B
    (coordinate_map_related A B E (A.mul x y))
    (related_mul A B
      (coordinate_map_related A B E x)
      (coordinate_map_related A B E y))

theorem coordinate_maps_inverse_left {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R)
    (EA : CoordinateExtractor A) (EB : CoordinateExtractor B)
    (x : A.carrier) :
    coordinateMap B A EB (coordinateMap A B EA x) = x := by
  have hforward := coordinate_map_related A B EA x
  have hbackward :=
    related_symm B A
      (coordinate_map_related B A EB (coordinateMap A B EA x))
  exact related_left_unique A B hbackward hforward

theorem coordinate_maps_inverse_right {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R)
    (EA : CoordinateExtractor A) (EB : CoordinateExtractor B)
    (y : B.carrier) :
    coordinateMap A B EA (coordinateMap B A EB y) = y :=
  coordinate_maps_inverse_left B A EB EA y

/-- Genuine inverse algebra maps, conditional on explicit constructive extractors. -/
structure ConstructiveQuadraticIsomorphism {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R) where
  forward : A.carrier → B.carrier
  backward : B.carrier → A.carrier
  leftInverse : ∀ x : A.carrier, backward (forward x) = x
  rightInverse : ∀ y : B.carrier, forward (backward y) = y
  preserveZero : forward A.zero = B.zero
  preserveOne : forward A.one = B.one
  preserveReal : ∀ a : RBOMA, forward (A.ofR a) = B.ofR a
  preserveImag : forward A.imag = B.imag
  preserveNeg : ∀ x : A.carrier, forward (A.neg x) = B.neg (forward x)
  preserveAdd : ∀ x y : A.carrier,
    forward (A.add x y) = B.add (forward x) (forward y)
  preserveMul : ∀ x y : A.carrier,
    forward (A.mul x y) = B.mul (forward x) (forward y)

/-- Actual functional R-field isomorphism requires extractor data on both sides. -/
theorem constructiveQuadraticIsomorphism
    {R : RStageIntegrationCertificate}
    (A B : QuadraticFieldPresentation R)
    (EA : CoordinateExtractor A) (EB : CoordinateExtractor B) :
    ConstructiveQuadraticIsomorphism A B where
  forward := coordinateMap A B EA
  backward := coordinateMap B A EB
  leftInverse := coordinate_maps_inverse_left A B EA EB
  rightInverse := coordinate_maps_inverse_right A B EA EB
  preserveZero := coordinate_map_zero A B EA
  preserveOne := coordinate_map_one A B EA
  preserveReal := coordinate_map_real A B EA
  preserveImag := coordinate_map_imag A B EA
  preserveNeg := coordinate_map_neg A B EA
  preserveAdd := coordinate_map_add A B EA
  preserveMul := coordinate_map_mul A B EA

/-- The selected presentation satisfies the universal comparison obligation. -/
theorem selectedQuadraticComparison
    (R : RStageIntegrationCertificate)
    (B : QuadraticFieldPresentation R) :
    QuadraticComparisonCertificate (selectedPresentation R) B :=
  quadraticComparison (selectedPresentation R) B

/-- Selected Route P compares functionally with every constructively coordinatized peer. -/
theorem selectedConstructiveQuadraticIsomorphism
    (R : RStageIntegrationCertificate)
    (B : QuadraticFieldPresentation R)
    (EB : CoordinateExtractor B) :
    ConstructiveQuadraticIsomorphism (selectedPresentation R) B :=
  constructiveQuadraticIsomorphism
    (selectedPresentation R) B (selectedExtractor R) EB

/-- The accepted-real selected presentation has a verified self-comparison. -/
theorem acceptedSelectedSelfComparison :
    QuadraticComparisonCertificate
      (selectedPresentation rStageIntegrationCertificate)
      (selectedPresentation rStageIntegrationCertificate) :=
  quadraticComparison
    (selectedPresentation rStageIntegrationCertificate)
    (selectedPresentation rStageIntegrationCertificate)

end BOMA.C.QuadraticComparison001
