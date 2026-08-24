/- ST2-EXP-011: scalar-generic quadratic comparison core.

This research-only source extracts exactly the coordinate-level declaration
closure used by CQuadraticComparison001. It deliberately contains no RBOMA,
RCBOMA, Dedekind, Cauchy, H5 transport, global coordinate selector, or inverse
selector. Functional maps remain conditional on explicit CoordinateExtractor
data. -/
namespace BOMA.C.StageTwo.ComparisonInterface011

/-- Operations on the scalar carrier that occur syntactically in quadratic
    coordinate formulas. No field, order, completeness, or inverse law is
    bundled here. -/
structure ScalarOps where
  carrier : Type
  zero : carrier
  one : carrier
  neg : carrier → carrier
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier

/-- Minimal presentation required by the actual comparison declaration closure.
    Algebraic laws that the comparison proofs do not consume are intentionally
    absent. -/
structure QuadraticPresentation (S : ScalarOps) where
  carrier : Type
  zero : carrier
  one : carrier
  neg : carrier → carrier
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  ofScalar : S.carrier → carrier
  imag : carrier
  coord : S.carrier → S.carrier → carrier
  coordinateGeneration : ∀ x : carrier, ∃ a b : S.carrier, x = coord a b
  coordinateUnique : ∀ {a b c d : S.carrier},
    coord a b = coord c d → a = c ∧ b = d
  coordinateZero : coord S.zero S.zero = zero
  coordinateOne : coord S.one S.zero = one
  coordinateReal : ∀ a : S.carrier, coord a S.zero = ofScalar a
  coordinateImag : coord S.zero S.one = imag
  coordinateNeg : ∀ a b : S.carrier,
    neg (coord a b) = coord (S.neg a) (S.neg b)
  coordinateAdd : ∀ a b c d : S.carrier,
    add (coord a b) (coord c d) = coord (S.add a c) (S.add b d)
  coordinateMul : ∀ a b c d : S.carrier,
    mul (coord a b) (coord c d) =
      coord
        (S.add (S.mul a c) (S.neg (S.mul b d)))
        (S.add (S.mul a d) (S.mul b c))

/-- Same scalar coordinates define the representation-neutral graph. -/
def Related {S : ScalarOps}
    (A B : QuadraticPresentation S)
    (x : A.carrier) (y : B.carrier) : Prop :=
  ∃ a b : S.carrier, x = A.coord a b ∧ y = B.coord a b

theorem related_total_left {S : ScalarOps}
    (A B : QuadraticPresentation S) (x : A.carrier) :
    ∃ y : B.carrier, Related A B x y := by
  rcases A.coordinateGeneration x with ⟨a, b, hx⟩
  exact ⟨B.coord a b, a, b, hx, rfl⟩

theorem related_total_right {S : ScalarOps}
    (A B : QuadraticPresentation S) (y : B.carrier) :
    ∃ x : A.carrier, Related A B x y := by
  rcases B.coordinateGeneration y with ⟨a, b, hy⟩
  exact ⟨A.coord a b, a, b, rfl, hy⟩

theorem related_right_unique {S : ScalarOps}
    (A B : QuadraticPresentation S)
    {x : A.carrier} {y z : B.carrier}
    (hy : Related A B x y) (hz : Related A B x z) : y = z := by
  rcases hy with ⟨a, b, hxa, hya⟩
  rcases hz with ⟨c, d, hxc, hzc⟩
  rcases A.coordinateUnique (hxa.symm.trans hxc) with ⟨hac, hbd⟩
  cases hac
  cases hbd
  exact hya.trans hzc.symm

theorem related_left_unique {S : ScalarOps}
    (A B : QuadraticPresentation S)
    {x z : A.carrier} {y : B.carrier}
    (hx : Related A B x y) (hz : Related A B z y) : x = z := by
  rcases hx with ⟨a, b, hxa, hya⟩
  rcases hz with ⟨c, d, hzc, hyc⟩
  rcases B.coordinateUnique (hya.symm.trans hyc) with ⟨hac, hbd⟩
  cases hac
  cases hbd
  exact hxa.trans hzc.symm

theorem related_symm {S : ScalarOps}
    (A B : QuadraticPresentation S)
    {x : A.carrier} {y : B.carrier}
    (h : Related A B x y) : Related B A y x := by
  rcases h with ⟨a, b, hx, hy⟩
  exact ⟨a, b, hy, hx⟩

theorem related_zero {S : ScalarOps}
    (A B : QuadraticPresentation S) : Related A B A.zero B.zero :=
  ⟨S.zero, S.zero, A.coordinateZero.symm, B.coordinateZero.symm⟩

theorem related_one {S : ScalarOps}
    (A B : QuadraticPresentation S) : Related A B A.one B.one :=
  ⟨S.one, S.zero, A.coordinateOne.symm, B.coordinateOne.symm⟩

