# Brick B-012 — Finite Reachability

**Status:** Provisional
**Type:** Structural consequence
**Previous Brick:** `B-011`
**Experiment:** `EXP-033`

## Definition

Every stage that is actually constructed under the current protocol is reachable from the initial stage `s₀` by a finite sequence of extension operations.

```text
s₀ → s₁ → ... → sₖ = S
```

where the recorded construction history contains finitely many extension occurrences.

## Why this Brick was created

`B-011` characterized an initial stage, and `B-010` supplied the successor-like extension relation. `EXP-033` shows that every constructed stage lies at finite extension depth from the initial stage.

This is a structural result about the construction history.

## Current commitments

1. Every actually constructed stage has finite extension depth from `s₀`.
2. The depth is recorded by the construction history.
3. The depth is not yet a natural number.
4. No external enumeration of stages is assumed.
5. No completed infinite domain is assumed.

## What the Brick gives us

The construction now has the form:

```text
initial stage
    │
    ├─ one extension → next stage
    ├─ one extension → next stage
    └─ ...
```

Every stage reached in the actual finite construction has a finite path from the initial stage.

This provides the first concrete candidate for a pre-numerical notion of **depth** or **iteration count**.

## What remains open

We must determine whether finite depths themselves can be distinguished and compared independently of the particular tokens contained in the stages. This is where a numerical structure may begin to emerge.

## Epistemic status

**Provisional structural result.**
