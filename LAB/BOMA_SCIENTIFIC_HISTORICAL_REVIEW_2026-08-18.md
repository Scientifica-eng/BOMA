# BOMA Scientific and Historical Repository Review

**Document ID:** `BOMA-REVIEW-2026-08-18`  
**Date:** 2026-08-18  
**Status:** ACTIVE — repository-level research review  
**Scope:** BOMA I, BOMA II, laboratory/PDCA development, forward construction, calibration, reconstruction, reverse engineering, framework comparison, Phase 10 integration, project reorientation, TCT, canonical architecture, and Lean/CI verification boundary.

---

## 1. Purpose

This document records a scientific and historical reading of the BOMA repository as a research object rather than as a mere collection of files.

The review distinguishes:

- original theory from later laboratory extensions;
- historical experiments from canonical units;
- constructed results from declared choices;
- structural results from formalization-dependent results;
- repository history from the epistemic history of the project.

The main conclusion is that BOMA currently contains several research layers developed in sequence and partially overlapping in the repository. They must not be treated as having equal epistemic authority.

---

## 2. Repository layers

The repository is best read as the following historical and conceptual sequence:

```text
BOMA I
  ↓
BOMA II
  ↓
BOMA Laboratory / PDCA
  ↓
Forward construction B-001 ... B-014
  ↓
CAL-001 calibration and reconstruction
  ↓
Reverse engineering / Closure Core
  ↓
Framework comparison and Phase 9
  ↓
Conditional Phase 10 realization
  ↓
REORIENTATION-001
  ↓
Transparent Construction Track (TCT)
  ↓
Current canonical architecture
```

This sequence is not equivalent to the physical folder tree. The repository contains legacy, experimental, active, canonical, and restored source records in parallel.

---

## 3. BOMA I — original architectural theory

The original source is preserved under:

- `BOMA_1/boma.tex`
- `BOMA_1/boma.bib`
- `BOMA_1/boma.pdf`

The original LaTeX source was first committed on 2026-08-11 in commit:

`9596046d5448033e34b5d4d8361bf4548041b0cf`

BOMA I presents BOMA as a **meta-framework for mathematical foundations**, not as a competing foundation such as ZFC, type theory, or categorical foundations.

Its central architectural components are:

```text
Blocks
Dependencies
Decision Points
Branches
Local Consistency
Minimal Injection
Architectural Transparency
```

The theoretical contribution is architectural: foundational commitments, alternatives, branch choices, and dependency relations are treated as explicit research objects rather than being erased when the final formal theory is presented.

BOMA I also introduces the idea of a **Foundational Space** of locally consistent architectural paths with a shared origin. Divergence between branches is treated as structural information rather than automatically as global failure.

### Scientific interpretation

BOMA I should be treated as the source theory defining the original conceptual motivation and architectural vocabulary. Later laboratory terminology must not be projected backward onto this text unless a source audit explicitly establishes the correspondence.

---

## 4. BOMA II — operationalization

The second original source is preserved under:

- `BOMA_2/boma_ii.tex`
- `BOMA_2/boma_ii.bib`
- `BOMA_2/boma_ii.pdf`

The LaTeX source was first committed on 2026-08-11 in commit:

`0188185e731c36ae8310810e88f2ae1210154be6`

BOMA II operationalizes the architecture by introducing explicit compliance properties:

```text
Traceability
Transparency
Auditability
Minimal-Brick Construction
Branchability
Correctability
```

It also refines epistemic classification into:

```text
Logical Necessity
Foundational Necessity
Architectural Necessity
Methodological Choice
```

The methodological significance is that only genuine methodological choice should generate a Decision Point and possible branch.

BOMA II also strengthens the framework with operational mechanisms including conservativity declarations, correction protocols, explicit DAG reasoning, and machine-readable unit records.

### Scientific interpretation

BOMA II is the bridge between BOMA as conceptual architecture and BOMA as a research-engineering discipline.

---

## 5. Laboratory self-application

The laboratory stage begins when BOMA starts applying its own principles to itself.

Important records include:

- `LAB/BOMA_UNDERSTANDING_BASELINE.md`
- `LAB/BOMA_SOURCE_AUDIT_001.md`
- `LAB/BOMA_TERMINOLOGY.md`
- `LAB/BOMA_PHILOSOPHY.md`
- `LAB/BOMA_LOGICAL_FOUNDATION.md`
- `LAB/PDCA/`

The key methodological achievement of this stage is the separation between:

```text
SOURCE TRUTH
and
LABORATORY HYPOTHESIS / PROJECT-LEVEL EXTENSION
```

This distinction prevents later definitions from being falsely attributed to BOMA I or BOMA II.

### Brick / Block development

