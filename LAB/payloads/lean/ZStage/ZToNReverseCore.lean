/- Post-Z reverse engineering: reverse candidates are defined from accepted Z structure
   before the known N carrier is allowed back in as comparison evidence. -/
namespace BOMA.Z.ReverseN001
open BOMA.Z.Rep001
open BOMA.Z.Rep001.ZSigned
open BOMA.Z.Arithmetic001
open BOMA.Z.Order001

/-- Extensional reverse candidate: the nonnegative cone of accepted Z.
Its definition does not mention BOMANat or embedN. -/
structure NFromZCone where
  val : ZSigned
  nonneg : zLE zzero val

/-- Z-zero is nonnegative. -/
def coneZero : NFromZCone := ⟨zzero, zle_refl zzero⟩

/-- Accepted integer one is nonnegative, proved internally in Z. -/
theorem zone_nonneg : zLE zzero zone := by
  change True
  trivial

/-- The cone is closed under successor x ↦ x+1. -/
def coneSucc (x : NFromZCone) : NFromZCone := by
  refine ⟨zadd x.val zone, ?_⟩
  have hstep : zLE zone (zadd x.val zone) := by
    simpa using zadd_mono_right x.nonneg zone
  exact zle_trans zone_nonneg hstep

/-- The cone is closed under accepted integer addition. -/
def coneAdd (x y : NFromZCone) : NFromZCone := by
  refine ⟨zadd x.val y.val, ?_⟩
  have hy_to_sum : zLE y.val (zadd x.val y.val) := by
    simpa [zadd_comm x.val y.val] using zadd_mono_right x.nonneg y.val
  exact zle_trans y.nonneg hy_to_sum

/-- The cone is closed under accepted integer multiplication. -/
def coneMul (x y : NFromZCone) : NFromZCone := by
  refine ⟨zmul x.val y.val, ?_⟩
  have h := zmul_mono_right_nonneg x.nonneg y.nonneg
  simpa using h

/-- Inherited order on the reverse cone. -/
def coneLE (x y : NFromZCone) : Prop := zLE x.val y.val

theorem coneLE_refl (x : NFromZCone) : coneLE x x := zle_refl x.val

theorem coneLE_trans {x y w : NFromZCone}
    (hxy : coneLE x y) (hyw : coneLE y w) : coneLE x w :=
  zle_trans hxy hyw

theorem coneLE_antisymm_values {x y : NFromZCone}
    (hxy : coneLE x y) (hyx : coneLE y x) : x.val = y.val :=
  zle_antisymm hxy hyx

theorem coneLE_total (x y : NFromZCone) : coneLE x y ∨ coneLE y x :=
  zle_total x.val y.val

/-- Intensional reverse notion generated only from accepted Z zero and +1.
This is deliberately Prop-valued: it supplies generatedness/induction for
propositions, but not a Type-valued recursor by itself. -/
inductive ReachZ : ZSigned → Prop where
  | zero : ReachZ zzero
  | succ {x : ZSigned} : ReachZ x → ReachZ (zadd x zone)

/-- Every Z-generated reachable value lies in the nonnegative cone. -/
theorem reach_nonneg {x : ZSigned} (h : ReachZ x) : zLE zzero x := by
  induction h with
  | zero => exact zle_refl zzero
  | @succ x hx ih =>
      have hstep : zLE zone (zadd x zone) := by
        simpa using zadd_mono_right ih zone
      exact zle_trans zone_nonneg hstep

/-- Reachability therefore embeds into the cone without any reference to N_BOMA. -/
def reachToCone {x : ZSigned} (h : ReachZ x) : NFromZCone :=
  ⟨x, reach_nonneg h⟩

/-- Propositional induction is intrinsic to the generated route. -/
theorem reach_induction
    (P : ZSigned → Prop)
    (hz : P zzero)
    (hs : ∀x, ReachZ x → P x → P (zadd x zone))
    {x : ZSigned} (h : ReachZ x) : P x := by
  induction h with
  | zero => exact hz
  | @succ x hx ih => exact hs x hx ih

end BOMA.Z.ReverseN001
