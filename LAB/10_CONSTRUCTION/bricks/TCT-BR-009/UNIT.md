# TCT-BR-009 — Terminal Interface Preservation

## Canonical Identity

- **Unit ID:** `TCT-BR-009`
- **Type:** Brick
- **Layer:** `L1 — explicit constructed structure`
- **Status:** **DECLARED ADDITIONAL CONSTRAINT**

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

**DECLARED ADDITIONAL CONSTRAINT — NOT DERIVED FROM THE CURRENT SPECIFICATION OF `≈`**

The completed derivability test established that terminal-interface preservation cannot be inferred from the presently specified structural-equivalence relation because the current specification does not itself require preservation of boundary/interface data.

This Brick is therefore an explicit admissibility constraint for the current path. It is not a theorem of the present kernel.

A future alternative or strengthened definition of `≈` may make this condition derivable. If that occurs, the change must be recorded through a new PDSA cycle and the canonical status must be updated with new evidence rather than silently rewriting this history.

## Verification evidence

Primary result:

`LAB/10_CONSTRUCTION/experiments/TCT-BR-009-DERIVABILITY-001.md`

Recorded result:

```text
TCT-BR-009 = DECLARED ADDITIONAL CONSTRAINT
TCT-J-001   = CONDITIONAL / PENDING
TCT-BLOCK-003 = RESERVED / NOT BUILT
```

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

The condition is structural only.

## Current research question

The unresolved question is no longer whether this condition follows from the **current** incomplete specification of `≈`; that derivability test has already returned a negative result.

The next research question is:

> Should the active construction adopt a stronger definition of `≈` under which terminal-interface preservation is derived, or retain a weaker `≈` together with `TCT-BR-009` as an independent declared constraint?

This question is assigned to the new PDSA TCT sequence.

## Possible future outcomes

```text
RETAIN DECLARED CONSTRAINT
    Keep the present status and make the dependency explicit in TCT-J-001.

DERIVED UNDER REVISED ≈
    A later explicit definition of ≈ proves terminal preservation.
    The historical declared-constraint status remains part of provenance.

REJECTED / REDESIGN
    A later construction shows the constraint is incompatible with the
    intended representation class and the path must branch or be redesigned.
```

## Sensitivity

A change to this Brick or to the definition of `≈` requires rechecking:

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

## PDSA provenance

Status synchronization performed during:

`PDSA-TCT-001 — Baseline Stabilization`

The synchronization changes documentary status only. It does not close `TCT-J-001` and does not promote any downstream Block.
