# R DAG — Accepted Stage-One Real Construction

**Status:** **STAGE-ONE R ACCEPTED — RA-22 ACCEPT; RE-R-001 CLOSED**  
**Input:** `Q-BLOCK-002 — Accepted Stage-One Rational Interface`  
**Governing specification:** `BOMA-R-ACCEPT-001`  
**Accepted export:** `R-BLOCK-001`  
**Reverse gate:** `RE-R-001 COMPLETE / PDSA-R-015`  
**Next family:** **C NOT STARTED — USER HOLD**

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
   └── R-DP-003 localized classical total-comparability witness
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
   ↓
PDSA-R-015 / RE-R-001
   ↓
reverse classification COMPLETE
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

`R-DP-002` remains a formalization/methodological choice. `RE-R-001` confirms that some explicit identity is acceptance-required, but the quotient realization is not a mathematical necessity theorem.

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

core. `R-DP-003` is now explicitly resolved: total cut comparability is supplied by a localized classical witness, then consumed through a narrow totality interface.

Evidence:

```text
32181726522 PASS
Lean 4.32.1
```

`RE-R-001` classifies this as a **LOGICAL COMMITMENT / branch candidate**, not as part of the definition of the real carrier and not as a necessity claim about all real constructions.

Final ordered-field interface verifies:

```text
0_R != 1_R
addition translation invariance as an iff
negation order reversal
nonnegative-factor multiplication monotonicity
positive inverse behavior
```

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

Reverse classification:

```text
LUB completeness property   STRUCTURALLY NECESSARY under BOMA-R-ACCEPT-001
union-of-lower-regions proof ROUTE-SPECIFIC — DEDEKIND
```

Scope remains Dedekind least-upper-bound completeness only. No unproved Cauchy/metric/sequential completeness equivalence is promoted.

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

Reverse classification preserves the asymmetric dependency discovered during construction:

```text
rNeg representation / respect         no fine bracketing
A + (-A) ⊆ 0                          no fine bracketing
0 ⊆ A + (-A)                          consumes cut_bracket_approx
```

Thus the additive-group interface is acceptance-required, while its hard boundary proof is Dedekind-route-specific.

## Approximation architecture

`R-DP-004 / R-QARCH-BLOCK-001` separates:

```text
Q natural upper bound        REUSABLE CERTIFIED CONTRIBUTION
Q Archimedean scaling        REUSABLE CERTIFIED CONTRIBUTION
finite rational-grid layer   arithmetic / reusable pattern
finite LowerCut exit search  DEDEKIND-SPECIFIC + localized Classical.em
cut_bracket_approx           DEDEKIND-SPECIFIC
```

Do not propagate the logical cost of arbitrary cut-membership search to Q arithmetic theorems that do not consume it.

## Multiplication architecture

`R-DP-005` selected:

```text
x⁺ := max(x,0)
x⁻ := max(-x,0)
xy := x⁺y⁺ + x⁻y⁻ - x⁺y⁻ - x⁻y⁺
```

The operation definition itself does not branch on proposition-valued sign cases.

Key V5:

```text
32189753112 signed candidate + Q multiplication preservation
32191203164 commutativity / zero / one
32191975377 associativity
32192506728 distributivity
32192653931 ordered-ring compatibility
```

All PASS.

Reverse classification:

```text
positive envelope / cut kernel       ROUTE-SPECIFIC — DEDEKIND
Q positive multiplicative approx     REUSABLE CERTIFIED CONTRIBUTION
signed decomposition                 SELECTED ARCHITECTURE, not universal necessity
proof-only sign classification       consumes logical totality
```

Retained branches: direct sign-case multiplication and shift-to-positive multiplication.

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

Reverse classification:

```text
Q inverse-order / reciprocal arithmetic   REUSABLE CERTIFIED CONTRIBUTIONS
positive reciprocal LowerCut              ROUTE-SPECIFIC — DEDEKIND
anchored cut bracketing                    ROUTE-SPECIFIC — DEDEKIND
signed extension                           consumes total-order/sign interface
unique-witness inverse interface           acceptance-required at RA-08 scope
```

The retained alternative is the completeness/supremum inverse route; it was not built to reconvergence and remains a branch candidate.

No global Choice-backed inverse selector is required by the accepted interface.

## Density and Archimedean characterization

Rational density:

```text
x < y → ∃q : QBOMA, x < rOfQ q < y
```

V5 `32359834460` PASS.

Reverse split:

```text
Q internal density                   REUSABLE
Dedekind roundedness                 ROUTE-SPECIFIC
strict-inclusion witness extraction  localized logical commitment
principal-cut sandwich               ROUTE-SPECIFIC
```

Archimedean characterization:

```text
∀x : RBOMA, ∃n : N_BOMA, x < rOfQ (qOfN n)
```

V5 `32359869558` PASS.

Reverse split:

```text
Q natural upper bound          REUSABLE
LowerCut proper/downward       ROUTE-SPECIFIC
principal-cut strict inclusion ROUTE-SPECIFIC
```

RA-13 specifically does not consume the finite cut-membership search used by fine bracketing.

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

## Final integration / acceptance

Acceptance-strength `R-J-002` checks on the same `RBOMA`:

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

## RE-R-001 result

Canonical records:

```text
LAB/PDSA/PDSA-R-015_REAL_STAGE_REVERSE_ENGINEERING.md
LAB/PDSA/experiments/PDSA-R-015-RE-R-001-DEPENDENCY-CLASSIFICATION.md
```

Final reverse conclusion:

> BOMA has accepted one transparent Dedekind realization of the declared Stage-One real interface. Acceptance certifies this realization and its exported properties; it does not convert the Dedekind route, quotient identity, classical comparability proof, multiplication architecture, or direct reciprocal route into universal mathematical necessities.

Highest-value later branch candidates:

```text
R-DP-001 Dedekind vs full Cauchy completion
R-DP-003 classical comparability vs constructive order regime
R-DP-002 quotient vs external CutEquiv identity
R-DP-006 direct reciprocal vs completeness-level inverse
R-DP-005 alternative multiplication architectures
R-DP-004 alternative approximation architecture
strict-order witness architecture
```

None is started by RE-R-001.

## Current frontier / prohibition

```text
R Stage One   ACCEPTED
RE-R-001      CLOSED / COMPLETE
C             NOT STARTED — USER HOLD
```

Governance prerequisites for C are satisfied, but **eligibility is not authorization**. By explicit user instruction, no canonical C acceptance specification, Decision Point, Brick, Block, payload, workflow, or PDSA construction cycle may be opened until a new explicit user order is given.
