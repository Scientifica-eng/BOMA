/- ST2-EXP-003: pointwise multiplication descends to the independent Cauchy
   quotient. This establishes a commutative-ring-strength milestone only;
   order, inverses, and completeness remain separate obligations. -/
namespace BOMA.R.StageTwo.CauchyMultiplicative003

open BOMA.NCore.RB001
open BOMA.NArithmetic.Order001
open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.Q.Inverse001
open BOMA.R.Gateway001
open BOMA.R.CauchyProbe001
open BOMA.R.StageTwo.CauchyCloseness003
open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyAdditive003
open BOMA.R.StageTwo.CauchyBounded003
open BOMA.R.StageTwo.CauchyProductBounds003

/-- Any two accepted-natural thresholds have a common upper threshold. -/
theorem common_upper_bound (a b : BOMANat) :
    ∃ N : BOMANat, LE a N ∧ LE b N := by
  rcases le_total a b with hab | hba
  · exact ⟨b, hab, le_refl b⟩
  · exact ⟨a, le_refl a, hba⟩

/-- A symmetric bound may be enlarged monotonically. -/
theorem qAbsBound_mono {B K x : QBOMA}
    (hBK : qLE B K) (hx : qAbsBound B x) : qAbsBound K x := by
  constructor
  · exact qle_trans (qneg_reverses hBK) hx.1
  · exact qle_trans hx.2 hBK

/-- The sum of two positive rational radii is positive. -/
theorem qPos_add {B C : QBOMA} (hB : qPos B) (hC : qPos C) :
    qPos (qAdd B C) := by
  constructor
  · have h := qAdd_mono hB.1 hC.1
    rw [qAdd_zero_left] at h
    exact h
  · intro hzero
    have hBsum := qadd_mono_right hC.1 B
    rw [qAdd_zero_left, qAdd_comm C B, hzero.symm] at hBsum
    exact hB.2 (qle_antisymm hB.1 hBsum)

/-- Two Cauchy sequences share one eventual positive symmetric bound. -/
theorem pair_common_eventual_bound (u v : CauchySeq) :
    ∃ K : QBOMA, qPos K ∧
      ∃ N : BOMANat, ∀ n : BOMANat, LE N n →
        qAbsBound K (u.seq n) ∧ qAbsBound K (v.seq n) := by
  rcases cauchy_eventually_bounded u with ⟨B, hB, Nu, hNu⟩
  rcases cauchy_eventually_bounded v with ⟨C, hC, Nv, hNv⟩
  let K := qAdd B C
  have hK : qPos K := qPos_add hB hC
  have hBK : qLE B K := by
    have h := qadd_mono_right hC.1 B
    rw [qAdd_zero_left, qAdd_comm C B] at h
    exact h
  have hCK : qLE C K := by
    have h := qadd_mono_right hB.1 C
    rw [qAdd_zero_left] at h
    exact h
  rcases common_upper_bound Nu Nv with ⟨N, hNuN, hNvN⟩
  refine ⟨K, hK, N, ?_⟩
  intro n hn
  exact ⟨
    qAbsBound_mono hBK (hNu n (le_trans hNuN hn)),
    qAbsBound_mono hCK (hNv n (le_trans hNvN hn))
  ⟩

/-- Four Cauchy sequences share one eventual positive symmetric bound. -/
theorem four_common_eventual_bound (u a v b : CauchySeq) :
    ∃ K : QBOMA, qPos K ∧
      ∃ N : BOMANat, ∀ n : BOMANat, LE N n →
        qAbsBound K (u.seq n) ∧ qAbsBound K (a.seq n) ∧
        qAbsBound K (v.seq n) ∧ qAbsBound K (b.seq n) := by
  rcases pair_common_eventual_bound u a with ⟨K₁, hK₁, N₁, hN₁⟩
  rcases pair_common_eventual_bound v b with ⟨K₂, hK₂, N₂, hN₂⟩
  let K := qAdd K₁ K₂
  have hK : qPos K := qPos_add hK₁ hK₂
  have hK₁K : qLE K₁ K := by
    have h := qadd_mono_right hK₂.1 K₁
    rw [qAdd_zero_left, qAdd_comm K₂ K₁] at h
    exact h
  have hK₂K : qLE K₂ K := by
    have h := qadd_mono_right hK₁.1 K₂
    rw [qAdd_zero_left] at h
    exact h
  rcases common_upper_bound N₁ N₂ with ⟨N, hN₁N, hN₂N⟩
  refine ⟨K, hK, N, ?_⟩
  intro n hn
  rcases hN₁ n (le_trans hN₁N hn) with ⟨hu, ha⟩
  rcases hN₂ n (le_trans hN₂N hn) with ⟨hv, hb⟩
  exact ⟨
    qAbsBound_mono hK₁K hu,
    qAbsBound_mono hK₁K ha,
    qAbsBound_mono hK₂K hv,
    qAbsBound_mono hK₂K hb
  ⟩

