# REVERSE-025 — Order Invariance of Pre-Count Correspondence

**Status:** Experiment completed — provisional result

## 1. Intention / Goal

Test whether a correspondence between an externally distinguishable multiplicity and an unlabeled pattern chain can yield a stable outcome independent of the order in which the external items are processed.

## 2. Experiment

Consider a finite externally distinguishable collection of signals/items and a neutral pattern chain:

```text
P₀ → P₁ → P₂ → P₃ → ...
```

Process the same external items in two different orders, assigning successive pattern positions through the same transition protocol.

Example schematically:

```text
a,b,c  →  terminal pattern P?
c,a,b  →  terminal pattern P?
```

The question is whether the terminal structural state can be treated as invariant under permutation of processing order.

## 3. Result

The experiment shows that **order invariance does not follow from the successor-like chain alone**.

The chain supplies positions and a transition mechanism, but order-independent counting requires an additional structural condition on the correspondence between the external multiplicity and the pattern positions.

A useful distinction appears:

```text
position assignment
        ≠
order-independent cardinal reading
```

The first is available from the neutral chain. The second requires a stronger notion of correspondence preservation.

## 4. Repaired Formulation

We therefore do not introduce a numerical count. Instead we ask for a correspondence protocol satisfying:

1. each processed external occurrence receives an available pattern position;
2. the protocol does not depend on accidental labels of the positions;
3. changing only the processing order does not change the terminal structural pattern up to the already-established structural sameness;
4. the protocol distinguishes exhaustion from continuation.

These are still behavioral conditions, not a definition of cardinality.

## 5. Important Finding

The attempt to obtain a number as an invariant of correspondence reveals that **order-independence itself is a nontrivial structural requirement**.

Thus the path is currently:

```text
neutral pattern chain
        ↓
correspondence protocol
        ↓
order invariance (additional requirement)
        ↓
stable terminal pattern
        ↓
possible precursor of numerical magnitude
```

The stable terminal pattern is not yet called a number.

## 6. Decision

1. Do not identify a terminal pattern with a number yet.
2. Treat order invariance as a separate structural property that must be earned or explicitly chosen.
3. Preserve the distinction between a procedure that counts in a chosen order and a magnitude that remains invariant under reordering.
4. Continue exploring whether order invariance can be derived from a still weaker correspondence condition.

## 7. Next Experiment

Test whether the required order invariance can emerge from a stronger notion of **structural matching** alone, without introducing addition, cardinality, permutations, or finite-set theory.
