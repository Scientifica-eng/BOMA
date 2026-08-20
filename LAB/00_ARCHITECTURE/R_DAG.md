# R DAG — Accepted Stage-One Real Construction

**Status:** **STAGE-ONE R ACCEPTED — RA-22 ACCEPT**  
**Input:** `Q-BLOCK-002 — Accepted Stage-One Rational Interface`  
**Governing specification:** `BOMA-R-ACCEPT-001`  
**Accepted export:** `R-BLOCK-001`  
**Current frontier:** `RE-R-001` mandatory reverse engineering

## Canonical forward spine

```text
Q-BLOCK-002 — accepted Q
   ↓
shared Q order / density / approximation gateways
   ↓
R-DP-001
   ├── Dedekind lower cuts SELECTED for Stage I
   └── Cauchy completion RETAINED for later branch study
   ↓
LowerCut / CutEquiv
   ↓
R-DP-002 — quotient identity selected
   ↓
RBOMA := Quotient cutSetoid
   ↓
rOfQ + rLE
   ├── constructive partial-order core
   └── R-LOGIC-BR-001 localized classical total-comparability witness
   ↓
R-COMP-BLOCK-001 — Dedekind LUB completeness
   ↓
R-ADD-GROUP-BLOCK-001 — additive group
   ↓
R-DP-004 — reusable Q Archimedean approximation route
   ↓
R-DP-005 — sign-free positive/negative decomposition multiplication
   ↓
R-MUL-BLOCK-001 — ordered commutative ring
   ↓
R-DP-006 — direct Dedekind reciprocal route selected
   ↓
R-FIELD-BLOCK-001 — unique nonzero inverse witnesses
   ↓
R-DENSITY-BLOCK-001 + R-ARCH-BLOCK-001
   ↓
explicit ordered-field closure
   ↓
R-J-002 — acceptance-strength integration PASS
   ↓
PDSA-R-014
   ↓
RA-22 ACCEPT
   ↓
R-BLOCK-001 — accepted Stage-One R
```

## Representation / identity

Selected raw representation:

```text
LowerCut.lower : QBOMA → Prop
nonempty
proper
downward
rounded
```

Identity:

```text
CutEquiv A B := ∀q, A.lower q ↔ B.lower q
RBOMA := Quotient cutSetoid
```

The quotient realization is a declared Stage-One formalization choice. Raw Lean structure equality is not used as real identity.

## Rational embedding

```text
rOfQ : QBOMA → RBOMA
```

is injective and exactly order-preserving/reflecting. Separate certified paths preserve Q zero, one, negation, addition, multiplication, and the positive inverse relation.

## Order and logical boundary

The selected non-strict order has a constructive:

```text
reflexive
transitive
antisymmetric
```

core. Total cut comparability is supplied by an explicit localized `Classical.em` witness.

Final ordered-field interface additionally verifies:

```text
0_R != 1_R
addition translation invariance as an iff
negation order reversal
nonnegative-factor multiplication monotonicity
positive inverse behavior
```

The final three specifically named closure laws were added during `PDSA-R-014` rather than inferred merely from the phrase “ordered field.”

## Dedekind completeness

`R-COMP-BLOCK-001` proves:

```text
nonempty bounded F : RBOMA → Prop
  →
F has a least upper bound in RBOMA.
```

Canonical evidence:

```text
32182056311 PASS
```

Scope is **Dedekind least-upper-bound completeness only**. No Cauchy/metric/sequential completeness equivalence is silently promoted.

## Additive group

Canonical operations:

```text
rZero
rAdd
rNeg
```

Key V5:

```text
32183597094 addition construction/lift
32183864915 Q addition preservation
32184188077 additive laws
32184767097 negation / Q preservation
32186543211 additive inverse / cancellation
```

All PASS.

## Multiplication architecture

`R-DP-005` selected the sign-free decomposition route:

