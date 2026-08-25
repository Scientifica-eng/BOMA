# PDSA-ST2-EXP-015 — Cauchy Route-Composition Square

**Cycle ID:** `PDSA-ST2-EXP-015`  
**Program:** `ST2-RP-001 — Compositionality and Minimality of the R→C Boundary`  
**Queue position:** `2 / 4`  
**Owner authority:** `ST2-RP-001 OWNER_AUTHORIZED`  
**Status:** `PLAN FROZEN / NO DO IN THIS COMMIT`  
**Frozen synchronized main reference:** `2a6c38af70e596c840ef2db4733421bde38f3ee5`  
**Typed origin:** `DECISION_POINT / C-DP-001`  
**Research branch:** `feature/stage-two-st2-exp-015-cauchy-route-composition-square`  
**Transition authority:** `LAB/PDSA/experiments/ST2-RP-001_TRANSITION_014_TO_015_001.md`  
**Origin record:** `LAB/PDSA/experiments/ST2-EXP-015_BRANCH_ORIGIN_RECORD_001.json`.

---

## 1. Scientific question

Hold the independently verified Cauchy real producer `RCBOMA` fixed and change
only the complex realization factor from the verified Route-P pair carrier to an
independent Route-Q formal-expression / normalization / quotient carrier.

Question:

```text
Does the Cauchy scalar producer support an independently constructed Route-Q
quadratic complex realization that reproduces the same tested C semantic target
and explicitly reconverges with the already verified Cauchy Route-P realization?
```

The experiment fills the lower-right corner of the owner-authorized square:

```text
                    C-ROUTE-P          C-ROUTE-Q
R-ROUTE-D/Dedekind     verified           verified by ST2-EXP-002
R-ROUTE-C/Cauchy       verified by 014    target of ST2-EXP-015
```

A successful result is evidence of compositional robustness of the two tested
representation factors. It is **not** a uniqueness theorem, a proof that every
possible construction of C is equivalent, or an acceptance promotion.

---

## 2. Single changed scientific factor

Exactly one scientific decision changes:

```text
C realization over fixed RCBOMA

control       C-ROUTE-P / pair carrier / H6+014
experimental  C-ROUTE-Q / formal expression → canonical quadratic normal form
              → quotient by equality of normal forms
```

The phrase “one changed factor” refers to the scientific factor, not to one file,
one declaration, or one commit. Multiple implementation files may be required to
realize the single Route-P→Route-Q change.

No other scientific factor may change during Do.

---

## 3. Fixed controls

The following are immutable controls for this experiment.

### 3.1 Scalar producer

```text
carrier      RCBOMA
zero         rCZero
one          rCOne
negation     rCNeg
addition     rCAdd
multiplication rCMul
order/inverse witnesses only as already verified by the Cauchy route
```

The scalar producer is the independently verified Cauchy route from
`ST2-EXP-003`. Dedekind `RBOMA` is not the 015 scalar producer.

### 3.2 Route-P Cauchy control

The already verified Cauchy Route-P meaning remains fixed:

```text
CCBOMA
ccZero / ccOne
ccNeg / ccAdd / ccMul
ccOfR
ccI
CauchyPairRingCertificate
CauchyQuadraticFieldCertificate
ST2-EXP-011 NativeCauchy h6Presentation / h6Extractor
ST2-EXP-014 cauchyNativeFullCCertificate
```

015 may compare against these declarations only after the independent Route-Q
construction required by the gates below is complete.

### 3.3 Target semantic surface

The nine C Claim meanings tested by 014 remain the comparison target:

```text
C-CL-CARRIER-001
C-CL-REMBED-001
C-CL-FIELD-001
C-CL-I-001
C-CL-GEN-001
C-CL-COORDUNIQ-001
C-CL-NONREAL-001
C-CL-COMPARE-001
C-CL-INTEGRATION-001
```

The accepted producers of those Claims are not modified. The identifiers denote
the semantic comparison target, not acceptance of a new Route-Q producer.

### 3.4 Accepted architecture

All of the following remain unchanged controls:

```text
R-DP-001 SELECTS R-ROUTE-D
R-BLOCK-001 accepted
C-DP-001 SELECTS C-ROUTE-P
C-BLOCK-001 accepted
C-J-001 accepted Junction
C-BLOCK-002 / CA-20 accepted
accepted Q/R/C source manifests
accepted Q/R/C manifest-listed mathematical sources
Stage-One acceptance contracts
```

### 3.5 Logical and selector boundary

The experiment may use already declared trusted quotient/setoid formalization
infrastructure. It may not introduce a new logical/foundational commitment.

