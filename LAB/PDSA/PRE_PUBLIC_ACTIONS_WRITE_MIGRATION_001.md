# BOMA Pre-Public Actions Write Migration 001

**Status:** OPEN — governance/security work
**Base:** `main`
**Purpose:** define the required migration path for GitHub Actions workflows that currently receive `contents: write` and record evidence by pushing directly to `main`.

## Security objective

Before BOMA becomes public, privileged workflows must not create a broad automation path capable of mutating canonical `main` outside the repository's protected change process.

## Current legacy pattern

Several evidence-producing workflows use:

```yaml
permissions:
  contents: write
```

and subsequently perform a direct push to `main`.

Known examples at audit time:

- `.github/workflows/boma-ncore-rb-005-evidence.yml`
- `.github/workflows/boma-n-addition-rb-001-evidence.yml`
- `.github/workflows/boma-n-multiplication-rb-001-evidence.yml`
- `.github/workflows/boma-n-order-rb-001-evidence.yml`
- `.github/workflows/boma-z-representation-rb-001-evidence.yml`
- `.github/workflows/boma-q-integration-001.yml`
- `.github/workflows/boma-r-integration-002.yml`

## Preferred target architecture

1. Verification runs with the minimum required repository permissions.
2. Claim/evidence output is emitted as an immutable workflow artifact whenever Git versioning is not mathematically necessary.
3. When persistent repository evidence is required, the workflow writes to a dedicated evidence branch and opens or updates a pull request.
4. `main` remains protected and is not granted a general Actions bypass.
5. Any unavoidable privileged action must be narrowly scoped, pinned to reviewed immutable action SHAs, and separately governed.

## Required validation

The migration is complete only after:

- no routine evidence workflow needs `contents: write` on `main`;
- each migrated workflow is independently verified;
- the canonical evidence/provenance semantics remain unchanged;
- the public `main` ruleset can require PR-based updates without breaking evidence recording;
- no privileged workflow can be triggered from untrusted pull-request code with write authority over `main`.

## Non-goals

This record does not change accepted mathematical producers, historical provenance, frozen Plans, or the repository visibility. It is a security/governance migration record only.
