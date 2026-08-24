/- ST2-EXP-003 H5 multiplicative-preservation layer.

   This source starts only after the exact-verified additive-preservation
   milestone.  Nonnegative products are compared by an exact strict-rational
   lower-envelope characterization.  Signed multiplication is then recovered
   from the four sign quadrants using the already verified preservation of
   order and negation.

   Nonzero inverse-relation preservation, the final field-isomorphism package,
   and any research Junction remain outside this source. -/
namespace BOMA.R.StageTwo.DedekindCauchyComparison003

open BOMA.Q.Quotient001
open BOMA.Q.Inverse001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.QPositiveMultiplicativeApprox001
open BOMA.R.QInverseOrder001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindOrderConstructive001
open BOMA.R.DedekindOrderClassical001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindAdditionLaws001
open BOMA.R.DedekindNegationCandidate001
open BOMA.R.DedekindAdditiveInverse001
open BOMA.R.DedekindPositivePart001
open BOMA.R.DedekindNonnegativeMul001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.DedekindSignedMulBasicLaws001
open BOMA.R.DedekindSignedMulSignLaws001
open BOMA.R.DedekindOrderedRing001
open BOMA.R.DedekindStrictOrder001
open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyAdditive003
open BOMA.R.StageTwo.CauchyMultiplicative003
open BOMA.R.StageTwo.CauchyOrderCore003
open BOMA.R.StageTwo.CauchyOrderTotal003
open BOMA.R.StageTwo.CauchyOrderedRing003
open BOMA.R.StageTwo.CauchyInverse003
open BOMA.R.StageTwo.CauchyLUBBracket003

/-- Left cancellation in the independent Cauchy additive group. -/
theorem rCAdd_left_cancel_h5 {x y z : RCBOMA}
    (h : rCAdd x y = rCAdd x z) : y = z := by
  apply rCAdd_right_cancel_h5 (z := x)
  rw [rCAdd_comm y x, rCAdd_comm z x]
  exact h

/-- Additive inverses are unique on the independent Cauchy carrier. -/
theorem rCAdd_inverse_unique_h5 {x y : RCBOMA}
    (h : rCAdd x y = rCZero) : y = rCNeg x := by
  apply rCAdd_left_cancel_h5 (x := x)
  calc
    rCAdd x y = rCZero := h
    _ = rCAdd x (rCNeg x) := (rCAdd_neg_right x).symm

/-- Cauchy negation is involutive. -/
theorem rCNeg_involutive_h5 (x : RCBOMA) : rCNeg (rCNeg x) = x := by
  symm
  exact rCAdd_inverse_unique_h5 (rCAdd_neg_left_h5 x)

/-- Negation sends a nonpositive Cauchy real to a nonnegative one. -/
theorem rCNeg_nonneg_of_nonpos_h5 {x : RCBOMA}
    (hx0 : rCLE x rCZero) :
    rCLE rCZero (rCNeg x) := by
  have ht := rcle_add_right hx0 (rCNeg x)
  rw [rCAdd_neg_right, rCAdd_zero_left] at ht
  exact ht

/-- Negation sends a nonnegative Cauchy real to a nonpositive one. -/
theorem rCNeg_nonpos_of_nonneg_h5 {x : RCBOMA}
    (h0x : rCLE rCZero x) :
    rCLE (rCNeg x) rCZero := by
  have ht := rcle_add_right h0x (rCNeg x)
  rw [rCAdd_zero_left, rCAdd_neg_right] at ht
  exact ht

/-- Right zero law for research multiplication. -/
theorem rCMul_zero_right_h5 (x : RCBOMA) :
    rCMul x rCZero = rCZero := by
  rw [rCMul_comm, rCMul_zero_left]

/-- Multiplication by an additive inverse on the right negates the product. -/
theorem rCMul_neg_right_h5 (x y : RCBOMA) :
    rCMul x (rCNeg y) = rCNeg (rCMul x y) := by
  apply rCAdd_inverse_unique_h5 (x := rCMul x y)
  calc
    rCAdd (rCMul x y) (rCMul x (rCNeg y)) =
        rCMul x (rCAdd y (rCNeg y)) :=
      (rCMul_add_right x y (rCNeg y)).symm
    _ = rCMul x rCZero := by rw [rCAdd_neg_right]
    _ = rCZero := rCMul_zero_right_h5 x

