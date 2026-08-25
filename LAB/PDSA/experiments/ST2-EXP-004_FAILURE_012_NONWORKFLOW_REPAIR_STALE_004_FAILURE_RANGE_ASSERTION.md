# ST2-EXP-004 Failure 012 — Non-Workflow Repair Stale 004 Failure-Range Assertion

**Phase:** post-Study lifecycle provenance repair  
**Failed exact head:** `3e44ef13addb4ab88d28df0b521a6147bded24ab`  
**Workflow:** `BOMA ST2-EXP-004 Lifecycle Closure`  
**Run:** `32841874338`  
**Job:** `apply verified non-workflow provenance repair`  
**Classification:** `TEMPORARY REPAIR SCRIPT / STALE INTERMEDIATE SOURCE-SHAPE ASSERTION`  
**Mathematical impact:** `NONE`

## Observed failure

The exact-head/remote-head guards passed. The temporary repair script restored
its in-memory historical ledger basis and handled the ST2-EXP-011 auditor
idempotently, then failed at the source-shape guard for the ST2-EXP-004
lifecycle auditor's preserved-failure range.

The renderer assumed that the file was either still at the original
`range(1, 7)` shape or already at the final `range(1, 12)` shape. The live
branch contained an intermediate repair-attempt range, so the guard raised an
`AssertionError` before the lifecycle audits and before any commit or push.

No repository repair commit was produced by run `32841874338`.

## Root cause

Successive failed delivery attempts changed workflow machinery while leaving
some non-workflow repair files at intermediate states. The temporary renderer
encoded only endpoint source shapes instead of normalizing all known
intermediate states. This is a repair-delivery defect, not a mathematical or
accepted-architecture failure.

## Corrective boundary

The next correction normalizes the preserved-failure audit range from the
actual live source form to the final range required by the complete immutable
failure set. It does not widen mathematical scope or alter the Frozen Plan,
Final Study/Act, accepted Q/R/C sources/manifests, `SELECTS`, Claims, Blocks,
Decision Points, Junctions, or accepted exports.

This failure record is immutable after creation.
