import Init

/-
PDCA-001 atomicity probe.
These declarations test whether the current B-001 target can be
meaningfully represented as smaller backend commitments.
They are probes, not accepted BOMA Bricks.
-/

namespace B001AtomicityProbe

/-- Candidate A: a minimal object domain with only a distinguished initial object. -/
inductive PointedObject where
  | initial : PointedObject

/-- Candidate B: successor as an extension over an already established domain. -/
def successor (x : PointedObject) : PointedObject := x

end B001AtomicityProbe