/-- Left negation compatibility follows from commutativity. -/
theorem rCMul_neg_left_h5 (x y : RCBOMA) :
    rCMul (rCNeg x) y = rCNeg (rCMul x y) := by
  calc
    rCMul (rCNeg x) y = rCMul y (rCNeg x) := rCMul_comm _ _
    _ = rCNeg (rCMul y x) := rCMul_neg_right_h5 y x
    _ = rCNeg (rCMul x y) := congrArg rCNeg (rCMul_comm y x)

/-- Negating both Cauchy factors leaves the product unchanged. -/
theorem rCMul_neg_neg_h5 (x y : RCBOMA) :
    rCMul (rCNeg x) (rCNeg y) = rCMul x y := by
  rw [rCMul_neg_left_h5, rCMul_neg_right_h5, rCNeg_involutive_h5]

/-- Cauchy order is equivalent to nonnegativity of the additive difference. -/
theorem rcle_iff_nonneg_difference_h5 (x y : RCBOMA) :
    rCLE x y ↔ rCLE rCZero (rCAdd y (rCNeg x)) := by
  constructor
  · intro hxy
    have ht := rcle_add_right hxy (rCNeg x)
    rw [rCAdd_neg_right] at ht
    exact ht
  · intro hdiff
    have ht := rcle_add_right hdiff x
    have hright : rCAdd (rCAdd y (rCNeg x)) x = y := by
      calc
        rCAdd (rCAdd y (rCNeg x)) x =
            rCAdd y (rCAdd (rCNeg x) x) :=
          rCAdd_assoc y (rCNeg x) x
        _ = rCAdd y rCZero := by rw [rCAdd_neg_left_h5]
        _ = y := rCAdd_zero_right y
    rw [rCAdd_zero_left, hright] at ht
    exact ht

/-- A nonnegative left Cauchy factor preserves non-strict order. -/
theorem rCMul_mono_left_nonneg_h5
    {x y c : RCBOMA}
    (hxy : rCLE x y)
    (h0c : rCLE rCZero c) :
    rCLE (rCMul c x) (rCMul c y) := by
  have hdiff : rCLE rCZero (rCAdd y (rCNeg x)) :=
    (rcle_iff_nonneg_difference_h5 x y).1 hxy
  have hprod :
      rCLE rCZero (rCMul c (rCAdd y (rCNeg x))) :=
    rcle_mul_nonneg h0c hdiff
  have hrepr :
      rCMul c (rCAdd y (rCNeg x)) =
        rCAdd (rCMul c y) (rCNeg (rCMul c x)) := by
    calc
      rCMul c (rCAdd y (rCNeg x)) =
          rCAdd (rCMul c y) (rCMul c (rCNeg x)) :=
        rCMul_add_right c y (rCNeg x)
      _ = rCAdd (rCMul c y) (rCNeg (rCMul c x)) := by
        rw [rCMul_neg_right_h5]
  rw [hrepr] at hprod
  exact (rcle_iff_nonneg_difference_h5
    (rCMul c x) (rCMul c y)).2 hprod

/-- A nonnegative right Cauchy factor preserves non-strict order. -/
theorem rCMul_mono_right_nonneg_h5
    {x y c : RCBOMA}
    (hxy : rCLE x y)
    (h0c : rCLE rCZero c) :
    rCLE (rCMul x c) (rCMul y c) := by
  rw [rCMul_comm x c, rCMul_comm y c]
  exact rCMul_mono_left_nonneg_h5 hxy h0c

/-- Multiplication by a nonzero common right factor is cancellative. -/
theorem rCMul_right_cancel_nonzero_h5
    {x y c : RCBOMA}
    (hc : c ≠ rCZero)
    (h : rCMul x c = rCMul y c) : x = y := by
  rcases rC_inverse_exists c hc with ⟨z, hz⟩
  have hcz := hz
  unfold RCInvRel at hcz
  calc
    x = rCMul x rCOne := (rCMul_one_right x).symm
    _ = rCMul x (rCMul c z) := congrArg (fun t => rCMul x t) hcz.symm
    _ = rCMul (rCMul x c) z := (rCMul_assoc x c z).symm
    _ = rCMul (rCMul y c) z := congrArg (fun t => rCMul t z) h
    _ = rCMul y (rCMul c z) := rCMul_assoc y c z
    _ = rCMul y rCOne := congrArg (fun t => rCMul y t) hcz
    _ = y := rCMul_one_right y

