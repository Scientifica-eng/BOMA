/- ST2-EXP-003: nonzero multiplicative inverse witnesses for the independent
   Cauchy quotient. The only new data-selection commitment is explicit:
   `Classical.choose` assembles a rational reciprocal sequence from the accepted
   witness-only Q inverse relation after eventual fixed-sign separation has
   already been proved. No Dedekind producer is consumed. -/
namespace BOMA.R.StageTwo.CauchyInverse003

open BOMA.NCore.RB001
open BOMA.NArithmetic.Order001
open BOMA.Q.Quotient001
open BOMA.Q.Inverse001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.QPositiveMultiplicativeApprox001
open BOMA.R.QInverseOrder001
open BOMA.R.CauchyProbe001
open BOMA.R.StageTwo.CauchyCloseness003
open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyAdditive003
open BOMA.R.StageTwo.CauchyBounded003
open BOMA.R.StageTwo.CauchyProductBounds003
open BOMA.R.StageTwo.CauchyMultiplicative003
open BOMA.R.StageTwo.CauchyOrderCore003
open BOMA.R.StageTwo.CauchyOrderTotal003
open BOMA.R.StageTwo.CauchyOrderedRing003
open BOMA.R.StageTwo.CauchyNonzeroGap003

/-- A positive rational lower bound makes every larger rational strictly
    positive. -/
theorem qlt_zero_of_pos_le {a0 a : QBOMA}
    (h0 : qPos a0) (h : qLE a0 a) : qLT qZero a := by
  refine ⟨qle_trans h0.1 h, ?_⟩
  intro hza
  have ha0z : qLE a0 qZero := by
    rw [hza]
    exact h
  have heq : a0 = qZero := qle_antisymm ha0z h0.1
  exact h0.2 heq.symm

/-- Inverse witnesses reverse a non-strict positive lower bound. -/
theorem q_inverse_le_of_positive_lower
    {a0 a a0inv ainv : QBOMA}
    (h0 : qPos a0) (h : qLE a0 a)
    (h0inv : QInvRel a0 a0inv) (hainv : QInvRel a ainv) :
    qLE ainv a0inv := by
  rcases qlt_trichotomy a0 a with hlt | heq | hrev
  · exact (q_inverse_strict_antitone
      (qlt_zero_of_pos_le h0 (qle_refl a0)) hlt h0inv hainv).1
  · have hainv0 : QInvRel a0 ainv := by
      rw [heq]
      exact hainv
    rw [q_inverse_unique hainv0 h0inv]
    exact qle_refl a0inv
  · have haeq : a = a0 := qle_antisymm hrev.1 h
    exact False.elim (hrev.2 haeq)

/-- A nonnegative rational below a nonnegative radius satisfies the symmetric
    bound used by the existing product-estimate infrastructure. -/
theorem qAbsBound_of_nonneg_le {K x : QBOMA}
    (hK : qLE qZero K) (hx0 : qLE qZero x) (hxK : qLE x K) :
    qAbsBound K x := by
  constructor
  · have hneg : qLE (qNeg K) qZero := by
      have ht := qneg_reverses hK
      rw [BOMA.R.StageTwo.CauchyBounded003.qNeg_zero] at ht
      exact ht
    exact qle_trans hneg hx0
  · exact hxK

/-- Difference of two inverse witnesses, factored through the original
    rational difference. -/
theorem q_reciprocal_difference
    {a b ainv binv : QBOMA}
    (hainv : QInvRel a ainv) (hbinv : QInvRel b binv) :
    qAdd ainv (qNeg binv) =
      qMul (qAdd b (qNeg a)) (qMul ainv binv) := by
  have hfirst : qMul b (qMul ainv binv) = ainv := by
    calc
      qMul b (qMul ainv binv) =
          qMul (qMul b ainv) binv :=
        (qMul_assoc b ainv binv).symm
      _ = qMul (qMul ainv b) binv := by
        rw [qMul_comm b ainv]
      _ = qMul ainv (qMul b binv) := qMul_assoc ainv b binv
      _ = qMul ainv qOne := congrArg (fun t => qMul ainv t) hbinv
      _ = ainv := qMul_one_right ainv
  have hsecond : qMul (qNeg a) (qMul ainv binv) = qNeg binv := by
    rw [qMul_neg_left]
    apply congrArg qNeg
    calc
      qMul a (qMul ainv binv) =
          qMul (qMul a ainv) binv :=
        (qMul_assoc a ainv binv).symm
      _ = qMul qOne binv := congrArg (fun t => qMul t binv) hainv
      _ = binv := qMul_one_left binv
  symm
  calc
    qMul (qAdd b (qNeg a)) (qMul ainv binv) =
        qAdd (qMul b (qMul ainv binv))
          (qMul (qNeg a) (qMul ainv binv)) :=
      qMul_add_left b (qNeg a) (qMul ainv binv)
    _ = qAdd ainv (qNeg binv) := by rw [hfirst, hsecond]

