# Brick B-009 — Stage Referability

**Status:** Provisional
**Type:** Chosen representational capability
**Previous Brick:** `B-008`
**Experiment:** `EXP-030`

## Definition

A completed finite constructional stage may itself be assigned a reference token.

If `S` is a completed stage, write:

```text
S → σ(S)
```

The token `σ(S)` refers to the stage as a whole, not merely to an internal token produced within it.

## Consequence

Because stages are referable, the extension rule can be represented between stage references:

```text
s ──E──► s⁺
```

This yields a candidate immediate-extension relation between referable stages.

## Why this Brick was chosen

`B-008` gave a general finite extension schema, but the stages themselves were not yet explicit referable results. `B-009` closes that representational gap.

The choice to make stages referable is explicit. It is not claimed to be forced by the previous construction.

## Current commitments

1. Completed finite stages can be referred to as constructional results.
2. Stage-reference is distinct from references to tokens internal to the stage.
3. The extension operation can be recorded as a relation between stage references.
4. The relation is not yet called successor.
5. No uniqueness or totality theorem has been established.
6. No natural-number interpretation has been introduced.
7. No induction principle has been introduced.

## What the Brick gives us

A new structural level:

```text
Stage₀ ──E──► Stage₁ ──E──► Stage₂ ──E──► ...
  │              │              │
  ▼              ▼              ▼
 s₀             s₁             s₂
```

The diagram records a candidate chain of referable stages; the ellipsis remains schematic and does not assert a completed infinite object.

## What remains open

Test the local uniqueness properties of the immediate-extension relation: whether each stage has one designated next stage and whether each non-initial stage has one designated previous stage.

## Epistemic status

**Provisional / chosen representation.**
