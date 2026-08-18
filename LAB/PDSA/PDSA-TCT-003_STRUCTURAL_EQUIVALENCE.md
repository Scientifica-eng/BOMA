# PDSA-TCT-003 — Structural Equivalence `≈`

**CycleID:** `PDSA-TCT-003`  
**Track:** TCT  
**Date opened:** 2026-08-18  
**Status:** **ACTIVE — PLAN / INITIAL DO**  
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
TCT-BLOCK-001  associativity / empty-behavior interpretation
TCT-BLOCK-002  normal-form representation and recovery
TCT-BR-009     independence versus derivability under candidate ≈
TCT-J-001      downstream target of this cycle, but not automatically resolved
```

---

# PLAN

## ResearchQuestion

What is the weakest useful, explicit, and auditable definition of object-level structural equivalence `≈` for the current TCT construction class?

The definition must be strong enough to support the intended construction but must not silently import canonical decomposition, numerical depth, natural-number indexing, global totality, or a richer algebraic theory than has been declared.

## First mandatory subquestion — `=` versus `≈`

Before proposing candidate equivalence relations, determine the intended status of statements such as:

```text
ε ⊙ A = A
A ⊙ ε = A
```

relative to:

```text
(A ⊙ B) ⊙ C ≈ A ⊙ (B ⊙ C)
```

Candidate interpretations to test:

```text
I1 — `=` is meta-level definitional/syntactic identity only.
I2 — `=` is strict object-level identity stronger than `≈`.
I3 — empty behavior should itself be expressed only up to `≈`.
I4 — a mixed convention is needed, with explicit coercion rules.
```

No interpretation is accepted merely because it is conventional in monoid theory.

## Candidate families for `≈`

The cycle will compare at least the following families.

### Candidate A — Generated structural congruence

Define `≈` as the least explicitly generated equivalence/congruence containing only named structural transformations that TCT chooses or proves admissible.

Questions:

- Which generators are declared versus derived?
- Is associativity included as a generator or proved from a lower representation?
- Are empty-configuration laws strict or included as equivalence generators?
- Does the generated relation preserve the terminal role automatically?

### Candidate B — Interface-preserving structural equivalence

Define `≈` by preservation of specified structural data, including boundaries/interfaces and composition structure.

Questions:

- Which structural data are primitive in the definition?
- Does terminal-interface preservation become definitional/derived?
- Does this make `TCT-BR-009` redundant as an independent constraint or merely move the declaration into the definition of `≈`?

### Candidate C — Weaker result/configuration equivalence

Permit an equivalence that identifies resulting configurations without requiring preservation of construction-history or terminal-interface data.

Purpose:

Use this family as a stress test/countermodel source for canonical recovery.

Questions:

- Can two configurations be equivalent while predecessor recovery differs?
- Does this demonstrate precisely why `TCT-BR-009` is necessary on a weak path?

Candidate C is not presumed desirable; it is included to understand the boundary.

## Required properties to test for every candidate

```text
Reflexivity
Symmetry
Transitivity
Compatibility with admitted uses of ⊙
Treatment of ε
Treatment of parenthesization
Boundary/interface preservation
Terminal-role preservation
Normal-form invariance
Recovery invariance
History sensitivity / history collapse
Dependence on meta-level representation
Hidden numerical assumptions
Dependence on global carrier assumptions
```

## Proof/countermodel discipline

For each claimed implication, attempt both:

```text
PROOF / DERIVATION
and
COUNTERMODEL / COUNTEREXAMPLE SEARCH
```

A failed proof is not evidence of independence unless supported by an explicit countermodel or other independence argument.

## Acceptance outcomes

The cycle may Act with one of:

```text
SELECT ONE CANDIDATE FOR CURRENT CANONICAL PATH
OPEN A BRANCH BETWEEN MATERIAL ALTERNATIVES
REVISE THE TCT KERNEL / INTERFACE MODEL
RETAIN TCT-BR-009 AS INDEPENDENT CONSTRAINT
MAKE TCT-BR-009 DERIVED UNDER AN EXPLICIT REVISED ≈
FAIL / RETURN TO METATHEORY OR KERNEL
```

The cycle itself does not automatically pass `TCT-J-001`; terminal recovery must still receive its dedicated theorem/countermodel cycle `PDSA-TCT-004` unless the Study shows that the Junction question has become purely definitional and that reclassification is justified.

---

# INITIAL DO

## D1 — Identity-layer issue inherited from PDSA-TCT-002

The metatheory contract now reserves:

```text
≡  meta-level syntactic/definitional identity
≈  object-level structural equivalence
```

Historical TCT source still uses bare `=` for empty behavior.

The first active task is therefore to classify each occurrence of equality in the current kernel and decide whether it denotes:

- meta-level definitional identity;
- strict object-level identity;
- or notation that should be replaced/qualified by structural equivalence.

## D2 — Current constraint baseline

Under the inherited incomplete specification:

```text
TCT-BR-009
Operational Status = ACTIVE
Epistemic Status   = DECLARED CHOICE — ADDITIONAL CONSTRAINT
```

The cycle must not erase this historical fact even if a later candidate `≈` makes terminal preservation derived.

---

# Initial Observations

1. The present TCT documents rely on `≈` before giving it a complete canonical definition.
2. Normal-form syntax can make terminal recovery deterministic at the presentation level while leaving recovery under object-level equivalence unresolved.
3. Making terminal preservation part of the **definition** of `≈` would solve one downstream requirement but would not prove that such a definition is minimal or otherwise preferable.
4. A weaker `≈` is scientifically useful as a comparison case because it can expose exactly which information canonical decomposition needs.
5. The cycle must distinguish “derived from `≈`” from “built into the definition of `≈`.” Those are different epistemic claims.

---

# STUDY

**Not yet closed.**

The next Study step is an equality/identity audit over the active kernel and finite-configuration records, followed by explicit candidate definitions and counterexample search.

---

# ACT

**PENDING.**

No candidate `≈` has yet been selected and no downstream unit has been promoted.

---

# ConstructionGraphEffects

```text
NONE YET — research cycle opened only.
```

# LearningGraphEffects

Initial inherited learning edge:

```text
L-TCT-002-07 (`=` versus `≈` unresolved)
        ↓
PDSA-TCT-003 first subproblem
```

# OpenQuestions

1. What does bare `=` mean in the current TCT kernel?
2. Must `≈` be a congruence for every compatible composition context or only selected contexts?
3. Is associativity a theorem, a declared equivalence generator, or a representation-normalization fact?
4. How much boundary/interface data belongs to the identity of a configuration?
5. Is terminal preservation an independent admissibility condition or a consequence of the selected structural identity notion?
6. Which candidate best preserves BOMA's distinction between construction history and reusable mathematical contribution?
