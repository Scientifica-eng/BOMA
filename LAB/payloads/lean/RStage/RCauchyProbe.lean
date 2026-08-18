/- Representation-only Cauchy route probe over accepted BOMA N and Q. -/
namespace BOMA.R.CauchyProbe001

open BOMA.NCore.RB001
open BOMA.NArithmetic.Order001
open BOMA.Q.Quotient001
open BOMA.R.Gateway001

/-- A rational sequence indexed by the accepted BOMA natural carrier. -/
def QSeq := BOMANat → QBOMA

/-- Cauchy condition using only positive rational epsilon and the accepted N order.
No primitive metric or absolute-value carrier is assumed. -/
def IsCauchy (u : QSeq) : Prop :=
  ∀ eps : QBOMA, qPos eps →
    ∃ N : BOMANat,
      ∀ m n : BOMANat, LE N m → LE N n → qClose eps (u m) (u n)

/-- Candidate Cauchy representation syntax. -/
structure CauchySeq where
  seq : QSeq
  cauchy : IsCauchy seq

/-- Null-difference / asymptotic closeness relation used as the candidate
representation identity. It is only a probe relation here; equivalence laws are
not promoted until proved. -/
def CauchyEquiv (u v : CauchySeq) : Prop :=
  ∀ eps : QBOMA, qPos eps →
    ∃ N : BOMANat,
      ∀ n : BOMANat, LE N n → qClose eps (u.seq n) (v.seq n)

end BOMA.R.CauchyProbe001
