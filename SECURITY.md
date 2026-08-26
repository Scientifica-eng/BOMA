# Security Policy

## Scope

BOMA is a research repository containing mathematical specifications, Lean formalizations, verification workflows, provenance records, and experimental research artifacts.

## Reporting a vulnerability or secret exposure

Do **not** disclose suspected credentials, tokens, private keys, or exploitable vulnerabilities in a public issue, pull request, commit, or discussion.

Use GitHub's private vulnerability-reporting mechanism for this repository when it is enabled. If private reporting is unavailable, contact the repository maintainer privately through GitHub and provide only the minimum information required to reproduce or assess the issue.

When reporting a suspected secret exposure, do not paste the secret itself. Identify the affected path, commit, workflow, or run and indicate whether the credential is still active.

## Credential handling

Any credential that may have been committed to Git history or exposed in an Actions log must be treated as compromised until verified otherwise. Removing the value from the current tree is not sufficient: revoke or rotate the credential first, then perform the repository cleanup.

## Public-repository security baseline

The canonical `main` branch is intended to be protected by repository rules that prevent force-pushes and deletion and require controlled pull-request changes and appropriate verification checks.

Human contributors should not push directly to `main`. Experimental and maintenance work must remain on dedicated branches until explicitly promoted.

## Security-sensitive changes

Security-sensitive workflow changes, permission changes, repository-settings changes, and changes affecting provenance or protected-branch behavior require explicit maintainer review.