theorem related_real {S : ScalarOps}
    (A B : QuadraticPresentation S) (a : S.carrier) :
    Related A B (A.ofScalar a) (B.ofScalar a) :=
  ⟨a, S.zero, (A.coordinateReal a).symm, (B.coordinateReal a).symm⟩

theorem related_imag {S : ScalarOps}
    (A B : QuadraticPresentation S) : Related A B A.imag B.imag :=
  ⟨S.zero, S.one, A.coordinateImag.symm, B.coordinateImag.symm⟩

theorem related_neg {S : ScalarOps}
    (A B : QuadraticPresentation S)
    {x : A.carrier} {y : B.carrier}
    (h : Related A B x y) : Related A B (A.neg x) (B.neg y) := by
  rcases h with ⟨a, b, hx, hy⟩
  refine ⟨S.neg a, S.neg b, ?_, ?_⟩
  · rw [hx, A.coordinateNeg a b]
  · rw [hy, B.coordinateNeg a b]

theorem related_add {S : ScalarOps}
    (A B : QuadraticPresentation S)
    {x z : A.carrier} {y w : B.carrier}
    (hxy : Related A B x y) (hzw : Related A B z w) :
    Related A B (A.add x z) (B.add y w) := by
  rcases hxy with ⟨a, b, hx, hy⟩
  rcases hzw with ⟨c, d, hz, hw⟩
  refine ⟨S.add a c, S.add b d, ?_, ?_⟩
  · rw [hx, hz, A.coordinateAdd a b c d]
  · rw [hy, hw, B.coordinateAdd a b c d]

theorem related_mul {S : ScalarOps}
    (A B : QuadraticPresentation S)
    {x z : A.carrier} {y w : B.carrier}
    (hxy : Related A B x y) (hzw : Related A B z w) :
    Related A B (A.mul x z) (B.mul y w) := by
  rcases hxy with ⟨a, b, hx, hy⟩
  rcases hzw with ⟨c, d, hz, hw⟩
  refine ⟨S.add (S.mul a c) (S.neg (S.mul b d)),
    S.add (S.mul a d) (S.mul b c), ?_, ?_⟩
  · rw [hx, hz, A.coordinateMul a b c d]
  · rw [hy, hw, B.coordinateMul a b c d]

/-- Preserve a supplied inverse witness. This theorem does not select, construct,
    or globally store an inverse. -/
theorem related_inverse_witness {S : ScalarOps}
    (A B : QuadraticPresentation S)
    {x z : A.carrier} {y w : B.carrier}
    (hxy : Related A B x y) (hzw : Related A B z w)
    (hxz : A.mul x z = A.one) : B.mul y w = B.one := by
  have h := related_mul A B hxy hzw
  rw [hxz] at h
  exact related_right_unique A B h (related_one A B)

/-- Relation-level comparison package. -/
structure QuadraticComparisonCertificate {S : ScalarOps}
    (A B : QuadraticPresentation S) where
  totalLeft : ∀ x : A.carrier, ∃ y : B.carrier, Related A B x y
  totalRight : ∀ y : B.carrier, ∃ x : A.carrier, Related A B x y
  uniqueRight : ∀ {x : A.carrier} {y z : B.carrier},
    Related A B x y → Related A B x z → y = z
  uniqueLeft : ∀ {x z : A.carrier} {y : B.carrier},
    Related A B x y → Related A B z y → x = z
  preserveZero : Related A B A.zero B.zero
  preserveOne : Related A B A.one B.one
  preserveReal : ∀ a : S.carrier, Related A B (A.ofScalar a) (B.ofScalar a)
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

theorem quadraticComparison {S : ScalarOps}
    (A B : QuadraticPresentation S) :
    QuadraticComparisonCertificate A B where
  totalLeft := related_total_left A B
  totalRight := related_total_right A B
  uniqueRight := @related_right_unique S A B
  uniqueLeft := @related_left_unique S A B
  preserveZero := related_zero A B
  preserveOne := related_one A B
  preserveReal := related_real A B
  preserveImag := related_imag A B
  preserveNeg := @related_neg S A B
  preserveAdd := @related_add S A B
  preserveMul := @related_mul S A B
  preserveInverse := @related_inverse_witness S A B

/-- Explicit constructive coordinate data. It is never synthesized from the
    existential totality theorem. -/
structure CoordinateExtractor {S : ScalarOps}
    (A : QuadraticPresentation S) where
  re : A.carrier → S.carrier
  im : A.carrier → S.carrier
  sound : ∀ x : A.carrier, x = A.coord (re x) (im x)

/-- Functional comparison exists only after explicit extractor data is supplied. -/
def coordinateMap {S : ScalarOps}
    (A B : QuadraticPresentation S)
    (E : CoordinateExtractor A) (x : A.carrier) : B.carrier :=
  B.coord (E.re x) (E.im x)

