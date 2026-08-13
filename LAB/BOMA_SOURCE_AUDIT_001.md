# BOMA Source Audit 001 — BOMA I / BOMA II

**Cycle:** `PDCA-001`  
**Purpose:** establish the authoritative source baseline before making architectural decisions about Brick terminology or B-001 decomposition.

## 1. Source commits

### BOMA I

- Commit: `9596046d5448033e34b5d4d8361bf4548041b0cf`
- File: `BOMA_1/boma.tex`
- Commit message: `BOMA_1 latex file`

### BOMA II

- Commit: `0188185e731c36ae8310810e88f2ae1210154be6`
- File: `BOMA_2/boma_ii.tex`
- Commit message: `BOMA_2 Latex form`

These commits, rather than the current branch layout, are the source references used for this audit.

## 2. BOMA I — Block definition

BOMA I explicitly defines a **Block** as the architectural unit:

```text
Block = (Id, Content, Dep, Status)
```

with finite non-empty formal content, direct dependencies on earlier Blocks, and status `Fixed` or `Open`.

BOMA I then defines:

```text
Atomic Block  ⇔  Dep(β) = ∅
```

The Atomic Block is described as the root carrying primitive notions, initial axioms, and the declaration of the underlying logic.

Source: `BOMA_1/boma.tex`, definitions `Block`, `Fixed Block`, `Open Block`, and `Atomic Block`.

## 3. BOMA I — Minimal Injection

BOMA I defines an **Injection** as content not derivable from cumulative prior content and establishes the Minimal Injection Principle with four requirements:

1. Necessity;
2. Individuation;
3. explicit acknowledgment of non-derivability;
4. Minimality, including replacement by a logically weaker sufficient injection where possible.

This is directly relevant to atomic construction because BOMA I does not merely ask that content be small; it asks that new foundational commitments be individually identified and minimized.

## 4. BOMA I — Logical policy

BOMA I explicitly states that a logically minimal development **defaults to intuitionistic logic** and introduces classical commitments only when necessary. It also states that the logical analogue is per-injection declaration of the inference system under which each injection is introduced.

Therefore the current project policy of treating intuitionistic logic as the default/core baseline is not an invention of PDCA-001; it is supported directly by BOMA I.

BOMA I also distinguishes three levels:

```text
object logic
framework logic
meta-logic
```

The framework paper itself uses classical logic at the framework/meta levels while claiming neutrality at the object-logic level.

## 5. BOMA I — Branch validity

BOMA I defines branch validity by **local consistency** and explicitly states that validity is independent between branches. Contradictory conclusions in different locally consistent branches are treated as architectural information, not as a failure of the framework.

This is important for later branch construction: a branch choice is not globally validated by agreement with another branch.

## 6. BOMA II — Minimal-Brick Construction

BOMA II introduces the term **Minimal-Brick Construction** as one of six compliance properties, but its formal definitions continue to use **Block** as the record/unit being evaluated.

P4 states that every Block satisfies the Minimal Injection Principle, with two additional disciplines:

- Vocabulary-Axiom Decoupling: vocabulary introduction and axioms governing it occupy separate Blocks.
- Single-Purpose Commitment: each Non-Conservative Block introduces exactly one logically independent core concept.

This is highly relevant to the current B-001 experiment.

## 7. BOMA II — Four-way Epistemic Status

BOMA II defines four Epistemic Statuses:

```text
LN — Logical Necessity
FN — Foundational Necessity
AN — Architectural Necessity
MC — Methodological Choice
```

An `MC` Block corresponds to a genuine choice and generates a Decision Point.

This gives the laboratory a source-backed vocabulary for distinguishing logical consequence from foundational or methodological commitment.

## 8. BOMA II — Machine-readable Block Record

BOMA II's representative records show that the unit remains called a **Brick** in the worked example while the formal structural machinery is expressed through Block-level concepts.

For example, the worked record names `Brick_007`, `Brick_012`, and `Brick_015`, and records fields such as:

```text
EpistemicStatus
Conservativity
Depends_on
Introduces
Exports
Injects
Derives
DecisionPoint
ErratumStatus
FormalPayload
```

The source therefore already contains a terminological tension/useful distinction between the formal architectural unit (`Block`) and the worked-example label (`Brick`). This must be resolved explicitly rather than guessed.

## 9. Critical finding for the current project

The source audit changes the status of the earlier PDCA question.

Earlier experimental work treated `Brick` as the smallest BOMA construction unit and `Block` as a possible grouping above it. The source documents do **not** establish that relationship in that direction.

Instead, the source baseline establishes:

```text
BOMA I:
    Block = formal architectural unit
    Atomic Block = Block with no dependencies

BOMA II:
    Minimal-Brick Construction = compliance property
    worked examples may be labelled Brick_N
    structural record remains Block-oriented
```

Therefore the laboratory must **not** silently rewrite BOMA's original `Block` definition into `Brick`.

## 10. Proposed experimental interpretation

The user's project direction may still deliberately refine the terminology to:

```text
Brick = smallest construction unit
Block = composition/group of Bricks
```

but this is an **architectural modification of the source framework**, not a statement of what BOMA I currently defines.

Before adoption, the laboratory should test whether this terminology preserves the source framework's required properties:

- Minimal Injection;
- Vocabulary-Axiom Decoupling;
- Single-Purpose Commitment;
- dependency legibility;
- Decision Points;
- Branchability;
- Correctability;
- machine-readable records.

## 11. Consequence for B-001

The previous evidence `E-007`–`E-010` remains valid as experimental evidence about the candidate decomposition, but the interpretation must be corrected:

```text
Observed:
    domain + initial is backend-separable.

Observed/provisional:
    domain + initial has an independently meaningful candidate identity.

Not yet established:
    domain + initial is an official BOMA Brick under the source definition.
```

The source audit therefore prevents a category error: using an experimentally chosen `Brick` terminology as if it were already the formal definition of BOMA I/II.

## 12. Source-backed logical baseline

The following statement is now source-backed by BOMA I:

> A logically minimal development defaults to intuitionistic logic and introduces classical commitments only when necessary.

The stronger project policy under discussion — permitting other logics in branches and requiring explicit declaration if a non-intuitionistic logic becomes necessary in the trunk — remains a **project-level refinement** and must be documented separately from the source statement.

## 13. Evidence — E-011

**E-011 — Authoritative source audit**

The two supplied source commits were retrieved and examined. The audit identifies:

1. the formal Block definition in BOMA I;
2. Atomic Block as the dependency-free root;
3. the Minimal Injection Principle;
4. the intuitionistic-default logical policy;
5. BOMA II's Minimal-Brick Construction property;
6. BOMA II's four-way Epistemic Status taxonomy;
7. the coexistence of `Brick_N` worked-example labels with Block-level formal machinery.

Status: **Verified source evidence**.

## 14. Next gate

Do not create `B-001a` / `B-001b` yet.

The next test should determine whether the project's proposed `Brick`/`Block` terminology can be introduced as a **controlled refinement** of BOMA I/II without losing traceability to the source architecture.
