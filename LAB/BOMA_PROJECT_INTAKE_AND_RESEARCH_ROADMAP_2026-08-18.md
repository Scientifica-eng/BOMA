# BOMA Project Intake and Research Roadmap

**Document ID:** `BOMA-INTAKE-2026-08-18`  
**Date of research-context intake:** 2026-08-18 09:43 (Africa/Algiers, UTC+01:00)  
**Repository:** `Scientifica-eng/BOMA`  
**Repository branch at intake:** `main`  
**Project owner / research authority:** `Scientifica-eng`  
**Receiving analytical agent:** ChatGPT — GPT-5.6 Sol, operating within the BOMA project workspace  
**Status:** ACTIVE — research continuity and objective record  

> This document records transfer and receipt of the **research context, repository state, project objectives, and analytical continuity** for work performed in this project workspace. It is not a legal transfer of ownership, authorship, intellectual property, custody, or institutional responsibility.

---

## 1. Intake acknowledgment

The BOMA project has been received for continued scientific analysis, architectural review, documentation, and research assistance on the basis of the repository state and history examined through 2026-08-18.

The received context includes, at minimum:

- the original BOMA I and BOMA II source documents;
- laboratory and PDCA records;
- Brick/Block and dependency experiments;
- forward construction records;
- CAL-001 calibration and reconstruction;
- reverse-engineering and Closure Core records;
- framework-comparison and Phase 9 records;
- Phase 10 arithmetic integration records;
- REORIENTATION-001;
- Transparent Construction Track records;
- canonical architecture, graph, and registry;
- current TCT-J-001 / TCT-BR-009 research boundary;
- existing Lean and CI verification infrastructure;
- relevant Git history, including deletion, merge, canonicalization, and source-restoration events.

The scientific/historical baseline for this intake is recorded separately in:

`LAB/BOMA_SCIENTIFIC_HISTORICAL_REVIEW_2026-08-18.md`

---

## 2. Governing project objective

The final intended result is a **transparent, traceable, logically founded, internally coherent mathematical architecture** whose complete construction history remains auditable.

The architecture is intended to begin **before numerical objects are introduced at the object level** and to progress by explicit construction, verification, and declared formalization commitments.

The project will proceed in two major stages.

---

# PART I — STAGE ONE

## 3. Stage One objective — transparent construction of the standard number domains

The first major stage shall construct an auditable path from a pre-numerical constructional layer to the standard number domains customarily denoted by:

```text
ℕ  natural numbers
ℤ  integers
ℚ  rational numbers
ℝ  real numbers
ℂ  complex numbers
```

The intended high-level path is:

```text
PRE-NUMERICAL CONSTRUCTIONAL LAYER
          ↓
STRUCTURALLY GENERATED FINITE CONFIGURATIONS
          ↓
FORMAL NATURAL-NUMBER REALIZATION
          ↓
ℕ
          ↓
ℤ
          ↓
ℚ
          ↓
ℝ
          ↓
ℂ
```

This diagram is a target view only. It does **not** imply that any transition is already proved, canonical, unique, or forced.

Each arrow must become its own auditable construction interface with explicit assumptions and verification status.

---

## 4. Meaning of “before numbers”

The project objective is **pre-numerical**, not metatheory-free.

The distinction shall be permanent:

```text
OBJECT LEVEL
    numerical concepts are not silently assumed before they are constructed

META LEVEL
    the language, logic, grammar, proof discipline, equivalence machinery,
    and verification procedures required to describe the construction
    must be explicitly declared
```

Therefore BOMA shall not claim unrestricted “construction outside all formal systems.”

The preferred scientific formulation is:

> **A framework-neutral pre-numerical constructional layer relative to an explicitly declared metatheory.**

The declared metatheory itself must be versioned and auditable.

---

## 5. Stage One architectural acceptance condition

Stage One is complete only when every standard number domain in scope has:

1. a unique canonical unit or Block identity;
2. explicit incoming dependencies;
3. explicit constitutive choices;
4. explicit derived content;
5. declared identity/equivalence rules;
6. declared operations and closure conditions;
7. verification evidence appropriate to its layer;
8. sensitivity/change-impact records;
9. provenance linking it to historical experiments where relevant;
10. a clear distinction between representation and mathematical structure;
11. an explicit statement of which results are framework-neutral and which depend on the selected formalization regime.

