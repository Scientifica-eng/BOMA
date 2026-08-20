# PDSA-R-015 / RE-R-001 — Real-Stage Dependency Classification

**Status:** FINAL STUDY MATRIX  
**Date:** 2026-08-20  
**Forward target under audit:** `R-BLOCK-001 — Accepted Stage-One Real Interface`  
**Acceptance decision:** `RA-22 = ACCEPT`  
**Purpose:** classify the accepted R dependency closure without modifying the accepted mathematical object.

## Classification vocabulary

A dependency may receive more than one label when the distinction is scientifically material.

```text
STRUCTURALLY NECESSARY
  required by the current BOMA-R-ACCEPT-001 exported contract, independent of the selected proof implementation.

ROUTE-SPECIFIC — DEDEKIND
  required by the selected Dedekind realization/proof path but not asserted necessary for every real construction.

LOGICAL COMMITMENT
  a proof-logical principle or local nonconstructive boundary, not an object-level real operation.

FORMALIZATION / PROOF-ENGINEERING ONLY
  backend representation, namespace, CI assembly, checker, or other verification infrastructure.

REUSABLE CERTIFIED CONTRIBUTION
  theorem/interface whose statement and proof dependencies are not intrinsically tied to the selected real carrier and can feed another branch.

ALTERNATIVE / BRANCH CANDIDATE
  retained noncanonical route suitable for a controlled later experiment.
```

The phrase **STRUCTURALLY NECESSARY** below means necessary relative to the declared Stage-One acceptance contract, not metaphysically necessary to every possible concept of real number.

---

## A. Accepted interface obligations versus selected realizations

| Node / contribution | Classification | Reverse-engineering result |
|---|---|---|
| accepted `QBOMA` input + explicit embedding into R | STRUCTURALLY NECESSARY | RA-03/RA-10 require an injective structure-preserving rational embedding; another real route may realize it differently. |
| explicit real carrier / equality regime | STRUCTURALLY NECESSARY | RA-01/RA-02 require an explicit carrier and identity, but do not require Dedekind cuts or a quotient specifically. |
| ordered-field interface including totality | STRUCTURALLY NECESSARY | Required by RA-09 in the current specification. The current classical proof of totality is not itself structurally necessary. |
| selected completeness theorem | STRUCTURALLY NECESSARY | RA-11 requires the declared completion theorem. Stage One selected Dedekind LUB completeness; the theorem contract is required for accepted R. |
| rational density in R | STRUCTURALLY NECESSARY | RA-12 is an explicit acceptance item. |
| Archimedean characterization | STRUCTURALLY NECESSARY | RA-13 is an explicit acceptance item. |
| claim-level V5 evidence + integration | FORMALIZATION / PROOF-ENGINEERING ONLY relative to object mathematics; STRUCTURALLY NECESSARY relative to BOMA acceptance governance | The checker does not define R, but BOMA governance requires verified evidence and an integration gate. |

---

## B. Completion representation and identity

### `R-DP-001` — Dedekind versus Cauchy

Classification:

```text
ROUTE-SPECIFIC — DEDEKIND
ALTERNATIVE / BRANCH CANDIDATE
```

Result:

- Dedekind lower cuts are the selected Stage-I construction strategy.
- Nothing in RA-01..RA-22 proves that Dedekind cuts are uniquely necessary.
- The retained Cauchy route is not a failed construction; it is a first-class branch with representation and constant-rational embedding probes already recorded.
- A future Cauchy branch must build its own formal carrier, algebra/order, and its selected completeness theorem before any convergence claim is permitted.

### `LowerCut` axioms

```text
nonempty
proper
downward
rounded
```

Classification:

```text
ROUTE-SPECIFIC — DEDEKIND
```

They are constitutive of the selected representation, not properties required verbatim of a Cauchy or other completion carrier.

### `CutEquiv`

Classification:

```text
ROUTE-SPECIFIC — DEDEKIND
```

It is the extensional identity relation appropriate to the selected lower-cut syntax. Some explicit identity relation is structurally necessary, but `CutEquiv` specifically is not universal across completion routes.

### `R-DP-002` — `RBOMA := Quotient cutSetoid`

Classification:

```text
FORMALIZATION / METHODOLOGICAL CHOICE
ALTERNATIVE / BRANCH CANDIDATE
```

Result:

- The quotient is not mathematically forced by the acceptance specification.
- The retained alternative is `LowerCut` syntax with external `CutEquiv` as the equality interface.
- Raw Lean structure equality is not an admissible silent substitute because the representation has a predicate field.
- The quotient gives convenient ordinary downstream equality and exactly reflects `CutEquiv`, but this is an interface choice rather than a theorem of necessity.

