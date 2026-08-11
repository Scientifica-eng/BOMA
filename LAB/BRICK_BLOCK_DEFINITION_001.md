# Brick / Block — Provisional Project Definition 001

**Cycle:** `PDCA-001`  
**Status:** Provisional project definition; not source-level BOMA definition  
**Evidence:** E-011, E-012

## 1. Scope

This document defines the terminology proposed for the **BOMA project being constructed here**. It does not rewrite or retroactively reinterpret BOMA I or BOMA II.

The source architecture must continue to be cited using its own terminology.

## 2. Brick

A **Brick** is the smallest intentionally constructed semantic unit that the project elects to expose as an independently identifiable construction commitment.

A Brick must have:

1. an explicit identity;
2. an explicit intended semantic commitment;
3. explicit dependencies, if any;
4. a boundary that is meaningful at the project's architectural level;
5. a record that permits its construction and verification status to be traced.

A Brick is **not** defined merely by:

- being syntactically small;
- being backend-separable;
- being represented by one Lean declaration;
- having no dependencies.

## 3. Dependency

A Brick may depend on another Brick.

Therefore:

```text
dependency ≠ non-Brick
```

The dependency must be explicit and the dependent Brick must contribute a distinct semantic commitment.

## 4. Block

A **Block** is a deliberately composed architectural unit consisting of one or more Bricks whose composition has an explicit architectural purpose.

A Block is not merely an arbitrary folder, namespace, file, or list of Bricks.

A Block should expose at least:

```text
members
composition purpose
inter-member dependencies
exported commitments
verification status
```

## 5. Composition relation

The intended relation is:

```text
Brick
  ├── Brick
  └── Brick
       │
       ▼
     Block
```

But composition does not erase identity:

```text
Block
  ├── preserves Brick identities
  ├── preserves dependency provenance
  └── adds a composition-level commitment
```

## 6. Atomicity

`Brick` must not be equated with source-level `Atomic Block`.

Source-level `Atomic Block` is a BOMA I concept. Project-level `Brick` is a construction-unit concept.

A Brick may therefore have dependencies while an Atomic Block, under the source definition, has none.

## 7. Positive case

Candidate:

```text
P = established object-domain commitment
S = successor-forming commitment over P
```

If `S` has an independently meaningful identity, explicit dependency on `P`, and a distinct semantic commitment, then `S` may be a Brick.

Expected result: **Brick candidate = YES**.

## 8. Negative case

Candidate:

```text
successor : X → X
```

where `X` has no independently specified semantic carrier/domain in the candidate's architectural context.

Expected result: **Brick candidate = NO**, because the candidate lacks an independently complete intended commitment.

## 9. Block positive case

Candidate:

```text
B = {Brick A, Brick B}
```

where their composition establishes an architectural capability that neither record represents alone, and the composition has explicit exported commitments.

Expected result: **Block candidate = YES**.

## 10. Block negative case

Candidate:

```text
B = arbitrary collection of unrelated Bricks
```

with no composition purpose, no added commitment, and no architectural relation.

Expected result: **Block candidate = NO**.

## 11. Relationship to BOMA I / BOMA II

This terminology is a project-level refinement motivated partly by BOMA II's use of `Minimal-Brick Construction`, but it is not claimed to be the formal terminology of the source documents.

BOMA I's formal `Block` and `Atomic Block` remain source concepts and must be referred to as such when discussing the original architecture.

## 12. Decision gate

This definition remains provisional until the four concrete cases above are tested and the results are recorded in the PDCA evidence ledger.

If a case contradicts the definition, the definition must be revised rather than the evidence being forced to fit it.