No number domain shall be marked constructed merely because a familiar external construction exists in standard mathematics.

---

## 6. Proposed Stage One Blocks

The following is a proposed roadmap, not yet a canonical registry update.

### Layer A — Pre-numerical construction

```text
A1  Construction kernel
A2  Finite configurations
A3  Canonical decomposition
A4  Structural depth / iteration invariant
A5  Successor-like construction
A6  Formalization boundary
```

The current TCT work occupies A1–A3, with A3 blocked at `TCT-J-001`.

### Layer B — Natural numbers

```text
B1  Natural-number carrier realization
B2  Initial element
B3  Successor
B4  Induction / recursion principle
B5  Addition
B6  Multiplication
B7  Order
B8  canonical equivalence to the intended ℕ package
```

The project should distinguish structural ancestry of each operation from the extra formal assumptions required to globalize it.

### Layer C — Integers

Candidate architecture:

```text
ℕ × ℕ representations
        ↓
explicit equivalence relation
        ↓
quotient / alternative realization decision
        ↓
ℤ
```

The crucial BOMA question is not merely how integers are normally constructed, but which commitments are introduced by:

- ordered-pair formation;
- equivalence classes;
- quotient existence;
- equality/identity of representatives;
- universal or algebraic characterization.

Alternative constructions must remain branchable when materially different.

### Layer D — Rational numbers

Candidate architecture:

```text
integer pairs with nonzero denominator role
        ↓
representation equivalence
        ↓
field operations
        ↓
ℚ
```

Again the quotient/identity layer must be architecturally explicit.

### Layer E — Real numbers

This must be treated as a major Decision Point rather than a routine continuation.

At least the following candidate branches should be retained for later comparison:

```text
Dedekind cuts
Cauchy sequences / completion
nested intervals or related completion constructions
other explicitly justified realizations
```

The project should not assume in advance that one is the uniquely canonical BOMA route.

The eventual convergence question should be formulated at the level of certified contributions / universal properties / isomorphism where possible.

### Layer F — Complex numbers

Candidate route:

```text
ℝ × ℝ
   ↓
complex multiplication structure
   ↓
ℂ
```

Alternative algebraic characterizations may be compared later, but the canonical project should first establish one fully auditable path.

---

## 7. Immediate Stage One priority

No new canonical work on ℕ should begin downstream until the present TCT gate is resolved.

Current frontier:

```text
TCT-BLOCK-001
      ↓
TCT-BLOCK-002
      ↓
TCT-J-001
      ↓
TCT-BR-009 / structural equivalence definition
```

The immediate research question shall be sharpened to:

> What are the weakest necessary and sufficient conditions on `≈` such that terminal decomposition is well-defined on structural-equivalence classes?

A central target property is:

```text
P ⊙ U ≈ Q ⊙ U  ⇒  P ≈ Q
```

with preservation of the distinguished terminal interface/role.

The acceptable outcomes are:

```text
DERIVED
DECLARED CONSTRAINT
COUNTERMODEL / FAILURE
ALTERNATIVE DEFINITION OF ≈
```

Downstream Blocks remain reserved until this result is closed.

---

# PART II — STAGE TWO

## 8. Stage Two objective — controlled branching experiments

After Stage One establishes at least one coherent canonical path through the standard number domains, the second major stage will test BOMA's branch-oriented architecture by deliberately varying selected Bricks, Blocks, or Junction conditions.

The aim is not to create arbitrary alternatives. It is to measure which architectural commitments are genuine Decision Points and what changes downstream when they are varied.

---

## 9. Proposed branch-test targets

High-value candidate branching points include:

### 9.1 Structural equivalence

Compare definitions of `≈` with different preservation/cancellation properties.

Questions:

- Which downstream results survive?
- Which representations collapse?
- When is decomposition canonical?
- Which choices are merely representational and which alter the mathematical structure?

### 9.2 Construction kernel

Test alternative elementary construction units or composition laws while preserving explicit interface contracts.

The objective is to distinguish accidental choices in `U`, `ε`, or `⊙` from indispensable structure.

### 9.3 Formal completion regime

For the finite constructional core, compare realizations such as:

```text
Peano-style structure
initial algebra
free monoid characterization
NNO/categorical realization
other explicitly defined regimes
```

The purpose is to separate invariant contributions from formalization-specific commitments.

