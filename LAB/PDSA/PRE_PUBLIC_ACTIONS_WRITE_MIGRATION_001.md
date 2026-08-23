# BOMA Pre-Public Actions Write Migration 001

**Status:** OPEN — governance/security work
**Base:** `main`
**Purpose:** define and track the migration path for GitHub Actions workflows that currently receive `contents: write` and record evidence by pushing directly to `main`.

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

## Batch A — completed migration

The following workflows were migrated from direct `main` evidence commits to artifact-first evidence:

- `.github/workflows/boma-ncore-rb-005-evidence.yml`
- `.github/workflows/boma-n-addition-rb-001-evidence.yml`
- `.github/workflows/boma-n-multiplication-rb-001-evidence.yml`
- `.github/workflows/boma-n-order-rb-001-evidence.yml`
- `.github/workflows/boma-z-representation-rb-001-evidence.yml`

For each workflow:

- repository permission is now `contents: read`;
- the verification assembly is unchanged;
- `GITHUB_SHA`, `GITHUB_RUN_ID`, toolchain value, generated timestamp, result, and step outcomes remain recorded;
- the previous repository evidence path is replaced by an artifact file generated under `/tmp/boma-evidence/`;
- evidence is uploaded with a run-unique artifact name using `actions/upload-artifact@v4`;
- no commit is created and no push to `main` occurs;
- the final enforcement step remains authoritative for the workflow result.

This is an evidence-storage migration, not a change to the mathematical verification contract.

## Q/R migration invariant

Q and R remain outside Batch A because their anti-drift checks are part of the provenance contract. Their eventual evidence-promotion mechanism must preserve this invariant:

> Evidence generated for verification commit `S` must not be promoted after the corresponding verification inputs on `main` have changed, unless the evidence is regenerated against the new exact input state.

Therefore an Evidence PR that remains open while `main` advances must be rejected, refreshed, or regenerated before merge. A successful verification alone is insufficient when its exact verified input state is stale.

The eventual Q/R design remains:

```text
read-only verification
        ↓
exact-head + anti-drift validation
        ↓
immutable workflow artifact
        ↓
evidence branch / generated evidence PR
        ↓
protected main
```

No Q/R direct-write workflow is changed by Batch A.

## Required validation

The migration is complete only after:

- no routine evidence workflow needs `contents: write` on `main`;
- each migrated workflow is independently verified;
- the canonical evidence/provenance semantics remain unchanged;
- the public `main` ruleset can require PR-based updates without breaking evidence recording;
- no privileged workflow can be triggered from untrusted pull-request code with write authority over `main`;
- Q/R anti-drift semantics remain enforced at evidence-promotion time.

## Non-goals

This record does not change accepted mathematical producers, historical provenance, frozen Plans, or the repository visibility. It is a security/governance migration record only.
