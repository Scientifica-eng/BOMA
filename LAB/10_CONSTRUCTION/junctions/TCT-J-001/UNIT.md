# TCT-J-001 — Canonical Decomposition Junction

## Canonical Identity

- **Unit ID:** `TCT-J-001`
- **Type:** Junction
- **Layer:** L1 — explicit constructed structure
- **Operational Status:** **PASS / RESOLVED**
- **Epistemic Status:** **DERIVED / VERIFIED UNDER TCT-BR-010**

## Purpose

Compatibility gate between selected generated normal-form presentations and canonical last-step decomposition under the active structural-equivalence specification.

## Incoming

```text
TCT-BLOCK-002   selected normal-form presentations + meta-level recovery procedure
TCT-BR-010      active structural-equivalence definition ≈
TCT-BR-009      terminal preservation theorem, derived under BR-010
```

## Outgoing

`TCT-BLOCK-003 — Canonical Decomposition`, now ACTIVE after its independent construction/verification cycle.

## Junction question

For a non-empty presentation supplied with a meta-finite derivation and expressed in the selected normal form, can the final construction step be recovered in a way invariant under `TCT-BR-010` structural equivalence?

## Recovery is a meta-level inspection record

The current `recover` notation denotes a meta-level inspection record, not a constructed ordered pair in the TCT object domain.

The Junction therefore tests predecessor equivalence and terminal-role correspondence directly.

## Required condition

For selected non-empty normal forms:

```text
U
```

or:

```text
A ≡ P ⊙ U
B ≡ Q ⊙ U
```

with `P,Q ∈ NF+`, if:

```text
A ≈ B
```

under `TCT-BR-010`, then:

```text
1. the recovered terminal roles correspond to the same distinguished U-role;
2. P ≈ Q.
```

The extension-extension core is:

```text
P ⊙ U ≈ Q ⊙ U  ⇒  P ≈ Q.
```

The base `U` case recovers predecessor `ε`; a base/extension cross-equivalence is excluded by the ordered-trace invariant proved in PDSA-TCT-004.

## Verification evidence

Primary proof:

`LAB/PDSA/experiments/PDSA-TCT-004-TERMINAL-RECOVERY-PROOF-001.md`

The proof establishes:

1. every `TCT-BR-010` derivation preserves an external ordered syntax trace;
2. the refined selected normal-form grammar has injective trace presentation;
3. final-marker cancellation at the meta level yields predecessor trace equality;
4. predecessor trace equality yields selected-presentation identity, hence predecessor structural equivalence by SE-1;
5. ordered trace preservation also preserves the structurally terminal `U` role.

No object-level numerical counting, cardinality, natural-number length, completed quotient carrier, or ordered-pair ontology is used.

## Acceptance result

```text
PASS
```

The required condition is DERIVED under TCT-BR-010 for the current selected normal-form family.

## Historical progression

```text
initial normal-form recovery
    ↓
syntactically deterministic but ≈ unspecified
    ↓
TCT-J-001 CONDITIONAL
    ↓
TCT-BR-009 exposed as additional requirement
    ↓
TCT-BR-010 defines explicit restricted ≈
    ↓
PDSA-TCT-004 proves terminal preservation
    ↓
TCT-J-001 PASS / RESOLVED
    ↓
PDSA-TCT-005 constructs TCT-BLOCK-003
```

The earlier CONDITIONAL state remains valid historical evidence.

## Current consequence

The gate has already permitted and been consumed by:

```text
TCT-BLOCK-003  ACTIVE — Canonical Decomposition
TCT-BLOCK-004  ACTIVE — Structural Iteration History
TCT-BLOCK-005  ACTIVE — Successor-Like Extension Structure
```

Passing this Junction did not itself construct those downstream units; each received its own PDSA cycle.

## Sensitivity

Changes to any of the following reopen this Junction:

```text
TCT-BLOCK-002 grammar or selected normal form
TCT-BR-010 generators / closure clauses
meta/object identity convention
empty definitional convention
terminal-role specification
single-generator kernel assumptions relevant to the proof
```

A reopened Junction affects all dependent active Blocks and future formalization work.

## Legacy source

`LAB/BUILDING/reverse/TCT-J-001_CANONICAL_DECOMPOSITION_JUNCTION.md`

Historical wording is preserved there. The present unit is the canonical state after PDSA-TCT-003 through PDSA-TCT-008 synchronization.
