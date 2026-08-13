# EXP-028 — Iterated Cumulative Growth

**Context:** `B-007`  
**Status:** Provisional

## 1. Intention / Goal

Test whether the incremental token-extension pattern can be applied repeatedly, preserving all previously available tokens while adding one new provenance-distinguished token at each accepted stage.

## 2. Experiment

Starting from the state with `r₁`, apply the strengthened extension rule twice:

```text
state₁: r₁
   │ E
   ▼
state₂: r₁, r₂
   │ E
   ▼
state₃: r₁, r₂, r₃
```

The labels are constructional provenance labels. They are not numerals.

## 3. Result

The pattern can be iterated for the tested finite number of stages. The second extension preserves `r₁` and `r₂` and introduces a new token `r₃`.

Thus the construction now supports a finite cumulative-growth pattern:

```text
r₁
r₁,r₂
r₁,r₂,r₃
```

The result is stronger than the existence of two tokens, because it demonstrates repeatable finite growth under the chosen rule. Nevertheless, it does not by itself establish unboundedness, infinity, or a natural-number structure. Nor does it establish that the stages have an intrinsic numerical identity.

A useful distinction has now emerged between:

- a **token** produced in the construction; and
- a **stage** consisting of the currently retained constructional history/tokens.

## 4. Decision

Accept the tested finite iteration as a provisional consequence of `B-007` and record the existence of cumulative finite stages.

Do not yet create a Brick for infinity or natural numbers. The next question is whether the construction can be generalized as a rule schema for any finite number of iterations, rather than merely observed for the three tested stages.

## 5. Epistemic Status

`Provisional empirical/constructional result`

## 6. Next Cycle

Test the generalization from the observed finite cases to an explicit rule schema: given any already constructed finite stage, can the extension rule produce a further stage preserving all previous tokens and adding exactly one new token?
