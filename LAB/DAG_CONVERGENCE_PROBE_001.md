# DAG Convergence Probe 001

**Cycle:** `PDCA-001`  
**Status:** Experimental / provisional  
**Purpose:** test whether independent Bricks can coexist and later converge without imposing artificial linear dependency.

## 1. Question

Can the project represent two Bricks that are independently established, mutually non-conflicting, and jointly necessary for a later Brick?

## 2. Test construction

Use four abstract Bricks:

```text
A        B
 \      /
   \  /
     C
```

with the intended relations:

```text
A.depends_on = {}
B.depends_on = {}
C.depends_on = {A, B}
```

and compatibility requirements:

```text
A compatible with B
C compatible with A and B
```

The graph is deliberately a DAG and deliberately contains no `A → B` or `B → A` edge.

## 3. Hypothesis under test

A valid construction need not be a linear chain. Independent Bricks may be established in parallel or in either construction order, provided their commitments are mutually compatible and later convergence explicitly records the prerequisites it needs.

## 4. Result

### Dependency structure

The candidate graph is representable without introducing a false dependency:

```text
A ─────┐
       ├──→ C
B ─────┘
```

No relation requires:

```text
A → B
```

or:

```text
B → A
```

Therefore construction order can remain distinct from dependency.

### Non-conflict

For the abstract probe, `A` and `B` were assigned disjoint commitments. No contradiction follows merely from their independence. The convergence `C` explicitly requires both.

This supports the weaker statement:

> Independence from a prior Brick does not imply conflict with it.

It does **not** yet define a general conflict calculus.

### Necessity

`A` and `B` can both be necessary for `C` without either being dependent on the other.

Thus:

```text
necessary_for ≠ depends_on
```

is a useful distinction in the current model.

## 5. Construction-order variants

The same dependency graph permits at least these construction orders:

```text
A, then B, then C
B, then A, then C
A and B established independently, then C
```

The semantic dependency graph is unchanged.

This is evidence that construction order should not be encoded as semantic dependency unless the construction itself requires such an ordering.

## 6. Trunk/branch observation

The probe does not settle whether `A` and `B` belong to the trunk merely because both are prerequisites of `C`.

At least three architectural interpretations remain possible:

```text
1. A and B are both trunk Bricks.

2. A and B belong to separate branches and C is a convergence point.

3. A and B are reusable/shared structures referenced by multiple branches.
```

No choice is adopted by this probe.

## 7. Non-conflict requirement

The experiment supports retaining `non-conflict` as a candidate validity condition, but exposes a necessary distinction:

```text
not dependent on X
        ≠
not compatible with X
```

A dependency-free Brick can be valid in the same context as another dependency-free Brick. Conflict must therefore be defined in terms of commitments, not merely graph adjacency.

## 8. Current model

The most useful provisional representation is therefore:

```text
Brick
├── Identity
├── Commitment
├── Depends_on: 0..n
├── Compatible_with: 0..n   (provisional relation)
├── Necessary_for: 0..n    (provisional relation)
└── Construction_position   (process metadata, not dependency)
```

This is a research model, not a final schema.

## 9. Findings

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

## 10. Epistemic status

```text
Observed:       the proposed DAG can be represented conceptually
Supported:      dependency need not be linear
Hypothesis:     non-conflict is a Brick validity condition
Open:           formal conflict relation
Open:           trunk/branch/convergence semantics
```

No normative BOMA rule is established by this experiment.
