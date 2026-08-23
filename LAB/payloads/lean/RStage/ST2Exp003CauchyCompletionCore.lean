/- ST2-EXP-003 completeness core: define the exact sequence-level Cauchy and
   convergence contract on the independently constructed quotient field. This
   file proves only the closeness calculus needed by a later diagonal limit; it
   does not claim completeness. -/
namespace BOMA.R.StageTwo.CauchyCompletionCore003

open BOMA.NCore.RB001
open BOMA.NArithmetic.Order001
open BOMA.Q.Quotient001
open BOMA.Q.Order001
open BOMA.R.CauchyProbe001
open BOMA.R.StageTwo.CauchyCloseness003
open BOMA.R.StageTwo.CauchyQuotient003
open BOMA.R.StageTwo.CauchyAdditive003
open BOMA.R.StageTwo.CauchyOrderCore003
open BOMA.R.StageTwo.CauchyOrderedRing003
open BOMA.R.StageTwo.CauchyInverse003
open BOMA.R.StageTwo.CauchyScale003

/-- Symmetric rational-radius closeness on the research Cauchy quotient. -/
def rCClose (eps : QBOMA) (x y : RCBOMA) : Prop :=
  rCLE x (rCAdd y (rCOfQ eps)) ∧
  rCLE y (rCAdd x (rCOfQ eps))

/-- A sequence of research Cauchy quotient classes. -/
abbrev RCSeq := BOMANat → RCBOMA

/-- Exact sequential Cauchy contract on the experimental carrier. -/
def IsRCCauchy (u : RCSeq) : Prop :=
  ∀ eps : QBOMA, qPos eps →
    ∃ N : BOMANat, ∀ m n : BOMANat,
      LE N m → LE N n → rCClose eps (u m) (u n)

/-- Exact sequential convergence contract on the experimental carrier. -/
def RCConverges (u : RCSeq) (x : RCBOMA) : Prop :=
  ∀ eps : QBOMA, qPos eps →
    ∃ N : BOMANat, ∀ n : BOMANat, LE N n → rCClose eps (u n) x

/-- The eventual-limit statement required for branch Cauchy completeness. -/
def RCCauchyComplete : Prop :=
  ∀ u : RCSeq, IsRCCauchy u → ∃ x : RCBOMA, RCConverges u x

/-- Positive embedded rational errors are nonnegative in the quotient order. -/
theorem rCOfQ_nonneg {eps : QBOMA} (heps : qPos eps) :
    rCLE rCZero (rCOfQ eps) := by
  have hq : qLE qZero eps := heps.1
  exact (rCOfQ_order qZero eps).2 hq

/-- Any point is below itself plus a positive rational error. -/
theorem rcle_self_add_error (x : RCBOMA) {eps : QBOMA} (heps : qPos eps) :
    rCLE x (rCAdd x (rCOfQ eps)) := by
  have h := rcle_add_right (rCOfQ_nonneg heps) x
  have hleft : rCAdd rCZero x = x := rCAdd_zero_left x
  have hright : rCAdd (rCOfQ eps) x = rCAdd x (rCOfQ eps) :=
    rCAdd_comm (rCOfQ eps) x
  rw [hleft, hright] at h
  exact h

/-- Closeness is reflexive at every positive radius. -/
theorem rCClose_refl {eps : QBOMA} (heps : qPos eps) (x : RCBOMA) :
    rCClose eps x x := by
  exact ⟨rcle_self_add_error x heps, rcle_self_add_error x heps⟩

/-- Closeness is symmetric by definition. -/
theorem rCClose_symm {eps : QBOMA} {x y : RCBOMA}
    (h : rCClose eps x y) : rCClose eps y x := ⟨h.2, h.1⟩

/-- Reassociate two rational error embeddings after quotient addition. -/
theorem rC_add_two_errors (x : RCBOMA) (eps delta : QBOMA) :
    rCAdd (rCAdd x (rCOfQ delta)) (rCOfQ eps) =
      rCAdd x (rCOfQ (qAdd delta eps)) := by
  calc
    rCAdd (rCAdd x (rCOfQ delta)) (rCOfQ eps) =
        rCAdd x (rCAdd (rCOfQ delta) (rCOfQ eps)) :=
      rCAdd_assoc x (rCOfQ delta) (rCOfQ eps)
    _ = rCAdd x (rCOfQ (qAdd delta eps)) := by
      rw [← rCOfQ_add]

