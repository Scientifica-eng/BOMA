# TCT-BR-009 — Terminal Interface Preservation

## Canonical Identity

- **Unit ID:** `TCT-BR-009`
- **Type:** Brick
- **Layer:** `L1 — explicit constructed structure`
- **Status:** PENDING

## Purpose

Make explicit the structural condition required for last-step recovery to be invariant under the declared structural equivalence `≈`.

## Incoming dependency

`TCT-J-001`

## Required condition

Structural equivalence must preserve the distinguished terminal interface and terminal-block role.

Operationally, when:

```text
A = P ⊙ U
B = Q ⊙ U
A ≈ B
```

then the recovered terminal role must correspond and:

```text
P ≈ Q
```

at the level of structural equivalence.

## Epistemic status

**FORMALIZATION-DEPENDENT / PENDING**

This condition is not yet claimed to follow from the current definition of `≈`. The present task is to determine whether it is derivable or must be declared as an additional admissibility condition.

## What this Brick does not introduce

```text
0
1
2
n
cardinality
addition
successor
induction
```

The condition is purely structural.

## Verification question

Can terminal-interface preservation be proved from the existing structural-equivalence definition without importing numerical or set-theoretic assumptions?

### Possible outcomes

```text
DERIVED
    The condition follows from the existing definition of ≈.

DECLARED CHOICE
    The condition must be added explicitly to the admissibility of ≈.

REJECTED
    The condition is incompatible with the intended representation class.
```

## Sensitivity

A change to this Brick requires rechecking:

```text
TCT-J-001
TCT-BLOCK-003
TCT-BLOCK-004
TCT-BLOCK-005
TCT-BLOCK-006
```

## Legacy origin

Discovered during:

`LAB/10_CONSTRUCTION/experiments/TCT-J-001-VERIFICATION-001.md`

and originally recorded inside:

`LAB/BUILDING/reverse/TCT-J-001_CANONICAL_DECOMPOSITION_JUNCTION.md`
