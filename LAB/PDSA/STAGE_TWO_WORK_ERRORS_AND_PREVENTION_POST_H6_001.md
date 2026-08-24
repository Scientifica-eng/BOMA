# STAGE_TWO_WORK_ERRORS_AND_PREVENTION_POST_H6_001 — Post-H6 Status-Gate Lessons

**Document ID:** `BOMA-ST2-ERROR-PREVENTION-POST-H6-001`  
**Status:** `RETAINED GOVERNANCE LESSONS / NO MATHEMATICAL FAILURE`  
**Date:** `2026-08-24`  
**Scope:** ST2-EXP-003 post-H6 current-state synchronization after mathematical H1–H6 PASS.  
**Frozen Plan:** unchanged `LAB/PDSA/PDSA-ST2-EXP-003_INDEPENDENT_CAUCHY_REAL_ROUTE.md`.  
**Accepted Q/R/C producers and manifests:** unchanged.

This record preserves two exact-head failures exposed only after the completed
ST2-EXP-003 mathematical evidence was synchronized into the branch-origin
ledger. Neither failure reached Lean proof checking. Both were caused by
legacy milestone auditors interpreting exact historical status substrings as
state-machine tokens.

The correction deliberately preserved those legacy tokens rather than
weakening or deleting the H3/H4 auditors after downstream H5/H6 completion.

## ERR-ST2-036 — stronger lifecycle status rejected by H3 legacy substring gate

**Failed head:** `778bdef52409e2a1bad53a03a8906cb1ca63471f`  
**Workflow:** `BOMA ST2-EXP-003 Independent Cauchy Real Route — V5`  
**Run:** `32726568612`  
**Failed step:** `Audit H3 completeness evidence and failure lineage`  
**Failure classification:** `GOVERNANCE FALSE POSITIVE / NO LEAN FAILURE`.

The generic Stage-Two branch-origin auditor passed with zero residuals, but
`stage_two_cauchy_h3_governance_audit.py` rejected the synchronized status:

```text
ACTIVE / H1-H6 EXACT PASS / MATHEMATICAL PASS / OWNER DISPOSITION PENDING
```

because its historical monotonicity proxy was textual: the status had to
contain either `SEQUENTIALLY COMPLETE` or `DEDEKIND-LUB CONTRACT PASS`.
The newer H1–H6 status was semantically stronger but did not contain either
legacy token.

### Actual cause

A milestone auditor encoded "H3 or stronger" as membership of a historical
substring rather than as a structured monotonic milestone/evidence relation.
Thus a stronger downstream status could be rejected even though the exact H3
evidence fields, source SHA, run, artifact, failure lineage, and acceptance
boundary remained unchanged.

### Correction

Retain `DEDEKIND-LUB CONTRACT PASS` as a legacy gate marker inside the active
ST2-EXP-003 status while also retaining the newer H1–H6 mathematical/lifecycle
state. Do not alter the old H3 evidence artifact or claim that it proved later
milestones.

### Preventive control

Future milestone auditors should prefer structured fields such as
`verified_<milestone>_run`, exact source SHA, evidence path, and an explicit
monotonic milestone rank/set. If compatibility with a historical substring
must be retained, treat that substring as a documented legacy gate token and
never assume that its absence means a later verified milestone is absent.

## ERR-ST2-037 — completed H5/H6 reconvergence rejected by H4 readiness wording

**Failed head:** `778bdef52409e2a1bad53a03a8906cb1ca63471f`  
**Workflow:** `BOMA ST2-EXP-003 Dedekind-Cauchy Comparison — V5`  
**Run:** `32726568547`  
**Failed step:** `Require audited H4 before combined reconvergence`  
**Failure classification:** `GOVERNANCE FALSE POSITIVE / NO LEAN FAILURE`.

The H4 auditor rejected the synchronized post-H6 record for three textual
reasons:

```text
h4_status_not_promoted
h5_readiness_not_explicit
h4_reconvergence_strength_boundary_missing
```

The record already stated an exact H5 field isomorphism, a verified research R
Junction, and an exact H6 Cauchy-native C rebuild. Nevertheless the H4 gate
still required the historical strings:

```text
DEDEKIND-LUB CONTRACT PASS
H5 COMPARISON READY
H4 EXACT LUB CONTRACT PASS
```

### Actual cause

The H4 auditor was designed as a one-way readiness gate before H5 existed. It
was later reused as an ancestor guard inside the H5/Junction workflow without
an explicit post-H5/post-H6 state transition. As a result, replacing readiness
wording with completed-result wording caused a false negative.

### Correction

Preserve all three H4/H5-readiness markers as compatibility tokens alongside
the stronger exact field-isomorphism/Junction/H6 descriptions. Keep
`verified_run = null` and omit the legacy active-record
`reconvergence_junction_id` while ST2-EXP-003 remains operationally ACTIVE,
because the current branch-origin auditor interprets those fields as lifecycle
closure signals.

### Preventive control

A readiness auditor reused after the guarded milestone completes must support a
monotonic successor state. Preferred design:

```text
H4_PASS <= H5_READY <= H5_PASS <= JUNCTION_PASS <= H6_PASS
```

and validate evidence identities for every attained predecessor rather than
requiring obsolete prose. A later status must not fail merely because it no
longer says "ready" after the operation has already passed.

## Corrected exact-head evidence

The narrow compatibility correction was committed as:

`9db7dcbf6adad7b4dcb1073b0cc674c71066e470`

with no changes to Lean mathematical sources, accepted producers/manifests, or
the Frozen Plan. The corrected head then passed all three critical V5
workflows:

```text
Independent Cauchy Real Route
  run      32726715089
  artifact 9519794043
  sha256   acdfc17a7ac7b32c9eea92b7b2cff1ff6011f1a86c6f050c64bfb0d9f669728c

Dedekind-Cauchy Comparison / Research R Junction
  run      32726715096
  artifact 9519797818
  sha256   3dcd4823ed4cf28870b16696b3f0cbbf37bf56a2b0624c9bae452e0bbbc452fd

Cauchy Quadratic Rebuild
  run      32726715235
  artifact 9519792768
  sha256   7769668275e278f47bba3a28bfbd398518f70c0b42603fb5e64287a5e3e196af
```

Accepted C regression workflows also passed on that same corrected head.

## Boundary

These lessons do not authorize:

- closing ST2-EXP-003;
- setting its top-level `verified_run` while the current auditor treats that as
  a closed-experiment signal;
- promoting the Cauchy real producer or H6 complex producer to accepted;
- starting ST2-EXP-011 or another candidate;
- editing the Frozen Plan;
- merging to `main`.

They preserve a proof-engineering lesson: **milestone evidence should be
monotonic and structured; prose status tokens are compatibility metadata, not
mathematical truth.**