/-- Multiplication by a strictly positive right Cauchy factor preserves strict
    order. -/
theorem rclt_mul_right_positive_h5
    {x y c : RCBOMA}
    (hxy : rCLT x y)
    (h0c : rCLT rCZero c) :
    rCLT (rCMul x c) (rCMul y c) := by
  refine ⟨rCMul_mono_right_nonneg_h5 hxy.1 h0c.1, ?_⟩
  intro hEq
  have hc : c ≠ rCZero := fun h => h0c.2 h.symm
  exact hxy.2 (rCMul_right_cancel_nonzero_h5 hc hEq)

/-- A multiplicative inverse witness of a strictly positive Cauchy real is
    strictly positive. -/
theorem rC_inverse_positive_h5
    {x y : RCBOMA}
    (h0x : rCLT rCZero x)
    (hy : RCInvRel x y) :
    rCLT rCZero y := by
  have hxy := hy
  unfold RCInvRel at hxy
  have hyNe : y ≠ rCZero := by
    intro h0
    have hone : rCZero = rCOne := by
      calc
        rCZero = rCMul x rCZero := (rCMul_zero_right_h5 x).symm
        _ = rCMul x y := congrArg (fun t => rCMul x t) h0.symm
        _ = rCOne := hxy
    exact (rCOfQ_strict qzero_lt_one).2 hone
  rcases rcle_total rCZero y with h0y | hy0
  · exact ⟨h0y, fun h => hyNe h.symm⟩
  · have h0ny : rCLE rCZero (rCNeg y) :=
      rCNeg_nonneg_of_nonpos_h5 hy0
    have hprod : rCLE rCZero (rCMul x (rCNeg y)) :=
      rcle_mul_nonneg h0x.1 h0ny
    have hnegone : rCMul x (rCNeg y) = rCNeg rCOne := by
      rw [rCMul_neg_right_h5, hxy]
    rw [hnegone] at hprod
    have hone0 := rcle_add_right hprod rCOne
    rw [rCAdd_zero_left, rCAdd_neg_left_h5] at hone0
    have h0one : rCLE rCZero rCOne :=
      (rCOfQ_order qZero qOne).2 qzero_le_one
    have heq : rCZero = rCOne := rcle_antisymm h0one hone0
    exact False.elim ((rCOfQ_strict qzero_lt_one).2 heq)

/-- If q is nonnegative and strictly below a product of nonnegative Cauchy
    reals, positive rational factors can be chosen below each input with a
    rational product still strictly above q. -/
