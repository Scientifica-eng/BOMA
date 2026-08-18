# PDSA-TCT-003 — Structural Equivalence `≈`

**CycleID:** `PDSA-TCT-003`  
**Track:** TCT  
**Date opened:** 2026-08-18  
**Date closed:** 2026-08-18  
**Status:** **CLOSED — ACT: SELECT CURRENT-PATH STRUCTURAL EQUIVALENCE**  
**Cycle type:** Mathematical-architectural definition and comparison cycle

---

## ParentCycles / LearningInputs

```text
PDSA-TCT-001  Baseline Stabilization
PDSA-TCT-002  Pre-Numerical Metatheory Contract
```

Required inherited records:

- `LAB/00_ARCHITECTURE/PRE_NUMERICAL_METATHEORY_CONTRACT.md`
- `LAB/10_CONSTRUCTION/blocks/TCT-BLOCK-001/UNIT.md`
- `LAB/10_CONSTRUCTION/blocks/TCT-BLOCK-002/UNIT.md`
- `LAB/10_CONSTRUCTION/junctions/TCT-J-001/UNIT.md`
- `LAB/10_CONSTRUCTION/bricks/TCT-BR-009/UNIT.md`
- `LAB/10_CONSTRUCTION/experiments/TCT-BR-009-DERIVABILITY-001.md`
- historical TCT-001/TCT-002 source records
- CAL-001 learning

## ConstructionUnitsAffected

```text
TCT-BLOCK-001  identity/empty/reassociation interpretation clarified
TCT-BLOCK-002  recovery interpretation clarified
TCT-BR-010     NEW active structural-equivalence specification
TCT-BR-009     derivability question sharpened and reopened under BR-010
TCT-J-001      gate condition rewritten precisely; still unresolved
```

---

# PLAN

## ResearchQuestion

What is the weakest useful, explicit, and auditable definition of object-level structural equivalence `≈` for the current TCT construction class?

The definition must be strong enough to support the intended construction but must not silently import canonical decomposition, numerical depth, natural-number indexing, global totality, ordered-pair ontology, or a richer algebraic theory than has been declared.

## Mandatory subproblem

Resolve the status of:

```text
=
≡
≈
```

before adopting any structural-equivalence definition.

## Candidate families

```text
A — generated structural congruence using reassociation
B — interface-preserving equivalence by definition
C — weaker/collapsing congruence as stress-test family
```

## Acceptance discipline

The cycle may select a definition of `≈`, but it may **not** promote `TCT-J-001` unless the terminal recovery condition is independently proved.

---

# DO

## D1 — Equality / identity audit

Created:

`LAB/PDSA/experiments/PDSA-TCT-003-EQ-AUDIT-001.md`

The audit classified current uses of identity and exposed several ambiguities.

### D1.1 — Construction labels

Statements historically written as:

```text
ε = empty configuration
U = elementary block
```

are naming/definition declarations, not derived equations.

### D1.2 — Empty behavior

Historical:

```text
ε ⊙ A = A
A ⊙ ε = A
```

Current-path interpretation:

```text
ε ⊙ A ≡ A
A ⊙ ε ≡ A
```

when admitted.

This is a **declared definitional convention**, not a theorem.

### D1.3 — Parenthesization

Reassociation is not syntactic identity:

```text
(A ⊙ B) ⊙ C  not generally ≡  A ⊙ (B ⊙ C)
```

Whether the two are structurally equivalent belongs to `≈`.

### D1.4 — Recovery notation

Historical verification notation:

```text
recover(U) = (ε,U)
recover(P ⊙ U) = (P,U)
```

was found to risk silently importing ordered-pair objects and equality on those pairs.

The active interpretation is now:

> `recover` is a meta-level inspection procedure returning a documentary/meta-record containing predecessor presentation and terminal role.

No ordered-pair object is introduced.

### D1.5 — Junction condition

The ambiguous historical form:

```text
recover(A) ≈ recover(B)
```

was replaced in the canonical Junction by explicit requirements:

```text
terminal roles correspond
and
P ≈ Q
```

for selected presentations:

```text
A ≡ P ⊙ U
B ≡ Q ⊙ U.
```

## D2 — Candidate comparison

Created:

`LAB/PDSA/experiments/PDSA-TCT-003-EQUIVALENCE-CANDIDATES-001.md`

### Candidate A

Reassociation-generated structural equivalence.

### Candidate B

Interface-preserving equivalence, potentially including terminal preservation directly in the definition.

### Candidate C

Collapsing congruence family used for counterexample/stress testing.

## D3 — Counterexample study

An external two-element idempotent monoid was used as a permitted countermodel instrument:

