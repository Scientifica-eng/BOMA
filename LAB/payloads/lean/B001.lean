import Init

/--
BOMA LAB PDCA-001 / Brick B-001.

This declaration is a backend representation of the BOMA Brick, not the
BOMA definition of the Brick itself.

The domain contains a distinguished initial object and a successor
constructor. No arithmetic operations or laws are introduced here.
-/
inductive BOMAObject where
  | initial : BOMAObject
  | successor : BOMAObject → BOMAObject
