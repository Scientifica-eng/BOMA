/- ST2-EXP-003: independent additive structure on the rational Cauchy quotient.
   This file uses accepted Q operations and the verified Cauchy quotient only. -/
namespace BOMA.R.StageTwo.CauchyAdditive003

open BOMA.NCore.RB001
open BOMA.NArithmetic.Order001
open BOMA.Q.Quotient001
open BOMA.R.Gateway001
open BOMA.R.CauchyProbe001
open BOMA.R.StageTwo.CauchyCloseness003
open BOMA.R.StageTwo.CauchyQuotient003

/-- Negating both endpoints preserves rational epsilon-closeness. -/
theorem qClose_neg {eps x y : QBOMA} (h : qClose eps x y) :
    qClose eps (qNeg x) (qNeg y) := by
  have hs := qClose_symm h
  unfold qClose at hs ⊢
  rw [qNeg_neg, qAdd_comm (qNeg x) y]
  exact hs

/-- The difference of two rational sums is the sum of their differences. -/
theorem q_difference_sum (x a y b : QBOMA) :
    qAdd (qAdd x a) (qNeg (qAdd y b)) =
      qAdd (qAdd x (qNeg y)) (qAdd a (qNeg b)) := by
  rw [qNeg_add]
  calc
    qAdd (qAdd x a) (qAdd (qNeg y) (qNeg b)) =
        qAdd x (qAdd a (qAdd (qNeg y) (qNeg b))) :=
      qAdd_assoc x a (qAdd (qNeg y) (qNeg b))
    _ = qAdd x (qAdd (qNeg y) (qAdd a (qNeg b))) :=
      qAdd_exchange x a (qNeg y) (qNeg b)
    _ = qAdd (qAdd x (qNeg y)) (qAdd a (qNeg b)) :=
      (qAdd_assoc x (qNeg y) (qAdd a (qNeg b))).symm

/-- Adding epsilon-close rationals adds their explicit error bounds. -/
theorem qClose_add {eps delta x y a b : QBOMA}
    (hxy : qClose eps x y) (hab : qClose delta a b) :
    qClose (qAdd eps delta) (qAdd x a) (qAdd y b) := by
  constructor
  · have h := qAdd_mono hxy.1 hab.1
    rw [← qNeg_add, q_difference_sum] at h
    exact h
  · have h := qAdd_mono hxy.2 hab.2
    rw [q_difference_sum] at h
    exact h

/-- Pointwise addition of rational sequences. -/
def seqAdd (u v : QSeq) : QSeq := fun n => qAdd (u n) (v n)

/-- Pointwise negation of a rational sequence. -/
def seqNeg (u : QSeq) : QSeq := fun n => qNeg (u n)

/-- Pointwise addition preserves the Cauchy condition. -/
theorem seqAdd_cauchy {u v : QSeq}
    (hu : IsCauchy u) (hv : IsCauchy v) : IsCauchy (seqAdd u v) := by
  intro eps heps
  rcases positive_half_exists heps with ⟨delta, hdelta, hsum⟩
  rcases hu delta hdelta with ⟨Nu, hNu⟩
  rcases hv delta hdelta with ⟨Nv, hNv⟩
  rcases le_total Nu Nv with hUV | hVU
  · refine ⟨Nv, ?_⟩
    intro m n hm hn
    have h := qClose_add
      (hNu m n (le_trans hUV hm) (le_trans hUV hn))
      (hNv m n hm hn)
    rw [hsum] at h
    exact h
  · refine ⟨Nu, ?_⟩
    intro m n hm hn
    have h := qClose_add
      (hNu m n hm hn)
      (hNv m n (le_trans hVU hm) (le_trans hVU hn))
    rw [hsum] at h
    exact h

/-- Pointwise negation preserves the Cauchy condition. -/
theorem seqNeg_cauchy {u : QSeq} (hu : IsCauchy u) : IsCauchy (seqNeg u) := by
  intro eps heps
  rcases hu eps heps with ⟨N, hN⟩
  exact ⟨N, fun m n hm hn => qClose_neg (hN m n hm hn)⟩

/-- Addition on verified Cauchy representatives. -/
def cAddSeq (u v : CauchySeq) : CauchySeq :=
  ⟨seqAdd u.seq v.seq, seqAdd_cauchy u.cauchy v.cauchy⟩

/-- Negation on verified Cauchy representatives. -/
def cNegSeq (u : CauchySeq) : CauchySeq :=
  ⟨seqNeg u.seq, seqNeg_cauchy u.cauchy⟩

/-- Addition respects asymptotic identity in both inputs. -/
theorem cAddSeq_respects {u u' v v' : CauchySeq}
    (hu : CauchyEquiv u u') (hv : CauchyEquiv v v') :
    CauchyEquiv (cAddSeq u v) (cAddSeq u' v') := by
  intro eps heps
  rcases positive_half_exists heps with ⟨delta, hdelta, hsum⟩
  rcases hu delta hdelta with ⟨Nu, hNu⟩
  rcases hv delta hdelta with ⟨Nv, hNv⟩
  rcases le_total Nu Nv with hUV | hVU
  · refine ⟨Nv, ?_⟩
    intro n hn
    have h := qClose_add (hNu n (le_trans hUV hn)) (hNv n hn)
    rw [hsum] at h
    exact h
  · refine ⟨Nu, ?_⟩
    intro n hn
    have h := qClose_add (hNu n hn) (hNv n (le_trans hVU hn))
    rw [hsum] at h
    exact h