In particular:

```text
no Classical.choose for representatives
no hidden global coordinate selector
no hidden global inverse selector
no conversion of total+unique relation into a global function without explicit data
witness-only inversion semantics retained
```

A Route-Q canonical normalizer is allowed precisely because it is a defined
normalization function on syntax and not representative choice.

---

## 4. Historical evidence that may inform but not determine 015

### 4.1 ST2-EXP-002 — Dedekind Route-Q learning

002 verified an independent Route-Q construction over accepted Dedekind
`RBOMA`, using its own syntax, canonical two-coordinate normal form, quotient by
normal-form equality, field closure, and an explicit P↔Q reconvergence after
independent Q completion.

That result is a **design precedent and external control only**.

015 may learn the mathematical schema:

```text
Expr over scalar coefficients
→ normalize to (re, im)
→ quotient syntax by equality of normalized coordinates
→ induced zero/one/neg/add/mul
→ independent ring/field closure
→ explicit coordinate extractor from canonical normalization
→ post-completion P↔Q comparison
```

015 may not consume the 002 Dedekind Q carrier or its Dedekind-specific field
producer as the new mathematical Route-Q result.

### 4.2 ST2-EXP-003 / H6

003 supplies the independently verified `RCBOMA` scalar route and the Cauchy
Route-P quadratic field control.

### 4.3 ST2-EXP-011

011 supplies the scalar-generic comparison layer and the relation/function
firewall. Its `NativeCauchy` instantiation supplies the fixed Route-P
`h6Presentation` and explicit `h6Extractor` over `RCBOMA`.

The generic comparison machinery may be reused as already verified comparison
infrastructure. Creating a new generic scalar-field construction for Route Q is
not authorized here.

### 4.4 ST2-EXP-014

014 supplies the verified complete nine-Claim Cauchy Route-P semantic control.
It establishes that the Cauchy producer is coherent enough for this 015
single-factor route experiment.

---

## 5. Native Route-Q representation frozen for 015

015 freezes the experimental representation to the same **kind** of Route-Q
representation tested historically by 002, but rebuilt natively over `RCBOMA`.

### 5.1 Normal form

```text
structure CauchyQNormal where
  re : RCBOMA
  im : RCBOMA
```

### 5.2 Raw expression syntax

The experimental syntax must have exactly the following mathematical constructors
(or definitionally equivalent names):

```text
coeff : RCBOMA → Expr
generator : Expr
neg : Expr → Expr
add : Expr → Expr → Expr
mul : Expr → Expr → Expr
```

No polynomial-ring construction, algebraic closure, additional generator, or
higher-degree relation is introduced.

### 5.3 Normalization

Normalization evaluates expressions to the coordinate law

```text
(a + bi)(c + di) = (ac - bd) + (ad + bc)i
```

using only the frozen Cauchy scalar operations.

### 5.4 Quotient identity

```text
e ≈ f  iff  normalize e = normalize f
CauchyQBOMA := Quotient exprSetoid
```

Thus quotient equality is controlled by canonical normal-form equality. The
quotient must not use the Route-P `CCBOMA` carrier as its identity relation or as
its hidden representation.

### 5.5 Formalization infrastructure

Lean `Setoid`, `Quotient`, `Quotient.mk`, `Quotient.lift`, `Quotient.lift₂`,
`Quotient.sound`, `Quotient.exact`, and quotient induction are allowed only under
the repository's already declared trusted-formalization treatment demonstrated by
002. Their use does not authorize any new object-level foundational principle.

---

## 6. Native implementation dependency firewall

The independent Route-Q mathematical assembly must have a manifest and exact
source/declaration closure that excludes the following as implementation
producers:

```text
LAB/payloads/lean/RStage/RStageIntegration002.lean
selected Dedekind implementation sources
LAB/payloads/lean/CStage/CRouteQuadraticQuotientProbe001.lean
LAB/payloads/lean/CStage/ST2Exp002QNormalRoute.lean
LAB/payloads/lean/CStage/ST2Exp002QNormalCore.lean
LAB/payloads/lean/CStage/ST2Exp002QNormalNormInverse.lean
LAB/payloads/lean/CStage/ST2Exp002QQuotientField.lean
LAB/payloads/lean/CStage/ST2Exp002PQJunction.lean
ST2Exp003DedekindCauchyFieldIsomorphism.lean
H5 cToD / dToC transport
accepted Route-P C implementation sources as a field-construction shortcut
```

The independent Q source may consume:

```text
independent RCBOMA/Cauchy real sources required for the frozen scalar operations
verified Cauchy scalar field/order/inverse facts needed for a native Q field proof
trusted Lean quotient/setoid infrastructure
new ST2-EXP-015 Route-Q sources
```

