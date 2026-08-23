# BOMA Pre-Public Hardening Audit 001

**Repository:** `Scientifica-eng/BOMA`  
**Audit date:** `2026-08-23`  
**Audit branch:** `maintenance/pre-public-hardening-001`  
**Base:** accepted `main` at `ea920b6b1e56444eddaf38ca91e6f7a968f10e0d`  
**Purpose:** prepare a visibility change from private to public without changing accepted mathematical producers or canonical `main`.

## 1. Executive status

Current recommendation: **PUBLICATION IS TECHNICALLY PLAUSIBLE, BUT `main` MUST BE HARDENED IMMEDIATELY AROUND THE VISIBILITY CHANGE.**

No accepted source, manifest, frozen Plan, or canonical mathematical claim is changed by this audit.

The repository is currently private and the default branch is `main`. Direct inspection of the GitHub branch metadata showed that `main` is currently **not protected** and has no required status checks.

The immediate publication risk is therefore governance, not a discovered source credential.

## 2. Current secret / credential surface

Current indexed repository searches did not find obvious occurrences of:

- `pull_request_target`;
- `secrets.` usage in repository source;
- `OPENAI_API_KEY`-style names searched during the audit;
- common GitHub personal-token prefixes searched during the audit;
- private-key markers searched during the audit;
- root `.env`-style credential files;
- `@gmail.com` in indexed repository file contents.

The active branch root contains the expected project directories and Lean build files only; no obvious credential file was observed at the root.

**Limitation:** GitHub code search is not a full historical secret scanner and was demonstrably incomplete for some workflow text. This audit therefore does **not** certify the entire Git object history or every historical Actions log as secret-free.

If any credential was ever committed or printed to Actions output, it must be revoked/rotated before publication; deleting the current file would not be sufficient.

## 3. Historical identity metadata

At least one historical commit already reachable from the repository history uses a personal email address rather than a GitHub noreply address:

- commit `bbec162c02aa04fa457907b88a0cee5ca6fdb2c1`;
- commit message: `Restore original BOMA I source file from Git history`;
- recorded author/committer email: `iersdz07@gmail.com`.

Making the repository public will expose commit metadata of this kind.

This audit deliberately does **not** recommend rewriting Git history merely to hide that address. BOMA relies heavily on exact commit SHAs for accepted baselines, frozen Plans, evidence records, and dependency provenance; a history rewrite would invalidate those references.

The project owner should therefore explicitly accept this metadata exposure before changing visibility.

## 4. Branch publication surface

At audit time the repository had 14 branches, including research, maintenance, temporary, restore, and work branches. A visibility change publishes the entire repository/branch surface, not only `main`.

Two notably old branches were inspected:

- `tmp-check-ignore`: `ahead_by = 0` relative to `main`, substantially behind current `main`;
- `restore-boma-sources`: `ahead_by = 0` relative to `main`, substantially behind current `main`.

Additional branch review is required before publication to classify all active research, maintenance, restore, and temporary branches and decide which refs should remain visible as part of the public laboratory history.

Deleting those branch refs would reduce UI clutter but would not remove their reachable historical commits from a public repository when those commits remain ancestors of current history. No destructive branch deletion is performed by this audit.

## 5. GitHub Actions security posture

Positive findings:

- no `pull_request_target` trigger was found in indexed workflows;
- the current C-stage acceptance workflow is explicitly read-only (`permissions: contents: read`);
- the ST2-EXP-003 research workflows already use explicit read-only repository permissions.

Important legacy design finding:

Several canonical evidence-producing workflows intentionally request `contents: write` and push evidence commits directly to `main` after verification. Confirmed examples include:

- `.github/workflows/boma-ncore-rb-005-evidence.yml`;
- `.github/workflows/boma-n-addition-rb-001-evidence.yml`;
- `.github/workflows/boma-n-multiplication-rb-001-evidence.yml`;
- `.github/workflows/boma-n-order-rb-001-evidence.yml`;
- `.github/workflows/boma-z-representation-rb-001-evidence.yml`;
- `.github/workflows/boma-q-integration-001.yml`;
- `.github/workflows/boma-r-integration-002.yml`.