theorem rC_nonneg_product_inner_witness
    {q : QBOMA} {x y : RCBOMA}
    (h0q : qLE qZero q)
    (h0x : rCLE rCZero x)
    (h0y : rCLE rCZero y)
    (hq : rCLT (rCOfQ q) (rCMul x y)) :
    ∃ a b : QBOMA,
      qLT qZero a ∧ qLT qZero b ∧
      rCLT (rCOfQ a) x ∧
      rCLT (rCOfQ b) y ∧
      qLT q (qMul a b) := by
  have hyNe : y ≠ rCZero := by
    intro hy0
    have hprod0 : rCMul x y = rCZero := by
      rw [hy0, rCMul_zero_right_h5]
    have hq0 : rCLT (rCOfQ q) rCZero := by
      rw [← hprod0]
      exact hq
    have h0qC : rCLE rCZero (rCOfQ q) :=
      (rCOfQ_order qZero q).2 h0q
    exact hq0.2 (rcle_antisymm hq0.1 h0qC)
  have hyPos : rCLT rCZero y :=
    ⟨h0y, fun h => hyNe h.symm⟩
  rcases rC_inverse_exists y hyNe with ⟨z, hz⟩
  have hzPos : rCLT rCZero z := rC_inverse_positive_h5 hyPos hz
  have hqz0 := rclt_mul_right_positive_h5 hq hzPos
  have hyz := hz
  unfold RCInvRel at hyz
  have hright : rCMul (rCMul x y) z = x := by
    calc
      rCMul (rCMul x y) z = rCMul x (rCMul y z) :=
        rCMul_assoc x y z
      _ = rCMul x rCOne := congrArg (fun t => rCMul x t) hyz
      _ = x := rCMul_one_right x
  rw [hright] at hqz0
  rcases rC_rational_image_dense hqz0 with ⟨a, hqza, hax⟩
  have h0qC : rCLE rCZero (rCOfQ q) :=
    (rCOfQ_order qZero q).2 h0q
  have h0qz : rCLE rCZero (rCMul (rCOfQ q) z) :=
    rcle_mul_nonneg h0qC hzPos.1
  have h0aLE : rCLE rCZero (rCOfQ a) :=
    rcle_trans h0qz hqza.1
  have h0aNe : rCZero ≠ rCOfQ a := by
    intro h0a
    have haBack : rCLE (rCOfQ a) (rCMul (rCOfQ q) z) := by
      rw [← h0a]
      exact h0qz
    exact hqza.2 (rcle_antisymm hqza.1 haBack)
  have h0a : rCLT rCZero (rCOfQ a) := ⟨h0aLE, h0aNe⟩
  have haQ : qLT qZero a := by
    refine ⟨(rCOfQ_order qZero a).1 h0a.1, ?_⟩
    intro hEq
    apply h0a.2
    exact congrArg rCOfQ hEq
  have hqay0 := rclt_mul_right_positive_h5 hqza hyPos
  have hzy : rCMul z y = rCOne := by
    rw [rCMul_comm]
    exact hyz
  have hleft :
      rCMul (rCMul (rCOfQ q) z) y = rCOfQ q := by
    calc
      rCMul (rCMul (rCOfQ q) z) y =
          rCMul (rCOfQ q) (rCMul z y) := rCMul_assoc _ _ _
      _ = rCMul (rCOfQ q) rCOne := congrArg (fun t => rCMul (rCOfQ q) t) hzy
      _ = rCOfQ q := rCMul_one_right _
  rw [hleft] at hqay0
  have haNe : a ≠ qZero := fun h => haQ.2 h.symm
  rcases q_inverse_exists a haNe with ⟨ainv, hainv⟩
  have hainvPosQ : qLT qZero ainv := qlt_zero_inverse haQ hainv
  have hainvPosC : rCLT rCZero (rCOfQ ainv) :=
    rCOfQ_strict hainvPosQ
  have hqb0 := rclt_mul_right_positive_h5 hqay0 hainvPosC
  have hainvEq := hainv
  unfold QInvRel at hainvEq
  have hleftInv :
      rCMul (rCOfQ q) (rCOfQ ainv) = rCOfQ (qMul q ainv) :=
    rCOfQ_mul q ainv
  have hrightInv :
      rCMul (rCMul (rCOfQ a) y) (rCOfQ ainv) = y := by
    calc
      rCMul (rCMul (rCOfQ a) y) (rCOfQ ainv) =
          rCMul (rCMul y (rCOfQ a)) (rCOfQ ainv) := by
        rw [rCMul_comm (rCOfQ a) y]
      _ = rCMul y (rCMul (rCOfQ a) (rCOfQ ainv)) :=
        rCMul_assoc y (rCOfQ a) (rCOfQ ainv)
      _ = rCMul y (rCOfQ (qMul a ainv)) := by rw [rCOfQ_mul]
      _ = rCMul y (rCOfQ qOne) := by rw [hainvEq]
      _ = y := rCMul_one_right y
  rw [hleftInv, hrightInv] at hqb0
  rcases rC_rational_image_dense hqb0 with ⟨b, hqInvb, hby⟩
  have hqInvbQ : qLT (qMul q ainv) b := by
    refine ⟨(rCOfQ_order _ _).1 hqInvb.1, ?_⟩
    intro hEq
    apply hqInvb.2
    exact congrArg rCOfQ hEq
  have h0qInv : qLE qZero (qMul q ainv) :=
    qmul_nonneg h0q hainvPosQ.1
  have h0b : qLT qZero b :=
    BOMA.R.DedekindAddition001.qle_lt_trans h0qInv hqInvbQ
  have hmul := qmul_lt_left_positive hqInvbQ haQ
  have hleftQ : qMul a (qMul q ainv) = q := by
    calc
      qMul a (qMul q ainv) = qMul q (qMul a ainv) := by
        rw [← qMul_assoc, qMul_comm a q, qMul_assoc]
      _ = qMul q qOne := by rw [hainvEq]
      _ = q := qMul_one_right q
  rw [hleftQ] at hmul
  exact ⟨a, b, haQ, h0b, hax, hby, hmul⟩

