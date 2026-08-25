# ST2-EXP-004 FAILURE 015 — Post-integration stop-marker literal mismatch

**Date:** 2026-08-25  
**Class:** GOVERNANCE / SENTINEL CONTRACT  
**Mathematical result affected:** NO  
**Observed head:** `45a69de1f8b0be5d0f340140b1d027a95c25708e`

## Observation

On PR #17 the read-only historical Gate A-F sentinels failed on the architecture-integration head. Representative exact runs include:

```text
Gate A  run 32857868032 / job 97834188518
Gate B  run 32857868041 / job 97834188892
Gate C  run 32857868008
Gate D  run 32857867980
Gate E  run 32857868097
Gate F  run 32857867997
```

The Gate records and accepted mathematical controls were not changed.

## Diagnosis

The integrated `ST2-EXP-004` closure contract requires an exact `NO NEW EXPERIMENT` marker in the Learning-to-Construction Act. The Act expressed the same stop condition as:

```text
STOP BEFORE NEW EXPERIMENT
No new experiment ... is authorized
```

but did not contain the exact uppercase literal required by the sentinel contract.

This is a literal contract mismatch in governance documentation, not a scientific Gate regression and not evidence that any historical Gate needs re-execution.

## Prevention / repair rule

Make the final stop condition explicit in the integration Act with the exact machine-audited marker:

```text
NO NEW EXPERIMENT
```

Retain all historical Gate records and final-run identities unchanged. The repair must not touch accepted Q/R/C mathematical sources or manifests.
