# TCT-BLOCK-001 — Construction Kernel

## Canonical Identity

- **Unit ID:** `TCT-BLOCK-001`
- **Type:** Block
- **Layer:** L1 — explicit constructed structure
- **Operational Status:** ACTIVE

## Purpose

Root construction block of the transparent construction track. It establishes the declared construction kernel without introducing natural-number notions.

## Inputs

- Declared constitutive starting choice from the project reorientation.

## Outputs

```text
ε  empty configuration
U  elementary repeatable block
⊙  compatible concatenation operation
```

## Internal candidate Bricks

```text
TCT-BR-001  Empty configuration
TCT-BR-002  Elementary block U
TCT-BR-003  Interface compatibility
TCT-BR-004  Concatenation
```

These Brick IDs are registry candidates until their individual canonical records are created and verified.

## Dependencies

`REORIENTATION-001`

## Downstream

`TCT-BLOCK-002`

## Identity / equivalence convention

Following `PDSA-TCT-002` and the equality audit in `PDSA-TCT-003`, the active pre-numerical track distinguishes:

```text
≡  meta-level definitional / selected-presentation identity
≈  object-level structural equivalence
```

No independent bare object-level equality relation is introduced by this Block.

### Empty behavior

The empty behavior of `ε` is a **declared definitional construction convention**:

```text
ε ⊙ A ≡ A
A ⊙ ε ≡ A
```

whenever the relevant composition is admitted.

This is not classified as a theorem derived from prior structure.

### Parenthesization

Different parenthesized presentations are not definitionally identical merely by syntax.

The current path treats reassociation through the explicit structural-equivalence specification:

`TCT-BR-010 — Reassociation-Generated Structural Equivalence`.

Thus:

```text
(A ⊙ B) ⊙ C ≈ A ⊙ (B ⊙ C)
```

when the displayed compositions are admissible.

On the current path this reassociation is a **declared structural-identity criterion**, not a claim of strict equality and not a theorem derived from an independent geometric semantics.

## Verification status

ACTIVE as a construction Block.

The kernel choices and constructional operation are explicit. Structural equivalence is now specified separately by `TCT-BR-010`.

Consequences such as terminal preservation, cancellation, and canonical decomposition remain verification targets and are not supplied by this Block.

## Epistemic status

- `U` and `ε`: DECLARED CONSTITUTIVE CHOICES
- `⊙`: DEFINED CONSTRUCTIONALLY
- empty behavior: DECLARED / DEFINITIONAL
- reassociation as structurally irrelevant: DECLARED CHOICE via `TCT-BR-010`
- terminal cancellation/preservation: NOT DERIVED HERE
- Natural-number notions: NOT INTRODUCED

## Sensitivity

- Changing `U`: retest formation and all descendants.
- Changing `ε`: retest identity-dependent constructions.
- Changing `⊙`: high-impact retest of the downstream graph.
- Changing the relation between `≡` and `≈`: retest `TCT-BR-010`, `TCT-BR-009`, and `TCT-J-001`.

## Legacy source

`LAB/BUILDING/reverse/TCT-001_CONSTRUCTION_KERNEL.md`

The legacy source remains preserved and is not the canonical identity of this unit.

Historical bare `=` notation in that source is interpreted through the later equality/identity audit rather than silently rewritten in place.

## Acceptance condition

The Block is canonical only while its explicit construction can be reviewed independently and without hidden numerical premises, and while its identity conventions remain explicitly separated from downstream structural theorems.
