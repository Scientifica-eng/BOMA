# TCT-J-001 — Canonical Decomposition Junction

## Architectural identity

- **Unit ID:** `TCT-J-001`
- **Type:** `Junction`
- **Layer:** `L1 — explicit constructed structure`
- **Incoming:** `TCT-002`
- **Outgoing:** `TCT-003`
- **Role:** canonicality gate for finite last-step recovery
- **Sensitivity:** high; changes affect decomposition, depth, successor, and all later formal stages

## Purpose

This Junction is the explicit compatibility gate between:

```text
TCT-002
finite configuration formation

        and

TCT-003
canonical last-step decomposition
```

It is deliberately separated from both blocks so that a possible failure of uniqueness cannot be hidden inside either formation or decomposition.

## Inputs

From `TCT-002`:

```text
finite normal-form configuration A
terminal construction block U
structural equivalence ≈
```

## Junction question

For a non-empty finite configuration represented in the chosen normal form, can the final construction step be recovered in a way that is invariant under the declared structural equivalence?

The desired interface is:

```text
A
↓
(predecessor P, terminal U)
```

with the requirement that equivalent representations recover equivalent predecessors and the same terminal role.

## Required compatibility condition

The Junction accepts the decomposition path only if the following implication is established:

```text
A ≈ B
        ↓
recover(A) ≈ recover(B)
```

where `recover(A)` denotes the predecessor configuration together with the terminal-block role.

This is a **structural invariance condition**, not a numerical statement.

## Local canonicality criterion

For every non-empty normalized finite configuration `A`, there must exist a predecessor configuration `P` such that:

```text
A = P ⊙ U
```

in the selected representation.

The stronger uniqueness requirement is:

```text
A = P ⊙ U
A = Q ⊙ U
        ↓
P ≈ Q
```

Thus the predecessor is unique at the level of structural equivalence, even if different documentary representations occur.

## Why this must be a Junction

There are two logically separate questions:

```text
FORMATION
Can A be produced?

DECOMPOSITION
Can A be reduced to its final step?
```

A construction may satisfy the first and fail the second.

The Junction therefore prevents this invalid inference:

```text
finite generation
        ⇏
canonical decomposition
```

## Normal-form route

Under the TCT-002 normal-form convention:

```text
NF ::= ε | U | (NF ⊙ U)
```

Every non-empty normal form has an explicit terminal `U` occurrence.

Therefore a candidate recovery map is:

```text
recover(ε)       = undefined / rejected
recover(U)       = (ε, U)
recover(P ⊙ U)   = (P, U)
```

This map is initially representation-dependent. The Junction's task is to determine whether it descends to structural-equivalence classes.

## Audit of hidden assumptions

The Junction does **not** introduce:

```text
0
1
2
n
cardinality
addition
successor
induction
```

It does require an explicit structural-equivalence notion `≈` strong enough to state representation invariance.

If `≈` itself cannot be defined without numerical or set-theoretic resources, that failure must be recorded here rather than hidden downstream.

## Decision outcomes

The Junction has exactly three admissible outcomes:

### PASS

Canonical recovery is invariant under `≈`.

Then `TCT-003` may construct the predecessor block.

### CONDITIONAL

Recovery is canonical only under an additional structural condition C.

Then C becomes an explicit incoming constraint and must receive its own unit identifier.

### FAIL

Equivalent finite configurations can have inequivalent predecessor recoveries.

Then the current normal form or structural-equivalence design is rejected and a branch must be opened for an alternative construction.

## Sensitivity / change impact

```text
Change TCT-002 formation rule
  → retest this Junction completely

Change normal-form convention
  → retest recovery invariance

Change structural equivalence ≈
  → high-impact retest
  → decomposition may change
  → depth may change
  → successor construction may change
  → formal-domain construction may change
```

## Current status

**CONDITIONAL / PENDING VERIFICATION**

The normalized grammar exposes a final `U` directly, but the project has not yet established the required invariance of recovery under the structural-equivalence relation.

Therefore `TCT-003` must not be upgraded to PASS until this Junction condition is verified.

## Graph position

```text
TCT-001
   │
   ▼
TCT-002
   │
   ▼
TCT-J-001  ← current decision gate
   │
   ├── PASS        → TCT-003
   ├── CONDITIONAL → add explicit constraint unit
   └── FAIL        → branch / redesign
```

## Plan position

Transparent Construction Track — `TCT-J-001`.

Next: **TCT-003 — Canonical Decomposition and Predecessor Block**, only after the Junction condition is satisfied or an explicit additional constraint is installed.