/-- Reciprocals of two positive rationals sharing one positive lower bound are
    epsilon-close whenever the originals are close at a correspondingly scaled
    radius. -/
theorem qClose_reciprocals_of_positive_lower
    {eps eta a0 a b a0inv ainv binv : QBOMA}
    (h0 : qPos a0)
    (ha : qLE a0 a) (hb : qLE a0 b)
    (h0inv : QInvRel a0 a0inv)
    (hainv : QInvRel a ainv) (hbinv : QInvRel b binv)
    (heta : qLE qZero eta)
    (hscale : qMul eta (qMul a0inv a0inv) = eps)
    (hab : qClose eta a b) :
    qClose eps ainv binv := by
  have h0strict := qlt_zero_of_pos_le h0 (qle_refl a0)
  have hainv0 := qlt_zero_inverse (qlt_zero_of_pos_le h0 ha) hainv
  have hbinv0 := qlt_zero_inverse (qlt_zero_of_pos_le h0 hb) hbinv
  have h0inv0 := qlt_zero_inverse h0strict h0inv
  have hainvBound : qLE ainv a0inv :=
    q_inverse_le_of_positive_lower h0 ha h0inv hainv
  have hbinvBound : qLE binv a0inv :=
    q_inverse_le_of_positive_lower h0 hb h0inv hbinv
  have hainvAbs : qAbsBound a0inv ainv :=
    qAbsBound_of_nonneg_le h0inv0.1 hainv0.1 hainvBound
  have hbinvAbs : qAbsBound a0inv binv :=
    qAbsBound_of_nonneg_le h0inv0.1 hbinv0.1 hbinvBound
  have hdiff : qAbsBound eta (qAdd b (qNeg a)) := by
    have ht := qClose_symm hab
    exact ht
  have hinvProd : qAbsBound (qMul a0inv a0inv) (qMul ainv binv) :=
    qAbsBound_mul h0inv0.1 h0inv0.1 hainvAbs hbinvAbs
  have hall :
      qAbsBound (qMul eta (qMul a0inv a0inv))
        (qMul (qAdd b (qNeg a)) (qMul ainv binv)) :=
    qAbsBound_mul heta (qmul_nonneg h0inv0.1 h0inv0.1) hdiff hinvProd
  rw [hscale] at hall
  change qAbsBound eps (qAdd ainv (qNeg binv))
  rw [q_reciprocal_difference hainv hbinv]
  exact hall

/-- Positive rational products remain positive in the `qPos` interface. -/
theorem qPos_mul {a b : QBOMA} (ha : qPos a) (hb : qPos b) :
    qPos (qMul a b) := by
  have haP : QPositive a := ⟨ha.1, fun hz => ha.2 hz.symm⟩
  have hbP : QPositive b := ⟨hb.1, fun hz => hb.2 hz.symm⟩
  refine ⟨qmul_nonneg haP.1 hbP.1, ?_⟩
  intro hzero
  exact qMul_ne_zero haP.2 hbP.2 hzero.symm

/-- Exact reciprocal-Cauchy scale: eps*a0*a0 cancels two copies of a0⁻¹. -/
theorem reciprocal_scale
    {eps a0 a0inv : QBOMA} (h0inv : QInvRel a0 a0inv) :
    qMul (qMul eps (qMul a0 a0)) (qMul a0inv a0inv) = eps := by
  have hpair :
      qMul (qMul a0 a0) (qMul a0inv a0inv) =
        qMul (qMul a0 a0inv) (qMul a0 a0inv) := by
    calc
      qMul (qMul a0 a0) (qMul a0inv a0inv) =
          qMul (qMul (qMul a0 a0) a0inv) a0inv :=
        (qMul_assoc (qMul a0 a0) a0inv a0inv).symm
      _ = qMul (qMul a0 (qMul a0 a0inv)) a0inv := by
        rw [qMul_assoc a0 a0 a0inv]
      _ = qMul (qMul a0 (qMul a0inv a0)) a0inv := by
        rw [qMul_comm a0 a0inv]
      _ = qMul (qMul (qMul a0 a0inv) a0) a0inv := by
        rw [← qMul_assoc a0 a0inv a0]
      _ = qMul (qMul a0 a0inv) (qMul a0 a0inv) :=
        qMul_assoc (qMul a0 a0inv) a0 a0inv
  calc
    qMul (qMul eps (qMul a0 a0)) (qMul a0inv a0inv) =
        qMul eps (qMul (qMul a0 a0) (qMul a0inv a0inv)) :=
      qMul_assoc eps (qMul a0 a0) (qMul a0inv a0inv)
    _ = qMul eps (qMul (qMul a0 a0inv) (qMul a0 a0inv)) := by
      rw [hpair]
    _ = qMul eps (qMul qOne qOne) := by rw [h0inv]
    _ = eps := by rw [qMul_one_left, qMul_one_right]

