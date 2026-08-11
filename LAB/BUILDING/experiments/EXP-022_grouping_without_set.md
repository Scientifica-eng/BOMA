# EXP-022 — Grouping Two Referable Tokens Without a Set

**Context:** `B-004`  
**Status:** Provisional

## 1. Intention / Goal

Test whether `r₁` and `r₂`, now available as provenance-distinguished referable tokens, can be treated together in one construction without importing the notion of a set, pair, or number.

## 2. Experiment

Introduce a new constructional act `G` whose input is the jointly specified occurrence of `r₁` and `r₂`.

```text
r₁   r₂
 \   /
   G
   │
   g
```

The symbol `g` denotes the result of the grouping act. It is not initially declared to be a set, ordered pair, unordered pair, or number.

## 3. Result

The construction succeeds at the operational level: two referable tokens can be jointly selected as the input to a further construction.

This reveals a new structural distinction between:

- having multiple referable tokens available; and
- forming a construction whose input consists jointly of those tokens.

However, the experiment does not determine the mathematical nature of `g`. Treating `g` as a set or pair would be an additional choice.

## 4. Decision

Accept the joint-grouping capability provisionally and create a Brick recording it. Do not identify the resulting grouped construction with the cardinal number two.

## 5. Epistemic Status

`Provisional / chosen construction`

## 6. Next Cycle

Test whether grouping is sensitive to order. Compare `G(r₁,r₂)` with `G(r₂,r₁)` without assuming either equality or inequality in advance.
