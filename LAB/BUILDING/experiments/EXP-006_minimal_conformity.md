# EXP-006 — Minimal Conformity

**Brick / context:** `B-001`  
**Status:** Provisional

## 1. Intention / Goal

Test the minimum notion of correctness/conformity needed for a construction result to count as an admissible result, without importing identity, counting, or a pre-existing collection of possible results.

## 2. Experiment

Treat a construction specification as a rule that determines an admissible way of producing a result. Instead of saying that a result is “equal to” a predetermined object, say that the performed construction satisfies its own specification when the required constructional conditions are met.

## 3. Result

This formulation avoids explicit equality and numerical multiplicity, but it reveals an important distinction between two levels:

```text
specification of an act
        ↓
execution satisfying the specification
```

The notion of conformity can therefore be understood procedurally: a construction is correct when it follows the declared rule. However, this does **not yet produce an object**. It only gives a criterion for an admissible construction/result.

A further problem remains: to compare two executions as instances of the same construction rule, we need some notion of sameness of the rule or sameness of the relevant outcome. Therefore conformity can avoid primitive object equality locally, but it cannot by itself establish a full theory of identity.

## 4. Decision

Accept **procedural conformity to a construction rule** as a useful intermediate notion, but reject the stronger claim that it already supplies the first mathematical object. The current construction has produced a rule-governed admissible outcome, not yet an independently identified entity.

This changes the immediate target: before trying to construct an object, test whether a rule-governed outcome can itself serve as the minimal bearer of distinction, and what additional condition is required for it to be referable.

## 5. Epistemic Status

`Provisional`

## 6. Next Cycle

Test whether a rule-governed outcome can be treated as a re-identifiable entity using only its constructional specification, without introducing a separate primitive equality relation.
