# ST2-EXP-003 — H5 Dedekind/Cauchy Comparison Execution 001

**Experiment:** `ST2-EXP-003`  
**Phase:** `H5 / combined Dedekind-Cauchy comparison`  
**Status:** `ACTIVE / FOUNDATION SOURCE WRITTEN / PROOF VERIFICATION BLOCKED BEFORE RUNNER STEP 1`  
**Date:** `2026-08-23`  
**Canonical acceptance impact:** `NONE`  
**Research Junction:** `NOT DECLARED`

## 1. Entry condition

H5 was opened only after the independently assembled Cauchy route had passed the
exact H4 least-upper-bound contract and the dedicated H4 governance gate had
reported `h5_comparison_allowed = true`.

The H4 proof remains separately rooted at
`BOMA.R.StageTwo.CauchyLUB003.cauchyLUBCertificate`; no selected Dedekind source
was added to `ST2_EXP_003_CAUCHY_INDEPENDENT_INPUTS.txt`.

## 2. Combined-assembly separation

The accepted real manifest remains unchanged:

`LAB/20_FORMALIZATION/R_STAGE/R_INTEGRATION_002_INPUTS.txt`

A separate H5 addendum was created:

`LAB/20_FORMALIZATION/R_STAGE/ST2_EXP_003_DEDEKIND_CAUCHY_COMPARISON_INPUTS.txt`

The intended combined target is assembled by concatenating the unchanged
accepted real manifest first and the research-only H5 addendum second. The H5
comparison source is deliberately absent from the independent Cauchy manifest.

Addendum commit:
`8aa2290ded76f4d05fd0e25b556975003afa91c1`

## 3. Foundation source

Source:
`LAB/payloads/lean/RStage/ST2Exp003DedekindCauchyComparison.lean`

Source commit:
`fe46bb3e75f14fbcbc19567fb715e273c4cf0205`

The current foundation defines two LUB-selected comparison maps over the common
accepted rational carrier:

- `cToD : RCBOMA -> RBOMA`
- `dToC : RBOMA -> RCBOMA`

and attempts to prove only the following first-layer claims:

1. explicit rational lower/upper witnesses on both carriers;
2. nonempty bounded rational-envelope families;
3. existence/specification of both comparison maps;
4. exact preservation of the accepted rational embedding in both directions;
5. monotonicity in both directions;
6. a `DedekindCauchyComparisonFoundationCertificate` packaging the accepted
   `RStageIntegrationCertificate` and independent `CauchyLUBCertificate`.

The source does **not** claim order reflection, injectivity, mutual inverses,
field isomorphism, canonical equivalence, or a research Junction.

## 4. H5 V5 workflow

Workflow:
`.github/workflows/boma-st2-exp-003-dedekind-cauchy-comparison.yml`

Workflow commit:
`8cb20eb9fc7c15204f1e08d48d22f6f3f6f9085a`

The workflow is designed to:

- pin the exact head, frozen Plan, H4 verified ancestor, and unchanged accepted
  Q/R/C producers;
- require `H4_GOVERNANCE_PASS` and `h5_comparison_allowed = true`;
- reject contamination of the independent Cauchy manifest;
- assemble accepted Dedekind R plus the separate research Cauchy/H5 addendum;
- typecheck the H5 foundation in pinned Lean;
- print logical commitments for the comparison targets;
- extract a separate combined dependency closure without replacing the
  independent H4 closure.

## 5. Verification attempts and classification

GitHub Actions run `32653354891` at exact head
`8cb20eb9fc7c15204f1e08d48d22f6f3f6f9085a` failed before any workflow step
record was created. A rerun of the failed jobs (`run_attempt = 2`) failed in the
same pre-step condition. The corresponding H4 and C-stage workflows on the
same commit also terminated with no step records.

Therefore these executions are **not classified as mathematical, Lean,
manifest, H5 governance, or experiment failure evidence**. No `ERR-ST2-*` class
is assigned from them, and no H5 claim is promoted to PASS.

The public GitHub status page reported Actions operational during the
investigation, so the exact repository/account hosted-runner cause remains
unresolved from the available evidence. The repository record therefore states
only the directly observed fact: jobs terminated before step 1 and produced no
usable Lean log.

## 6. Proof-engineering analysis while verification is blocked

A second comparison design was identified that may become useful if the
symmetric LUB maps make order reflection unnecessarily expensive. For a Cauchy
real `x`, define a buffered rational lower predicate conceptually by

`q in L_x  <->  exists delta > 0, rCOfQ (q + delta) <= x`.

This predicate is naturally downward closed and rounded by splitting `delta`.
It may permit a direct Cauchy-to-Dedekind lower-cut map and an inverse proof via
cut membership, without introducing a new strict-density or locatedness
principle. This is currently a design observation only; it has not replaced the
foundation source and carries no proof status.

## 7. Current H5 boundary

Current scientifically valid status:

`H5 AUTHORIZED / COMBINED FOUNDATION WRITTEN / LEAN VERIFICATION NOT YET OBTAINED / NO JUNCTION`

H4 remains the latest independently verified mathematical frontier. Accepted
`R-BLOCK-001`, selected `C-ROUTE-P`, accepted `C-BLOCK-002 / CA-20`, and `main`
remain unchanged.
