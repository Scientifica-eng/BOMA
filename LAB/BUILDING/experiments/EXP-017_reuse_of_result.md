# EXP-017 — Reuse of a Referable Constructional Result

**Brick / context:** `B-002`  
**Status:** Provisional

## 1. Intention / Goal

Test the first concrete consequence of `B-002`: whether a referable constructional result `r` can be used as the input/context for a further construction without adding numerical structure.

## 2. Experiment

Take the referable result `r` produced in `B-002` and apply a new constructional act `κ` whose input is explicitly `r`.

We do not assume that `κ(r)` is different from `r`, nor that it is equal to `r`. We only record that the construction is permitted to take `r` as its input.

Schematic form:

```text
δ → r
    │
    └── κ(r)
```

The new act `κ` is another explicit constructional choice.

## 3. Result

The experiment succeeds operationally: once `r` is admitted as a referable result, it can be used as the locus/input of a further construction.

This yields a new distinction between:

- a constructional result being available for reference; and
- a construction being performed on that result.

However, nothing yet establishes that `κ(r)` is a new entity. In particular, we must not infer a successor, inequality, or multiplicity merely from the fact that another construction has been performed.

The experiment therefore reveals an important asymmetry: **reusability of a result is available before novelty of the resulting outcome is established.**

## 4. Decision

Accept the ability to use a referable constructional result as input to another construction as a provisional structural capability.

Do not yet add any principle saying that applying a construction produces a distinct result. Such a principle would be a new choice and must be tested separately.

## 5. Epistemic Status

`Provisional`

## 6. Next Cycle

Test the minimal condition under which the outcome of `κ(r)` can be regarded as distinct from `r`, if such a condition is needed. Explicitly test both possibilities: the construction may preserve the result, or it may generate a distinguishable outcome.