```text
x⁺ := max(x,0)
x⁻ := max(-x,0)
xy := x⁺y⁺ + x⁻y⁻ - x⁺y⁻ - x⁻y⁺
```

The operation definition itself does not branch on proposition-valued sign cases. Sign classification is isolated to proof layers.

Key V5:

```text
32189753112 signed candidate + Q multiplication preservation
32191203164 commutativity / zero / one
32191975377 associativity
32192506728 distributivity
32192653931 ordered-ring compatibility
```

All PASS.

## Multiplicative inverse

`R-DP-006` selected a direct Dedekind reciprocal construction for positive cuts, extended through signed field closure.

Final interface:

```text
x != 0
  →
∃ y, x*y = 1
```

with witness uniqueness and left/right inverse behavior.

Key V5:

```text
32355681924 positive inverse product
32356254961 representative-independent positive inverse relation
32356513408 every nonzero real has unique inverse witness
```

All PASS.

No global Choice-backed inverse selector is required by the accepted interface.

## Density and Archimedean characterization

```text
x < y → ∃q : QBOMA, x < rOfQ q < y
```

V5 `32359834460` PASS.

```text
∀x : RBOMA, ∃n : N_BOMA, x < rOfQ (qOfN n)
```

V5 `32359869558` PASS.

## Formal commitment boundary

Explicit commitments include:

```text
predicate-valued cuts
quotient formation
localized Classical.em for total comparability
localized classical finite membership search for fine bracketing
localized Classical.byContradiction for positive representative extraction
localized classical witness extraction for strict R density
Lean 4.32.1 / GitHub V5 as verification infrastructure
```

Not required by accepted interface:

```text
global representative selector for completeness
global inverse selector
external standard Real carrier
Mathlib real completeness
function/proposition extensionality as the real-identity bridge
```

Lake manifest contains zero external packages for the verified assemblies.

## Final integration / acceptance

Acceptance-strength `R-J-002` certificate checks on the same `RBOMA`:

```text
identity / Q embedding / total order
nontriviality
additive group
translation invariance / negation reversal
commutative field algebra at the unique-witness inverse interface
nonnegative-factor monotonicity
positive inverse behavior
Dedekind LUB completeness
Q density
Archimedean characterization
```

Final V5:

```text
run                 32374868448
verified commit     f07363c22b049a3fae028a927df74d4fb28a0680
Lean                4.32.1
result              PASS
```

Acceptance matrix:

```text
RA-01..15   PASS, with RA-15 RESOLVED
RA-16       NOT TRIGGERED — correctly discharged
RA-17..20   PASS
RA-21       PASS / R-J-002 RESOLVED
RA-22       ACCEPT
```

Closure:

`LAB/PDSA/PDSA-R-014_STAGE_ONE_REAL_CLOSURE.md`

Accepted export:

`LAB/10_CONSTRUCTION/blocks/R-BLOCK-001/UNIT.md`

## Current frontier — mandatory RE-R-001

Governance now requires:

```text
R-BLOCK-001 accepted
   ↓
RE-R-001
   ↓
classify dependencies as:
  STRUCTURALLY NECESSARY
  ROUTE-SPECIFIC — DEDEKIND
  LOGICAL COMMITMENT
  FORMALIZATION / PROOF-ENGINEERING ONLY
  REUSABLE CERTIFIED CONTRIBUTION
  ALTERNATIVE / BRANCH CANDIDATE
   ↓
RE-R-001 closure
   ↓
only then may canonical C construction open
```

Mandatory backward questions include:

```text
what survives without total-order Classical witness?
which dependencies are Dedekind-specific?
which Q approximation results are reusable by Cauchy or other branches?
is quotient identity structural or merely selected realization?
which units can be weakened/eliminated without changing RA-22?
which Decision Points should become Stage-II branch experiments?
```

## Prohibition

Canonical complex-number construction remains blocked until `RE-R-001` is closed.