### 9.4 Logic regime

Where meaningful, compare classical, intuitionistic/constructive, or other declared logical regimes.

No branch should be considered equivalent merely because both produce a theorem with the same informal sentence. The exported guarantee and its logical interface must be compared explicitly.

### 9.5 Real-number construction

The real numbers provide a natural large-scale branching experiment because several standard constructions exist and are mathematically equivalent only after substantial comparison theory.

A BOMA treatment should preserve the construction paths and then analyze their convergence.

### 9.6 Quotient versus quotient-free realizations

Where a canonical path uses equivalence classes or quotients, later branches should test whether the same certified mathematical contribution can be produced with a different identity mechanism.

---

## 10. Stage Two evaluation criteria

A branch experiment is scientifically useful only if it records:

```text
shared incoming interface
precise Decision Point
option selected on each branch
new assumptions introduced
logic requirements
construction outputs
certified reusable contributions
incompatibilities
convergence conditions
formal equivalence/isomorphism evidence where applicable
change propagation
```

Comparison is an epistemic instrument, not a mechanism that retroactively validates a branch.

---

# PART III — RECOMMENDATIONS

## 11. Recommendation 1 — establish a strict authority hierarchy

The repository should formalize the following authority order:

```text
ORIGINAL SOURCES
    BOMA I / BOMA II

CANONICAL ARCHITECTURE
    current accepted unit identities and graph

ACTIVE RESEARCH
    unresolved canonical candidates and Junction tests

EXPERIMENTAL / DIAGNOSTIC HISTORY
    PDCA, forward, reverse, calibration, alternative probes

ARCHIVE
    superseded, rejected, or organizationally obsolete artifacts
```

Historical value and canonical authority must not be conflated.

---

## 12. Recommendation 2 — one authoritative status source

Each canonical unit should have one authoritative status record.

The current `TCT-BR-009` status drift demonstrates the need for this rule.

Recommended mechanism:

```text
REGISTRY = authoritative state index
UNIT.md = local unit contract
VERIFICATION record = evidence
```

A synchronization check should eventually detect status disagreement automatically.

---

## 13. Recommendation 3 — declare the metatheory contract

Before extending TCT, create an explicit document defining the minimal meta-level resources permitted in the pre-numerical layer.

It should answer:

- What logic is available?
- What syntax/grammar machinery is available?
- What notion of finite expression/history is permitted?
- What equality or equivalence can be used at the meta level?
- What proof principles are allowed?
- What does “constructed” mean at this layer?

This document should prevent future hidden smuggling analogous to the issues found by CAL-001.

---

## 14. Recommendation 4 — make Junctions theorem/countermodel gates

Every high-impact Junction should be framed so that its status can be resolved by one of:

```text
PROOF
COUNTERMODEL
EXPLICIT CONSTITUTIVE CHOICE
BRANCH SPLIT
```

Narrative confidence must never promote a Junction.

`TCT-J-001` should become the model case for this discipline.

---

## 15. Recommendation 5 — distinguish syntax, quotient, and semantics

Future units should explicitly identify whether they operate on:

```text
raw construction syntax
normal forms
structural-equivalence classes
formal carrier objects
semantic/model interpretations
```

Many hidden foundational commitments enter exactly when moving between these levels.

---

## 16. Recommendation 6 — preserve the distinction between construction and interpretation

The architecture should always distinguish:

```text
constructional fact
from
numerical/algebraic interpretation
```

For example, repeated elementary extension may be structural before it is interpreted as successor iteration or numerical depth.

This distinction should be propagated throughout ℕ, ℤ, ℚ, ℝ, and ℂ.

---

## 17. Recommendation 7 — formal verification should follow canonical stabilization

Lean or another proof assistant should not be used to freeze unstable architecture prematurely.

Recommended order:

```text
architectural definition
    ↓
mathematical verification / counterexample analysis
    ↓
canonical status
    ↓
formal encoding
    ↓
reproducible machine verification
```

Formal encoding should preserve the distinction between backend representation and BOMA unit identity.

---

## 18. Recommendation 8 — develop machine-checkable architecture metadata

As the graph grows toward ℂ, manual status management will become fragile.

A future machine-readable registry should track at least:

```text
UnitID
Type
Layer
Status
EpistemicStatus
DependsOn
Introduces
Derives
Exports
LogicRequirements
VerificationEvidence
AlternativeTo
MeetsAt
Sensitivity
HistoricalSources
```