```text
M = {e,u}
e identity
u ⊙ u = u
```

Then:

```text
e ⊙ u = u = u ⊙ u
```

while:

```text
e ≠ u.
```

This demonstrates that:

```text
equivalence + congruence + associativity + identity
```

is not enough to guarantee right cancellation / terminal predecessor recovery.

The external model is not a TCT definition; it is countermodel evidence under the metatheory contract.

## D4 — Candidate A made explicit

Created canonical unit:

`TCT-BR-010 — Reassociation-Generated Structural Equivalence`.

Its definition is the least relation satisfying:

```text
SE-1  A ≡ B ⇒ A ≈ B

SE-2  (A ⊙ B) ⊙ C ≈ A ⊙ (B ⊙ C)
      whenever the displayed compositions are admissible

SE-3  reflexive / symmetric / transitive closure

SE-4  compatible contextual closure under ⊙
```

Explicitly absent:

```text
idempotent collapse
contraction
insertion
deletion
commutativity
numerical/cardinality criteria
terminal-preservation clause
```

## D5 — Canonical synchronization

Updated:

```text
LAB/10_CONSTRUCTION/blocks/TCT-BLOCK-001/UNIT.md
LAB/10_CONSTRUCTION/blocks/TCT-BLOCK-002/UNIT.md
LAB/10_CONSTRUCTION/bricks/TCT-BR-009/UNIT.md
LAB/10_CONSTRUCTION/bricks/TCT-BR-010/UNIT.md
LAB/10_CONSTRUCTION/junctions/TCT-J-001/UNIT.md
LAB/00_ARCHITECTURE/REGISTRY.md
LAB/00_ARCHITECTURE/GRAPH.md
```

No downstream construction Block was promoted.

---

# OBSERVATIONS

## O1 — Bare equality was carrying multiple meanings

The same symbol `=` had historically served for:

- naming;
- definitional empty behavior;
- meta-level recovery specification;
- presentation decomposition;
- ordinary documentary prose.

This was a traceability risk even where the mathematics was intuitively clear.

## O2 — Ordered pairs could have entered by notation rather than construction

Writing recovery as `(P,U)` is harmless as external bookkeeping only if its status is explicit.

Without that declaration, a future argument could mistakenly treat pair formation as already available object-level structure.

## O3 — Congruence is not cancellation

The idempotent counterexample isolates a crucial distinction:

> closure under composition does not imply recoverability of a factor.

This is directly relevant to the historical discovery of `TCT-BR-009`.

## O4 — Candidate B would answer the question by definition

An interface-preserving equivalence that explicitly preserves terminal role is legitimate, but would make the current Junction less informative because the desired recovery condition would be included in the identity criterion.

## O5 — Candidate A preserves the theorem question

Candidate A identifies only definitional sameness plus parenthesization changes and their compatible contexts. It deliberately contains no terminal rule.

Therefore terminal recovery remains a genuine theorem/countermodel problem.

---

# STUDY

## S1 — Selected interpretation of identity

For the current pre-numerical canonical path:

```text
≔  definition / notation introduction
≡  meta-level definitional / selected-presentation identity
≈  object-level structural equivalence
```

No separate bare object-level equality is required yet.

This does not forbid a later formalization from introducing equality; it prevents premature ambiguity now.

## S2 — Empty configuration result

`ε` neutrality is treated as part of the declared constructional definition:

```text
ε ⊙ A ≡ A
A ⊙ ε ≡ A.
```

This is epistemically cleaner than presenting neutrality as if it had been derived from earlier structure.

## S3 — Associativity/reassociation result

The historical associativity target is reclassified on the current path:

```text
reassociation is a DECLARED structural-identity generator of ≈
```

not strict equality and not a derived geometric theorem.

A later branch may instead attempt to derive reassociation from a deeper interface semantics, but that is not the current canonical route.

## S4 — Candidate selection

Candidate A was selected because it is the weakest of the tested useful candidates that:

- makes parenthesization irrelevant;
- remains finitely witnessable/auditable;
- does not collapse occurrences by an explicit rule;
- does not build terminal recovery into the definition;
- requires no numerical object-level structure;
- requires no completed quotient carrier.

## S5 — Status of TCT-BR-009

The historical classification remains:

```text
DECLARED CHOICE — ADDITIONAL CONSTRAINT
```

because the original derivability test was correctly negative relative to the incomplete relation available at that time.

However, BR-010 changes the premises of the derivability question.

Therefore the next task is a **retest**, not a retroactive rewrite of history.

## S6 — What was not established

This cycle did **not** establish:

