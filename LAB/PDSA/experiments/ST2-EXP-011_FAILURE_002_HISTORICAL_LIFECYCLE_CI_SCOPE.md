# ST2-EXP-011 — Failure 002 / Historical lifecycle CI scope

**Experiment:** `ST2-EXP-011 / C Comparison Interface Generalization`  
**Date:** `2026-08-24`  
**Classification:** `GOVERNANCE/CI COMPATIBILITY FAILURE / NOT A MATHEMATICAL FAILURE`  
**Frozen Plan:** unchanged  
**Accepted Q/R/C sources:** unchanged

## 1. Trigger

After Study/Act, `LAB/PDSA/STATUS.md` correctly stopped asserting a globally idle
Stage-Two frontier. Pull-request workflows inherited from closed
`ST2-EXP-002/003` then ran on the `ST2-EXP-011` branch.

Several historical workflows encoded the stronger implication:

```text
ST2-EXP-003 is CLOSED
=> the whole Stage-Two program must still have NO ACTIVE EXPERIMENT
```

That implication was valid only at the historical instant when 001--003 had
been closed and the next slot was still open. It is not a permanent invariant.
A later experiment may be active while 001--003 remain historically CLOSED.

## 2. First exposed failures

Exact head:

`211eab2f9005845c71a2f3869d14464ef97d092a`

The following pull-request workflows failed at lifecycle/governance steps before
their mathematical Lean work could be reached:

```text
Stage-Two Lifecycle Closure 001
  run 32750715634

ST2-EXP-003 Cauchy Quadratic Rebuild
  run 32750715744

ST2-EXP-003 Independent Cauchy Real Route
  run 32750715709

ST2-EXP-003 Dedekind-Cauchy Comparison
  run 32750715582

ST2-EXP-002 Independent Quotient Route and Pair Junction
  run 32750715665
```

Representative lifecycle residuals were:

```text
status_not_closed
frontier_no_active_marker_missing
```

At the same exact head, the `ST2-EXP-011` workflow and the accepted C regression
workflows were successful. Therefore these red checks were not evidence against
the mathematical result of ST2-EXP-011.

## 3. Root cause

The CI implementation conflated two distinct propositions:

```text
historical experiment-local closure
!=
current global program frontier
```

Closed-experiment evidence must remain immutable and verifiable after later
experiments begin. It must not require the current active-experiment pointer to
remain `NONE` forever.

## 4. Corrective design

A separate auditor was introduced:

`LAB/00_ARCHITECTURE/tools/stage_two_historical_closure_audit.py`.

It verifies that `ST2-EXP-001..003` remain historically CLOSED/PASS, protects
their exact evidence and accepted boundaries, rejects reactivation of those
historical experiments, and permits at most one later nonclosed experiment.

Historical callers were changed to use that preservation audit after
`ST2-EXP-003` is closed. The original strict closed-frontier auditor remains the
authority for reproducing the historical no-active frontier itself.

`stage_two_branch_governance_audit.py` now routes according to lifecycle epoch
instead of assuming that `ST2-EXP-003` is the only possible active Stage-Two
experiment.

## 5. Secondary compatibility failure

After the historical auditor itself passed, one downstream comparison utility
still recognized only the old governance schemas.

Exact head:

`76b46a97bd65551a35c7c5734de8272b0ba7296d`

```text
ST2-EXP-003 Independent Cauchy Real Route
  run       32752921166
  job       97513817165
  artifact  9529724919
  sha256    2786a2bd5bc3758b469e83f0e5b6e2ddaecd7abf3385fc1563ff766eaf7eaa6d
```

The historical audit passed and the Lean/H4 proof and dependency closure passed.
`ST2_EXP_003_COMPARE_FOUNDATION.py` nevertheless returned
`typed_origin_governance_failed` because it did not recognize the new explicit
historical-closure schema.

The utility was corrected to accept exactly three typed governance modes:

```text
ACTIVE_FRONTIER
CLOSED_FRONTIER
HISTORICAL_CLOSURE
```

No mathematical target, required declaration, selected-Dedekind exclusion, or
accepted-product condition was weakened.

## 6. Verified prevention result

Exact head after both compatibility corrections:

`ef116405c08475ec8702d9177a5106d7d0bfe525`

All nine relevant pull-request workflows passed on that head:

```text
ST2-EXP-011 C Comparison Interface Generalization   run 32753140129  SUCCESS
Stage-Two Lifecycle Closure 001                     run 32753140144  SUCCESS
ST2-EXP-003 Independent Cauchy Real Route           run 32753140147  SUCCESS
ST2-EXP-003 Cauchy Quadratic Rebuild                run 32753140145  SUCCESS
ST2-EXP-003 Dedekind-Cauchy Comparison              run 32753140218  SUCCESS
ST2-EXP-002 Independent Quotient Route/Junction     run 32753140135  SUCCESS
C Comparable Quadratic Route Probes                 run 32753140225  SUCCESS
C Same-Carrier Integration/Claim Transparency       run 32753140141  SUCCESS
C Stage Acceptance/Six-Stage Transparency           run 32753140262  SUCCESS
```

Current ST2-EXP-011 artifact on that exact head:

```text
run       32753140129
artifact  9529812715
sha256    f7ec7a6d1fb88a8c59dbcc8ce04bd8d6c389a3b3d77bb6ed3c1f22dc629dd9b1
```

## 7. Prevention rule

For future Stage-Two workflows:

```text
experiment-local CLOSED evidence is monotone historical knowledge;
current active/frontier state is time-varying program state.
```

A historical experiment workflow may verify preservation of its own closure and
accepted boundaries. It must not infer that the global Stage-Two active pointer
must remain permanently empty. Conversely, a current-frontier audit must still
enforce the single-active-experiment invariant.

This record is supplemental evidence. It does not modify the immutable
ST2-EXP-011 Frozen Plan or retroactively rewrite its mathematical Study/Act.
