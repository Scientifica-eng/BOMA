# PDSA-TCT-004 — Terminal Recovery Theorem / Countermodel

**CycleID:** `PDSA-TCT-004`  
**Track:** TCT  
**Date opened:** 2026-08-18  
**Status:** **ACTIVE — DO / PROOF AND COUNTERMODEL STUDY**  
**Cycle type:** Mathematical verification cycle

## ParentCycles / LearningInputs

```text
PDSA-TCT-001  Baseline stabilization
PDSA-TCT-002  Pre-numerical metatheory contract
PDSA-TCT-003  Structural equivalence ≈
```

Primary inputs:

```text
TCT-BLOCK-002
TCT-BR-010
TCT-BR-009
TCT-J-001
PDSA-TCT-003 equality audit
PDSA-TCT-003 candidate comparison
```

---

# PLAN

## ResearchQuestion

Under **exactly** the structural-equivalence relation defined by `TCT-BR-010`, is terminal predecessor recovery invariant?

Core form:

```text
P ⊙ U ≈ Q ⊙ U  ⇒  P ≈ Q
```

with the base non-empty configuration `U` handled by the declared empty predecessor `ε` at the meta-level recovery procedure.

## Required outcomes

The cycle must attempt both:

```text
PROOF / DERIVATION
COUNTERMODEL / COUNTEREXAMPLE SEARCH
```

A generic model of “some congruence” is not sufficient. A counterexample must satisfy the **exact generated relation** of BR-010 or expose an ambiguity in that specification.

## Prohibited shortcut

The proof may not assume:

```text
natural-number length
cardinality of U occurrences
object-level counting
successor
induction over ℕ
a completed quotient carrier
```

Permitted meta-level resources are those declared in `BOMA-META-TCT-001`.

## Candidate proof invariant

Define an external structural trace of the presented construction syntax using a meta-level finite list/word of a neutral marker representing the ordered occurrence frontier.

The trace is research/proof infrastructure only:

```text
OBJECT-LEVEL EXPORT: NONE
```

Target proof structure:

1. show every generator of BR-010 preserves the trace;
2. conclude every `≈` derivation preserves the trace;
3. prove trace injectivity on the selected normal-form grammar;
4. use meta-level right cancellation of the final marker;
5. conclude predecessor presentations are definitionally identical, hence structurally equivalent by SE-1.

---

# INITIAL DO — normal-form audit

The historical grammar:

```text
NF ::= ε
    | U
    | (NF ⊙ U)
```

contains a representational redundancy once the current definitional rule:

```text
ε ⊙ U ≡ U
```

is adopted.

Therefore the selected canonical normal form should be refined without changing the generated constructional content:

```text
NF  ::= ε | NF+
NF+ ::= U | (NF+ ⊙ U)
```

This excludes explicit `ε` inside a non-empty selected normal form.

The change is representational/syntactic, not numerical.

It is needed so that “selected normal form” is actually a unique presentation candidate rather than a grammar admitting a definitional duplicate at its base.

---

# Current Observations

1. The exact BR-010 relation is a **least generated relation**, so countermodels with extra collapse equations do not refute it; they refute only weaker axiomatic descriptions.
2. Every explicit BR-010 generator appears to preserve ordered occurrence trace.
3. If trace preservation and normal-form trace injectivity are proved, terminal cancellation follows without object-level counting.
4. The normal-form grammar should be repaired before the theorem is claimed.

---

# STUDY

**OPEN.**

A dedicated proof/countermodel experiment will determine whether the trace argument closes all cases.

# ACT

**PENDING.**

No status change to `TCT-BR-009`, `TCT-J-001`, or `TCT-BLOCK-003` occurs merely by opening this cycle.
