# TCT-J-001 — Canonical Decomposition Junction

## Canonical Identity

- **Unit ID:** `TCT-J-001`
- **Type:** Junction
- **Layer:** L1 — explicit constructed structure
- **Status:** PENDING

## Purpose

Compatibility gate between finite configuration formation and canonical last-step decomposition.

## Incoming

`TCT-BLOCK-002`

## Outgoing

`TCT-BLOCK-003`

## Junction question

For a non-empty finite configuration in the selected normal form, can the final construction step be recovered in a way invariant under the declared structural equivalence?

## Required condition

```text
A ≈ B  →  recover(A) ≈ recover(B)
```

where recovery returns the predecessor configuration together with the terminal-block role.

## Acceptance states

```text
PASS
CONDITIONAL
FAIL
```

PASS permits TCT-BLOCK-003.

CONDITIONAL requires an explicit additional constraint unit.

FAIL requires an alternative branch or redesign.

## Current status

CONDITIONAL / PENDING VERIFICATION.

The normal-form grammar exposes a final `U`, but invariance of recovery under structural equivalence has not yet been independently established.

## Sensitivity

Changes to TCT-BLOCK-002, the normal-form convention, or structural equivalence require a complete retest of this Junction and may affect decomposition, depth, successor, and formal-domain construction.

## Legacy source

`LAB/BUILDING/reverse/TCT-J-001_CANONICAL_DECOMPOSITION_JUNCTION.md`