The later project-level distinction between Brick and Block was not simply read out of the original papers. It was experimentally developed and tested in files such as:

- `LAB/BRICK_VS_BLOCK_PROBE_001.md`
- `LAB/BRICK_BLOCK_DEFINITION_001.md`
- `LAB/BRICK_BLOCK_CASE_TEST_001.md`

The resulting project semantics can be summarized as:

- **Brick:** smallest independently reviewable/changeable unit at the declared granularity;
- **Block:** coherent composition of one or more Bricks with its own interface and acceptance condition.

This is a legitimate project-level architectural refinement, provided it remains explicitly distinguished from the wording of the original sources.

---

## 6. Dependency logic and reusable contributions

One of the most important laboratory results is the separation between:

```text
structural dependency
and
logical requirement propagation
```

The project discovered that a dependent unit should not automatically inherit the full logical strength historically used by every producer upstream. Instead, it should inherit the logical requirements of the **actual evidence/guarantee/interface consumed**.

Relevant records include:

- `LAB/L-018_TRANSITIVE_LOGICAL_REQUIREMENT_LEARNING.md`
- `LAB/EVIDENCE_GUARANTEE_PROBE_001.md`
- `LAB/REUSABLE_GUARANTEE_PROBE_001.md`
- `LAB/CONTRIBUTION_VS_BRICK_PROBE_001.md`
- `LAB/MULTI_PRODUCER_CONTRIBUTION_PROBE_001.md`

This led to an important conceptual separation:

```text
Construction Unit ≠ Reusable Certified Contribution
```

A reusable contribution can have a weaker logical interface than the full proof history of the Brick or Block that produced it.

### Research significance

This result is central to future branch convergence. Two branches may produce extensionally or structurally equivalent reusable guarantees under different logical regimes without forcing all descendants to inherit the strongest producer history.

---

## 7. First forward construction toward arithmetic

The forward construction in `LAB/BUILDING/bricks/` attempted to construct a pre-numerical sequence of commitments.

The main chain was:

```text
B-001 distinction marker
B-002 referable result
B-003 reuse operation
B-004 provenance-indexed multiplicity
B-005 joint grouping
B-006 preservation-plus-extension
B-007 incremental token extension
B-008 general finite extension schema
B-009 stage referability
B-010 local successor structure
B-011 initiality
B-012 finite reachability
B-013 depth invariant
B-014 depth compatibility
```

The methodological goal was to separate constructional generation from numerical interpretation.

A major strength of this sequence is that several intuitively numerical notions were deliberately withheld until separately justified.

---

## 8. CAL-001 — critical anti-drift correction

The calibration cycle under:

`LAB/BUILDING/calibration/`

is a decisive point in the history of the project.

The audit identified hidden numerical commitments in apparently harmless terms such as:

```text
exactly one
finite
depth
stage
```

As a consequence, the project froze forward progression, reclassified parts of the construction, and rejected a direct numerical reading of some earlier results.

The scientifically important lesson is:

> A construction intended to precede numbers must not define its own pre-numerical invariants by silently using numerical concepts at the meta/object boundary.

The calibration therefore redirected the project toward structural equivalence of construction histories before numerical interpretation.

---

## 9. Reconstruction

The reconstruction stage deepened the analysis of the starting point itself.

Relevant files include:

- `LAB/BUILDING/reconstruction/REBUILD-EXP-001_B001.md`
- `LAB/BUILDING/reconstruction/REBUILD-EXP-001_minimal_recipe_analysis.md`
- `LAB/BUILDING/reconstruction/REBUILD-EXP-002_referability_without_identity.md`

The distinction event was no longer treated as a symbol appearing without conditions. A minimal recipe of the form:

```text
K + D + A
```

was analyzed, corresponding approximately to context, registerable difference, and response act.

Referability was also analyzed without assuming a global mathematical equality relation, using retained constructional/historical address.

### Research significance

Provenance moved from being only audit metadata to becoming part of the structural mechanism of reidentification.

---

## 10. Reverse engineering

The reverse track in `LAB/BUILDING/reverse/` begins from the structural requirements associated with the natural numbers and asks which commitments are genuinely required.

Important results include:

- successor-like behavior alone is insufficient;
- initiality, generation, closure/non-truncation, and identity must be separated;
- potential indefinite extensibility is not identical to a completed total domain;
- local referenceability is not identical to a global reference object;
- the transition to a formal carrier is a constitutive boundary rather than a free deduction.

The forward and reverse paths converge at a generated, referable construction horizon, but this horizon is **not yet the natural-number domain**.

---

## 11. Closure Core and formalization boundary

The `CLOSURE-CORE-*` sequence provides one of the strongest methodological results in the repository.

It decomposes formalization into distinct commitments including:

```text
objectification
cross-reference
global domain
identity/equivalence
operations
framework choice
```