---

## C. Order and logical boundary

### Constructive `rLE` core

Verified contribution:

```text
reflexivity
transitivity
antisymmetry
CutComparability -> totality
```

Classification:

```text
ROUTE-SPECIFIC — DEDEKIND at its current representation
REUSABLE PROOF PATTERN at interface level
```

The partial-order core does not consume unrestricted Classical reasoning.

### `R-DP-003` / isolated classical `CutComparability`

Classification:

```text
LOGICAL COMMITMENT
ALTERNATIVE / BRANCH CANDIDATE
```

Current evidence isolates local classical reasoning to a witness of:

```text
∀ A B : LowerCut, CutLE A B ∨ CutLE B A.
```

This is sufficient for the selected Stage-I total-order requirement. It is not part of the definition of `LowerCut`, `CutEquiv`, `RBOMA`, or the constructive partial-order core.

#### What survives if this totality witness is removed?

Directly preserved by already-separated dependency paths:

```text
LowerCut / CutEquiv representation
quotient carrier and rational embedding
constructive rLE partial-order laws
Dedekind LUB construction
rAdd construction and additive laws
rNeg construction and Q-negation preservation
additive inverse / additive group
positive-envelope construction
nonnegative multiplication kernel
positive reciprocal LowerCut construction
Q-level natural upper-bound / scaling / density / inverse-order contributions
RA-13 direct Archimedean theorem
```

The current strict-rational-density theorem uses its own localized classical witness-extraction step, not the total-comparability theorem.

What does **not** remain certified as the accepted package under removal of totality:

```text
RA-09 total-order obligation itself
current proof-level sign classification used by full signed field closure
current signed extension of the inverse to arbitrary nonzero reals
any theorem whose existing proof explicitly consumes total comparability
```

Therefore removing the classical comparability witness does not destroy the carrier or most positive/partial-order infrastructure, but it does invalidate the current `RA-22` acceptance contract unless totality and sign-dependent claims are rebuilt by another route.

Stage-II candidate:

```text
current classical CutComparability
  versus
constructive locatedness / strengthened cut specification / alternative strict-order witness regime.
```

---

## D. Completeness

### `R-COMP-BLOCK-001`

Acceptance-level property:

```text
nonempty bounded F : RBOMA → Prop
  ->
exists least upper bound in RBOMA
```

Classification of the **property**:

```text
STRUCTURALLY NECESSARY
```

because RA-11 and the selected RG-02 contract require it.

Classification of the **proof realization**:

```text
ROUTE-SPECIFIC — DEDEKIND
```

because the witness is built as a union of lower regions. A Cauchy branch need not reproduce that construction.

Important reverse result:

> LUB existence is not a hidden producer of the selected multiplicative inverse. `R-DP-006` explicitly found that a completeness-level inverse route would additionally need multiplication/supremum interaction or equivalent continuity infrastructure.

---

## E. Approximation and additive inverse

### `R-DP-004` / `R-QARCH-BLOCK-001`

This block must be split, not given one global label.

```text
Q natural upper bound       REUSABLE CERTIFIED CONTRIBUTION
Q Archimedean scaling       REUSABLE CERTIFIED CONTRIBUTION
finite rational grid        REUSABLE arithmetic pattern; current theorem is cut-targeted
finite LowerCut exit search ROUTE-SPECIFIC — DEDEKIND + LOGICAL COMMITMENT
cut_bracket_approx          ROUTE-SPECIFIC — DEDEKIND
```

The finite membership search has a localized `Classical.em` because arbitrary predicate membership in `LowerCut` is queried. That logical cost must not be inherited upward by Q arithmetic results that do not consume it.

### Additive inverse

The operation `rNeg` and its representative invariance are cheaper than the full inverse law.

The hard containment:

```text
principalCut(0) ⊆ A + (-A)
```

consumes `cut_bracket_approx`; the opposite containment does not.

Classification:

```text
rNeg representation                ROUTE-SPECIFIC — DEDEKIND
additive-group interface            STRUCTURALLY NECESSARY for RA-05/RA-09
fine-boundary proof of inverse law  ROUTE-SPECIFIC — DEDEKIND
```

Alternative branch retained by `R-DP-004`:

```text
reusable Q-Archimedean gateway
  versus
direct one-off Dedekind bracketing proof.
```

---

## F. Multiplication

### `R-DP-005` selected decomposition

```text
x+ := max(x,0)
x- := max(-x,0)
xy := x+y+ + x-y- - x+y- - x-y+
```