After independent Q field closure, comparison-only sources may additionally
consume the already verified 011 `NativeCauchy` Route-P presentation/extractor and
014 control evidence.

The independent-Q manifest and the comparison manifest must be separate so that
post-completion comparison cannot become a hidden construction dependency.

---

## 7. Gate A — exact baseline and Claim/square inventory

Before substantive construction, record an exact evidence file classifying:

1. the frozen main `2a6c38af70e596c840ef2db4733421bde38f3ee5`;
2. the exact 014 Cauchy Route-P control roots;
3. the exact 002 Dedekind Route-Q historical roots used only as design/external
   comparison precedent;
4. the exact 011 generic/native-Cauchy comparison roots;
5. all nine C Claim IDs in `CLAIM_REGISTRY.md`;
6. which nine-Claim meanings must be newly represented by native Q declarations,
   which are comparison infrastructure, and which are integration packaging;
7. the four research-square corners and their evidence status.

Gate A must not classify any 015 Claim as PASS before exact Lean evidence exists.

If the inventory reveals that the lower-right corner cannot be tested without
changing the scalar producer, accepted C target meaning, logical regime, or queue
sequence, stop and classify the discovery before writing mathematical Do code.

---

## 8. Gate B — native Cauchy Route-Q carrier and normalization

Construct a Cauchy-native Route-Q syntax/normalization/quotient with no forbidden
implementation dependency.

Required evidence:

```text
CauchyQNormal coordinate extensionality
raw Expr syntax over RCBOMA
normalization function
normal-form neg/add/mul
quotient/setoid
well-defined quotient neg/add/mul
faithful RCBOMA embedding
I² = -1 at quotient equality
generation by embedded RCBOMA and I
coordinate uniqueness
I not real
constructive canonical extractor qRe/qIm from normalization
```

The carrier must be genuinely quotient/syntax based, not a type alias for
`CCBOMA`.

---

## 9. Gate C — independent native Route-Q ring and field closure

Prove the Route-Q ring/field laws natively over the fixed Cauchy scalar
producer, without using a Route-P↔Q isomorphism to obtain the field laws.

Required ring/embedding properties include:

```text
zero ≠ one
embedding injective
add commutative / associative / zero / inverse
mul commutative / associative / one
distributivity
embedding preserves zero/one/neg/add/mul
I² = -1
generation
coordinate uniqueness
I not real
```

Required field evidence:

```text
∀ z ≠ 0, ∃ w, z*w = 1
inverse witnesses unique
```

Inverse existence must be proved from the independently verified Cauchy scalar
field/order/nondegeneracy machinery using witness semantics. No global inverse
function is required or allowed merely for convenience.

A field proof obtained by transporting the H6 pair field across a P↔Q map before
independent Q closure is a **scientific failure of the independence criterion**,
not a technical shortcut.

---

## 10. Gate D — complete Cauchy Route-Q semantic target

After Gate C, package explicit research-only roots covering the same nine target
Claim meanings used in 014:

```text
carrier
faithful R embedding
field
I² = -1
generation
coordinate uniqueness
non-reality of I
comparison surface
integration/full-C research package
```

The comparison family may use the already verified 011 generic comparison
infrastructure, but the Route-Q presentation and extractor must be supplied from
015's native Q declarations.

The integration family is a research package only. It must not modify
`C-BLOCK-002`, `CA-20`, `CLAIM_REGISTRY.md`, or any accepted Claim producer.

---

## 11. Gate E — post-completion Cauchy P↔Q reconvergence

Only after Gates B–D establish native Route-Q closure independently, construct a
post-completion comparison with the fixed H6/014 Route-P control.

Required relation-level evidence:

```text
QuadraticComparisonCertificate
  h6Presentation
  cauchyRouteQPresentation
```

Required functional evidence is allowed because both sides have explicit
extractors:

```text
h6Extractor
cauchyRouteQExtractor
ConstructiveQuadraticIsomorphism
  h6Presentation
  cauchyRouteQPresentation
```

The functional maps must have explicit coordinate formulas, equivalent to:

```text
P → Q : (a,b) ↦ qCoord a b
Q → P : z ↦ (qRe z, qIm z)
```

and prove:

```text
left inverse
right inverse
preserve scalar embedding
preserve I
preserve addition
preserve multiplication
```

This map is allowed because Q has a constructive canonical normalizer/extractor;
it does not select an arbitrary quotient representative.

The P↔Q comparison file must not occur in the independent-Q field manifest.

---

