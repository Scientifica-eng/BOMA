# TCT-J-001 Verification 001 — Recovery Invariance

## Purpose

Test the canonicality gate independently of TCT-BLOCK-003.

Question: does last-step recovery depend only on the structural-equivalence class, rather than on the chosen normal-form representation?

## Required condition

For finite normalized configurations A and B:

```text
A ≈ B  →  recover(A) ≈ recover(B)
```

where recovery returns the predecessor configuration together with the terminal role U.

## Test family

The first non-empty constructions are represented by:

```text
U
U ⊙ U
(U ⊙ U) ⊙ U
((U ⊙ U) ⊙ U) ⊙ U
```

For each construction, compare:

1. its selected normal form;
2. any alternative parenthesization admitted by the structural-equivalence relation;
3. the recovered predecessor;
4. the recovered terminal role.

## Observation

Within the currently declared normal-form grammar, recovery is syntactically deterministic:

```text
recover(U)     = (ε, U)
recover(P ⊙ U) = (P, U)
```

Therefore recovery is uniquely specified **inside the selected normal form**.

However, this does not by itself prove invariance under arbitrary structural equivalence. That requires a theorem connecting `≈` with terminal-interface preservation.

## Hidden requirement exposed

TCT-J-001 therefore depends on the following additional structural condition:

> Structural equivalence preserves the distinguished terminal interface and maps equivalent terminal decompositions to equivalent predecessor configurations.

This is not numerical and does not introduce natural-number indexing, but it is an additional admissibility condition on `≈`.

## Decision

**CONDITIONAL**

The Junction is not promoted to PASS yet.

The finite normal form gives a deterministic recovery procedure, but full representation-invariance requires the explicit terminal-interface preservation condition above.

## Consequence

TCT-BLOCK-003 must not be promoted to a canonical predecessor theorem until the added condition is either:

- proved from the existing definition of `≈`, or
- elevated to an explicit Brick/Junction constraint with its own verification.

## Status

`TCT-J-001`: CONDITIONAL / PENDING

## Graph effect

```text
TCT-BLOCK-002
      │
      ▼
TCT-J-001
      │
      ├── current result: CONDITIONAL
      │
      └── next: explicit terminal-interface constraint
```
