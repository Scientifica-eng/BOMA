# EXTERNAL-INTERPRETATION-005 — Canonicity and Uniqueness

## Status

Phase 8 — External mathematical interpretation.

## Question

Does the framework-neutral structural core determine one mathematical interpretation uniquely, or does canonicity require an additional commitment?

## Structural evidence available before framework choice

The current core supports:

- a distinguished initial structural role;
- one elementary extension role;
- finite construction histories;
- decomposition of a finite history into elementary extensions;
- history composition;
- operational associativity of sequential composition;
- a candidate neutral empty history;
- construction depth as an invariant of finite construction;
- local referenceability without a prior global mathematical domain.

These observations do not by themselves select a unique formal foundation.

## Test

Compare whether the same pre-formal behavior admits materially different formal readings and identify what would make one interpretation canonical.

### Free-monoid reading

A formal free-monoid interpretation can make the elementary extension a generator and history composition the monoid operation. To call the result *free* requires a universal property beyond the observed finite behavior.

### Peano-style reading

A formal successor interpretation can make the initial role a distinguished element and elementary extension a successor map. To identify the intended totality, a closure/induction principle is required in the relevant formal setting.

### Initial-algebra reading

An initial-algebra interpretation can make the base and successor-like constructors explicit and use initiality to characterize the generated object. Initiality is an additional universal-property commitment.

### Natural-number-object reading

A categorical natural-number-object interpretation similarly uses a universal property to identify the intended object. This again adds categorical infrastructure not present in the pre-formal core.

## Result

The pre-formal core is **not canonically identified with one unique mathematical framework by the evidence obtained so far**.

The core supports several respectable interpretations. Uniqueness therefore cannot be claimed merely from structural resemblance.

A canonical interpretation requires an additional criterion. At least three kinds are possible:

1. **Structural minimality** — prefer the interpretation adding the least extra structure needed for the target claims.
2. **Universal characterization** — prefer a framework in which the intended structure is uniquely characterized by a universal property.
3. **Explicit convention** — declare a framework as a project-level choice, without claiming it was uniquely forced by the pre-formal construction.

The project should not silently replace (3) by (1) or (2).

## Important distinction

There is a difference between:

> the structure has a unique interpretation *up to isomorphism inside a chosen framework*

and:

> the pre-formal evidence uniquely determines the framework itself.

The former may hold after a framework is chosen; the latter is not established.

## Decision

Do not declare ℕ or any specific formal framework to be uniquely forced yet.

The next test should compare the **minimal formal completion** needed to obtain a canonical object in each candidate framework, and determine whether those costs are genuinely comparable or depend on the chosen logical language.

## Plan position

Stage 8 — External mathematical interpretation.
