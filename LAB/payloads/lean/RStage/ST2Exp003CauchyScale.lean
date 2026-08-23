/- ST2-EXP-003 completeness prerequisite: an explicit positive rational scale
   indexed by accepted BOMANat and tending to zero. The scale chooses one
   accepted-Q inverse witness for each positive successor natural. This exposes
   the countable data-selection boundary before any diagonal completion proof. -/
namespace BOMA.R.StageTwo.CauchyScale003

open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001
open BOMA.NArithmetic.Order001
open BOMA.Z.Rep001
open BOMA.Z.Arithmetic001
open BOMA.Z.Order001
open BOMA.Q.Quotient001
open BOMA.Q.Inverse001
open BOMA.Q.Embedding001
open BOMA.Q.Order001
open BOMA.Q.OrderedField001
open BOMA.R.Gateway001
open BOMA.R.QArchimedeanUpperBound001
open BOMA.R.QArchimedeanScaling001
open BOMA.R.CauchyProbe001
open BOMA.R.StageTwo.CauchyCloseness003
open BOMA.R.StageTwo.CauchyInverse003

/-- Accepted natural order is preserved by the canonical Q embedding. -/
theorem qOfN_mono {m n : BOMANat} (h : LE m n) :
    qLE (qOfN m) (qOfN n) := by
  unfold qOfN
  exact (qOfZ_order (embedN m) (embedN n)).2
    ((embedN_order m n).2 h)

/-- Every natural is below its successor. -/
theorem le_self_succ (n : BOMANat) : LE n (s n) := by
  change LEAdd n (s n)
  refine ⟨s z, ?_⟩
  simpa using (add_s_right n z)

/-- The embedded successor natural is strictly positive in accepted Q. -/
theorem qOfN_succ_pos (n : BOMANat) : qPos (qOfN (s n)) := by
  have hle : qLE qZero (qOfN (s n)) := by
    change qLE (qOfZ (embedN z)) (qOfZ (embedN (s n)))
    exact (qOfZ_order (embedN z) (embedN (s n))).2
      ((embedN_order z (s n)).2 (z_le (s n)))
  have hne : qZero ≠ qOfN (s n) := by
    intro heq
    have hback : qLE (qOfN (s n)) qZero := by
      rw [← heq]
      exact qle_refl qZero
    have hzord : zLE (embedN (s n)) (embedN z) := by
      change qLE (qOfZ (embedN (s n))) (qOfZ (embedN z)) at hback
      exact (qOfZ_order (embedN (s n)) (embedN z)).1 hback
    have hnz : LE (s n) z := (embedN_order (s n) z).1 hzord
    exact not_s_le_z n hnz
  exact ⟨hle, hne⟩

/-- Nonzero form used by the accepted witness-only inverse theorem. -/
theorem qOfN_succ_ne_zero (n : BOMANat) : qOfN (s n) ≠ qZero := by
  intro h
  exact (qOfN_succ_pos n).2 h.symm

/-- One explicit selected reciprocal of the embedded positive natural n+1.
    This is deliberately noncomputable and source-attributed to Choice. -/
noncomputable def qCauchyScale (n : BOMANat) : QBOMA := by
  classical
  exact Classical.choose (q_inverse_exists (qOfN (s n)) (qOfN_succ_ne_zero n))

/-- The selected scale value is the accepted-Q inverse witness of n+1. -/
theorem qCauchyScale_inv (n : BOMANat) :
    QInvRel (qOfN (s n)) (qCauchyScale n) := by
  classical
  unfold qCauchyScale
  exact Classical.choose_spec
    (q_inverse_exists (qOfN (s n)) (qOfN_succ_ne_zero n))

/-- Every scale value is positive. -/
theorem qCauchyScale_pos (n : BOMANat) : qPos (qCauchyScale n) := by
  have hbase : QPositive (qOfN (s n)) :=
    ⟨(qOfN_succ_pos n).1, qOfN_succ_ne_zero n⟩
  have hinv : QPositive (qCauchyScale n) :=
    inverse_of_positive_is_positive hbase (qCauchyScale_inv n)
  exact ⟨hinv.1, fun h => hinv.2 h.symm⟩