/-- Exact strict rational lower-envelope description of a nonnegative Cauchy
    product. -/
theorem rC_rational_strict_below_mul_nonneg_iff
    {q : QBOMA} {x y : RCBOMA}
    (h0x : rCLE rCZero x)
    (h0y : rCLE rCZero y) :
    rCLT (rCOfQ q) (rCMul x y) ↔
      qLT q qZero ∨
      ∃ a b : QBOMA,
        qLT qZero a ∧ qLT qZero b ∧
        rCLT (rCOfQ a) x ∧
        rCLT (rCOfQ b) y ∧
        qLT q (qMul a b) := by
  constructor
  · intro hq
    rcases qlt_trichotomy q qZero with hneg | heq | hpos
    · exact Or.inl hneg
    · right
      apply rC_nonneg_product_inner_witness (q := q) (x := x) (y := y)
      · rw [heq]
        exact qle_refl qZero
      · exact h0x
      · exact h0y
      · exact hq
    · right
      exact rC_nonneg_product_inner_witness hpos.1 h0x h0y hq
  · intro h
    rcases h with hneg | hprod
    · have h0prod : rCLE rCZero (rCMul x y) :=
        rcle_mul_nonneg h0x h0y
      refine ⟨rcle_trans ((rCOfQ_order q qZero).2 hneg.1) h0prod, ?_⟩
      intro hEq
      have hprodq : rCLE rCZero (rCOfQ q) := by
        rw [hEq]
        exact h0prod
      have hq0 : rCLE (rCOfQ q) rCZero :=
        (rCOfQ_order q qZero).2 hneg.1
      have heq0 := rcle_antisymm hq0 hprodq
      exact hneg.2 (rCOfQ_injective heq0)
    · rcases hprod with ⟨a, b, h0a, h0b, hax, hby, hqab⟩
      have hAB : rCLT (rCOfQ q) (rCOfQ (qMul a b)) :=
        rCOfQ_strict hqab
      have h0aC : rCLE rCZero (rCOfQ a) :=
        (rCOfQ_order qZero a).2 h0a.1
      have h0bC : rCLE rCZero (rCOfQ b) :=
        (rCOfQ_order qZero b).2 h0b.1
      have h1 :
          rCLE (rCMul (rCOfQ a) (rCOfQ b))
            (rCMul x (rCOfQ b)) :=
        rCMul_mono_right_nonneg_h5 hax.1 h0bC
      have h2 :
          rCLE (rCMul x (rCOfQ b)) (rCMul x y) :=
        rCMul_mono_left_nonneg_h5 hby.1 h0x
      have hrat :
          rCLE (rCOfQ (qMul a b)) (rCMul x y) := by
        rw [← rCOfQ_mul]
        exact rcle_trans h1 h2
      exact rclt_trans_le hAB hrat

/-- Exact strict rational lower-envelope description of the accepted Dedekind
    nonnegative multiplication kernel. -/
