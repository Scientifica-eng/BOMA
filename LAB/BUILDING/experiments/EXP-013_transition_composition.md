# EXP-013 — Transition Composition

**Brick / context:** `B-001`  
**Status:** Provisional

## 1. Intention / Goal

Determine the least structure needed to compose one admissible transition with another, without assuming natural numbers, a completed collection of states, or a predetermined notion of succession.

## 2. Experiment

Start from the current working notion of an admissible transition:

```text
state A  →  state B
```

and ask whether a second admissible transition

```text
state B  →  state C
```

can be attached to the first so that the resulting construction represents a combined transition from A to C.

No cardinality or numerical indexing is introduced.

## 3. Result

Composition is possible at the operational level when the output condition of one transition is suitable as the input condition of the next. The combined construction can therefore be represented schematically as:

```text
A → B → C
```

However, this does not yet establish that transitions form a mathematical set, nor that composition is a total operation. Composition is conditional on compatibility between the endpoint of the first transition and the starting condition of the second.

An important new structure appears: **compatibility of transitions**. The construction therefore acquires a compositional aspect without requiring numbers.

## 4. Decision

Accept **partial composition of compatible admissible transitions** as a provisional structural feature of the current path. Do not yet impose associativity, totality, identity transitions, or a formal category-theoretic structure; those would be additional choices unless forced by later construction.

The result also changes what may count as a useful primitive: a transition is not merely a successor-like move but an operation with input/output compatibility conditions.

## 5. Epistemic Status

`Provisional`

## 6. Next Cycle

Test whether composing three compatible transitions exposes a structural law that is forced by the construction (such as associativity), or whether such a law would have to be explicitly chosen.
