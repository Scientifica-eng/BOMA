# Brick B-007 — Incremental Token Extension

**Status:** Provisional
**Type:** Chosen strengthening of a constructional operation
**Previous Brick:** `B-006`
**Experiment:** `EXP-027`

## Definition

Strengthen the extension operation `E` so that an extension preserves all previously available referable tokens and makes one new provenance-distinguished token available.

Schematic form:

```text
state₁: {r₁}
       │
       E
       ▼
state₂: {r₁, r₂}
```

The braces are schematic notation only; they do not introduce set theory.

## Why this Brick was chosen

`B-006` established preservation-plus-extension but did not require the extension to add a new distinguishable result. `EXP-027` tests the minimal strengthening needed to obtain genuine cumulative growth.

This strengthening is an explicit choice.

## Current commitments

1. Extension preserves all previously available referable tokens.
2. Each accepted extension can introduce one new provenance-distinguished token.
3. The new token is distinguished by its constructional provenance.
4. No numeral is assigned to a state.
5. No successor function is assumed.
6. No infinity or unboundedness is assumed.
7. The extension rule remains a constructional choice and may later be revised.

## What the Brick gives us

A two-stage cumulative growth pattern:

```text
state₁ → state₂
  r₁      r₁, r₂
```

This is the first Brick that explicitly supports growth in which the past is retained and a new referable token is added.

## What remains open

Whether the same rule can be iterated to produce `r₃`, `r₄`, ... remains an experiment, not an assumption.

If iteration succeeds, we will examine whether a finite-stage structure emerges that can later support natural-number construction.

## Epistemic status

**Provisional / chosen strengthening.**