theorem r_rational_strict_below_mul_nonneg_envelope_iff
    {q : QBOMA} {x y : RBOMA}
    (h0x : rLE rZero x)
    (h0y : rLE rZero y) :
    rLT (rOfQ q) (rMulNonnegEnvelope x y) ↔
      qLT q qZero ∨
      ∃ a b : QBOMA,
        qLT qZero a ∧ qLT qZero b ∧
        rLT (rOfQ a) x ∧
        rLT (rOfQ b) y ∧
        qLT q (qMul a b) := by
  refine Quotient.inductionOn x ?_ h0x
  intro A h0A
  refine Quotient.inductionOn y ?_ h0y
  intro B h0B
  have h0Ac : CutLE (principalCut qZero) A := by
    change rLE (rmk (principalCut qZero)) (rmk A) at h0A
    exact (rLE_mk_iff (principalCut qZero) A).1 h0A
  have h0Bc : CutLE (principalCut qZero) B := by
    change rLE (rmk (principalCut qZero)) (rmk B) at h0B
    exact (rLE_mk_iff (principalCut qZero) B).1 h0B
  have hPosA := cutPosPart_of_nonneg h0Ac
  have hPosB := cutPosPart_of_nonneg h0Bc
  constructor
  · intro h
    change rLT (rOfQ q) (rmk (cutMulNonnegEnvelope A B)) at h
    have hcut : (cutMulNonnegEnvelope A B).lower q :=
      (rOfQ_strict_mk_iff_lower q (cutMulNonnegEnvelope A B)).1 h
    rcases hcut with hneg | hprod
    · exact Or.inl hneg
    · rcases hprod with ⟨a, b, ha, hb, h0a, h0b, hqab⟩
      exact Or.inr ⟨a, b, h0a, h0b,
        (rOfQ_strict_mk_iff_lower a A).2 ((hPosA a).1 ha),
        (rOfQ_strict_mk_iff_lower b B).2 ((hPosB b).1 hb),
        hqab⟩
  · intro h
    change rLT (rOfQ q) (rmk (cutMulNonnegEnvelope A B))
    apply (rOfQ_strict_mk_iff_lower q (cutMulNonnegEnvelope A B)).2
    rcases h with hneg | hprod
    · exact Or.inl hneg
    · rcases hprod with ⟨a, b, h0a, h0b, ha, hb, hqab⟩
      exact Or.inr ⟨a, b,
        (hPosA a).2 ((rOfQ_strict_mk_iff_lower a A).1 ha),
        (hPosB b).2 ((rOfQ_strict_mk_iff_lower b B).1 hb),
        h0a, h0b, hqab⟩

/-- Nonnegative accepted signed multiplication has the same rational envelope
    as its underlying nonnegative kernel. -/
theorem r_rational_strict_below_mul_nonneg_iff
    {q : QBOMA} {x y : RBOMA}
    (h0x : rLE rZero x)
    (h0y : rLE rZero y) :
    rLT (rOfQ q) (rMulCandidate x y) ↔
      qLT q qZero ∨
      ∃ a b : QBOMA,
        qLT qZero a ∧ qLT qZero b ∧
        rLT (rOfQ a) x ∧
        rLT (rOfQ b) y ∧
        qLT q (qMul a b) := by
  rw [rMulCandidate_of_nonneg_nonneg h0x h0y]
  exact r_rational_strict_below_mul_nonneg_envelope_iff h0x h0y

/-- The forward H5 map transports Cauchy nonnegativity to Dedekind
    nonnegativity. -/
theorem cToD_nonneg_h5 {x : RCBOMA}
    (h0x : rCLE rCZero x) :
    rLE rZero (cToD x) := by
  have h := cToD_mono h0x
  rw [cToD_zero] at h
  exact h

/-- The forward H5 map transports Cauchy nonpositivity as well. -/
theorem cToD_nonpos_h5 {x : RCBOMA}
    (hx0 : rCLE x rCZero) :
    rLE (cToD x) rZero := by
  have h := cToD_mono hx0
  rw [cToD_zero] at h
  exact h

/-- The explicit H5 comparison map preserves multiplication on the nonnegative
    quadrant. -/
theorem cToD_mul_nonneg
    {x y : RCBOMA}
    (h0x : rCLE rCZero x)
    (h0y : rCLE rCZero y) :
    cToD (rCMul x y) = rMulCandidate (cToD x) (cToD y) := by
  apply r_eq_of_rational_strict_lower_iff
  intro q
  constructor
  · intro h
    have hC : rCLT (rCOfQ q) (rCMul x y) :=
      (cToD_rational_strict_iff).1 h
    rcases (rC_rational_strict_below_mul_nonneg_iff h0x h0y).1 hC with
      hneg | hprod
    · exact (r_rational_strict_below_mul_nonneg_iff
        (cToD_nonneg_h5 h0x) (cToD_nonneg_h5 h0y)).2 (Or.inl hneg)
    · rcases hprod with ⟨a, b, h0a, h0b, hax, hby, hqab⟩
      apply (r_rational_strict_below_mul_nonneg_iff
        (cToD_nonneg_h5 h0x) (cToD_nonneg_h5 h0y)).2
      exact Or.inr ⟨a, b, h0a, h0b,
        (cToD_rational_strict_iff).2 hax,
        (cToD_rational_strict_iff).2 hby,
        hqab⟩
  · intro h
    have hD := (r_rational_strict_below_mul_nonneg_iff
      (cToD_nonneg_h5 h0x) (cToD_nonneg_h5 h0y)).1 h
    apply (cToD_rational_strict_iff).2
    apply (rC_rational_strict_below_mul_nonneg_iff h0x h0y).2
    rcases hD with hneg | hprod
    · exact Or.inl hneg
    · rcases hprod with ⟨a, b, h0a, h0b, hax, hby, hqab⟩
      exact Or.inr ⟨a, b, h0a, h0b,
        (cToD_rational_strict_iff).1 hax,
        (cToD_rational_strict_iff).1 hby,
        hqab⟩

