# ST2-EXP-015_FAILURE_003 — Gate-C state-sync STATUS drift

**Experiment:** `ST2-EXP-015`  
**Program:** `ST2-RP-001`  
**Date:** `2026-08-25`  
**Classification:** `TECHNICAL GOVERNANCE SYNCHRONIZATION FAILURE / RECOVERABLE INSIDE FROZEN PLAN`  
**Failed exact head:** `cf58cec756a338dfa3ca315dc480d7c8154bbcb9`  
**Workflow:** `BOMA ST2-EXP-015 Cauchy Route Composition Square — V5`  
**Run:** `32891023026`  
**Job:** `97942730685`  
**Artifact:** `9579444689`  
**Artifact SHA-256:** `8bd71a06235b96ff49f0a87b4388e96df0ee2d5967155cb89f9e6b07389f6235`

## Observed result

The exact-head, Frozen-Plan identity, owner/program authority, accepted Q/R/C
source immutability, Gate A, Gate B, Gate C manifest/firewall, pinned Lean
elaboration, and Gate-C independent declaration-closure checks all passed on the
failed head.

The only failed workflow step was:

```text
Run autonomous-program and architecture regressions
```

The active machine-readable program state on this head is `WAITING_CI`, while
`LAB/PDSA/STATUS.md` still reports the earlier recovery frontier as
`ACTIVE STATE: RECOVERY_ALLOWED` and describes Gate C as not yet started. The
autonomous research-program audit requires `STATUS.md` to name the exact current
autonomous state, so the regression fails closed before the architecture audit can
complete.

## Root cause

Commit `cf58cec756a338dfa3ca315dc480d7c8154bbcb9` correctly persisted the exact
Gate-C PASS from head `8b8d8413a3638eb8f4f4d738d3cf1a2a12c866bd` into the current-state JSON and
moved the lifecycle to Gate-C PASS state synchronization, but did not synchronize
`LAB/PDSA/STATUS.md` in the same commit.

This is current-state documentation drift only. It does not alter or call into
question the Gate-C mathematical result.

## Authorized recovery

1. Preserve this failed exact-head run, job, artifact, and digest.
2. Synchronize `LAB/PDSA/STATUS.md` to the already authoritative current-state JSON:
   `WAITING_CI`, Gate C exact PASS on `8b8d8413...`, Gate D not started.
3. Do not modify the Frozen Plan, scientific factor, Claim cone, accepted sources,
   selected routes, acceptance contract, logical/foundational commitments, or queue.
4. Do not synchronize the experiment register or permanent origin ledger in this
   repair; the current-state record explicitly sequences those after the state-sync
   head itself passes exact V5.
5. Rerun the full exact-head V5. Gate D remains unauthorized until this repaired
   state-sync head passes and the register/origin-ledger synchronization is then
   completed and exact-verified.

## Scientific status

`GATE C EXACT PASS RETAINED / STATE-SYNC HEAD REGRESSION FAILED / TECHNICAL RECOVERY ALLOWED`.

No owner boundary is triggered by this failure because no hypothesis, success
criterion, single changed factor, route selection, accepted export, acceptance
contract, logical regime, queue order, or sequence-critical prerequisite changes.