Classification:

```text
MATHEMATICAL / ARCHITECTURAL CHOICE
ROUTE-SPECIFIC at the current implementation
ALTERNATIVE / BRANCH CANDIDATE
```

The accepted field requires multiplication and ordered-field laws, but not this sign architecture specifically.

Subclassification:

```text
positive envelope on cuts              ROUTE-SPECIFIC — DEDEKIND
nonnegative cut multiplication kernel  ROUTE-SPECIFIC — DEDEKIND
Q positive multiplicative approximation REUSABLE CERTIFIED CONTRIBUTION
signed composition formula             selected architecture, not universal necessity
proof-only sign classification          consumes logical totality; not in operation definition
```

The operation definition deliberately avoids proposition-valued sign branching.

Retained alternatives:

```text
B direct sign-case multiplication
C shift-to-positive multiplication
```

These are not mathematically rejected.

---

## G. Multiplicative inverse

### `R-DP-006` Route A — direct positive Dedekind reciprocal

Subclassification:

```text
Q inverse-order interface              REUSABLE CERTIFIED CONTRIBUTION
positive reciprocal LowerCut syntax    ROUTE-SPECIFIC — DEDEKIND
CutEquiv/proof-parameter independence  ROUTE-SPECIFIC — DEDEKIND
anchored fine cut bracketing            ROUTE-SPECIFIC — DEDEKIND
Q reciprocal-gap estimate              REUSABLE CERTIFIED CONTRIBUTION
positive inverse-product proof          ROUTE-SPECIFIC — DEDEKIND at current proof
positive representative extraction      LOGICAL COMMITMENT + route-sensitive witness step
signed extension                        consumes total-order/sign interface
unique-witness inverse interface        STRUCTURALLY NECESSARY for RA-08 at accepted scope
```

The accepted interface does not require a global `inv : RBOMA → RBOMA` selector. Existence + uniqueness witnesses are sufficient.

### Retained Route B — completeness/supremum inverse

Classification:

```text
ALTERNATIVE / BRANCH CANDIDATE
```

Measured missing prerequisites:

```text
bounded reciprocal approximant family
positive rational witness extraction at the required level
multiplication/supremum interaction or equivalent continuity theorem
```

No convergence claim between Routes A and B is made because Route B was not built to a second complete inverse interface.

---

## H. Density and Archimedean characterization

### `R-DENSITY-BLOCK-001`

Acceptance property:

```text
x < y -> exists q : QBOMA, x < rOfQ(q) < y
```

Classification of property:

```text
STRUCTURALLY NECESSARY
```

Current proof decomposition:

```text
Q internal density                   REUSABLE CERTIFIED CONTRIBUTION
Dedekind roundedness                 ROUTE-SPECIFIC — DEDEKIND
strict-inclusion witness extraction  LOGICAL COMMITMENT, localized
principal-cut sandwich               ROUTE-SPECIFIC — DEDEKIND
```

A future strict-order branch may carry a positive inclusion witness directly and compare logical cost.

### `R-ARCH-BLOCK-001`

Acceptance property:

```text
∀x, ∃n : N_BOMA, x < rOfQ(qOfN n)
```

Classification of property:

```text
STRUCTURALLY NECESSARY
```

Current proof decomposition:

```text
Q natural upper bound          REUSABLE CERTIFIED CONTRIBUTION
LowerCut proper/downward       ROUTE-SPECIFIC — DEDEKIND
principal-cut strict inclusion ROUTE-SPECIFIC — DEDEKIND
```

Important logical result:

- RA-13 does not consume `cut_bracket_approx`.
- It therefore does not inherit the finite cut-membership `Classical.em` used in fine bracketing.

---

## I. Contributions a Cauchy branch can reuse unchanged

The phrase **unchanged** is interpreted strictly at theorem/source dependency level, not merely as a similar mathematical idea.

Strong unchanged candidates are the carrier-independent Q-level interfaces:

```text
accepted Q-BLOCK-002 ordered-field interface
internal Q density gateway
Q natural upper-bound theorem
Q Archimedean scaling theorem
Q inverse-order contribution
Q positive multiplicative approximation
Q reciprocal-gap arithmetic where its statement is independent of LowerCut
accepted N/Z/Q embeddings and arithmetic beneath them
```

These can be consumed without presupposing `LowerCut`, `CutEquiv`, or `RBOMA`.

The following are **not** unchanged Cauchy inputs even when they express standard real properties, because their present Lean statements/proofs are specialized to the Dedekind carrier:

