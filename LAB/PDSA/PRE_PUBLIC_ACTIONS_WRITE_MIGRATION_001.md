# BOMA Pre-Public Actions Write Migration 001

**Status:** OPEN — governance/security work
**Base:** `main`
**Purpose:** define and track the migration path for GitHub Actions workflows that previously received `contents: write` and recorded evidence by pushing directly to `main`.

## Security objective

Before BOMA becomes public, privileged workflows must not create a broad automation path capable of mutating canonical `main` outside the repository's protected change process.

## Batch A — completed

The following workflows are artifact-first and use `contents: read`:

- `.github/workflows/boma-ncore-rb-005-evidence.yml`
- `.github/workflows/boma-n-addition-rb-001-evidence.yml`
- `.github/workflows/boma-n-multiplication-rb-001-evidence.yml`
- `.github/workflows/boma-n-order-rb-001-evidence.yml`
- `.github/workflows/boma-z-representation-rb-001-evidence.yml`

For each, the verification assembly is unchanged and the evidence still records the exact source SHA, workflow run, toolchain, result, and relevant step outcomes. The evidence is uploaded as a run-unique artifact and no repository mutation occurs.

## Batch B/C — Q and R evidence promotion

The Q and R integration workflows retain their anti-drift verification semantics but no longer push evidence directly to `main`.

Each workflow:

1. runs with `contents: write` and `pull-requests: write` solely to create a dedicated evidence branch and pull request;
2. verifies the accepted assembly at the exact triggering `GITHUB_SHA`;
3. checks that every verification input remains unchanged on `origin/main` before promotion;
4. emits the same claim-level evidence as an immutable workflow artifact;
5. creates a dedicated evidence branch from the current `main`;
6. commits only the generated evidence file to that branch;
7. opens a Draft PR targeting `main`;
8. performs no direct push to `main` and receives no `main` bypass.

The canonical Q/R workflow paths remain:

- `.github/workflows/boma-q-integration-001.yml`
- `.github/workflows/boma-r-integration-002.yml`

## Evidence-promotion invariant

Evidence generated for verification commit `S` must not be merged after any corresponding verification input on `main` changes, unless the evidence is regenerated against the new exact input state.

`.github/workflows/pre-public-evidence-promotion-gate.yml` enforces this invariant on evidence PRs by requiring that:

- the PR changes exactly one supported evidence file;
- the evidence contains a valid exact 40-hex verified commit SHA;
- that verified commit is an ancestor of the PR base;
- every Q/R verification input is byte-for-byte unchanged between the verified commit and the PR base.

The final `main` ruleset must require branches to be up to date before merge so that base drift cannot be bypassed between validation and merge.

## Required final validation

The migration is complete only after:

- no routine evidence workflow pushes directly to `main`;
- Batch A workflows remain `contents: read` only;
- Q/R use evidence branches and PRs with anti-drift enforcement;
- the evidence promotion gate is required for the relevant protected PRs;
- `main` is protected against direct pushes, force pushes, and deletion;
- no broad Actions bypass is granted;
- all privileged workflows are reviewed for action pinning and untrusted-input exposure.

## Non-goals

This record does not change accepted mathematical producers, frozen Plans, historical provenance, the repository visibility, or the accepted canonical mathematical status. It records a security/governance migration only.
