# CONSTRUCTION-GRAPH-001 — Transparent Construction Graph

## Status

**Active engineering map**  
Track: `Transparent Construction Track`  
Cycle: `PDCA-001`

## Purpose

This document is the human-readable map of the construction system. It is not itself a mathematical theorem. It records where each construction unit sits, what it consumes, what it produces, and which units are affected by a change.

## Current graph

```text
                           START
                             │
                             ▼
                    ┌─────────────────┐
                    │ KERNEL BLOCK    │
                    │ TCT-001         │
                    └────────┬────────┘
                             │
                 CONSTRUCTS  │
                             ▼
              ┌──────────────────────────┐
              │ FINITE CONFIGURATION     │
              │ BLOCK TCT-002            │
              └────────────┬─────────────┘
                           │
                    VERIFICATION
                           │
                           ▼
                   ┌──────────────┐
                   │ TCT-J-001    │
                   │ Canonical    │
                   │ decomposition│
                   └──────┬───────┘
                          │
                          ▼
                    TCT-003 pending
                          │
                          ▼
                    depth / stage
                          │
                          ▼
                     successor
                          │
                          ▼
                  formal natural numbers
```

## Node registry

| ID | Type | Role | Status |
|---|---|---|---|
| TCT-001 | Block | construction kernel: `ε`, `U`, `⊙` | active / established as declared kernel |
| TCT-002 | Block | finite configuration formation and normal form | PASS on formation; decomposition pending |
| TCT-J-001 | Junction | decomposition compatibility gate | pending |
| TCT-003 | Block | canonical last-step decomposition | pending |
| TCT-004 | Block | construction depth | pending |
| TCT-005 | Block | successor-stage construction | pending |
| TCT-006 | Block | formal natural-number domain | pending |

## Edge registry

### `TCT-001 → TCT-002`

Relation: `COMPOSES / DEPENDS_ON`

Meaning: TCT-002 uses the kernel objects and concatenation interface from TCT-001 to generate finite configurations.

### `TCT-002 → TCT-J-001`

Relation: `VERIFIES / MEETS_AT`

Meaning: TCT-J-001 is the gate at which the generated normal forms are tested for decomposition invariance.

### `TCT-J-001 → TCT-003`

Relation: `CONSTRAINS / DEPENDS_ON`

Meaning: TCT-003 cannot claim canonical decomposition until the junction condition is satisfied.

## Horizontal structure

Current horizontal peers do not yet exist in the active construction path. When alternative kernels or alternative normalization conventions are introduced, they must be represented as explicit siblings:

```text
TCT-A-001  ALTERNATIVE_TO  TCT-A-002
```

The original is never silently replaced.

## Vertical structure

Current vertical chain:

```text
kernel
  ↓
finite configurations
  ↓
canonical decomposition
  ↓
depth
  ↓
successor
  ↓
formal domain
  ↓
ℕ realization
```

## Change-impact rule

A reviewer changing a node must inspect all outgoing dependency edges.

Example:

```text
Change TCT-001
   ↓
retest TCT-002
   ↓
retest TCT-J-001
   ↓
retest TCT-003
   ↓
possibly invalidate depth/successor/domain blocks
```

A change to TCT-002 does not automatically invalidate TCT-001, but it may invalidate every downstream node that depends on the formation or equivalence interface.

## Architectural rule

No mathematical claim may be promoted from `pending` to `accepted` merely because a downstream document exists. The node itself and its incoming edges must pass verification.

## Plan position

Transparent Construction Track — Graph 001.

Next architectural action: complete TCT-J-001 and then TCT-003.
