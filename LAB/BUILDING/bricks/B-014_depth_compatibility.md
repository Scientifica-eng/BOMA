# Brick B-014 — Depth Compatibility Under Extension

**Status:** Provisional
**Type:** Structural stabilization
**Previous Brick:** `B-013`
**Experiment:** `EXP-035`

## Definition

The chosen extension operation is compatible with constructional depth: histories with equal depth remain equal-depth after one application of the extension rule.

```text
same depth
    │ E
    ▼
same new depth
```

## Why this Brick was created

`B-013` identified constructional depth as an invariant candidate but left open whether that abstraction was stable under the basic extension operation. `EXP-035` establishes compatibility for the chosen construction rule.

## Current commitments

1. Equal-depth histories are treated as equivalent for the purpose of the depth abstraction.
2. One extension applied to equal-depth histories yields equal-depth histories.
3. The extension operation therefore induces a well-defined one-step operation on depth classes.
4. The depth abstraction forgets internal token/provenance details while retaining extension depth.
5. The resulting domain is called **candidate pre-numerical** only.
6. No natural-number interpretation is yet imposed.
7. No completed infinite domain is assumed.
8. No arithmetic addition or multiplication is assumed.

## What the Brick gives us

We can now schematically pass from concrete stages to an abstract depth domain:

```text
concrete stage
      │
      ▼
 depth class
      │
      E
      ▼
next depth class
```

The crucial point is that the operation survives the abstraction. We are no longer merely describing histories after the fact; we have a constructional operation acting on the abstraction itself.

## What remains open

The candidate pre-numerical domain must now be constructed explicitly from finite histories modulo equal-depth equivalence. We then need to test whether it has a distinguished initial element and a one-step operation with the required structural properties.

Only after that should we consider whether numerical interpretation is justified.

## Epistemic status

**Provisional / abstraction stabilized.**