/-- A positive eventual gap makes every late rational term nonzero. -/
theorem positive_gap_term_nonzero
    {u : CauchySeq} {a0 : QBOMA} {N n : BOMANat}
    (h0 : qPos a0)
    (hN : ∀ k : BOMANat, LE N k → qLE a0 (u.seq k))
    (hn : LE N n) : u.seq n ≠ qZero := by
  intro hzero
  have ha0z : qLE a0 qZero := by
    rw [← hzero]
    exact hN n hn
  have heq : a0 = qZero := qle_antisymm ha0z h0.1
  exact h0.2 heq.symm

/-- Explicit Choice boundary: from the accepted pointwise existential rational
    inverse relation, assemble one reciprocal sequence. All late selected values
    are proved inverse witnesses; early values are irrelevant to the quotient. -/
theorem positive_gap_inverse_sequence_exists
    (u : CauchySeq) (hgap : EventuallyPositiveGap u) :
    ∃ v : CauchySeq,
      CauchyEquiv (cMulSeq u v) (cauchyOfQ qOne) := by
  classical
  rcases hgap with ⟨a0, h0, N0, hN0⟩
  have hpoint : ∀ n : BOMANat,
      ∃ r : QBOMA, LE N0 n → QInvRel (u.seq n) r := by
    intro n
    by_cases hn : LE N0 n
    · have hnz := positive_gap_term_nonzero h0 hN0 hn
      rcases q_inverse_exists (u.seq n) hnz with ⟨r, hr⟩
      exact ⟨r, fun _ => hr⟩
    · exact ⟨qZero, fun h => False.elim (hn h)⟩
  let vseq : QSeq := fun n => Classical.choose (hpoint n)
  have hv : ∀ n : BOMANat, LE N0 n → QInvRel (u.seq n) (vseq n) := by
    intro n hn
    exact (Classical.choose_spec (hpoint n)) hn
  have ha0nz : a0 ≠ qZero := fun hz => h0.2 hz.symm
  rcases q_inverse_exists a0 ha0nz with ⟨a0inv, ha0inv⟩
  have hvCauchy : IsCauchy vseq := by
    intro eps heps
    let eta := qMul eps (qMul a0 a0)
    have heta : qPos eta := by
      unfold eta
      exact qPos_mul heps (qPos_mul h0 h0)
    rcases u.cauchy eta heta with ⟨Nu, hNu⟩
    rcases common_upper_bound N0 Nu with ⟨N, hN0N, hNuN⟩
    refine ⟨N, ?_⟩
    intro m n hm hn
    have hm0 : LE N0 m := le_trans hN0N hm
    have hn0 : LE N0 n := le_trans hN0N hn
    have huma := hN0 m hm0
    have huna := hN0 n hn0
    have humInv := hv m hm0
    have hunInv := hv n hn0
    have huClose := hNu m n (le_trans hNuN hm) (le_trans hNuN hn)
    apply qClose_reciprocals_of_positive_lower
      h0 huma huna ha0inv humInv hunInv heta.1
    · unfold eta
      exact reciprocal_scale ha0inv
    · exact huClose
  let v : CauchySeq := ⟨vseq, hvCauchy⟩
  refine ⟨v, ?_⟩
  intro eps heps
  refine ⟨N0, ?_⟩
  intro n hn
  have hprod := hv n hn
  change qClose eps (qMul (u.seq n) (vseq n)) qOne
  rw [hprod]
  exact qClose_refl_of_pos eps qOne heps

/-- A negative eventual gap becomes a positive gap after pointwise negation. -/
theorem negative_gap_to_positive_neg
    {u : CauchySeq} (hgap : EventuallyNegativeGap u) :
    EventuallyPositiveGap (cNegSeq u) := by
  rcases hgap with ⟨a0, h0, N, hN⟩
  refine ⟨a0, h0, N, ?_⟩
  intro n hn
  have ht := qneg_reverses (hN n hn)
  rw [qNeg_neg] at ht
  exact ht

/-- Multiplying by the negations of both factors gives the original product. -/
theorem cMul_neg_neg_pointwise (u v : CauchySeq) :
    CauchyEquiv (cMulSeq u v) (cMulSeq (cNegSeq u) (cNegSeq v)) := by
  exact cauchyEquiv_of_pointwise_eq (fun n => by
    change qMul (u.seq n) (v.seq n) =
      qMul (qNeg (u.seq n)) (qNeg (v.seq n))
    exact (qMul_neg_neg (u.seq n) (v.seq n)).symm)