```text
rLE / rLT on RBOMA
rAdd / rNeg / rMulCandidate
Dedekind LUB union proof
cut bracketing
principal-cut density sandwich
Dedekind reciprocal object
RStageIntegration002 certificate
```

A future Cauchy branch may converge to equivalent interfaces, but that must be constructed and tested rather than inferred.

---

## J. Minimal accepted dependency spine

At acceptance-contract granularity:

```text
accepted Q
  ↓
explicit R carrier + identity
  ↓
faithful Q embedding
  ↓
ordered-field algebra
  ↓
selected completeness theorem
  ↓
rational density + Archimedean characterization
  ↓
commitment / hidden-dependency audit
  ↓
claim-level V5
  ↓
R-J-002 integration
  ↓
RA-22 ACCEPT
```

At current selected-realization granularity:

```text
Q-BLOCK-002
  ↓
R-DP-001 Dedekind
  ↓
LowerCut / CutEquiv
  ↓
R-DP-002 quotient identity
  ↓
constructive rLE + localized totality witness
  ↓
Dedekind LUB
  ↓
additive group via cut bracketing
  ↓
sign-free multiplication architecture
  ↓
ordered ring
  ↓
direct Dedekind reciprocal + signed extension
  ↓
field witness interface
  ↓
R density + R Archimedean
  ↓
explicit ordered-field closure
  ↓
R-J-002
  ↓
R-BLOCK-001
```

---

## K. What can be omitted from the minimal Construction Graph without changing the accepted theorem set?

These may be omitted from a **minimal active dependency spine**, but must remain in the Learning Graph / branch archive:

```text
unselected Cauchy probes after R-DP-001 selection
external-CutEquiv identity alternative after R-DP-002 selection
unselected direct/shift multiplication routes
unbuilt completeness-level inverse route
historical failed Q-gap / inverse-product revisions
CI-only namespace/dependency repair attempts
superseded workflow failure states
```

They are scientifically valuable provenance and must not be deleted.

No accepted obligation block can simply be deleted without replacement:

```text
R-COMP-BLOCK-001  required by RA-11
R-DENSITY-BLOCK-001 required by RA-12
R-ARCH-BLOCK-001 required by RA-13
field/order/algebra contributions required by RA-04..10
R-J-002 required by RA-21
```

Some selected implementation units are replaceable by alternative proofs/routes, but replacing them is a new branch experiment, not a documentary simplification.

---

## L. Stage-II branch candidates exposed by RE-R-001

Priority is scientific value, not permission to start now.

### RE2-R-01 — Completion route

```text
R-DP-001
Dedekind accepted baseline
vs
full Cauchy carrier
```

Convergence target: explicit ordered-field/completion comparison, not representation resemblance.

### RE2-R-02 — Logical regime for order

```text
R-DP-003
localized classical CutComparability
vs
constructive locatedness / strengthened cut regime / witness-carrying strict order
```

### RE2-R-03 — Formal identity

```text
R-DP-002
Quotient cutSetoid
vs
LowerCut + external CutEquiv
```

Measure proof-interface overhead and downstream equality propagation.

### RE2-R-04 — Inverse architecture

```text
R-DP-006
Direct Dedekind reciprocal
vs
completeness/supremum inverse
```

Requires explicit new supremum-multiplication/continuity infrastructure if Route B is pursued.

### RE2-R-05 — Multiplication sign architecture

```text
R-DP-005
positive/negative-part decomposition
vs
direct sign cases
vs
shift-to-positive
```

### RE2-R-06 — Approximation route

```text
R-DP-004
reusable Q Archimedean gateway
vs
direct representation-specific cut bracketing
```

### RE2-R-07 — Strict-order witness architecture

```text
rLT := rLE ∧ ≠ with witness extraction
vs
explicit strict-inclusion witness interface
```

This candidate arises directly from the RA-12 logical audit.

---

## M. Final RE-R-001 classification

The accepted Stage-One real interface is **not** a monolithic necessity chain.

It factors as:

```text
acceptance-required interface properties
+
selected Dedekind construction choices
+
explicit formal identity choice
+
localized logical commitments
+
reusable Q-level certified contributions
+
verification infrastructure
+
retained alternative branches
```

The central reverse-engineering conclusion is:

> BOMA has constructed and accepted one transparent Dedekind realization of the declared Stage-One real interface. Acceptance certifies that realization and its exported properties; it does not convert the Dedekind route, quotient identity, classical comparability proof, multiplication architecture, or direct reciprocal route into mathematical necessities.

No accepted R theorem is revised by this classification.