The key result is that a collection of individually available finite constructions does not automatically entail a completed global object containing all of them.

This should remain a permanent architectural distinction in future BOMA work.

---

## 12. Framework comparison

Phase 9 compares multiple realizations of the constructional core:

```text
Peano-style structure
Free monoid
Initial algebra
Natural Numbers Object (NNO)
```

The comparison shows that the finite constructional core is relatively stable across frameworks, while global completion, identity, canonicity, induction, and universality depend on the selected realization regime.

Therefore the constructional core does not uniquely force one formal framework.

The remaining constitutive step was abstracted as the selection of a **formal realization regime** controlling:

- admissible representations;
- identity/equivalence;
- completion;
- available operations;
- canonicality criteria.

---

## 13. Phase 10

Phase 10 performs a conditional realization under a Peano-style regime and interprets:

```text
initial role               → 0
elementary extension       → S
history composition        → addition
iterated composition       → multiplication
successor reachability     → order
```

The correct scientific reading is not that the project derived the natural numbers from nothing. Rather:

> The project constructed a finite structural core, isolated the boundary at which additional global commitments are required, and then showed how a Peano-style formal regime realizes the intended arithmetic structure.

Carrier totality, equality, induction, and global closure remain formalization-dependent.

---

## 14. REORIENTATION-001 and the Transparent Construction Track

`LAB/BUILDING/reverse/REORIENTATION-001_transparent_mathematical_construction_to_N.md`

marks a second major correction.

The Stage 1–10 route was retained as a diagnostic research history rather than promoted as the final canonical construction.

TCT restarts from explicit constitutive construction choices:

```text
ε   empty configuration
U   elementary repeatable block
⊙   compatible concatenation
```

This is methodologically stronger because the project no longer disguises its first constitutive choices as if they were completely assumption-free.

---

## 15. Current canonical architecture

The active canonical layer is defined by:

- `LAB/00_ARCHITECTURE/ARCHITECTURE.md`
- `LAB/00_ARCHITECTURE/GRAPH.md`
- `LAB/00_ARCHITECTURE/REGISTRY.md`

The authoritative unit identities are currently:

```text
TCT-BLOCK-001  ACTIVE
TCT-BLOCK-002  ACTIVE
TCT-J-001      CONDITIONAL / PENDING
TCT-BR-009     DECLARED ADDITIONAL CONSTRAINT (registry/result)
TCT-BLOCK-003  RESERVED
TCT-BLOCK-004  RESERVED
TCT-BLOCK-005  RESERVED
TCT-BLOCK-006  RESERVED
```

The current canonical construction therefore **does not yet reach ℕ**.

---

## 16. Current scientific frontier — TCT-J-001

The current problem is canonical last-step recovery.

For finite configurations represented as:

```text
A = P ⊙ U
B = Q ⊙ U
```

and structural equivalence `≈`, the desired property is:

```text
P ⊙ U ≈ Q ⊙ U
        ↓
P ≈ Q
```

with preservation of the distinguished terminal role of `U`.

The existing normal-form grammar makes recovery syntactically deterministic, but this does not prove that recovery is invariant on equivalence classes.

The project correctly isolated the missing condition as:

`TCT-BR-009 — Terminal Interface Preservation`

and then established that this condition is **not derived from the currently specified definition of `≈`**.

### Recommended mathematical reformulation

The next research task should be formulated as:

> Determine the weakest necessary and sufficient conditions on structural equivalence `≈` under which terminal recovery is well-defined on quotient configurations.

A useful algebraic formulation is a right-cancellation requirement relative to the distinguished generator/interface:

```text
P ⊙ U ≈ Q ⊙ U  ⇒  P ≈ Q
```

The project should prove this property, produce a countermodel, or explicitly declare it as part of the admissibility definition of `≈`.

No downstream construction of depth, successor, or a natural-number carrier should be promoted before this gate is resolved.

---

## 17. Important conceptual caution — pre-numerical vs pre-formal

The project can reasonably aim at a **pre-numerical object-level construction**.

It should not claim to operate without any metatheory.

The project already uses meta-level resources such as:

- finite expressions/histories;
- grammars;
- equivalence relations;
- structural induction-like arguments;
- case distinctions;
- dependency graphs;
- verification judgments.

Accordingly, future documentation should distinguish:

```text
PRE-NUMERICAL CONSTRUCTION LAYER
from
DECLARED METATHEORETIC / LOGICAL ENVIRONMENT
```

Recommended terminology:

> **framework-neutral constructional layer relative to an explicitly declared metatheory**

This is more defensible than the unrestricted phrase “pre-formal mathematics.”

---

## 18. Lean and verification boundary

The repository contains Lean infrastructure, but the active mathematical program is not yet fully formalized.

