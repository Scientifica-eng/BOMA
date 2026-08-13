# EXP-026 — Preservation Plus Extension

**Context:** `B-002`, `B-004`, `EXP-025`  
**Status:** Provisional

## 1. Intention / Goal

Test whether the construction can extend an existing referable result while preserving the earlier result as part of the new constructional state.

The target is deliberately weaker than a successor operation: we do not assume that the new outcome is a number, that it is distinct from the old result, or that the extension is unique.

## 2. Experiment

Start with the existing referable result `r` and introduce a new constructional act `E` intended to produce an extended state `e` in which `r` remains available.

Schematic form:

```text
r ──E──► e
     │
     └── r remains available within e
```

The preservation requirement is part of the experiment: the new construction may add structure but must not erase the prior result.

## 3. Result

The experiment can be specified coherently. We can distinguish the idea of an **extension** from the idea of a replacement: `e` is a later constructional state that retains access to `r` while allowing additional construction.

However, the experiment does not establish that `e` is a new object distinct from `r`. Nor does it establish a canonical extension operation. The operation `E` is an explicit choice.

This gives us a candidate structural pattern:

> **preserve what has been constructed, then add something without erasing the prior construction.**

This pattern is promising for a counting construction because repeated growth could preserve earlier stages. But no numerical interpretation is licensed yet.

## 4. Decision

Accept the preservation-plus-extension pattern as a provisional constructional capability and create a Brick for it.

Do not call it successor. Do not impose uniqueness, injectivity, order, or numerical meaning.

## 5. Epistemic Status

`Provisional / chosen construction`

## 6. Next Cycle

Test whether the extension can add a new referable output token while preserving the old one. This will determine whether the pattern can generate a growing sequence of distinguishable constructional stages.
