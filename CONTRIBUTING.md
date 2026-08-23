# Contributing to BOMA

## Main branch

`main` is the canonical branch. Human changes should be proposed through pull requests and must not bypass the repository's main-branch protection rules.

## Research branches

BOMA uses dedicated branches for experiments, maintenance, restoration, and research alternatives. Preserve branch provenance and do not rewrite accepted mathematical history merely to make the public tree look cleaner.

## Mathematical and provenance constraints

Changes must preserve the distinction between:

- accepted canonical producers;
- supporting verification evidence;
- retained alternatives and research branches;
- historical failures and governance records.

Do not rewrite historical documents to make an earlier state appear to have anticipated a later decision.

## Verification

Before opening a pull request, run the relevant Lean checks and repository validation available for the affected stage. A successful generic build is not, by itself, evidence that an acceptance gate or claim-level requirement has passed.

## Workflow changes

Treat GitHub Actions changes as security-sensitive. Keep `GITHUB_TOKEN` permissions as narrow as practical, avoid privileged pull-request workflows, and do not add direct writes to `main` without an explicit governance decision.

## Secrets

Never commit credentials, API keys, private keys, personal access tokens, or local environment files. Do not place secrets in workflow source, generated evidence, test fixtures, or Actions logs.

See `SECURITY.md` for reporting suspected exposures.