/-- Representative-level nonzero inverse witness, handling either eventual
    sign without changing the accepted quotient identity. -/
theorem representative_inverse_exists
    (u : CauchySeq) (hne : rCmk u ≠ rCZero) :
    ∃ v : CauchySeq,
      CauchyEquiv (cMulSeq u v) (cauchyOfQ qOne) := by
  rcases nonzero_eventually_sign_separated u hne with hpos | hneg
  · exact positive_gap_inverse_sequence_exists u hpos
  · have hposNeg := negative_gap_to_positive_neg hneg
    rcases positive_gap_inverse_sequence_exists (cNegSeq u) hposNeg with
      ⟨v, hv⟩
    let nv := cNegSeq v
    refine ⟨nv, ?_⟩
    have hsame :
        CauchyEquiv (cMulSeq u nv) (cMulSeq (cNegSeq u) v) := by
      exact cauchyEquiv_of_pointwise_eq (fun n => by
        change qMul (u.seq n) (qNeg (v.seq n)) =
          qMul (qNeg (u.seq n)) (v.seq n)
        rw [qMul_neg_right, qMul_neg_left])
    exact cauchyEquiv_trans hsame hv

/-- Research quotient-level inverse relation. -/
def RCInvRel (x y : RCBOMA) : Prop := rCMul x y = rCOne

/-- Every nonzero research Cauchy class has a multiplicative inverse witness.
    The witness is branch-only and does not alter accepted R-BLOCK-001. -/
theorem rC_inverse_exists (x : RCBOMA) (hx : x ≠ rCZero) :
    ∃ y : RCBOMA, RCInvRel x y := by
  refine Quotient.inductionOn x ?_ hx
  intro u hu
  rcases representative_inverse_exists u hu with ⟨v, hv⟩
  refine ⟨rCmk v, ?_⟩
  unfold RCInvRel
  change rCmk (cMulSeq u v) = rCmk (cauchyOfQ qOne)
  exact Quotient.sound hv

/-- Right one law, derived from commutativity and the verified left law. -/
theorem rCMul_one_right (x : RCBOMA) : rCMul x rCOne = x := by
  rw [rCMul_comm, rCMul_one_left]

/-- Multiplicative inverse witnesses are unique in the research commutative
    monoid, so the exported contract remains witness-only rather than a global
    inverse operation. -/
theorem rC_inverse_unique {x y z : RCBOMA}
    (hy : RCInvRel x y) (hz : RCInvRel x z) : y = z := by
  unfold RCInvRel at hy hz
  calc
    y = rCMul rCOne y := (rCMul_one_left y).symm
    _ = rCMul (rCMul x z) y := congrArg (fun t => rCMul t y) hz.symm
    _ = rCMul x (rCMul z y) := rCMul_assoc x z y
    _ = rCMul x (rCMul y z) :=
      congrArg (fun t => rCMul x t) (rCMul_comm z y)
    _ = rCMul (rCMul x y) z := (rCMul_assoc x y z).symm
    _ = rCMul rCOne z := congrArg (fun t => rCMul t z) hy
    _ = z := rCMul_one_left z

/-- Unique witness form of the research field inverse contract. -/
theorem rC_inverse_exists_unique (x : RCBOMA) (hx : x ≠ rCZero) :
    ∃ y : RCBOMA, RCInvRel x y ∧
      ∀ z : RCBOMA, RCInvRel x z → z = y := by
  rcases rC_inverse_exists x hx with ⟨y, hy⟩
  refine ⟨y, hy, ?_⟩
  intro z hz
  exact rC_inverse_unique hz hy

/-- Independent ordered-field-strength certificate. Completeness remains a
    separate gate and is deliberately absent from this structure. -/
structure CauchyOrderedFieldCertificate where
  orderedRingCertificate : CauchyOrderedRingCertificate
  nonzeroGapCertificate : CauchyNonzeroGapCertificate
  inverseExistsUnique : ∀ (x : RCBOMA), x ≠ rCZero →
    ∃ y : RCBOMA, RCInvRel x y ∧
      ∀ z : RCBOMA, RCInvRel x z → z = y
  choiceBoundary : ∀ (u : CauchySeq), EventuallyPositiveGap u →
    ∃ v : CauchySeq, CauchyEquiv (cMulSeq u v) (cauchyOfQ qOne)

theorem cauchyOrderedFieldCertificate : CauchyOrderedFieldCertificate where
  orderedRingCertificate := cauchyOrderedRingCertificate
  nonzeroGapCertificate := cauchyNonzeroGapCertificate
  inverseExistsUnique := rC_inverse_exists_unique
  choiceBoundary := positive_gap_inverse_sequence_exists

end BOMA.R.StageTwo.CauchyInverse003
