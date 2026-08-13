# EXP-014 — Three-Transition Composition

**Brick / context:** `B-001`  
**Status:** Provisional

## 1. Intention / Goal

Observe what structure appears when three compatible admissible transitions are composed, without assuming associativity or any other algebraic law in advance.

## 2. Experiment

Take compatible transitions:

```text
A → B
B → C
C → D
```

Compose them in stages, first combining the first two and then the third, and alternatively combining the last two and then the first. Compare the resulting composite constructional path.

## 3. Result

At the operational level both parenthesizations describe the same ordered path:

```text
A → B → C → D
```

No additional numerical structure is required to describe this path. The observed invariance is therefore consistent with an associativity-like property of composition.

However, the experiment does not yet establish a formal associativity theorem. We have not formally defined the objects, transitions, or composition operation sufficiently to state and prove such a theorem. The observation may instead reflect the way the composite path was constructed.

Thus the experiment provides evidence that **associativity may be structurally forced once composition is understood as concatenation of compatible paths**, but this remains conditional on a future formalization of paths and composition.

## 4. Decision

Record associativity-like behavior as an observed structural regularity, not as a primitive axiom. Do not add an associativity rule to the foundation yet.

The next cycle should examine whether there is a neutral constructional transition that leaves a path unchanged under composition, rather than introducing an identity element by fiat.

## 5. Epistemic Status

`Provisional`

## 6. Next Cycle

Test for a constructionally neutral transition and determine whether its existence is forced, impossible, or requires an explicit choice.
