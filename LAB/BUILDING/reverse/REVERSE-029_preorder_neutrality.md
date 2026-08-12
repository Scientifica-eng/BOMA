# REVERSE-029 — Structural Reordering Neutrality

**Status:** Experiment completed — provisional result
**Cycle:** Reverse engineering path

## 1. Intention / Goal

Test whether invariance under reordering can be derived from a more primitive requirement than arithmetic commutativity or a ready-made equivalence relation.

## 2. Candidate Principle

A representation may be changed while preserving the structural information relevant to the construction.

The candidate principle is:

> A change of presentation that preserves the constructionally relevant structure should not alter the structural invariant extracted from it.

This is intentionally stated without using arithmetic terminology.

## 3. Experiment

Compare two presentations of the same externally distinguishable collection of cases:

```text
Presentation A: a → b → c
Presentation B: c → a → b
```

We do not assume that A and B are equal as mathematical lists, nor do we assume a permutation group.

Instead, we ask whether the correspondence rule can depend only on structural roles and not on the accidental order in which the cases are presented.

## 4. Result

A stable invariant can be preserved under re-presentation only when the correspondence protocol explicitly ignores presentation order and tracks only the preserved structural roles.

Thus:

```text
presentation
    ↓
role-preserving correspondence
    ↓
structural result
```

The stability is not forced by the raw sequence alone.

## 5. What This Means

Order-neutrality is not yet a derived theorem of the pre-mathematical construction.

It is better understood as a property that a valid correspondence protocol may have:

```text
structural preservation
        ↓
representation neutrality
        ↓
stable extracted invariant
```

No use is made here of:

- commutativity;
- cardinality;
- permutations as a mathematical object;
- equality of lists;
- natural numbers.

## 6. Important Boundary

This experiment strengthens a distinction already present in the reverse path:

```text
raw presentation order
        ≠
structural order
        ≠
numerical order
```

A numerical interpretation must not be imported merely because a representation was written as a sequence.

## 7. Provisional Decision

The project should treat representation-neutrality as a **protocol constraint** or candidate structural principle, not yet as a theorem derived from deeper primitives.

It cannot currently be reduced further without introducing a new analysis of what counts as "preserved structure."

## 8. Next Question

Can "preserved structure" itself be specified without using equality, equivalence, or a pre-existing mathematical relation?

If yes, a stronger derivation may be possible. If no, this may identify another genuine choice boundary before numerical identification.
