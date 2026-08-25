# ST2-EXP-004 FAILURE 014 — Post-integration final-stop next-act schema mismatch

**Date:** 2026-08-25  
**Class:** GOVERNANCE / HISTORICAL-LIFECYCLE COMPATIBILITY  
**Mathematical result affected:** NO  
**Observed head:** `45a69de1f8b0be5d0f340140b1d027a95c25708e`

## Observation

PR #17 exact-head CI reached the lifecycle-integrated state but the historical `ST2-EXP-011` closure audit failed in final-stop mode.

Evidence:

```text
workflow run  32857868031
job           97834189112
artifact      9566897781
artifact sha  12076ea010c52b4c77f2e9b1ffb29275ef5c3514902daac1f8c4e42b44dbb4b8
```

The uploaded `011.json` reported exactly:

```text
mode     ST2_EXP_004_CLOSED_INTEGRATED_FINAL_STOP
expected NO ACTIVE EXPERIMENT / STOP BEFORE NEW EXPERIMENT / OWNER AUTHORIZATION REQUIRED
actual   STOP BEFORE NEW EXPERIMENT / OWNER AUTHORIZATION REQUIRED
```

`active_experiment` was already `null`; the mismatch was only the literal schema of the top-level `required_next_act` field.

## Diagnosis

The new integration state separated the no-active fact into `active_experiment` and `next_experiment_slot`, while the historical 011 compatibility audit retained the established final-stop spelling in `required_next_act` itself.

This is a state-schema compatibility defect, not a change to ST2-EXP-011 or ST2-EXP-004 mathematics.

## Prevention / repair rule

Use one canonical final-stop literal across current machine state and historical compatibility checks:

```text
NO ACTIVE EXPERIMENT / STOP BEFORE NEW EXPERIMENT / OWNER AUTHORIZATION REQUIRED
```

Do not weaken historical closure checks and do not activate a successor experiment as part of the repair.