/-- A positive scale exists so that two common-bound error terms sum to the
    requested positive epsilon. -/
theorem product_delta_exists {eps K : QBOMA}
    (heps : qPos eps) (hK : qPos K) :
    ∃ delta : QBOMA, qPos delta ∧
      qAdd (qMul K delta) (qMul K delta) = eps := by
  rcases positive_half_exists heps with ⟨half, hhalf, hhalfsum⟩
  have hKPositive : QPositive K :=
    ⟨hK.1, fun h => hK.2 h.symm⟩
  rcases q_inverse_exists K hKPositive.2 with ⟨invK, hinvK⟩
  have hinvPositive : QPositive invK :=
    inverse_of_positive_is_positive hKPositive hinvK
  have hhalfPositive : QPositive half :=
    ⟨hhalf.1, fun h => hhalf.2 h.symm⟩
  let delta := qMul half invK
  have hdeltaNonNeg : qLE qZero delta := by
    unfold delta
    exact qmul_nonneg hhalfPositive.1 hinvPositive.1
  have hdeltaNe : delta ≠ qZero := by
    unfold delta
    exact qMul_ne_zero hhalfPositive.2 hinvPositive.2
  have hdelta : qPos delta :=
    ⟨hdeltaNonNeg, fun h => hdeltaNe h.symm⟩
  have hKdelta : qMul K delta = half := by
    unfold delta
    calc
      qMul K (qMul half invK) = qMul (qMul K half) invK :=
        (qMul_assoc K half invK).symm
      _ = qMul (qMul half K) invK :=
        congrArg (fun t => qMul t invK) (qMul_comm K half)
      _ = qMul half (qMul K invK) := qMul_assoc half K invK
      _ = qMul half qOne := congrArg (fun t => qMul half t) hinvK
      _ = half := qMul_one_right half
  refine ⟨delta, hdelta, ?_⟩
  rw [hKdelta, hhalfsum]

/-- Pointwise multiplication of rational sequences. -/
def seqMul (u v : QSeq) : QSeq := fun n => qMul (u n) (v n)

/-- Pointwise multiplication preserves the Cauchy condition. -/
theorem seqMul_cauchy {u v : QSeq}
    (hu : IsCauchy u) (hv : IsCauchy v) : IsCauchy (seqMul u v) := by
  let U : CauchySeq := ⟨u, hu⟩
  let V : CauchySeq := ⟨v, hv⟩
  rcases pair_common_eventual_bound U V with ⟨K, hK, Nb, hNb⟩
  intro eps heps
  rcases product_delta_exists heps hK with ⟨delta, hdelta, hscale⟩
  rcases hu delta hdelta with ⟨Nu, hNu⟩
  rcases hv delta hdelta with ⟨Nv, hNv⟩
  rcases common_upper_bound Nb Nu with ⟨Nbu, hNbNbu, hNuNbu⟩
  rcases common_upper_bound Nbu Nv with ⟨N, hNbuN, hNvN⟩
  refine ⟨N, ?_⟩
  intro m n hm hn
  have hNbm : LE Nb m := le_trans hNbNbu (le_trans hNbuN hm)
  have hNbn : LE Nb n := le_trans hNbNbu (le_trans hNbuN hn)
  rcases hNb m hNbm with ⟨hUm, hVm⟩
  rcases hNb n hNbn with ⟨hUn, hVn⟩
  exact qClose_mul_of_common_bound hK.1 hdelta.1 hscale
    hUm hUn hVm hVn
    (hNu m n (le_trans hNuNbu (le_trans hNbuN hm))
      (le_trans hNuNbu (le_trans hNbuN hn)))
    (hNv m n (le_trans hNvN hm) (le_trans hNvN hn))

/-- Multiplication on verified Cauchy representatives. -/
def cMulSeq (u v : CauchySeq) : CauchySeq :=
  ⟨seqMul u.seq v.seq, seqMul_cauchy u.cauchy v.cauchy⟩