The human-readable Markdown registry should remain available as a generated or synchronized view.

---

## 19. Recommendation 9 — define completion criteria for each number domain

Each target domain should have an acceptance specification **before** construction begins.

For example, the ℕ acceptance target should specify which of the following are required and at what layer:

- carrier;
- initial element;
- successor;
- successor injectivity/non-cyclicity where intended;
- generation;
- induction/recursion;
- addition;
- multiplication;
- order;
- universal/categorical characterization if required;
- comparison with standard realizations.

Analogous acceptance specifications should be defined for ℤ, ℚ, ℝ, and ℂ.

---

## 20. Recommendation 10 — do not optimize for a single inevitable foundation

The project should first establish a coherent canonical path, but it should not encode the philosophical claim that this path is the uniquely forced mathematical foundation unless that result is actually proved.

BOMA's distinctive strength is better expressed as:

> making the location, cost, consequences, and alternatives of foundational commitments explicit.

This is scientifically stronger than claiming that every commitment can be eliminated.

---

# PART IV — RESEARCH GOVERNANCE

## 21. Permanent invariants proposed for the project

The following should govern future work:

1. **No silent premise.** Every non-derived commitment must be identifiable.
2. **No silent replacement.** Revisions preserve historical identity or receive new IDs.
3. **No downstream promotion through an unresolved gate.**
4. **No conflation of representation with object.**
5. **No conflation of construction with interpretation.**
6. **No conflation of architectural dependency with inherited logical strength.**
7. **No deletion of scientifically relevant failed paths.**
8. **No numerical notion in the pre-numerical object layer unless explicitly constructed.**
9. **No claim of framework independence without cross-framework evidence.**
10. **No machine-verification claim without reproducible verification evidence.**

---

## 22. Proposed work sequence from the intake point

The recommended order of work is:

```text
STEP 1
Synchronize canonical statuses and remove documentary drift.

STEP 2
Declare the pre-numerical metatheory contract.

STEP 3
Give a complete formal specification of structural equivalence ≈.

STEP 4
Resolve TCT-J-001 and TCT-BR-009 by theorem, countermodel,
or explicit admissibility choice.

STEP 5
Construct TCT-BLOCK-003 — canonical decomposition.

STEP 6
Construct structural depth/iteration without numerical circularity.

STEP 7
Construct successor-like structure.

STEP 8
Isolate and document the formal realization boundary.

STEP 9
Construct and verify one canonical realization of ℕ.

STEP 10
Construct ℤ.

STEP 11
Construct ℚ.

STEP 12
Open explicit Decision Point(s) for ℝ construction and select one
canonical path while preserving alternatives.

STEP 13
Construct ℂ.

STEP 14
Run a Stage-One whole-architecture audit from the pre-numerical kernel
through ℂ.

STEP 15
Freeze Stage-One canonical release.

STEP 16
Begin Stage-Two controlled branching experiments.
```

---

## 23. Definition of success

The project succeeds at Stage One when an independent reviewer can start from the declared pre-numerical kernel and answer, for every major result through ℂ:

```text
What was assumed?
What was constructed?
What was derived?
What formal regime is in force?
What logic was required?
What representation was used?
What equivalence/identity was imposed?
What alternatives existed?
What verification evidence exists?
What breaks if this unit changes?
```

The project succeeds at Stage Two when alternative choices can be introduced at selected Bricks/Blocks/Junctions and their consequences can be traced without rewriting or obscuring the canonical history.

---

## 24. Intake conclusion

The BOMA project is accepted in its current state as an **unfinished but scientifically structured foundational-construction research program**.

Its present canonical boundary is well identified, and its historical experiments provide a substantial diagnostic base for future work.

The immediate obligation is not to accelerate toward arithmetic notation. It is to stabilize the architectural and logical boundary on which all later number constructions will depend.

The governing long-term objective is therefore recorded as:

> **Build a logically founded, internally coherent, transparent, traceable, auditable architecture beginning at a declared pre-numerical constructional layer and reaching the standard number domains ℕ, ℤ, ℚ, ℝ, and ℂ as Stage One; then, as Stage Two, deliberately branch selected Bricks, Blocks, or Junctions in order to test alternative foundational choices, dependency propagation, compatibility, and convergence.**
