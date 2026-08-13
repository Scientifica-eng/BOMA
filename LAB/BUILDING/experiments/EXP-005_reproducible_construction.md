# EXP-005 — Reproducible Construction

**Brick / context:** `B-001`  
**Status:** Provisional

## 1. Intention / Goal

Test whether a construction rule can provide re-identifiability of its result without presupposing numerical repetition or primitive equality.

## 2. Experiment

Treat a construction as a specified procedure rather than as an already identified object. Ask whether executing the same specified procedure again gives a result that is admissibly recognized by the procedure as its corresponding result, without first asserting equality between two outputs.

## 3. Result

The attempt succeeds only conditionally. A construction rule can specify what counts as a correct result of the construction, so recognition can be tied to conformity with the rule rather than to an unexplained primitive equality. But this requires a notion of **correctness/conformity** of a result to a construction rule.

The dependency has therefore moved:

```text
primitive equality
        ↓
recognition
        ↓
construction rule
        ↓
correctness / conformity
```

This is progress only if correctness can be specified without silently reintroducing equality or numerical multiplicity.

A further observation is important: the construction rule may identify a **role** or **specification**, not yet an intrinsic object. Thus the first stable item may be better described as “a result satisfying a construction specification” than as “an object existing independently of the construction.”

## 4. Decision

Accept **reproducibility by construction rule** as a stronger working hypothesis than primitive equality, but do not yet accept it as a foundation. Equality has not disappeared; we have only localized the immediate requirement to correctness/conformity.

The next experiment should test the minimum notion of correctness: whether a result can conform to a construction specification without presupposing identity, counting, or a pre-existing collection of possible results.

## 5. Epistemic Status

`Provisional`

## 6. Next Cycle

Test minimal correctness/conformity of a construction result, and determine whether it can be formulated intuitionistically without hidden equality or numerical structure.