/-- Pointwise multiplication respects asymptotic identity in both inputs. -/
theorem cMulSeq_respects {u u' v v' : CauchySeq}
    (hu : CauchyEquiv u u') (hv : CauchyEquiv v v') :
    CauchyEquiv (cMulSeq u v) (cMulSeq u' v') := by
  rcases four_common_eventual_bound u u' v v' with ⟨K, hK, Nb, hNb⟩
  intro eps heps
  rcases product_delta_exists heps hK with ⟨delta, hdelta, hscale⟩
  rcases hu delta hdelta with ⟨Nu, hNu⟩
  rcases hv delta hdelta with ⟨Nv, hNv⟩
  rcases common_upper_bound Nb Nu with ⟨Nbu, hNbNbu, hNuNbu⟩
  rcases common_upper_bound Nbu Nv with ⟨N, hNbuN, hNvN⟩
  refine ⟨N, ?_⟩
  intro n hn
  rcases hNb n (le_trans hNbNbu (le_trans hNbuN hn)) with
    ⟨hUn, hU'n, hVn, hV'n⟩
  exact qClose_mul_of_common_bound hK.1 hdelta.1 hscale
    hUn hU'n hVn hV'n
    (hNu n (le_trans hNuNbu (le_trans hNbuN hn)))
    (hNv n (le_trans hNvN hn))

/-- Research multiplication on the Cauchy quotient. -/
def rCMul : RCBOMA → RCBOMA → RCBOMA :=
  Quotient.lift₂
    (fun u v => rCmk (cMulSeq u v))
    (fun _ _ _ _ hu hv => Quotient.sound (cMulSeq_respects hu hv))

/-- Research multiplicative one is the constant rational one sequence. -/
def rCOne : RCBOMA := rCOfQ qOne

@[simp] theorem rCMul_mk (u v : CauchySeq) :
    rCMul (rCmk u) (rCmk v) = rCmk (cMulSeq u v) := rfl

theorem rCMul_comm (x y : RCBOMA) : rCMul x y = rCMul y x := by
  refine Quotient.inductionOn x ?_
  intro u
  refine Quotient.inductionOn y ?_
  intro v
  exact Quotient.sound (cauchyEquiv_of_pointwise_eq (fun n => qMul_comm _ _))

theorem rCMul_assoc (x y z : RCBOMA) :
    rCMul (rCMul x y) z = rCMul x (rCMul y z) := by
  refine Quotient.inductionOn x ?_
  intro u
  refine Quotient.inductionOn y ?_
  intro v
  refine Quotient.inductionOn z ?_
  intro w
  exact Quotient.sound
    (cauchyEquiv_of_pointwise_eq (fun n => qMul_assoc _ _ _))

theorem rCMul_one_left (x : RCBOMA) : rCMul rCOne x = x := by
  refine Quotient.inductionOn x ?_
  intro u
  exact Quotient.sound
    (cauchyEquiv_of_pointwise_eq (fun n => qMul_one_left (u.seq n)))

theorem rCMul_zero_left (x : RCBOMA) : rCMul rCZero x = rCZero := by
  refine Quotient.inductionOn x ?_
  intro u
  exact Quotient.sound
    (cauchyEquiv_of_pointwise_eq (fun n => qMul_zero_left (u.seq n)))

theorem rCMul_add_right (x y z : RCBOMA) :
    rCMul x (rCAdd y z) = rCAdd (rCMul x y) (rCMul x z) := by
  refine Quotient.inductionOn x ?_
  intro u
  refine Quotient.inductionOn y ?_
  intro v
  refine Quotient.inductionOn z ?_
  intro w
  exact Quotient.sound
    (cauchyEquiv_of_pointwise_eq (fun n => qMul_add_right _ _ _))

theorem rCOfQ_mul (q r : QBOMA) :
    rCMul (rCOfQ q) (rCOfQ r) = rCOfQ (qMul q r) := by
  exact Quotient.sound (cauchyEquiv_of_pointwise_eq (fun n => rfl))

/-- Independently assembled commutative-ring-strength research certificate. -/
structure CauchyCommutativeRingCertificate where
  productBoundCertificate : CauchyProductBoundCertificate
  mulComm : ∀ x y : RCBOMA, rCMul x y = rCMul y x
  mulAssoc : ∀ x y z : RCBOMA, rCMul (rCMul x y) z = rCMul x (rCMul y z)
  mulOneLeft : ∀ x : RCBOMA, rCMul rCOne x = x
  mulZeroLeft : ∀ x : RCBOMA, rCMul rCZero x = rCZero
  mulAddRight : ∀ x y z : RCBOMA,
    rCMul x (rCAdd y z) = rCAdd (rCMul x y) (rCMul x z)
  qEmbeddingMul : ∀ q r : QBOMA,
    rCMul (rCOfQ q) (rCOfQ r) = rCOfQ (qMul q r)

theorem cauchyCommutativeRingCertificate : CauchyCommutativeRingCertificate where
  productBoundCertificate := cauchyProductBoundCertificate
  mulComm := rCMul_comm
  mulAssoc := rCMul_assoc
  mulOneLeft := rCMul_one_left
  mulZeroLeft := rCMul_zero_left
  mulAddRight := rCMul_add_right
  qEmbeddingMul := rCOfQ_mul

end BOMA.R.StageTwo.CauchyMultiplicative003