/-- Negation respects asymptotic identity. -/
theorem cNegSeq_respects {u v : CauchySeq} (h : CauchyEquiv u v) :
    CauchyEquiv (cNegSeq u) (cNegSeq v) := by
  intro eps heps
  rcases h eps heps with ⟨N, hN⟩
  exact ⟨N, fun n hn => qClose_neg (hN n hn)⟩

/-- Research addition on the Cauchy quotient. -/
def rCAdd : RCBOMA → RCBOMA → RCBOMA :=
  Quotient.lift₂
    (fun u v => rCmk (cAddSeq u v))
    (fun _ _ _ _ hu hv => Quotient.sound (cAddSeq_respects hu hv))

/-- Research negation on the Cauchy quotient. -/
def rCNeg : RCBOMA → RCBOMA :=
  Quotient.lift
    (fun u => rCmk (cNegSeq u))
    (fun _ _ h => Quotient.sound (cNegSeq_respects h))

/-- Research additive zero is the constant rational zero sequence. -/
def rCZero : RCBOMA := rCOfQ qZero

@[simp] theorem rCAdd_mk (u v : CauchySeq) :
    rCAdd (rCmk u) (rCmk v) = rCmk (cAddSeq u v) := rfl

@[simp] theorem rCNeg_mk (u : CauchySeq) :
    rCNeg (rCmk u) = rCmk (cNegSeq u) := rfl

/-- Pointwise equality supplies asymptotic equality without a selector. -/
theorem cauchyEquiv_of_pointwise_eq {u v : CauchySeq}
    (h : ∀ n : BOMANat, u.seq n = v.seq n) : CauchyEquiv u v := by
  intro eps heps
  refine ⟨BOMANat.z, ?_⟩
  intro n hn
  rw [h n]
  exact qClose_refl_of_pos eps (v.seq n) heps

/-- Quotient addition is commutative. -/
theorem rCAdd_comm (x y : RCBOMA) : rCAdd x y = rCAdd y x := by
  refine Quotient.inductionOn x ?_
  intro u
  refine Quotient.inductionOn y ?_
  intro v
  exact Quotient.sound (cauchyEquiv_of_pointwise_eq (fun n => qAdd_comm _ _))

/-- Quotient addition is associative. -/
theorem rCAdd_assoc (x y z : RCBOMA) :
    rCAdd (rCAdd x y) z = rCAdd x (rCAdd y z) := by
  refine Quotient.inductionOn x ?_
  intro u
  refine Quotient.inductionOn y ?_
  intro v
  refine Quotient.inductionOn z ?_
  intro w
  exact Quotient.sound (cauchyEquiv_of_pointwise_eq (fun n => qAdd_assoc _ _ _))

/-- The constant zero sequence is a left identity. -/
theorem rCAdd_zero_left (x : RCBOMA) : rCAdd rCZero x = x := by
  refine Quotient.inductionOn x ?_
  intro u
  exact Quotient.sound
    (cauchyEquiv_of_pointwise_eq (fun n => qAdd_zero_left (u.seq n)))

/-- Pointwise negation gives a right additive inverse. -/
theorem rCAdd_neg_right (x : RCBOMA) : rCAdd x (rCNeg x) = rCZero := by
  refine Quotient.inductionOn x ?_
  intro u
  exact Quotient.sound
    (cauchyEquiv_of_pointwise_eq (fun n => qAdd_neg_right (u.seq n)))

/-- The constant-sequence rational embedding preserves addition. -/
theorem rCOfQ_add (q r : QBOMA) :
    rCAdd (rCOfQ q) (rCOfQ r) = rCOfQ (qAdd q r) := by
  exact Quotient.sound (cauchyEquiv_of_pointwise_eq (fun n => rfl))

/-- The constant-sequence rational embedding preserves negation. -/
theorem rCOfQ_neg (q : QBOMA) : rCNeg (rCOfQ q) = rCOfQ (qNeg q) := by
  exact Quotient.sound (cauchyEquiv_of_pointwise_eq (fun n => rfl))

/-- Independently assembled additive-group-strength research certificate. -/
structure CauchyAdditiveCertificate where
  addComm : ∀ x y : RCBOMA, rCAdd x y = rCAdd y x
  addAssoc : ∀ x y z : RCBOMA, rCAdd (rCAdd x y) z = rCAdd x (rCAdd y z)
  addZeroLeft : ∀ x : RCBOMA, rCAdd rCZero x = x
  addInverseRight : ∀ x : RCBOMA, rCAdd x (rCNeg x) = rCZero
  qEmbeddingAdd : ∀ q r : QBOMA,
    rCAdd (rCOfQ q) (rCOfQ r) = rCOfQ (qAdd q r)
  qEmbeddingNeg : ∀ q : QBOMA, rCNeg (rCOfQ q) = rCOfQ (qNeg q)

theorem cauchyAdditiveCertificate : CauchyAdditiveCertificate where
  addComm := rCAdd_comm
  addAssoc := rCAdd_assoc
  addZeroLeft := rCAdd_zero_left
  addInverseRight := rCAdd_neg_right
  qEmbeddingAdd := rCOfQ_add
  qEmbeddingNeg := rCOfQ_neg

end BOMA.R.StageTwo.CauchyAdditive003