## 12. Gate F — route-composition-square classification

After the lower-right corner and the Cauchy P↔Q edge are established, classify
the exact tested square.

The four corners are:

```text
D/P  accepted Dedekind + Route P control
D/Q  ST2-EXP-002 verified research Route Q
C/P  ST2-EXP-014 verified Cauchy Route P
C/Q  ST2-EXP-015 candidate
```

The required scientific conclusion is one of:

```text
SQUARE_CLOSED_AT_TESTED_SEMANTIC_SURFACE
SQUARE_PARTIALLY_CLOSED_WITH_EXACT_GAP
SQUARE_DOES_NOT_CLOSE_UNDER_FROZEN_FACTORS
```

A `SQUARE_CLOSED...` result requires:

```text
C/Q native Route-Q field and nine-Claim target PASS
Cauchy P↔Q explicit reconvergence PASS
D/Q historical 002 evidence remains valid as external control
D/P accepted control unchanged
014 C/P evidence remains valid
no forbidden implementation transport used to manufacture C/Q
```

Strict diagram commutativity across Dedekind↔Cauchy need not be promoted to a
new canonical theorem if it would require introducing H5 transport into native
Q implementation. Existing H5/003 evidence may be used only after native closure
as an **external oracle** to test whether the expected coordinate-level square
reconverges. If an exact cross-real commuting theorem can be proved without
changing the frozen factor, record it as robustness evidence; if not, classify
the square at the exact semantic/evidence level actually proved rather than
silently strengthening the experiment.

No square result permits the statement that C is unique among all constructions.

---

## 13. Gate G — exact V5, provenance, and regressions

A PASS requires all relevant evidence on one exact research head:

```text
workflow expected head == checked-out head
frozen main reference is an ancestor
Frozen Plan commit is an ancestor
Frozen Plan file byte-identical to its freeze commit
accepted Q/R/C manifests unchanged from frozen main
accepted manifest-listed mathematical sources unchanged from frozen main
014 Route-P control sources/evidence unchanged from frozen main unless a current-main
  governance-only synchronization is explicitly classified and does not alter the control
no sorry
no new axiom
no hidden Classical.choose/global representative or coordinate selector
new native Q source uses RCBOMA, not RBOMA
native Q implementation closure excludes 002 Dedekind Q producers
native Q implementation closure excludes H5/Dedekind transport
native Q implementation closure excludes H6 pair field as a field-construction shortcut
native Q carrier is not an alias of CCBOMA
native Q ring/field elaborates under pinned Lean
native Q nine-Claim research package elaborates
post-completion Cauchy P↔Q comparison elaborates
relation/function firewall passes
important roots have #print axioms evidence
program governance audit passes
architecture consistency passes
accepted C regressions pass
relevant 002/003/011/014 historical controls pass
exact run/job/artifact IDs and SHA-256 digests are preserved
```

Pinned Lean remains the current historical Stage-Two toolchain unless synchronized
main explicitly changes it before Do:

```text
leanprover/lean4:v4.32.1
```

---

## 14. Study obligations

Study must answer separately:

1. Was a genuinely quotient/syntax-based Cauchy Route-Q constructed without
   Dedekind/H5 or Route-P field transport?
2. Does it satisfy the full field and coordinate target independently?
3. Which of the nine C target Claim meanings are native Q mathematics, which use
   011 comparison infrastructure, and which are only 015 integration packaging?
4. Does explicit Cauchy P↔Q reconvergence hold, and with what exact coordinate
   formulas?
5. Does the four-corner tested square close at the semantic surface actually
   measured?
6. Is the result stronger than 002+014 merely juxtaposed, i.e. does it show that
   scalar-route and C-representation substitutions compose in the lower-right
   corner?
7. Did any dependency on order, inverse witnesses, quotient infrastructure,
   H5/Dedekind, or Route P appear that was not predicted by the Frozen Plan?
8. Does the result leave the 016 interface-weakening experiment scientifically
   meaningful as a single-factor test?
9. Did any newly discovered prerequisite become sequence-critical before 016?

Study must distinguish construction dependency, comparison dependency, historical
control, and external oracle.

---

## 15. Act boundary

Allowed Act classifications:

```text
CLOSED / PASS
CLOSED / INFORMATIVE FAIL
BLOCKED / RECOVERY IN PROGRESS
OWNER_REQUIRED
```

A successful 015 may integrate bounded knowledge that the exact Dedekind/Cauchy
× P/Q square closes at the verified surface under `ST2-RP-001` routine authority.

A PASS does **not** authorize:

