# Brick B-013 — Constructional Depth as an Invariant

**Status:** Provisional
**Type:** Structural abstraction candidate
**Previous Brick:** `B-012`
**Experiment:** `EXP-034`

## Definition

The extension depth of a constructed stage is treated as a structural invariant of its construction history, distinct from the identity of the particular stage.

Two stages may have equal depth without being identical constructional results; stages with different depths are distinguishable by their recorded extension histories.

## Why this Brick was created

`B-012` established finite reachability. `EXP-034` showed that the length of a finite construction history can be abstracted away from the particular tokens and provenance of the resulting stage.

This suggests a candidate abstraction:

```text
particular stage → depth class
```

The abstraction is not yet identified with a natural number.

## Current commitments

1. Constructional depth is distinct from full stage identity.
2. Equal depth does not force identity of stages.
3. Different depths are structurally distinguishable.
4. A depth class may forget internal token/provenance details.
5. No numerical names are assigned to depth classes.
6. No set-theoretic quotient construction is assumed yet.

## What the Brick gives us

A possible route from concrete construction to abstract quantity:

```text
concrete history
      │
      ▼
   depth
      │
      ▼
 depth class
```

This is the first Brick that explicitly separates **what was constructed** from **how many extension steps were used to construct it**.

## What remains open

We must test whether depth equivalence is stable under extension: if two histories have the same depth, does applying one extension to each produce histories that again have the same depth? If yes, extension may descend to the depth abstraction and generate a pre-numerical successor structure.

## Epistemic status

**Provisional / abstraction candidate.**
