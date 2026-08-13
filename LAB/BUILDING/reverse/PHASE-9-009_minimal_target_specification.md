# PHASE-9-009 — Minimal Target Specification for the Natural Numbers

## Status

Phase 9 — Formal matching against the natural-number target.

## Purpose

Determine the smallest additional specification that can be placed above the framework-neutral finite generative core in order to target the natural-number structure specifically, while testing whether that specification is genuinely framework-neutral or simply a concealed formalization choice.

## Starting point

The cross-framework invariant core established in PHASE-9-007 consists of:

- a distinguished initial structural role;
- one repeatable elementary extension/transition role;
- finite generation by repeated extension;
- recoverable/decomposable finite histories;
- construction depth as a finite invariant;
- coherent finite composition/accumulation behavior.

PHASE-9-008 showed that this core does not determine a unique complete mathematical object under a weak framework-neutral behavioral equivalence.

## Candidate minimal target specification

The weakest useful strengthening tested here is a target specification with four additional behavioral requirements:

1. **No-cycle behavior:** repeated elementary extension never returns to an earlier stage of the same finite history.
2. **Unique finite predecessor behavior:** every non-initial finite stage has exactly one immediately preceding stage within the generated chain.
3. **Generation completeness:** every admitted stage is generated from the distinguished initial role by finitely many elementary extensions.
4. **Indefinite extendability:** every admitted stage can be extended by the same elementary transition to another stage.

These are intentionally stated without naming sets, natural numbers, induction, monoids, initial algebras, categories, or formal equality.

## Test

Does the four-clause strengthening determine the intended natural-number structure uniquely, without introducing framework-specific machinery?

## Result

The specification substantially narrows the target and captures a successor-chain interpretation more tightly than the neutral core alone. It excludes cycles, multiple immediate predecessors, disconnected admitted stages, and terminal stages.

However, it still does **not** constitute a framework-neutral uniqueness theorem for a complete mathematical object.

The critical clause is **generation completeness** together with **indefinite extendability**. Taken operationally, they describe an unbounded successor chain. But to turn that behavioral description into a mathematically complete object requires some formal notion of domain, identity, quantification over all admitted stages, and a principle ensuring that the domain contains exactly the intended finitely generated stages.

Thus the added specification is genuinely useful as a target characterization, but it does not eliminate the formalization boundary.

## Minimality finding

The experiment suggests a useful distinction between two levels:

### Behavioral target specification

```text
initial role
+
repeatable successor-like extension
+
acyclicity
+
unique predecessor
+
finite generation
+
indefinite extendability
```

This is sufficiently strong to characterize the intended **successor-chain behavior** more sharply.

### Formal mathematical completion

```text
formal domain
+
formal identity/equality
+
global quantification
+
closure/completeness principle
+
criterion of canonicality
```

These remain additional formal commitments.

## Important consequence

The phrase “the natural numbers” has therefore been decomposed into two separable tasks:

1. identify the intended **behavioral successor-chain target**;
2. choose a formal framework in which that target becomes a complete canonical mathematical object.

The first can be specified in a comparatively framework-neutral vocabulary. The second cannot yet be derived from the pre-formal construction alone.

## What this establishes

1. The neutral core can be strengthened without immediately importing a named mathematical theory.
2. A successor-chain target can be described behaviorally with substantially more precision than the earlier core.
3. The remaining global commitments are still unavoidable when converting the behavioral target into a formal total object.
4. The project has therefore reduced the ambiguity, but has not eliminated the formalization boundary.

## What remains open

- Whether an even weaker behavioral target specification suffices.
- Whether the four clauses are independent, or some follow from the construction already established.
- Whether a framework-neutral universal property can replace the remaining formal domain/closure commitments.
- Whether the final project result should identify N directly or identify the smallest formal object realizing this target under an explicitly declared framework.

## Rule for Phase 9

No behavioral target clause is to be treated as equivalent to a named mathematical axiom unless that equivalence is separately proved under an explicit formalization.

## Plan position

Stage 9 — Formal matching against the natural-number target.
Substage 009 — Minimal target specification tested.
