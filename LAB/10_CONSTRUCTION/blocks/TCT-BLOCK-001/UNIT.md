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

## Declared internal components

```text
Empty configuration ε
Elementary repeatable block U
Interface compatibility condition
Compatible concatenation operation ⊙
```

These are explicit internal construction components of `TCT-BLOCK-001`. They are **not separate canonical Brick units** at the current project granularity.

### Granularity normalization — PDSA-ARCH-002

Earlier revisions of this Block provisionally labeled the four components:

```text
TCT-BR-001  Empty configuration
TCT-BR-002  Elementary block U
TCT-BR-003  Interface compatibility
TCT-BR-004  Concatenation
```

Those labels were explicitly described as candidate Brick IDs and were never promoted to individual canonical `UNIT.md` records. `PDSA-ARCH-002` therefore removes their **active candidate-identity interpretation** to prevent a component from appearing to be a canonical Brick merely because it once received a provisional ID.

Historical documents containing those candidate labels remain provenance and are not rewritten. A future branch may promote a genuinely independent component to a Brick only through an explicit canonical record and the current granularity rule in `CLAIM_ARCHITECTURE.md`.

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

The empty behavior of `ε` is a declared definitional construction convention:

```text
ε ⊙ A ≡ A
A ⊙ ε ≡ A
```

whenever the relevant composition is admitted.

This is not classified as a theorem derived from prior structure.

### Parenthesization

Different parenthesized presentations are not definitionally identical merely by syntax.

The current path treats reassociation through:

`TCT-BR-010 — Reassociation-Generated Structural Equivalence`.

Thus:

```text
(A ⊙ B) ⊙ C ≈ A ⊙ (B ⊙ C)
```

when the displayed compositions are admissible.

On the current path this reassociation is a declared structural-identity criterion, not a claim of strict equality and not a theorem derived from an independent geometric semantics.

## Verification status

ACTIVE as the root construction Block.

The kernel choices and constructional operation are explicit. Structural equivalence is specified separately by `TCT-BR-010`.

This Block itself does not supply terminal preservation, cancellation, decomposition, structural iteration, or successor-like properties. Those claims have since been independently derived/constructed downstream in their own units and PDSA cycles.

## Epistemic status

- `U` and `ε`: DECLARED CONSTITUTIVE CHOICES
- `⊙`: DEFINED CONSTRUCTIONALLY
- empty behavior: DECLARED / DEFINITIONAL
- reassociation as structurally irrelevant: DECLARED CHOICE via `TCT-BR-010`
- downstream terminal/decomposition/iteration/extension results: NOT DERIVED BY THIS BLOCK; see downstream units
- natural-number notions: NOT INTRODUCED

## Current downstream state

```text
TCT-BLOCK-002  ACTIVE
TCT-BR-010     ACTIVE
TCT-BR-009     ACTIVE / DERIVED
TCT-J-001      PASS / RESOLVED
TCT-BLOCK-003  ACTIVE
TCT-BLOCK-004  ACTIVE
TCT-BLOCK-005  ACTIVE
```

## Sensitivity

- Changing `U`: retest formation and all descendants.
- Changing `ε`: retest identity-dependent constructions.
- Changing `⊙`: high-impact retest of the downstream graph.
- Changing the relation between `≡` and `≈`: retest `TCT-BR-010`, `TCT-BR-009`, `TCT-J-001`, and affected descendants.

## Legacy source

`LAB/BUILDING/reverse/TCT-001_CONSTRUCTION_KERNEL.md`

The legacy source remains preserved and is not the canonical identity of this unit.

Historical bare `=` notation in that source is interpreted through the later equality/identity audit rather than silently rewritten in place.

## Acceptance condition

The Block is canonical only while its explicit construction can be reviewed independently and without hidden numerical premises, and while its identity conventions remain explicitly separated from downstream structural theorems.

Verification/downstream wording synchronized during `PDSA-TCT-008`; internal-component granularity normalized during `PDSA-ARCH-002` without changing the mathematical construction.
