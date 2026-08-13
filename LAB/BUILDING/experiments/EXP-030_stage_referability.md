# EXP-030 — Stage Referability

**Context:** `B-008`  
**Status:** Provisional

## 1. Intention / Goal

Test whether a completed finite constructional stage can itself become a referable result, so that the relation between a stage and its extension can be represented explicitly.

## 2. Experiment

Take a completed stage `S` and assign it a reference token `σ(S)` representing that stage as a constructional result. Then apply the extension rule:

```text
S ──reference──► s
S ──E──────────► S⁺
```

The reference `s` is intended to denote the completed stage, not merely one of its internal tokens.

## 3. Result

The construction can coherently distinguish two levels of referability:

- referability of tokens produced within a stage;
- referability of the stage itself as a completed constructional result.

Once stages are referable, the extension operation can be recorded as a relation between two referable stages:

```text
s ──E──► s⁺
```

where `s` refers to `S` and `s⁺` refers to `S⁺`.

This is a significant structural gain. The construction now supports a candidate immediate-extension relation between stages. However, the relation has not yet been shown to be a successor relation in the mathematical sense: uniqueness, totality, injectivity, induction, and numerical interpretation remain unproved.

## 4. Decision

Accept stage referability as a provisional constructional capability and create a Brick for it.

Record the immediate-extension relation as a candidate structural relation, not yet as successor.

## 5. Epistemic Status

`Provisional / chosen representation`

## 6. Next Cycle

Test whether each completed stage has exactly one designated immediate extension under the chosen rule, and whether each non-initial stage has exactly one designated immediate predecessor. This will test whether the candidate relation has the local structure required of a successor chain.
