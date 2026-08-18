# TCT-BR-010 — Reassociation-Generated Structural Equivalence

## Canonical Identity

- **Unit ID:** `TCT-BR-010`
- **Type:** Brick
- **Layer:** `L1 — explicit constructed structure`
- **Operational Status:** **ACTIVE**
- **Epistemic Status:** **DECLARED CHOICE — STRUCTURAL IDENTITY SPECIFICATION**
- **PDSA origin:** `PDSA-TCT-003`

## Purpose

Provide the explicit current-path definition of object-level structural equivalence `≈` for the pre-numerical TCT construction without importing terminal recovery, numerical depth, cardinality, global quotient existence, or a completed natural-number domain.

## Scope

The definition applies schematically to admissible meta-finitely presented TCT construction terms built from:

```text
ε
U
A ⊙ B    when the declared interfaces are compatible
```

No completed carrier of all such configurations is asserted by this Brick.

## Meta-level identity input

The active metatheory contract provides:

```text
≡  meta-level definitional / selected-presentation identity
```

with empty behavior treated definitionally:

```text
ε ⊙ A ≡ A
A ⊙ ε ≡ A
```

when the relevant composition is admitted.

These are definitional construction conventions, not derived object-level equality theorems.

## Definition of `≈`

`≈` is the **least relation** on admissible presented configurations satisfying the following clauses.

### SE-1 — Definitional inclusion

```text
A ≡ B  ⇒  A ≈ B
```

### SE-2 — Reassociation generator

Whenever all displayed compositions are admissible:

```text
(A ⊙ B) ⊙ C  ≈  A ⊙ (B ⊙ C)
```

Parenthesization is therefore declared irrelevant to the structural identity used on the current path.

This is a declared identity criterion, not a theorem derived from a deeper geometric semantics.

### SE-3 — Equivalence closure

`≈` is closed under:

```text
reflexivity
symmetry
transitivity
```

### SE-4 — Compatible contextual closure

If:

```text
A ≈ A'
B ≈ B'
```

and the relevant compositions are admissible, then:

```text
A ⊙ B  ≈  A' ⊙ B'
```

No claim is made about compositions whose interfaces are not admitted.

## Explicit non-generators

The current definition contains no rule permitting:

```text
U ⊙ U ≈ U              idempotent collapse
A ⊙ A ≈ A              contraction
A ≈ A ⊙ U              insertion
A ⊙ U ≈ A              deletion
A ⊙ B ≈ B ⊙ A          commutativity
```

and contains no criterion based on:

```text
number of U occurrences
cardinality
numerical length/depth
natural-number index
```

## What this Brick does not assert

This Brick does **not** assert:

```text
terminal-interface preservation
right cancellation
canonical predecessor recovery
unique decomposition modulo ≈
numerical depth
successor
induction
existence of a quotient set/type of equivalence classes
```

Those are separate claims.

## Relationship to TCT-BR-009

`TCT-BR-009 — Terminal Interface Preservation` remains, at the moment this Brick is introduced:

```text
Operational Status: ACTIVE
Epistemic Status: DECLARED CHOICE — ADDITIONAL CONSTRAINT
```

`TCT-BR-010` deliberately does **not** include terminal preservation as a defining clause.

The next PDSA cycle must determine whether the narrower generated relation defined here makes terminal preservation **DERIVED**.

## Verification target

The principal next theorem/countermodel question is:

```text
P ⊙ U ≈ Q ⊙ U  ⇒  P ≈ Q
```

for the TCT-generated finite normal-form family under exactly `SE-1` through `SE-4`.

No positive answer is assumed by this Brick.

## Counterexample boundary

A generic congruence is not sufficient for recovery. For example, adding a collapse generator:

```text
U ⊙ U ≈ U
```

admits non-cancellative models.

Therefore any proof of terminal preservation must use the **specific restricted generation** of the present `≈`, not merely the words “equivalence” or “congruence.”

## Dependencies

```text
TCT-BLOCK-001
TCT-BLOCK-002
BOMA-META-TCT-001
PDSA-TCT-003 equality/identity audit
```

## Downstream

```text
TCT-BR-009
TCT-J-001
TCT-BLOCK-003 (if the Junction passes)
```

## Sensitivity

Changing any generator or closure clause of `≈` requires retesting at least:

```text
TCT-BR-009
TCT-J-001
TCT-BLOCK-003
TCT-BLOCK-004
TCT-BLOCK-005
TCT-BLOCK-006
```

Adding a collapsing, commuting, insertion, deletion, or other generator is a high-impact architectural change and should normally receive a distinct alternative-unit identity.

## Provenance

Selected by:

- `LAB/PDSA/PDSA-TCT-003_STRUCTURAL_EQUIVALENCE.md`
- `LAB/PDSA/experiments/PDSA-TCT-003-EQ-AUDIT-001.md`
- `LAB/PDSA/experiments/PDSA-TCT-003-EQUIVALENCE-CANDIDATES-001.md`
