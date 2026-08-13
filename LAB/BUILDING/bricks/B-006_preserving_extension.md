# Brick B-006 — Preservation-Plus-Extension

**Status:** Provisional
**Type:** Chosen constructional operation
**Previous Bricks:** `B-002`, `B-004`
**Experiment:** `EXP-026`

## Definition

We introduce `E` as a constructional operation that extends a current constructional state while preserving access to the previously constructed referable result.

```text
r ──E──► e
     │
     └── r remains available within e
```

## Why this Brick was chosen

The project requires a construction that can grow without automatically erasing what was already built. `EXP-026` tests this pattern without assuming that the extension is a successor or has numerical meaning.

`E` is an explicit choice, not a deduction from previous Bricks.

## Current commitments

1. A constructional state can be extended.
2. The prior referable result remains available after extension.
3. Extension does not automatically imply a new number.
4. Extension does not automatically imply a distinct output.
5. No uniqueness of extension is assumed.
6. No successor relation is assumed.
7. No order or arithmetic is assumed.

## What the Brick gives us

A growth pattern that preserves the past:

```text
state₀
  │
  └──E──► state₁
          │
          └── state₀ remains accessible
```

This is potentially important for an eventual natural-number construction because it permits cumulative growth.

## What remains open

Can `E` be strengthened so that each extension adds a new provenance-distinguished referable token while preserving all previous tokens? If yes, we may obtain a genuine iterative growth structure. If not, this Brick may be insufficient for counting.

## Epistemic status

**Provisional / chosen construction.**