For Q and R integration, the workflow explicitly commits generated evidence and executes `git push origin HEAD:main`.

This means a strict `main` rule requiring every update to pass through a PR will conflict with current self-recording evidence behavior unless the bot is granted a bypass. A broad GitHub Actions bypass is **not recommended** for a public repository.

The migration target is recorded separately in `LAB/PDSA/PRE_PUBLIC_ACTIONS_WRITE_MIGRATION_001.md`.

## 6. Preferred `main` protection architecture

Target end-state:

1. block branch deletion;
2. block force pushes;
3. require changes to `main` through pull requests;
4. require conversation resolution;
5. require canonical, always-running status checks before merge;
6. keep `GITHUB_TOKEN` read-only by default;
7. do not grant a broad Actions bypass to `main`;
8. migrate evidence recorders away from direct `main` pushes.

Preferred evidence migration options, in order:

1. verification produces immutable GitHub Actions artifacts and exact-head evidence, without changing `main`;
2. if evidence must remain versioned in Git, the workflow writes to a dedicated evidence branch and opens/updates a PR;
3. only as a temporary compatibility measure, use a narrowly scoped bypass actor if GitHub ruleset capabilities and project governance make this unavoidable.

The current direct-to-`main` evidence push model should not be treated as the desired public-repository security architecture.

## 7. Required-check design caution

Do not immediately mark dozens of path-filtered workflows as required checks. A required check that is skipped because its workflow/path filter did not run can block merges indefinitely.

BOMA should expose one small, always-running PR gate for `main`, or a compact set of always-running canonical gates. That gate can delegate/validate the appropriate mathematical acceptance surfaces without requiring every historical proof workflow as a branch-protection context.

The exact required-check names should be selected only after successful public-repository Actions runs establish the final check contexts.

## 8. Visibility-change operational sequence

Recommended sequence:

1. preserve an external mirror backup of all refs before visibility change;
2. explicitly accept the historical commit-email exposure described above;
3. merge the pre-public hardening baseline only after final review;
4. create/activate a `main` ruleset at minimum blocking force pushes and deletion;
5. avoid a broad Actions bypass;
6. change repository visibility to Public using an administrator account;
7. verify that standard hosted Actions execute again without private-repository minute exhaustion;
8. establish an always-running PR gate and then require it in the `main` ruleset;
9. migrate self-recording evidence workflows away from direct `main` pushes;
10. enable/confirm public-repository secret scanning and push protection where available.

## 9. Actions-minute incident

The observed pre-step failures during ST2-EXP-003 H5 occurred after the organization reported 100% consumption of included private-repository Actions minutes. These pre-runner failures are operational and must not be classified as Lean/proof failures.

After publication, re-run the exact H5 verification workflow before promoting any H5 claim.

## 10. Explicit non-actions

This audit does not:

- change `main`;
- change repository visibility;
- rewrite Git history;
- delete branches;
- add or change a software license;
- grant bypass permissions;
- alter accepted Q/R/C producers;
- change a frozen Plan;
- claim H5 PASS.

Those boundaries are intentional.

## 11. Workflow supply-chain boundary

The evidence-producing workflows with repository write capability also invoke reusable third-party actions through moving major-version tags, notably `leanprover/lean-action@v1`. The official `actions/checkout@v4` action is likewise referenced by a major-version tag.

A tagged action reference is operationally convenient but is not the same security boundary as a full immutable commit SHA. This is especially important for workflows that possess `contents: write` or any future bypass permission for `main`.

Before granting any workflow or GitHub App a bypass around the public `main` ruleset, BOMA should either:

1. remove the direct-write requirement entirely, which is preferred; or
2. pin every nontrivial external action executed inside that privileged workflow to a reviewed full commit SHA and maintain those pins explicitly.

No action pin is changed in this audit because those workflows are part of the existing canonical verification machinery and must be reverified after any such supply-chain change.
