/- Representative-independent positive inverse relation revision 003.
Consumes positive representative extraction 002 and the V5-passing inverse-product 004. -/
namespace BOMA.R.DedekindPositiveInverseRelation003

open BOMA.Q.Quotient001
open BOMA.Q.Inverse001
open BOMA.R.Gateway001
open BOMA.R.DedekindProbe001
open BOMA.R.DedekindQuotient001
open BOMA.R.DedekindAddition001
open BOMA.R.DedekindPositivePart001
open BOMA.R.DedekindNonnegativeMul001
open BOMA.R.DedekindSignedMulCandidate001
open BOMA.R.DedekindSignedMulSignLaws001
open BOMA.R.DedekindPositiveReciprocal001
open BOMA.R.DedekindPositiveReciprocalEmbedding001
open BOMA.R.DedekindPositiveRepresentative002
open BOMA.R.DedekindPositiveInverseProduct004

/-- Positive inverse relation with no global representative selector. -/
def RPositiveInvRel (x y : RBOMA) : Prop :=
  ∃ A : LowerCut, ∃ hApos : CutHasPositive A,
    x = rmk A ∧ y = rmk (cutRecipPos A hApos)

 theorem cut_zero_le_recipPos
    (A : LowerCut) (hApos : CutHasPositive A) :
    CutLE (principalCut qZero) (cutRecipPos A hApos) := by
  intro q hq0
  exact Or.inl hq0

 theorem rPositiveInvRel_exists
    {x : RBOMA}
    (h0x : rLE rZero x)
    (hx0 : x ≠ rZero) :
    ∃ y : RBOMA, RPositiveInvRel x y := by
  rcases r_nonneg_nonzero_positive_rep h0x hx0 with ⟨A, hApos, hxA⟩
  exact ⟨rmk (cutRecipPos A hApos), A, hApos, hxA, rfl⟩

 theorem rPositiveInvRel_unique
    {x y z : RBOMA}
    (hy : RPositiveInvRel x y)
    (hz : RPositiveInvRel x z) :
    y = z := by
  rcases hy with ⟨A, hApos, hxA, hyA⟩
  rcases hz with ⟨B, hBpos, hxB, hzB⟩
  have hmk : rmk A = rmk B := hxA.symm.trans hxB
  have hAB : CutEquiv A B := (rmk_eq_iff).1 hmk
  have hRec : CutEquiv (cutRecipPos A hApos) (cutRecipPos B hBpos) :=
    cutRecipPos_respects hAB hApos hBpos
  calc
    y = rmk (cutRecipPos A hApos) := hyA
    _ = rmk (cutRecipPos B hBpos) := rmk_sound hRec
    _ = z := hzB.symm

 theorem rPositiveInvRel_product_one
    {x y : RBOMA}
    (hxy : RPositiveInvRel x y) :
    rMulCandidate x y = rOne := by
  rcases hxy with ⟨A, hApos, hxA, hyA⟩
  rw [hxA, hyA]
  have h0A : rLE rZero (rmk A) := by
    change rLE (rmk (principalCut qZero)) (rmk A)
    exact (rLE_mk_iff (principalCut qZero) A).2
      (cut_zero_le_of_has_positive hApos)
  have h0Rec : rLE rZero (rmk (cutRecipPos A hApos)) := by
    change rLE (rmk (principalCut qZero)) (rmk (cutRecipPos A hApos))
    exact (rLE_mk_iff (principalCut qZero) (cutRecipPos A hApos)).2
      (cut_zero_le_recipPos A hApos)
  rw [rMulCandidate_of_nonneg_nonneg h0A h0Rec]
  change rmk (cutMulNonnegEnvelope A (cutRecipPos A hApos)) = rmk (principalCut qOne)
  exact rmk_sound (cutMul_recipPos_equiv_one A hApos)

 theorem rPositiveInvRel_rOfQ
    {q qinv : QBOMA}
    (h0q : qLT qZero q)
    (hqinv : QInvRel q qinv) :
    RPositiveInvRel (rOfQ q) (rOfQ qinv) := by
  let hpos : CutHasPositive (principalCut q) := principalCut_has_positive h0q
  refine ⟨principalCut q, hpos, rfl, ?_⟩
  change rmk (principalCut qinv) = rmk (cutRecipPos (principalCut q) hpos)
  exact (rmk_sound (cutRecipPos_principal h0q hqinv)).symm

end BOMA.R.DedekindPositiveInverseRelation003