/-- Triangle composition for quotient closeness with additive radii. -/
theorem rCClose_trans_add {eps delta : QBOMA} {x y z : RCBOMA}
    (hxy : rCClose eps x y) (hyz : rCClose delta y z) :
    rCClose (qAdd delta eps) x z := by
  constructor
  · have h1 := hxy.1
    have h2 := rcle_add_right hyz.1 (rCOfQ eps)
    have hchain :
        rCLE x (rCAdd (rCAdd z (rCOfQ delta)) (rCOfQ eps)) :=
      rcle_trans h1 h2
    rw [rC_add_two_errors] at hchain
    exact hchain
  · have h1 := hyz.2
    have h2 := rcle_add_right hxy.2 (rCOfQ delta)
    have hchain :
        rCLE z (rCAdd (rCAdd x (rCOfQ eps)) (rCOfQ delta)) :=
      rcle_trans h1 h2
    have hnorm :
        rCAdd (rCAdd x (rCOfQ eps)) (rCOfQ delta) =
          rCAdd x (rCOfQ (qAdd delta eps)) := by
      calc
        rCAdd (rCAdd x (rCOfQ eps)) (rCOfQ delta) =
            rCAdd x (rCAdd (rCOfQ eps) (rCOfQ delta)) :=
          rCAdd_assoc x (rCOfQ eps) (rCOfQ delta)
        _ = rCAdd x (rCOfQ (qAdd eps delta)) := by rw [← rCOfQ_add]
        _ = rCAdd x (rCOfQ (qAdd delta eps)) := by
          rw [qAdd_comm eps delta]
    rw [hnorm] at hchain
    exact hchain

/-- Enlarging a positive error radius preserves quotient closeness. -/
theorem rCClose_mono {eps delta : QBOMA} {x y : RCBOMA}
    (h : rCClose eps x y) (hed : qLE eps delta) :
    rCClose delta x y := by
  have herr : rCLE (rCOfQ eps) (rCOfQ delta) :=
    (rCOfQ_order eps delta).2 hed
  constructor
  · exact rcle_trans h.1 (rcle_add_right herr y)
  · exact rcle_trans h.2 (rcle_add_right herr x)

/-- A constant quotient sequence converges to its constant value. -/
theorem constant_converges (x : RCBOMA) :
    RCConverges (fun _ => x) x := by
  intro eps heps
  refine ⟨BOMA.NCore.RB001.BOMANat.z, ?_⟩
  intro n hn
  exact rCClose_refl heps x

/-- Machine-checkable statement boundary for the later diagonal proof. -/
structure CauchyCompletionCoreCertificate where
  closeRefl : ∀ {eps : QBOMA}, qPos eps → ∀ x : RCBOMA, rCClose eps x x
  closeSymm : ∀ {eps : QBOMA} {x y : RCBOMA},
    rCClose eps x y → rCClose eps y x
  closeTriangle : ∀ {eps delta : QBOMA} {x y z : RCBOMA},
    rCClose eps x y → rCClose delta y z →
      rCClose (qAdd delta eps) x z
  closeMonotone : ∀ {eps delta : QBOMA} {x y : RCBOMA},
    rCClose eps x y → qLE eps delta → rCClose delta x y
  scale : CauchyScaleCertificate
  orderedField : CauchyOrderedFieldCertificate

theorem cauchyCompletionCoreCertificate : CauchyCompletionCoreCertificate where
  closeRefl := @rCClose_refl
  closeSymm := @rCClose_symm
  closeTriangle := @rCClose_trans_add
  closeMonotone := @rCClose_mono
  scale := cauchyScaleCertificate
  orderedField := cauchyOrderedFieldCertificate

end BOMA.R.StageTwo.CauchyCompletionCore003
