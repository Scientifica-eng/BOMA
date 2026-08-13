# Brick B-003 — Reusable Construction Operation

**Status:** Provisional
**Type:** Chosen constructional operation
**Previous Brick:** `B-002`
**Experiment:** `EXP-017`

## Definition

We introduce `κ` as a constructional operation that is permitted to take the referable result `r` of `B-002` as its input.

Schematically:

```text
r ──κ──► κ(r)
```

At this stage `κ(r)` is not declared to be a new object, a new number, or a successor of `r`.

## Why this Brick was chosen

`B-002` established only that a constructional result can be made referable. `B-003` tests the weakest natural use of that capability: using the result as input to another construction.

The choice of `κ` is explicit and experimental. It is not claimed to be forced by `B-002`.

## Current commitments

1. `r` can serve as an input/context for a further construction.
2. A construction applied to `r` need not be assumed to produce something different from `r`.
3. No successor relation is assumed.
4. No inequality is assumed.
5. No numerical multiplicity is assumed.
6. Any claim that `κ(r)` is distinct from `r` requires a later explicit constructional or logical basis.

## What the Brick gives us

The current path now contains a reusable constructional result and an operation acting on it:

```text
B-001        B-002          B-003
  δ   ─────►   r   ─────►   κ(r)
```

The right-hand outcome remains intentionally underdetermined.

## What remains open

The next experiment must determine whether the construction supplies any basis for distinguishing `κ(r)` from `r`. It is equally legitimate at this stage that the operation preserves the result.

## Epistemic status

**Provisional / experimental.**

This Brick records an explicit choice in the construction, not a theorem that the operation is uniquely determined by the preceding Bricks.
