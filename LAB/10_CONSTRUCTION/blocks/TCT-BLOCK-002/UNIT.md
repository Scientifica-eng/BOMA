# TCT-BLOCK-002 — Generated Selected Configurations

## Canonical Identity

- **Unit ID:** `TCT-BLOCK-002`
- **Type:** Block
- **Layer:** L1 — explicit constructed structure
- **Operational Status:** ACTIVE
- **Terminology note:** historical sources and earlier canonical revisions used “Finite Configurations”; PDSA-TCT-008 refines the canonical title to avoid reading meta-finiteness as an already constructed object-level numerical property.

## Purpose

Construct selected configuration presentations generated from the TCT-BLOCK-001 kernel, each accompanied by an explicit **meta-finite** formation/derivation witness, without numerical indexing or a completed global carrier.

## Inputs

```text
ε  empty configuration
U  elementary block
⊙  compatible concatenation
```

## Outputs

```text
selected generated normal-form presentations with meta-finite witnesses
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

`TCT-J-001` is the explicit canonicality gate for terminal-step recovery and is now PASS / RESOLVED under `TCT-BR-010` by `PDSA-TCT-004`.

## Formation and metatheory boundary

The normal-form grammar is interpreted under `BOMA-META-TCT-001` as a meta-level formation specification.

A presented configuration is admitted when it carries an explicit meta-finite formation/derivation according to the grammar.

This does **not** assert:

```text
a completed global set/type of all generated configurations
an object-level finite cardinality
a natural-number-valued size or depth
```

The canonical title therefore avoids using “finite” as the object-level role name even though every supplied presentation/derivation is meta-finite in the research environment.

## Selected canonical normal-form grammar

`PDSA-TCT-004` found a representational redundancy in the historical grammar:

```text
NF ::= ε | U | (NF ⊙ U)
```

because the current definitional convention gives:

```text
ε ⊙ U ≡ U.
```

The selected canonical grammar is:

```text
NF  ::= ε | NF+
NF+ ::= U | (NF+ ⊙ U)
```

This refinement excludes explicit `ε` inside a non-empty selected normal form.

It does not change the constructional content of the track and introduces no numerical indexing. Historical documents retain the earlier grammar as provenance.

## Normal-form identity convention

For selected normal-form presentations:

```text
≡  meta-level definitional / selected-presentation identity
≈  object-level structural equivalence as specified by TCT-BR-010
```

The normal-form convention is a DECLARED CHOICE and must not itself be confused with a proof that arbitrary structural-equivalence classes possess canonical representatives beyond the verified current scope.

## Recovery procedure

Recovery is a **meta-level inspection procedure on selected normal-form syntax**:

```text
recover(U)
  ≔ meta-record { predecessor: ε, terminal-role: distinguished U }

recover(P ⊙ U)
  ≔ meta-record { predecessor: P, terminal-role: distinguished U }
```

for `P ∈ NF+`.

The meta-record notation does not introduce an object-level ordered-pair construction or equality on ordered pairs.

## Verification status

**PASS** for generated selected-presentation formation with explicit meta-finite witnesses.

**PASS** for deterministic terminal inspection inside selected normal form.

**PASS under TCT-BR-010** for invariance of predecessor/terminal recovery modulo `≈` by:

`LAB/PDSA/experiments/PDSA-TCT-004-TERMINAL-RECOVERY-PROOF-001.md`.

## Epistemic status

- formation procedure: CONSTRUCTED relative to declared grammar/metatheory
- meta-finiteness of supplied witness: META-LEVEL ONLY
- normal-form convention: DECLARED CHOICE
- refined NF grammar: DECLARED REPRESENTATION REFINEMENT
- terminal visibility in selected NF: CONSTRUCTED / SYNTACTIC
- recovery procedure on NF syntax: META-LEVEL DEFINITION
- recovery invariance modulo BR-010: DERIVED
- object-level numerical finiteness/cardinality: NOT INTRODUCED
- completed global carrier: NOT INTRODUCED

## Structural-equivalence dependency

The current path uses:

`TCT-BR-010 — Reassociation-Generated Structural Equivalence`.

The recovery theorem depends on the exact BR-010 generation rules and must be retested if those rules change.

## Current downstream state

```text
TCT-J-001      PASS / RESOLVED
TCT-BLOCK-003  ACTIVE — Canonical Decomposition
TCT-BLOCK-004  ACTIVE — Structural Iteration History
TCT-BLOCK-005  ACTIVE — Successor-Like Extension Structure
```

## Sensitivity

- Changing the formation grammar requires retesting normal forms, recovery, decomposition, structural iteration, and successor-like extension.
- Changing only the normal-form convention requires representation-invariance retesting.
- Changing structural equivalence has high downstream impact.
- Promoting recovery from a meta-level inspection to an object-level function requires an explicit new construction/formalization step.
- Reintroducing explicit `ε` inside non-empty selected normal forms reopens the presentation-injectivity proof used by PDSA-TCT-004.

## Legacy source

`LAB/BUILDING/reverse/TCT-002_FINITE_CONFIGURATION_FORMATION.md`

The legacy source remains preserved and is not the canonical identity of this unit.

Historical use of “finite configurations,” the earlier grammar, bare `=`, and pair notation is interpreted through the later PDSA metatheory, equality/identity, recovery, and calibration audits.
