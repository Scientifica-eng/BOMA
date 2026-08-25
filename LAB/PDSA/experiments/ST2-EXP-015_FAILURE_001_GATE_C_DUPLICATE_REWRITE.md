# ST2-EXP-015_FAILURE_001 — Gate-C duplicate rewrite proof-script failure

**Experiment:** `ST2-EXP-015`  
**Program:** `ST2-RP-001`  
**Date:** `2026-08-25`  
**Classification:** `TECHNICAL IMPLEMENTATION FAILURE / RECOVERABLE INSIDE FROZEN PLAN`  
**Failed exact head:** `f3d2490e423f6e0088a1f347166dea154e40ccf0`  
**Workflow:** `BOMA ST2-EXP-015 Cauchy Route Composition Square — V5`  
**Run:** `32888095445`  
**Job:** `97933210939`  
**Artifact:** `9578362774`  
**Artifact SHA-256:** `a278a8509c096007b84995233c4dcb2e7bbb9ababa1e46947bae9b44ad877f97`

## Failure

Gate-C source-boundary checks passed: the field manifest was the Gate-B independent manifest plus exactly `ST2Exp015CauchyQField.lean`, and forbidden Dedekind/002/H5/Route-P field-transport and selector producers were absent. Accepted Q/R/C manifest/source immutability also passed before Lean elaboration.

Pinned-Lean elaboration then failed in `q_mul_zero_left` after the goal had already been rewritten from

```text
qNormal (qMul qZero z) = qNormal qZero
```

to

```text
nfMul (nfReal rCZero) (qNormal z) = nfReal rCZero
```

The proof script requested `q_normal_zero` a second time:

```lean
rw [q_normal_mul, q_normal_zero, q_normal_zero]
```

Lean correctly reported that no occurrence of `qNormal qZero` remained.

## Root cause

`proof-script goal-state error`: the first `q_normal_zero` rewrite had already rewritten all matching occurrences. The second identical rewrite was redundant and therefore failed.

This is explicitly within the autonomous recovery envelope of `AUTONOMOUS_RESEARCH_PROGRAM_GOVERNANCE_001.md`. It changes no mathematical statement, hypothesis, representation, scalar producer, Claim cone, success criterion, route selection, acceptance contract, logical/foundational commitment, or queue order.

## Authorized repair

Replace only

```lean
rw [q_normal_mul, q_normal_zero, q_normal_zero]
```

with

```lean
rw [q_normal_mul, q_normal_zero]
```

in `LAB/payloads/lean/CStage/ST2Exp015CauchyQField.lean`, then rerun the full exact-head V5. No Gate D action is authorized until Gate C passes on the repaired exact head.

## Scientific status

`UNCLASSIFIED / NO MATHEMATICAL FAILURE INFERRED FROM THIS RUN`.

The failed head is preserved as negative execution provenance and must not be relabeled PASS.