theorem coordinate_map_related {S : ScalarOps}
    (A B : QuadraticPresentation S)
    (E : CoordinateExtractor A) (x : A.carrier) :
    Related A B x (coordinateMap A B E x) :=
  ⟨E.re x, E.im x, E.sound x, rfl⟩

theorem coordinate_map_zero {S : ScalarOps}
    (A B : QuadraticPresentation S) (E : CoordinateExtractor A) :
    coordinateMap A B E A.zero = B.zero :=
  related_right_unique A B
    (coordinate_map_related A B E A.zero) (related_zero A B)

theorem coordinate_map_one {S : ScalarOps}
    (A B : QuadraticPresentation S) (E : CoordinateExtractor A) :
    coordinateMap A B E A.one = B.one :=
  related_right_unique A B
    (coordinate_map_related A B E A.one) (related_one A B)

theorem coordinate_map_real {S : ScalarOps}
    (A B : QuadraticPresentation S) (E : CoordinateExtractor A)
    (a : S.carrier) :
    coordinateMap A B E (A.ofScalar a) = B.ofScalar a :=
  related_right_unique A B
    (coordinate_map_related A B E (A.ofScalar a)) (related_real A B a)

theorem coordinate_map_imag {S : ScalarOps}
    (A B : QuadraticPresentation S) (E : CoordinateExtractor A) :
    coordinateMap A B E A.imag = B.imag :=
  related_right_unique A B
    (coordinate_map_related A B E A.imag) (related_imag A B)

theorem coordinate_map_neg {S : ScalarOps}
    (A B : QuadraticPresentation S) (E : CoordinateExtractor A)
    (x : A.carrier) :
    coordinateMap A B E (A.neg x) = B.neg (coordinateMap A B E x) :=
  related_right_unique A B
    (coordinate_map_related A B E (A.neg x))
    (related_neg A B (coordinate_map_related A B E x))

theorem coordinate_map_add {S : ScalarOps}
    (A B : QuadraticPresentation S) (E : CoordinateExtractor A)
    (x y : A.carrier) :
    coordinateMap A B E (A.add x y) =
      B.add (coordinateMap A B E x) (coordinateMap A B E y) :=
  related_right_unique A B
    (coordinate_map_related A B E (A.add x y))
    (related_add A B
      (coordinate_map_related A B E x)
      (coordinate_map_related A B E y))

theorem coordinate_map_mul {S : ScalarOps}
    (A B : QuadraticPresentation S) (E : CoordinateExtractor A)
    (x y : A.carrier) :
    coordinateMap A B E (A.mul x y) =
      B.mul (coordinateMap A B E x) (coordinateMap A B E y) :=
  related_right_unique A B
    (coordinate_map_related A B E (A.mul x y))
    (related_mul A B
      (coordinate_map_related A B E x)
      (coordinate_map_related A B E y))

theorem coordinate_maps_inverse_left {S : ScalarOps}
    (A B : QuadraticPresentation S)
    (EA : CoordinateExtractor A) (EB : CoordinateExtractor B)
    (x : A.carrier) :
    coordinateMap B A EB (coordinateMap A B EA x) = x := by
  have hforward := coordinate_map_related A B EA x
  have hbackward :=
    related_symm B A
      (coordinate_map_related B A EB (coordinateMap A B EA x))
  exact related_left_unique A B hbackward hforward

theorem coordinate_maps_inverse_right {S : ScalarOps}
    (A B : QuadraticPresentation S)
    (EA : CoordinateExtractor A) (EB : CoordinateExtractor B)
    (y : B.carrier) :
    coordinateMap A B EA (coordinateMap B A EB y) = y :=
  coordinate_maps_inverse_left B A EB EA y

/-- Functional isomorphism package, explicitly conditional on extractor data. -/
structure ConstructiveQuadraticIsomorphism {S : ScalarOps}
    (A B : QuadraticPresentation S) where
  forward : A.carrier → B.carrier
  backward : B.carrier → A.carrier
  leftInverse : ∀ x : A.carrier, backward (forward x) = x
  rightInverse : ∀ y : B.carrier, forward (backward y) = y
  preserveZero : forward A.zero = B.zero
  preserveOne : forward A.one = B.one
  preserveReal : ∀ a : S.carrier, forward (A.ofScalar a) = B.ofScalar a
  preserveImag : forward A.imag = B.imag
  preserveNeg : ∀ x : A.carrier, forward (A.neg x) = B.neg (forward x)
  preserveAdd : ∀ x y : A.carrier,
    forward (A.add x y) = B.add (forward x) (forward y)
  preserveMul : ∀ x y : A.carrier,
    forward (A.mul x y) = B.mul (forward x) (forward y)

def constructiveQuadraticIsomorphism {S : ScalarOps}
    (A B : QuadraticPresentation S)
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

end BOMA.C.StageTwo.ComparisonInterface011