/-- The successor embedding is monotone along accepted natural order. -/
theorem qOfN_succ_mono {m n : BOMANat} (h : LE m n) :
    qLE (qOfN (s m)) (qOfN (s n)) :=
  qOfN_mono ((le_s_iff).2 h)

/-- The reciprocal scale is order reversing. -/
theorem qCauchyScale_antitone {m n : BOMANat} (h : LE m n) :
    qLE (qCauchyScale n) (qCauchyScale m) := by
  exact q_inverse_le_of_positive_lower
    (qOfN_succ_pos m)
    (qOfN_succ_mono h)
    (qCauchyScale_inv m)
    (qCauchyScale_inv n)

/-- Multiplying the Archimedean inequality by the selected reciprocal of n+1
    isolates that reciprocal below the positive step. -/
theorem scale_le_of_one_le_mul {n : BOMANat} {eps : QBOMA}
    (heps : qPos eps)
    (h : qLE qOne (qMul (qOfN (s n)) eps)) :
    qLE (qCauchyScale n) eps := by
  have hsnonneg : qLE qZero (qCauchyScale n) := (qCauchyScale_pos n).1
  have hm := qmul_mono_right_nonneg h hsnonneg
  have hleft : qMul qOne (qCauchyScale n) = qCauchyScale n :=
    qMul_one_left (qCauchyScale n)
  have hright :
      qMul (qMul (qOfN (s n)) eps) (qCauchyScale n) = eps := by
    calc
      qMul (qMul (qOfN (s n)) eps) (qCauchyScale n) =
          qMul eps (qMul (qOfN (s n)) (qCauchyScale n)) := by
        calc
          qMul (qMul (qOfN (s n)) eps) (qCauchyScale n) =
              qMul (qMul eps (qOfN (s n))) (qCauchyScale n) := by
            rw [qMul_comm (qOfN (s n)) eps]
          _ = qMul eps (qMul (qOfN (s n)) (qCauchyScale n)) :=
            qMul_assoc eps (qOfN (s n)) (qCauchyScale n)
      _ = qMul eps qOne :=
        congrArg (fun t => qMul eps t) (qCauchyScale_inv n)
      _ = eps := qMul_one_right eps
  rw [hleft, hright] at hm
  exact hm

/-- The selected positive rational scale tends to zero: every positive rational
    epsilon eventually dominates all later scale values. -/
theorem qCauchyScale_tends_zero (eps : QBOMA) (heps : qPos eps) :
    ∃ N : BOMANat, ∀ n : BOMANat, LE N n → qLE (qCauchyScale n) eps := by
  rcases q_archimedean_scale qOne eps heps with ⟨k, hk⟩
  let N := s k
  have hkN : LE k N := by
    unfold N
    exact le_self_succ k
  have hqkN : qLE (qOfN k) (qOfN N) := qOfN_mono hkN
  have hprod : qLE (qMul (qOfN k) eps) (qMul (qOfN N) eps) :=
    qmul_mono_right_nonneg hqkN heps.1
  have hOneN : qLE qOne (qMul (qOfN N) eps) := qle_trans hk hprod
  have hNscale : qLE (qCauchyScale k) eps := by
    unfold N at hOneN
    exact scale_le_of_one_le_mul heps hOneN
  refine ⟨k, ?_⟩
  intro n hn
  exact qle_trans (qCauchyScale_antitone hn) hNscale

/-- Machine-checkable certificate for the decreasing rational scale. -/
structure CauchyScaleCertificate where
  positive : ∀ n : BOMANat, qPos (qCauchyScale n)
  antitone : ∀ {m n : BOMANat}, LE m n →
    qLE (qCauchyScale n) (qCauchyScale m)
  tendsZero : ∀ eps : QBOMA, qPos eps →
    ∃ N : BOMANat, ∀ n : BOMANat, LE N n → qLE (qCauchyScale n) eps
  selectedInverse : ∀ n : BOMANat,
    QInvRel (qOfN (s n)) (qCauchyScale n)

theorem cauchyScaleCertificate : CauchyScaleCertificate where
  positive := qCauchyScale_pos
  antitone := qCauchyScale_antitone
  tendsZero := qCauchyScale_tends_zero
  selectedInverse := qCauchyScale_inv

end BOMA.R.StageTwo.CauchyScale003
