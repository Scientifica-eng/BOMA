# REORIENTATION-001 — Transparent Mathematical Construction from Minimal Starting Point to Natural Numbers

## Status

Active project reorientation — replaces the previous post-hoc interpretation emphasis with an explicit, auditable mathematical construction path.

## Decision

The project target is now stated as:

> Build a transparent mathematical structure, using explicit Bricks / Blocks / geometric configurations where useful, starting from the weakest viable declared starting point and proceeding step-by-step until a formal natural-number structure is obtained.

The project is not satisfied with merely showing that a pre-formal structure can later be interpreted as `N`.

## Construction architecture

The construction will have three simultaneously visible layers:

```text
L0 — Pre-formal / operational starting point
        ↓
L1 — Explicit mathematical construction objects
        ↓
L2 — Formal natural-number realization
```

Every edge between layers must be recorded as one of:

```text
CONSTRUCTED
DERIVED
DECLARED CHOICE
REQUIRES FORMALIZATION
FAILED / REJECTED
```

No edge may be silently justified by resemblance to a known theory.

## Proposed construction vocabulary

The project will use the smallest useful vocabulary discovered so far:

1. **Distinction** — a reproducible difference sufficient to support reference.
2. **Distinguished role** — a structurally singled-out configuration.
3. **Extension block** — one repeatable elementary transformation of the configuration.
4. **Finite history** — a finite composition of extension blocks.
5. **Depth** — the number of extension blocks in the history, represented initially as a construction invariant rather than a pre-given number.
6. **Composition** — sequential concatenation of histories.
7. **Decomposition** — recoverability of the final extension step.
8. **Reachability** — existence of a finite continuation between two stages.

These are constructional interfaces, not yet claims about a particular mathematical ontology.

## Geometric possibility

A geometric realization may be used only when it makes a structural relation easier to inspect than an abstract Brick does.

Candidate geometric primitive:

```text
point/configuration P_0
        ↓ one fixed extension move
P_1
        ↓ same move
P_2
        ↓ ...
```

The geometry is a **representation of the construction**, not its metaphysical foundation. Any property obtained visually must be translated into an explicit mathematical statement before it can count as a result.

## Canonical Brick format

Each construction Brick should contain:

```text
Input state
Construction rule
Output state
Invariant preserved
New structure obtained
Proof/verification
Dependencies
Epistemic status
Failure condition
```

## Initial proposed build path

```text
Brick B-001  Minimal distinction
        ↓
Brick B-002  Distinguished configuration
        ↓
Brick B-003  One repeatable extension
        ↓
Brick B-004  Finite history object
        ↓
Brick B-005  Decomposition / last-step recovery
        ↓
Brick B-006  Composition of histories
        ↓
Brick B-007  Depth invariant
        ↓
Block B-008  Successor-stage correspondence
        ↓
Block B-009  Formal domain choice
        ↓
Block B-010  Natural-number realization
        ↓
Block B-011  Addition
        ↓
Block B-012  Multiplication
        ↓
Block B-013  Order
```

This sequence is provisional. Each Brick is accepted only after construction and verification.

## Separation from previous work

The reverse-engineering and external-interpretation work from Stages 1–10 remains valuable as diagnostic evidence. It is no longer the primary proof path.

Its role is now:

```text
reverse work → identify candidate interfaces / detect hidden assumptions
forward construction → establish the mathematical object explicitly
```

## Formalization boundary

The previously identified constitutive boundary remains explicit:

```text
pre-formal construction
        ↓
formal realization choice
        ↓
formal total natural-number structure
```

The project will not pretend that this boundary has disappeared.

However, the new goal is to minimize the amount of structure imported at that boundary by constructing the preceding mathematical object as explicitly as possible.

## Audit rules

1. No named number system may be used before its defining structure has been constructed or explicitly declared.
2. No counting argument may use natural-number indices before an index structure has itself been introduced.
3. Every use of `0`, `1`, `+`, `×`, or `≤` before formal realization must be replaced by the corresponding constructional vocabulary.
4. A drawing is evidence only for the relations it explicitly represents; it is not a proof by itself.
5. A failed construction must be preserved as a recorded experiment rather than silently replaced.
6. Every successful Brick must identify which assumptions it adds.
7. The final identification with `N` is a conclusion of the construction path under the declared formal regime, not a premise disguised as notation.

## Exit criterion for the reorientation

The reoriented project is successful only when a reviewer can start at B-001, follow every construction rule and verification step, and reach the formal natural numbers without needing to infer omitted mathematical structure from tradition or intuition.

## Current position

This is a project-level reorientation record. No new mathematical theorem is claimed by this document itself.

## Plan position

Reorientation point after completion of Stages 1–10.

Next active stage: **Transparent Construction Track — TCT-001 / B-001 Minimal Distinction**.