```text
P ⊙ U ≈ Q ⊙ U ⇒ P ≈ Q
terminal-interface preservation
canonical decomposition
right cancellation in the general compatible term class
TCT-J-001 PASS
TCT-BLOCK-003
```

---

# ERRORS / RISKS DETECTED

1. Ambiguous bare `=` in historical construction statements.
2. Potential silent import of object-level ordered pairs through recovery notation.
3. Risk of treating generic congruence as if it implied cancellation.
4. Risk of solving a Junction by putting its required result into the definition of `≈` without recording that epistemic move.
5. Risk of calling reassociation “derived associativity” when the current path actually declares it as an identity criterion.

---

# SUCCESSES

1. `≈` is now an independently locatable canonical unit.
2. Its generators and non-generators are explicit.
3. Meta-level and object-level identity roles are separated.
4. Recovery no longer depends on an implicit ordered-pair ontology.
5. A concrete counterexample demonstrates why cancellation needs its own proof.
6. The next Junction test now has exact premises.

---

# HUMAN / AI RESEARCH RECORD

## Human contribution

The human research authority supplied and maintained the governing objectives inherited by this cycle:

- transparent and traceable mathematical construction;
- cumulative PDSA learning rather than linear document production;
- preservation of errors and successful methods as research output;
- refusal to promote downstream mathematics without explicit justification.

The instruction to continue the documented PDSA plan authorized this cycle to move from planning into the equality/equivalence audit while preserving canonical gates.

## AI contribution

The AI research agent:

- audited the overloaded identity notation;
- identified the ordered-pair import risk in `recover`;
- generated and compared three equivalence families;
- produced the idempotent-collapse counterexample;
- proposed the restricted generated relation now recorded as BR-010;
- synchronized canonical documentation without promoting downstream Blocks.

## Verification status of AI contribution

The architectural definitions and counterexample reasoning are recorded for independent mathematical review.

No AI-generated claim about terminal cancellation has been accepted as theorem in this cycle.

This is a deliberate control against fluent-but-unverified promotion.

---

# ACT

## Decision A — select Candidate A

Adopt for the current canonical path:

`TCT-BR-010 — Reassociation-Generated Structural Equivalence`.

Epistemic status:

```text
DECLARED CHOICE — STRUCTURAL IDENTITY SPECIFICATION
```

## Decision B — keep terminal preservation outside the definition

Do not include `TCT-BR-009` as a defining generator of `≈`.

This preserves the scientific content of the next test.

## Decision C — do not promote the Junction

```text
TCT-J-001     remains CONDITIONAL / PENDING
TCT-BLOCK-003 remains RESERVED / NOT CONSTRUCTED
```

## Decision D — open next PDSA cycle

Next cycle:

```text
PDSA-TCT-004 — Terminal Recovery Theorem / Countermodel
```

Question:

```text
Under exactly TCT-BR-010:
P ⊙ U ≈ Q ⊙ U  ⇒  P ≈ Q ?
```

The next cycle must attempt both proof and countermodel search.

---

# ConstructionGraphEffects

Added:

```text
TCT-BR-010  --DEFINES/CONSTRAINS-->  TCT-J-001
```

Retained:

```text
TCT-BR-009  --CONSTRAINS / DERIVABILITY QUESTION--> TCT-J-001
```

No outgoing edge to `TCT-BLOCK-003` has been activated.

---

# LearningGraphEffects

New reusable learning:

```text
L-TCT-003-01  Bare equality must be classified before use.
L-TCT-003-02  Empty neutrality can be definitional without object-level equality.
L-TCT-003-03  Recovery records are meta-level unless pair objects are constructed.
L-TCT-003-04  Congruence does not imply cancellation.
L-TCT-003-05  Definition-by-terminal-preservation would not be a derivation.
L-TCT-003-06  Reassociation is a declared identity criterion on the current path.
L-TCT-003-07  Generated equivalence allows provenance of each equivalence witness.
L-TCT-003-08  Historical negative derivability results must be retested, not erased,
              when premises are strengthened.
```

---

# NextCycleInputs

`PDSA-TCT-004` inherits:

- `TCT-BR-010` exact SE-1 through SE-4 definition;
- equality/identity notation discipline;
- TCT-BLOCK-002 normal-form grammar;
- meta-level recovery interpretation;
- BR-009 required condition;
- idempotent-collapse counterexample showing generic congruence insufficiency;
- prohibition on numerical counting as object-level proof content.

---

# Closure conclusion

**PDSA-TCT-003 CLOSED.**

The project now has an explicit, intentionally weak structural-equivalence relation for the current path. The next scientific frontier is no longer “what does `≈` mean?” but the precise theorem/countermodel question of whether that relation supports terminal predecessor recovery.