/-- The forward H5 map preserves signed multiplication in all four sign
    quadrants. -/
theorem cToD_mul (x y : RCBOMA) :
    cToD (rCMul x y) = rMulCandidate (cToD x) (cToD y) := by
  rcases rcle_total rCZero x with h0x | hx0
  · rcases rcle_total rCZero y with h0y | hy0
    · exact cToD_mul_nonneg h0x h0y
    · have h0ny : rCLE rCZero (rCNeg y) :=
        rCNeg_nonneg_of_nonpos_h5 hy0
      have h := cToD_mul_nonneg h0x h0ny
      rw [rCMul_neg_right_h5, cToD_neg, cToD_neg,
          rMulCandidate_neg_right] at h
      have ht := congrArg rNeg h
      simpa only [rNeg_involutive] using ht
  · rcases rcle_total rCZero y with h0y | hy0
    · have h0nx : rCLE rCZero (rCNeg x) :=
        rCNeg_nonneg_of_nonpos_h5 hx0
      have h := cToD_mul_nonneg h0nx h0y
      rw [rCMul_neg_left_h5, cToD_neg, cToD_neg,
          rMulCandidate_neg_left] at h
      have ht := congrArg rNeg h
      simpa only [rNeg_involutive] using ht
    · have h0nx : rCLE rCZero (rCNeg x) :=
        rCNeg_nonneg_of_nonpos_h5 hx0
      have h0ny : rCLE rCZero (rCNeg y) :=
        rCNeg_nonneg_of_nonpos_h5 hy0
      have h := cToD_mul_nonneg h0nx h0ny
      rw [rCMul_neg_neg_h5, cToD_neg, cToD_neg,
          rMulCandidate_neg_left, rMulCandidate_neg_right,
          rNeg_involutive] at h
      exact h

/-- The reverse H5 map preserves signed multiplication. -/
theorem dToC_mul (x y : RBOMA) :
    dToC (rMulCandidate x y) = rCMul (dToC x) (dToC y) := by
  have h := congrArg dToC (cToD_mul (dToC x) (dToC y))
  rw [dToC_cToD, cToD_dToC, cToD_dToC] at h
  exact h.symm

/-- Multiplicative one is preserved in the forward direction. -/
theorem cToD_one : cToD rCOne = rOne := by
  change cToD (rCOfQ qOne) = rOfQ qOne
  exact cToD_rational qOne

/-- Multiplicative one is preserved in the reverse direction. -/
theorem dToC_one : dToC rOne = rCOne := by
  change dToC (rOfQ qOne) = rCOfQ qOne
  exact dToC_rational qOne

/-- Machine-checkable ordered-ring preservation milestone.  Inverse relations
    and the final field-isomorphism claim are intentionally absent. -/
structure DedekindCauchyMultiplicativePreservationCertificate where
  additive : DedekindCauchyAdditivePreservationCertificate
  forwardMul : ∀ x y : RCBOMA,
    cToD (rCMul x y) = rMulCandidate (cToD x) (cToD y)
  reverseMul : ∀ x y : RBOMA,
    dToC (rMulCandidate x y) = rCMul (dToC x) (dToC y)
  forwardOne : cToD rCOne = rOne
  reverseOne : dToC rOne = rCOne

noncomputable def dedekindCauchyMultiplicativePreservationCertificate :
    DedekindCauchyMultiplicativePreservationCertificate where
  additive := dedekindCauchyAdditivePreservationCertificate
  forwardMul := cToD_mul
  reverseMul := dToC_mul
  forwardOne := cToD_one
  reverseOne := dToC_one

end BOMA.R.StageTwo.DedekindCauchyComparison003
