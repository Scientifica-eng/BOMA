# TCT-BLOCK-002 — Finite Configurations

## Canonical Identity

- **Unit ID:** `TCT-BLOCK-002`
- **Type:** Block
- **Layer:** L1 — explicit constructed structure
- **Operational Status:** ACTIVE

## Purpose

Construct the meta-finitely presented configuration family generated from the TCT-BLOCK-001 kernel without numerical indexing.

## Inputs

```text
ε  empty configuration
U  elementary block
⊙  compatible concatenation
```

## Outputs

```text
meta-finitely presented normal-form configurations
candidate terminal-step recovery procedure
```

## Internal candidate Bricks

```text
TCT-BR-005  Formation
TCT-BR-006  Normal form
TCT-BR-007  Terminal visibility
TCT-BR-008  Recovery candidate
```

These Brick IDs are registry candidates until their individual canonical records are created and verified.

## Dependency

`TCT-BLOCK-001`

## Junction

`TCT-J-001` is the explicit canonicality gate for terminal-step recovery.

## Formation and metatheory boundary

The normal-form grammar is interpreted under `BOMA-META-TCT-001` as a meta-level formation specification.

A presented configuration is admitted when it carries an explicit meta-finite formation/derivation according to the grammar. This does not assert a completed global set/type of all finite configurations and does not assign a natural-number-valued size.

## Normal-form identity convention

For selected normal-form presentations:

```text
≡  denotes meta-level definitional / selected-presentation identity
≈  denotes object-level structural equivalence as specified by TCT-BR-010
```

The normal-form convention is a **DECLARED CHOICE** and must not itself be confused with a proof that structural equivalence has canonical representatives.

## Recovery candidate

Recovery is currently a **meta-level inspection procedure on selected normal-form syntax**.

It should be read schematically as:

```text
recover(U)
  ≔ meta-record { predecessor: ε, terminal-role: distinguished U }

recover(P ⊙ U)
  ≔ meta-record { predecessor: P, terminal-role: distinguished U }
```

The meta-record notation does **not** introduce an object-level ordered-pair construction or equality on ordered pairs.

Inside the selected normal form, the terminal `U` is syntactically visible and recovery is deterministic as a presentation-level inspection.

What remains unresolved is whether that recovery is invariant under `≈`.

## Verification status

PASS for meta-finite configuration formation and explicit normal-form generation.

PASS for deterministic terminal inspection **inside the selected normal-form presentation**.

Canonical decomposition modulo `≈` remains pending independent verification at `TCT-J-001`.

## Epistemic status

- formation procedure: CONSTRUCTED relative to declared grammar/metatheory
- normal-form convention: DECLARED CHOICE
- terminal visibility in selected NF: CONSTRUCTED / SYNTACTIC
- recovery procedure on NF syntax: META-LEVEL DEFINITION
- canonical decomposition modulo `≈`: PENDING
- numerical indexing: NOT INTRODUCED
- completed global carrier: NOT INTRODUCED

## Structural-equivalence dependency

The current path uses:

`TCT-BR-010 — Reassociation-Generated Structural Equivalence`.

`TCT-BLOCK-002` does not claim that this relation preserves recovered predecessors. That is the next theorem/countermodel question.

## Sensitivity

- Changing the formation grammar requires retesting normal forms, recovery, decomposition, depth, and successor.
- Changing only the normal-form convention requires representation-invariance retesting.
- Changing structural equivalence has high downstream impact.
- Promoting recovery from a meta-level inspection to an object-level function requires an explicit new construction/formalization step.

## Legacy source

`LAB/BUILDING/reverse/TCT-002_FINITE_CONFIGURATION_FORMATION.md`

The legacy source remains preserved and is not the canonical identity of this unit.

Historical use of `=` and pair notation in recovery examples is interpreted through the later equality/identity audit.