```text
selecting R-ROUTE-C
selecting C-ROUTE-Q
replacing R-BLOCK-001
replacing C-BLOCK-002 / CA-20
changing C-DP-001 SELECTS
changing any acceptance contract
claiming generic K[i]
claiming route independence beyond the tested square
```

A mathematically informative FAIL may still permit transition to 016 only if the
program's 015→016 prerequisites remain satisfied after Study/Act. A failure that
invalidates the intended sequence is `OWNER_REQUIRED`.

---

## 16. Predeclared failure classes

```text
F1   frozen baseline / Plan ancestry / byte identity fails
F2   synchronized main or program authority no longer supports 015
F3   Cauchy scalar producer must change to construct Q
F4   native Q requires a Dedekind/002 implementation producer
F5   native Q requires H5 cToD/dToC transport
F6   Q field closure can be obtained only by transporting the H6 Route-P field
F7   the experimental carrier collapses to / aliases CCBOMA instead of quotient syntax
F8   a new global quotient-representative, coordinate, or inverse selector is required
F9   a new foundational/logical commitment is required
F10  full Q field or one of the frozen target meanings genuinely fails
F11  P↔Q reconvergence fails under the same fixed RCBOMA operations
F12  square classification exposes a precise noncommuting/gap condition
F13  accepted Q/R/C source/manifest change is required to obtain PASS
F14  implementation changes more than the C representation P→Q factor
F15  exact dependency/provenance/artifact evidence is incomplete or mismatched
F16  generic scalar K abstraction becomes necessary to obtain the result
F17  a sequence-critical prerequisite is discovered such that ST2-EXP-016 should not follow directly
```

`F17` is a program stop condition and sets `OWNER_REQUIRED` before any queue
change. `F16` may not be “repaired” by prematurely performing 017; if generic K
is genuinely required for 015, classify the result under the frozen experiment
and escalate according to sequence impact.

Other failures are autonomously recoverable only when the correction remains
inside this immutable Plan, preserves the one changed factor, target semantic
surface, accepted controls, logical boundary, and queue order.

---

## 17. Technical recovery rule

The agent may repair only implementation/audit/tooling defects that do not alter:

```text
scientific question
single changed factor
RCBOMA scalar control
Route-Q representation kind
nine-Claim comparison target
success/failure criteria
logical/foundational boundary
accepted controls
sequence
```

Every failed exact head must retain provenance. After any repair, the exact-head
V5 must run again on the repaired head.

A new mathematical hypothesis, new scalar condition, changed quotient identity,
changed target Claim meaning, additional route, or generic-K abstraction is not a
technical repair.

---

## 18. Frozen execution order

```text
1. commit this Plan alone before Do;
2. record the exact Frozen Plan commit and activate 015 under current-state governance;
3. record Gate-A square/Claim/source inventory;
4. create separate native-Q and post-completion-comparison manifests;
5. construct Cauchy-native Route-Q syntax/normalization/quotient;
6. prove native Q ring and field independently from Route P;
7. package native Q target Claim meanings;
8. instantiate 011 comparison infrastructure for Q;
9. only then construct explicit Cauchy P↔Q reconvergence;
10. classify the four-corner tested square;
11. run exact source/declaration independence audits;
12. run exact-head pinned Lean, #print axioms, regressions, and governance audits;
13. preserve failed/successful heads and artifacts;
14. write Study/Act only after evidence is complete;
15. close lifecycle on one exact verified head;
16. evaluate the exact 015→016 transition gate;
17. auto-continue to 016 only if program prerequisites remain true.
```

No `ST2-EXP-016` Plan may be frozen before 015 lifecycle closure and transition
assessment.

---

## 19. Frozen success criterion

`ST2-EXP-015` is `PASS` only if exact evidence establishes all of:

```text
native Cauchy Route-Q quotient/syntax carrier exists
native Q field closure is independent of Route P and Dedekind/H5 implementation transport
full frozen nine-Claim C target meanings are represented research-only over native Q
explicit Cauchy Route-P↔Route-Q reconvergence exists after independent Q closure
relation/function and witness-only-selector boundaries are preserved
four-corner route-composition square is classified as closed at the exact tested semantic surface
accepted architecture/manifests/contracts remain unchanged
no second scientific factor or generic-K abstraction is introduced
all exact V5/provenance/regression gates pass
```

If the exact evidence instead shows a genuine mathematical gap while preserving
the frozen experiment, record `INFORMATIVE FAIL`; do not edit this Plan to obtain
PASS.

# END FROZEN PLAN

This file is immutable after its freeze commit. Do, Study, Act, lifecycle
closure, knowledge integration, and transition are separate evidence records.
