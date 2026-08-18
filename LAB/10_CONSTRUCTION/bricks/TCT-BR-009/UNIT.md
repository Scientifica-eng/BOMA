# TCT-BR-009 — Terminal Interface Preservation

## Canonical Identity

- **Unit ID:** `TCT-BR-009`
- **Type:** Brick
- **Layer:** `L1 — explicit constructed structure`
- **Operational Status:** **ACTIVE**

## Purpose

Make explicit the structural condition required for last-step recovery to be invariant under the declared structural equivalence `≈`.

## Incoming dependencies

```text
TCT-J-001
TCT-BR-010
```

## Required condition

Structural equivalence must preserve the distinguished terminal interface and terminal-block role.

For selected normal-form presentations:

```text
A ≡ P ⊙ U
B ≡ Q ⊙ U
A ≈ B
```

then the recovered terminal role must correspond and:

```text
P ≈ Q
```

at the level of object-level structural equivalence.

The symbols `≡` above record selected-presentation identity; no independent bare object-level equality is being assumed.

## Epistemic Status

**DECLARED CHOICE — ADDITIONAL CONSTRAINT, WITH DERIVABILITY RETEST OPEN UNDER TCT-BR-010**

The completed historical derivability test established that terminal-interface preservation could not be inferred from the **previous incomplete specification** of `≈` because that specification did not state enough about the relation.

That historical result remains valid evidence about the earlier state of the project.

`PDSA-TCT-003` has now introduced:

`TCT-BR-010 — Reassociation-Generated Structural Equivalence`.

Unlike an interface-preserving definition, BR-010 deliberately does not build the present condition into `≈`.

Therefore the current question is now mathematically sharper:

> Is terminal preservation derived from the restricted generation rules of TCT-BR-010, or must this Brick remain an independent declared constraint?

No reclassification to DERIVED is made before that proof/countermodel cycle completes.

## Verification evidence

Historical result:

`LAB/10_CONSTRUCTION/experiments/TCT-BR-009-DERIVABILITY-001.md`

Current equality/identity and candidate-definition evidence:

```text
LAB/PDSA/experiments/PDSA-TCT-003-EQ-AUDIT-001.md
LAB/PDSA/experiments/PDSA-TCT-003-EQUIVALENCE-CANDIDATES-001.md
LAB/10_CONSTRUCTION/bricks/TCT-BR-010/UNIT.md
```

## Why the retest is nontrivial

A generic congruence does not guarantee right cancellation.

For example, a relation admitting:

```text
U ⊙ U ≈ U
```

can fail terminal predecessor recovery.

The next proof must therefore use the **specific fact that TCT-BR-010 is generated only by definitional identity, reassociation, equivalence closure, and compatible contextual closure**, with no insertion/deletion/collapse generator.

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
ordered-pair objects
```

The condition is structural only.

## Possible outcomes of PDSA-TCT-004

```text
DERIVED UNDER TCT-BR-010
    Prove P ⊙ U ≈ Q ⊙ U ⇒ P ≈ Q and terminal-role preservation.
    Update current-path epistemic classification while preserving history.

RETAIN DECLARED CONSTRAINT
    Show that BR-010 alone is insufficient or that proof requires an
    additional admissibility condition.

FAIL / REDESIGN
    Produce a countermodel satisfying BR-010 as actually specified but
    violating the required property; revise/branch the structural identity.
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

```text
PDSA-TCT-001  synchronized operational vs epistemic status
PDSA-TCT-003  supplied explicit ≈ and reopened derivability as a precise theorem question
PDSA-TCT-004  next verification cycle
```