Current payloads include:

- `LAB/payloads/lean/B001.lean`
- `LAB/payloads/lean/B001_atomicity_probe.lean`

The files explicitly describe themselves as backend representations/probes rather than canonical BOMA definitions.

The reproducibility infrastructure is documented in:

- `LAB/environment/LEAN_REPRODUCIBLE.md`
- `.github/workflows/boma-lean-pdca-001.yml`

The workflow checks only the early B001 payload/probe and is not a formal verification of the current TCT graph.

Therefore the correct status is:

> BOMA has an initial reproducible formal-verification infrastructure, not comprehensive formal verification of the project.

---

## 19. Repository-history observations

The repository history contains several operational events that must not be confused with epistemic changes in the theory.

Key dates:

- **2026-08-11:** BOMA I and BOMA II sources committed; PDCA and laboratory development begin; forward construction created; CAL-001 opened and closed.
- **2026-08-12:** reverse-engineering path and closure analysis expand.
- **2026-08-13:** framework comparisons and Phase 10 integration; project reorientation to TCT; canonical architecture created; TCT-J-001 and TCT-BR-009 isolated; repository deletion/restoration/merge events occur.
- **2026-08-18:** original BOMA I and BOMA II source sets restored to `main`.

Deletion or restoration of source folders in Git history should be interpreted as repository-management events unless accompanied by an explicit epistemic decision record.

---

## 20. Repository consistency issues to correct

### 20.1 TCT-BR-009 status drift

`LAB/00_ARCHITECTURE/REGISTRY.md` and the derivability audit classify TCT-BR-009 as:

```text
DECLARED ADDITIONAL CONSTRAINT
```

while `LAB/10_CONSTRUCTION/bricks/TCT-BR-009/UNIT.md` still contains pending/formalization-dependent wording.

A single source of truth for status should be established and the unit record synchronized.

### 20.2 Duplicate historical identifiers

The historical reverse path contains repeated numerical identifiers such as variants of `REVERSE-025` and `CLOSURE-CORE-013`.

These should not be deleted, but should receive explicit historical aliases or supersession metadata to prevent provenance ambiguity.

### 20.3 Graph representation vs registry status

`GRAPH.md` visually shows the path through reserved future Blocks. The graph should make the distinction between `ACTIVE`, `PENDING`, and `RESERVED` visually explicit so that sequence does not imply verification.

### 20.4 Archive policy

`LAB/90_ARCHIVE` is largely unused despite the presence of a large historical experimental corpus. A formal archival classification policy is needed.

Recommended state vocabulary:

```text
CANONICAL
ACTIVE
PENDING
EXPERIMENTAL
HISTORICAL
SUPERSEDED
REJECTED
RESERVED
```

Historical preservation must remain an architectural invariant.

---

## 21. Overall scientific assessment

The strongest contribution of the repository is not currently a new completed foundation for arithmetic. Its strongest contribution is an architectural discipline for exposing and testing the commitments involved in foundational construction.

Particularly strong results are:

1. first-class representation of foundational decisions;
2. explicit separation of declared, constructed, derived, and formalization-dependent content;
3. preservation of rejected and corrected paths;
4. calibration as an active anti-smuggling mechanism;
5. distinction between dependency structure and inherited logical requirements;
6. distinction between a construction unit and a reusable certified contribution;
7. explicit isolation of the boundary between finite construction and global formal completion;
8. refusal to promote downstream results while an upstream Junction remains unresolved.

The principal scientific risk is confusing **architectural transparency** with **logical derivability**. Perfect documentation of a constitutive choice does not turn that choice into a theorem. The project must preserve the discipline already demonstrated by CAL-001, Closure Core, Phase 9/10, and TCT-BR-009.

---

## 22. Current research position

The canonical frontier is:

```text
TCT-BLOCK-001
    ↓
TCT-BLOCK-002
    ↓
TCT-J-001
    ↓
TCT-BR-009 / definition of ≈
```

The immediate scientific question is:

```text
What exactly must structural equivalence preserve
so that canonical decomposition is well-defined?
```

Until this is resolved, `TCT-BLOCK-003` and all descendants must remain reserved.

---

## 23. Final conclusion

BOMA should now be understood as an evolving research architecture with three distinct achievements:

1. **Theoretical architecture** — BOMA I and II.
2. **Methodological laboratory** — PDCA, Brick/Block analysis, logic/dependency analysis, calibration, and reverse-engineering experiments.
3. **Current canonical construction program** — TCT.

The historical laboratory remains scientifically valuable because it documents why the canonical track has its present form. It should be preserved as provenance, not confused with the current accepted construction.

The project is now positioned to continue from a clearly identified structural gate rather than from an undefined ambition to “derive numbers from nothing.”
