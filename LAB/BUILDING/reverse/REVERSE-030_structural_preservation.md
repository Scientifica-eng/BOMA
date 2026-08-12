# REVERSE-030 — Structural Preservation Without Predefined Equivalence

**Cycle:** `REVERSE-030`  
**Status:** Experiment completed — provisional result

## 1. Intention / Goal

Test whether the notion of preserving structure can be stated operationally, without importing equality, equivalence, or a standard mathematical notion of isomorphism.

## 2. Starting Point

We have a neutral pattern structure of the form:

```text
P₀ → P₁ → P₂ → ...
```

with an initial role, a transition, and patterns obtained through the construction protocol.

## 3. Experiment

A transformation is treated as structure-preserving only when the roles relevant to the construction remain recoverable after the transformation:

- an initial role remains an initial role;
- a transition from one pattern to the next remains a transition of the same constructional kind;
- the transformed presentation supports the same sequence of admissible transitions;
- no new constructional capability is introduced solely by changing presentation.

We intentionally avoid saying that the original and transformed structures are "equal" or "equivalent".

## 4. Result

A useful operational notion of preservation can be expressed as **invariance of constructional behavior under a permitted re-presentation**.

```text
presentation A
      ↓ preserving transformation
presentation B
      ↓
relevant constructional behavior is recoverable
```

This is weaker than formal equality and does not require a pre-existing equivalence relation.

## 5. Critical Limitation

The phrase "same constructional behavior" still contains a comparison commitment. We have not eliminated comparison; we have displaced it into an operational test based on recoverability of roles and transitions.

Therefore this experiment does not prove that structural preservation is primitive. It shows only that a weaker, behavior-based formulation is possible without choosing a formal mathematical framework.

## 6. Decision

**REVERSE-030 is provisionally accepted.**

For the neutral path, use "preserves constructional behavior" rather than "is equal to" or "is equivalent to" until a formal equality/equivalence framework is explicitly chosen.

## 7. Consequence for the Project

This keeps the project theoretically neutral while allowing us to reason about invariants. The next question is whether repeated behavior-preserving transformations generate a stable family of presentations without requiring formal quotienting or equivalence classes.
