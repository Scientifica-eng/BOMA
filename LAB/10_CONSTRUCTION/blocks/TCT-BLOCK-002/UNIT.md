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
meta-finitely presented selected normal-form configurations
meta-level terminal-step recovery procedure
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

`TCT-J-001` is the explicit canonicality gate for terminal-step recovery and has been independently verified under `TCT-BR-010` by `PDSA-TCT-004`.

## Formation and metatheory boundary

The normal-form grammar is interpreted under `BOMA-META-TCT-001` as a meta-level formation specification.

A presented configuration is admitted when it carries an explicit meta-finite formation/derivation according to the grammar. This does not assert a completed global set/type of all finite configurations and does not assign a natural-number-valued size.

## Selected canonical normal-form grammar

`PDSA-TCT-004` found a representational redundancy in the historical grammar:

```text
NF ::= ε | U | (NF ⊙ U)
```

because the current definitional convention gives:

```text
ε ⊙ U ≡ U.
```

The selected canonical grammar is therefore refined to:

```text
NF  ::= ε | NF+
NF+ ::= U | (NF+ ⊙ U)
```

This refinement excludes explicit `ε` inside a non-empty selected normal form.

It does **not** change the constructional content of the track and introduces no numerical indexing. It removes a definitional duplicate so that presentation-level uniqueness can be stated cleanly.

Historical documents retain the earlier grammar as provenance.

## Normal-form identity convention

For selected normal-form presentations:

```text
≡  denotes meta-level definitional / selected-presentation identity
≈  denotes object-level structural equivalence as specified by TCT-BR-010
```

The normal-form convention is a **DECLARED CHOICE** and must not itself be confused with a proof that arbitrary structural-equivalence classes possess canonical representatives beyond the verified current scope.

## Recovery procedure

Recovery is currently a **meta-level inspection procedure on selected normal-form syntax**.

It is defined schematically by:

```text
recover(U)
  ≔ meta-record { predecessor: ε, terminal-role: distinguished U }

recover(P ⊙ U)
  ≔ meta-record { predecessor: P, terminal-role: distinguished U }
```

for `P ∈ NF+`.

The meta-record notation does **not** introduce an object-level ordered-pair construction or equality on ordered pairs.

Inside the selected normal form, the terminal `U` is syntactically visible and recovery is deterministic as a presentation-level inspection.

## Verification status

**PASS** for meta-finite configuration formation and explicit selected normal-form generation.

**PASS** for deterministic terminal inspection inside the selected normal-form presentation.

**PASS under TCT-BR-010** for invariance of predecessor/terminal recovery modulo `≈`, by:

`LAB/PDSA/experiments/PDSA-TCT-004-TERMINAL-RECOVERY-PROOF-001.md`.

The theorem is scoped to the present selected normal-form family and current BR-010 relation.

## Epistemic status

- formation procedure: CONSTRUCTED relative to declared grammar/metatheory
- normal-form convention: DECLARED CHOICE
- refined NF grammar: DECLARED REPRESENTATION REFINEMENT
- terminal visibility in selected NF: CONSTRUCTED / SYNTACTIC
- recovery procedure on NF syntax: META-LEVEL DEFINITION
- recovery invariance modulo BR-010: DERIVED
- numerical indexing: NOT INTRODUCED
- completed global carrier: NOT INTRODUCED

## Structural-equivalence dependency

The current path uses:

`TCT-BR-010 — Reassociation-Generated Structural Equivalence`.

The recovery theorem depends on the exact BR-010 generation rules and must be retested if those rules change.

## Sensitivity

- Changing the formation grammar requires retesting normal forms, recovery, decomposition, depth, and successor.
- Changing only the normal-form convention requires representation-invariance retesting.
- Changing structural equivalence has high downstream impact.
- Promoting recovery from a meta-level inspection to an object-level function requires an explicit new construction/formalization step.
- Reintroducing explicit `ε` inside non-empty selected normal forms reopens the presentation-injectivity proof used by PDSA-TCT-004.

## Legacy source

`LAB/BUILDING/reverse/TCT-002_FINITE_CONFIGURATION_FORMATION.md`

The legacy source remains preserved and is not the canonical identity of this unit.

Historical use of the earlier grammar, bare `=`, and pair notation in recovery examples is interpreted through the later PDSA equality/identity and recovery audits.
