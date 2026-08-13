# E-002 — DAG Convergence

**Cycle:** `PDCA-001`  
**Status:** Experimental / provisional  
**Source record:** `LAB/DAG_CONVERGENCE_PROBE_001.md`  
**Epistemic status:** `HYPOTHESIS`

## Question

Can two Bricks be independently established, mutually non-conflicting, and jointly necessary for a later Brick without imposing an artificial linear dependency between them?

## Test construction

Use four abstract Bricks:

```text
A        B
 \      /
   \  /
     C
```

with:

```text
A.depends_on = {}
B.depends_on = {}
C.depends_on = {A, B}
```

The intended compatibility conditions are:

```text
A compatible with B
C compatible with A and B
```

The graph deliberately contains no `A → B` or `B → A` edge.

## Initial hypothesis

A valid construction need not be a linear chain. Independent Bricks may be established in parallel or in either construction order, provided their commitments are mutually compatible and a later convergence explicitly records the prerequisites it needs.

## Result

The conceptual graph is representable without introducing a false dependency:

```text
A ─────┐
       ├──→ C
B ─────┘
```

Nothing in the construction requires:

```text
A → B
```

or:

```text
B → A
```

Therefore construction order can remain distinct from semantic dependency.

## Non-conflict observation

For this abstract probe, `A` and `B` were assigned disjoint commitments. No contradiction follows merely from their independence. `C` explicitly requires both.

This supports the weaker statement:

> Independence from a prior Brick does not imply conflict with it.

It does **not** define a general conflict calculus.

## Necessity observation

`A` and `B` can both be necessary for `C` without either being dependent on the other.

Therefore, provisionally:

```text
necessary_for ≠ depends_on
```

## Construction-order variants

The same dependency graph permits:

```text
A, then B, then C
B, then A, then C
A and B established independently, then C
```

The dependency graph remains unchanged.

This supports the proposition that construction order should not be encoded as semantic dependency unless the construction actually requires that ordering.

## Trunk / branch observation

The experiment does not settle whether `A` and `B` should be classified as trunk Bricks merely because both are prerequisites of `C`.

At least three interpretations remain open:

```text
1. A and B are both trunk Bricks.
2. A and B belong to separate branches and C is a convergence point.
3. A and B are reusable/shared structures referenced by multiple branches.
```

No choice is adopted here.

## Candidate non-conflict requirement

The experiment supports retaining non-conflict as a candidate validity condition, while preserving the distinction:

```text
not dependent on X
        ≠
not compatible with X
```

A dependency-free Brick can be valid in the same context as another dependency-free Brick. Conflict must therefore concern commitments rather than graph adjacency alone.

## Provisional model exposed by the probe

```text
Brick
├── Identity
├── Commitment
├── Depends_on: 0..n
├── Compatible_with: 0..n   (provisional)
├── Necessary_for: 0..n    (provisional)
└── Construction_position   (process metadata, not dependency)
```

This is a research model, not a final schema.

## Findings

```text
DAG without artificial linearization       PASS
Independent Bricks                         PASS
Later convergence                         PASS
Construction order ≠ dependency           SUPPORTED
Necessity ≠ dependency                     SUPPORTED
Non-conflict as candidate condition        SUPPORTED / OPEN
General conflict definition                OPEN
Trunk/branch assignment                    OPEN
```

## Limitations

This is a conceptual architectural probe. It does not constitute a Lean/Coq/Agda/Isabelle backend experiment and does not formally verify the proposed relations.

## Learning

A branching/converging construction should not be forced into a linear dependency chain merely because the repository records a chronological construction process.

This reinforces the result of `E-001` while remaining a separate experiment.

## Open questions

1. What is the minimal formal definition of compatibility?
2. Is `Necessary_for` an intrinsic relation or derived from a target construction?
3. How should trunk/branch membership be represented?
4. Can the same convergence point consume independently reusable structures from multiple branches?
5. What changes when the commitments of A and B are not disjoint?

## Migration note

This document is a standalone PDCA experiment record. The original source record is intentionally preserved during migration and must not be silently deleted or rewritten.
