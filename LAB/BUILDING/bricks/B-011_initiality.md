# Brick B-011 — Initiality

**Status:** Provisional
**Type:** Structural characterization
**Previous Brick:** `B-010`
**Experiment:** `EXP-032`

## Definition

The initial stage `s₀` is characterized as the designated starting stage of the construction, with no preceding extension occurrence in the construction history.

```text
no predecessor → s₀ → s₁ → s₂ → ...
```

## Why this Brick was created

`B-010` provided a successor-like local chain but did not characterize its starting point. `EXP-032` identified a structural property that distinguishes `s₀` from later stages.

The characterization is relative to the chosen construction history.

## Current commitments

1. `s₀` is the designated initial stage.
2. No preceding extension occurrence is recorded for `s₀`.
3. Every later constructed stage has a recorded immediate predecessor.
4. `s₀` is not yet identified with the number zero.
5. The initiality property is structural, not numerical.
6. No completed infinite domain is assumed.

## What the Brick gives us

A base point for the stage chain:

```text
s₀ → s₁ → s₂ → s₃ → ...
↑
initial
```

The pair of structures now present is:

- an initial stage;
- a successor-like extension relation.

Together they form the basic shape expected of a candidate natural-number chain, but this resemblance is not yet an identification with `ℕ`.

## What remains open

We must determine whether the stage chain, with its initiality and extension rules, can support the characteristic principles of natural numbers without importing them by definition.

In particular, we should test finite reachability from the initial stage and whether the resulting stage system is closed under the extension operation.

## Epistemic status

**Provisional structural result.**
