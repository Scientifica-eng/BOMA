# TCT-001 — Construction Kernel: Empty Configuration + Elementary Block

## Status

Transparent Construction Track — active.

## Objective

Replace the previous conceptual starting point with an explicit mathematical construction kernel that can be inspected independently of the natural numbers.

## Constitutive starting choice

We choose one elementary geometric block `U` with a specified orientation and a designated concatenation interface.

This is **not** claimed to be mathematically inevitable. It is the smallest concrete constructional choice adopted to make the project executable and auditable.

We also admit an **empty configuration** `ε` as the neutral result of performing no construction.

```text
ε    = empty configuration
U    = one elementary block
```

The symbols `ε` and `U` are construction labels, not numerical values.

## Geometry

A concrete realization may be a closed oriented line segment with two marked interfaces, left and right. The geometry is only a representation of the abstract construction interface:

```text
┌─────────────┐
│      U      │
└─────────────┘
L             R
```

The only geometric facts used at this stage are:

1. `U` is a repeatable unit configuration.
2. Its right interface can be matched to the left interface of another copy.
3. Concatenation produces a larger configuration with a left boundary and a right boundary.

No metric length, coordinate number, numerical distance, or cardinality is assumed.

## Primitive operation

Define a binary construction operation `⊙` on compatible configurations by concatenation:

```text
A ⊙ B
```

means: place `B` after `A` by matching the designated interfaces.

At this stage the operation is partial: it is defined only when the interfaces are compatible.

## First derived constructions

Starting from `ε` and `U`, we can explicitly construct:

```text
ε
U
U ⊙ U
(U ⊙ U) ⊙ U
((U ⊙ U) ⊙ U) ⊙ U
...
```

These are **construction histories/configurations**, not yet indexed by natural numbers.

## Structural checks

### Empty behavior

For every configuration `A` for which concatenation is defined:

```text
ε ⊙ A = A
A ⊙ ε = A
```

These identities are constructional specifications of the empty configuration.

### Associativity target

The intended construction is insensitive to parenthesization:

```text
(A ⊙ B) ⊙ C  ≈  A ⊙ (B ⊙ C)
```

where `≈` denotes structural equivalence of the resulting geometric configuration.

This is a target to be proved/verified, not an assumption of the pre-formal layer.

## Why this is preferable to binary distinguishability as the first primitive

The earlier `D(a,b)` proposal presupposed two unexplained relata. The present kernel instead starts with a single repeatable configuration and an empty configuration, then obtains multiplicity through repeated construction.

We therefore do not say:

```text
there are two objects
```

at the start.

We say only:

```text
there is an elementary construction block U,
and it can be concatenated with another copy when the interfaces match.
```

The appearance of multiple occurrences is a result of applying the construction rule.

## What is deliberately absent

No natural-number notation is used to define the construction.

No primitive numerical notions are admitted:

```text
0, 1, 2, n
+
×
≤
cardinality
length as a number
```

No set-theoretic membership ontology is required by the construction statement itself.

## First audit boundary

At the current level, we have explicitly chosen:

```text
KERNEL CHOICE:
    an elementary repeatable block U
    an empty configuration ε
    a compatible concatenation operation ⊙
```

We have not yet derived:

```text
all finite configurations
uniqueness of decomposition
integer-valued depth
natural-number domain
```

These must be constructed next.

## Acceptance criterion

TCT-001 is accepted as the construction kernel only if a reviewer can verify, without using natural-number indices, that:

1. `U` is a repeatable elementary configuration;
2. compatible copies can be concatenated;
3. `ε` behaves as the empty construction;
4. the resulting finite configurations can be recovered and compared structurally.

## Failure conditions

Reject or modify the kernel if:

1. the geometric realization secretly requires numerical measurement;
2. concatenation cannot be defined without importing an already-completed numerical structure;
3. structural equivalence `≈` turns out to require stronger primitives than declared;
4. the construction of the finite family cannot be stated without circular use of natural numbers.

## Epistemic status

```text
U and ε as starting choices        DECLARED CONSTITUTIVE CHOICE
Concatenation interface            DEFINED CONSTRUCTIONALLY
Empty behavior                     SPECIFIED
Associativity                      TARGET / TO BE VERIFIED
Natural numbers                    NOT YET INTRODUCED
```

## Plan position

Transparent Construction Track — TCT-001.

Next: **TCT-002 — Finite configuration formation and canonical decomposition**, with no natural-number indexing.
