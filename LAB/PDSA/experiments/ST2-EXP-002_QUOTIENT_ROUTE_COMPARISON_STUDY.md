# ST2-EXP-002 — Execution / Study / Act Record

**Frozen Plan:** `LAB/PDSA/PDSA-ST2-EXP-002_INDEPENDENT_QUOTIENT_ROUTE.md`  
**Accepted baseline:** `878a52c3d833b9db9ea66f1ff4fcd207ca6ab498`  
**Plan commit:** `94a79eb07a2dddebbcba0e8fbd11508514ecca6c`  
**Status:** `DO IN PROGRESS / NO CLAIM OF V5 SUCCESS`

The owner approved exactly one changed factor: the realization choice at
`C-DP-001`. The same whole accepted `RStageIntegrationCertificate` is used by
accepted Route P and experimental Route Q. The retained Q object is a formal
expression / normalization quotient, not a separately implemented full
polynomial ring.

## Initial architectural observation

The accepted formal-dependency policy permits direct `Quotient` and `Setoid`
consumers in accepted Q and R stage sources, not arbitrary C-stage producers.
Completing the expression quotient in C therefore has an explicit
representation/formalization cost. A separate branch-only policy lists exact
experimental C consumers; the accepted policy remains untouched.

## Ordered execution contract

1. Assemble and check the Q-only normal-form ring, witness field, and quotient
   field without selected P, generic P/Q comparison, or the previous experiment.
2. Extract the actual Q field declaration closure and machine-reject all P
   declarations before compiling the combined assembly.
3. Only then instantiate the common contract and verify mutually inverse,
   structure-preserving P/Q functions.
4. Audit logical/formalization commitments, all nine C Claim producer
   families, and the unchanged accepted reference.

## Iteration and failures

### Attempt 1 — retained negative evidence / F1

- Source commit: `025fe2d445dc90556d3ddd2ca92b70658b1a7db7`.
- Exact V5 run: `32596872373` — `FAIL`, at the **independent Q field** step.
- Lean's Q-normal coordinate rewrite had an explicit whole-R certificate that
  could not be inferred from its conclusion; omitting that argument left
  unresolved `RStageIntegrationCertificate` goals.
- Extractor soundness additionally needed the `qRe`/`qIm` projections unfolded;
  normal re-encoding needed its `qOfNormal` abbreviation unfolded before rewrite.
- The checker refused to reach any P/Q comparison or Claim-promotion step.
  Its temporary `sorryAx` output describes unresolved failed elaboration, not
  accepted evidence or a new trusted axiom.
- Correction: pass the unchanged accepted-R parameter explicitly, unfold the
  relevant local definitions, and retain the exact same frozen Plan.

## Study and Act

Pending exact-head V5 evidence. Route Q is not accepted; CA-20 and selected
Route P remain unchanged. No merge is authorized.
