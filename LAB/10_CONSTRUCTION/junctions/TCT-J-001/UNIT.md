# TCT-J-001 — Canonical Decomposition Junction

## Canonical Identity

- **Unit ID:** `TCT-J-001`
- **Type:** Junction
- **Layer:** L1 — explicit constructed structure
- **Operational Status:** **CONDITIONAL / PENDING**
- **Epistemic Status:** **PENDING**

## Purpose

Compatibility gate between finite normal-form configuration formation and canonical last-step decomposition under the active structural-equivalence specification.

## Incoming

```text
TCT-BLOCK-002   finite normal-form presentations + meta-level recovery procedure
TCT-BR-010      active structural-equivalence definition ≈
```

## Current constraint / discovered requirement

`TCT-BR-009 — Terminal Interface Preservation`

## Outgoing

`TCT-BLOCK-003` — RESERVED until this Junction passes.

## Junction question

For a non-empty meta-finitely presented configuration in the selected normal form, can the final construction step be recovered in a way invariant under `TCT-BR-010` structural equivalence?

## Recovery is not yet an ordered-pair-valued object function

The current `recover` notation denotes a meta-level inspection record, not a constructed ordered pair in the TCT object domain.

Therefore the Junction does **not** use the ambiguous statement:

```text
recover(A) ≈ recover(B)
```

because `≈` is not defined on recovery meta-records.

## Required condition

Let selected normal-form presentations be given by:

```text
A ≡ P ⊙ U
B ≡ Q ⊙ U
```

with the base non-empty presentation `U` understood as having meta-level predecessor record `ε`.

If:

```text
A ≈ B
```

under `TCT-BR-010`, then canonical recovery requires both:

```text
1. the recovered terminal role on each presentation corresponds to the
   same distinguished U-role;

2. P ≈ Q.
```

The core cancellation form to be proved/refuted is:

```text
P ⊙ U ≈ Q ⊙ U  ⇒  P ≈ Q
```

for the TCT-generated normal-form family.

## Acceptance states

```text
PASS
    The required condition is derived under TCT-BR-010 with independent evidence.

CONDITIONAL
    The condition is available only by retaining an explicit additional
    constraint such as TCT-BR-009.

FAIL
    A countermodel exists under the selected ≈, requiring redesign or branch.
```

Only PASS permits unconditional promotion of `TCT-BLOCK-003` on the current path.

A deliberately conditional construction would require a separate architectural decision rather than silent promotion.

## Current status

**CONDITIONAL / PENDING VERIFICATION.**

Historical work established deterministic recovery inside the selected normal form and exposed `TCT-BR-009` as an additional requirement under the previous incomplete `≈` specification.

`PDSA-TCT-003` has now supplied the explicit current-path relation `TCT-BR-010` without building terminal preservation into its definition.

The Junction must therefore be retested under that exact relation.

## Next verification cycle

`PDSA-TCT-004 — Terminal Recovery Theorem / Countermodel`

Required discipline:

- attempt a constructive derivation under `SE-1` through `SE-4` of TCT-BR-010;
- search for a countermodel satisfying exactly those clauses but violating recovery;
- distinguish a theorem about the specific generated relation from an invalid appeal to generic congruence;
- do not use numerical counting as object-level content.

## Sensitivity

Changes to any of the following reopen this Junction:

```text
TCT-BLOCK-002 grammar or normal form
TCT-BR-010 generators / closure clauses
TCT-BR-009 status or condition
meta/object identity convention
terminal-role specification
```

A change may affect decomposition, structural depth, successor, and formal-domain construction.

## Legacy source

`LAB/BUILDING/reverse/TCT-J-001_CANONICAL_DECOMPOSITION_JUNCTION.md`

Historical wording is preserved there. The present unit is the canonical interpretation after the PDSA equality/identity audit.
