# EXP-027 — Extension with a New Referable Token

**Context:** `B-006`  
**Status:** Provisional

## 1. Intention / Goal

Test whether preservation-plus-extension can add a new provenance-distinguished referable token while retaining the previously available token.

## 2. Experiment

Start from a state containing `r₁` and apply an extension operation `E` that is stipulated to preserve `r₁` and assign a new referable output token `r₂` to the extension occurrence.

```text
state₁: {r₁}
       │
       E
       ▼
state₂: {r₁, r₂}
```

The braces are used only as a schematic notation for the collection of currently available tokens; no set-theoretic interpretation is assumed.

The new-token condition is an explicit strengthening of `B-006`, not a consequence of preservation alone.

## 3. Result

The experiment succeeds as a constructional pattern. We can specify a later constructional state that preserves access to `r₁` and makes a new provenance-indexed token `r₂` available.

This gives a stronger growth pattern than `B-006`:

> extension can preserve the past while adding a new referable token.

However, the experiment still does not establish a general successor function, a natural-number structure, or an intrinsic identity relation between tokens. The distinction of `r₂` is grounded in the explicit provenance rule already introduced in `B-004`.

## 4. Decision

Accept this strengthened growth pattern as a new provisional Brick.

Do not yet call the operation successor. Do not identify the states with numerals. Do not assume that the process is infinite or deterministic beyond the stated constructional rule.

## 5. Epistemic Status

`Provisional / chosen strengthening`

## 6. Next Cycle

Test whether the same extension pattern can be iterated: after producing `r₂`, can another extension preserve both `r₁` and `r₂` while adding `r₃`? The aim is to see whether finite iterative growth emerges before introducing numerical labels.
