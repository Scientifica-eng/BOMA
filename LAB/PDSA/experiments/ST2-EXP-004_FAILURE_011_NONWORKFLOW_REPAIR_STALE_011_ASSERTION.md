# ST2-EXP-004 Failure 011 — Non-Workflow Repair Stale 011 Assertion

**Phase:** post-Study lifecycle provenance repair  
**Failed exact head:** `277c0da1e2be1ac99d3b658ea4e488438d23563f`  
**Workflow:** `BOMA ST2-EXP-004 Lifecycle Closure`  
**Run:** `32841640578`  
**Job:** `apply verified non-workflow provenance repair`  
**Classification:** `TEMPORARY REPAIR SCRIPT / STALE SOURCE-SHAPE ASSERTION`  
**Mathematical impact:** `NONE`

## Observed failure

The job checked out the exact branch head and verified that the remote branch
still matched that head. It then failed inside the temporary Python rendering
script with an `AssertionError` before running the three lifecycle auditors and
before creating or pushing any repair commit.

The failing assertion was the temporary renderer's source-shape guard around
the ST2-EXP-011 lifecycle-auditor expectation. The repair machinery had already
passed an earlier read-only renderer on the intended repaired state, but the
subsequent delivery workflow assumed a specific pre-repair textual form rather
than treating the current source form idempotently.

No repository repair commit was produced by run `32841640578`.

## Root cause

The self-modifying CI delivery path accumulated state-sensitive textual
assertions across successive repair attempts. That made the delivery mechanism
itself less stable than the provenance correction it was intended to carry.
This is a tooling/lifecycle-delivery failure, not evidence against the
ST2-EXP-004 scientific result or accepted mathematics.

## Corrective boundary

The self-modifying CI repair path is abandoned. The already verified repair is
applied through the GitHub Contents API from explicit exact references:

- historical records `ST2-EXP-001`, `002`, `003`, and `011` are restored from
  green head `6779d028c49f73757ea838c163d3968a982559fe`;
- only current closed-state fields and the `ST2-EXP-004` record advance;
- workflow cleanup is performed separately and returned to read-only audit
  behavior;
- no Frozen Plan, Final Study/Act, accepted source, accepted manifest,
  architectural selection, Claim meaning, Block, Decision Point, Junction, or
  accepted export is changed.

This failure record is immutable after creation.
