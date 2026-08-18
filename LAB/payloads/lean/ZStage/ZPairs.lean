/- Difference-pair route. Requires accepted natural addition. -/
namespace BOMA.Z.Rep001
open BOMA.NCore.RB001
open BOMA.NCore.RB001.BOMANat
open BOMA.NArithmetic.Addition001

structure ZPair where
  p : BOMANat
  n : BOMANat

/-- (a,b) ~ (c,d) iff a+d=c+b. -/
def ZEquiv (x y : ZPair) : Prop := add x.p y.n = add y.p x.n

theorem zeq_refl (x : ZPair) : ZEquiv x x := rfl

theorem zeq_symm {x y : ZPair} (h : ZEquiv x y) : ZEquiv y x := h.symm

theorem zeq_trans {x y w : ZPair} (hxy : ZEquiv x y) (hyw : ZEquiv y w) : ZEquiv x w := by
  cases x with
  | mk a b =>
    cases y with
    | mk c d =>
      cases w with
      | mk e f =>
        apply add_right_cancel (add a f) (add e b) d
        calc
          add (add a f) d = add a (add f d) := add_assoc a f d
          _ = add a (add d f) := congrArg (fun q => add a q) (add_comm f d)
          _ = add (add a d) f := (add_assoc a d f).symm
          _ = add (add c b) f := congrArg (fun q => add q f) hxy
          _ = add c (add b f) := add_assoc c b f
          _ = add c (add f b) := congrArg (fun q => add c q) (add_comm b f)
          _ = add (add c f) b := (add_assoc c f b).symm
          _ = add (add e d) b := congrArg (fun q => add q b) hyw
          _ = add e (add d b) := add_assoc e d b
          _ = add e (add b d) := congrArg (fun q => add e q) (add_comm d b)
          _ = add (add e b) d := (add_assoc e b d).symm

end BOMA.Z.Rep001
