# EXP-023 — Order Sensitivity of Joint Grouping

**Context:** `B-005`  
**Status:** Provisional

## 1. Intention / Goal

Test whether the joint grouping operation `G` depends on the order in which its two referable inputs are presented.

## 2. Experiment

Compare the two constructions:

```text
G(r₁,r₂)
G(r₂,r₁)
```

Do not assume equality or inequality between their outcomes.

## 3. Result

The current construction does not contain a rule identifying the two orderings. It also contains no rule forcing them to differ. Therefore order sensitivity is **underdetermined** at this stage.

This is not merely a failure to decide a fact: it identifies a missing design choice. We have specified that two inputs can be jointly grouped, but we have not specified whether the operation preserves input order.

The construction therefore branches into two legitimate extensions:

- **ordered grouping:** `G(r₁,r₂)` and `G(r₂,r₁)` are retained as potentially different constructions;
- **order-insensitive grouping:** the two presentations are stipulated to yield the same grouping construction.

Choosing either would add structure beyond `B-005`.

## 4. Decision

Do not create a new Brick yet. Preserve the underdetermination explicitly rather than choosing an ordering convention merely for convenience.

This is important for the larger construction: the path to natural numbers should not inherit an unnecessary ordering principle before we know whether it is required.

## 5. Epistemic Status

`Accepted underdetermination`

## 6. Next Cycle

Explore whether the project goal of constructing a finite counting structure gives a reason to choose one branch, or whether both branches should be explored in parallel.
