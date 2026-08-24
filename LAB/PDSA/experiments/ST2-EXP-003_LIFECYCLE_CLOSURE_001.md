# ST2-EXP-003_LIFECYCLE_CLOSURE_001 — Owner-authorized lifecycle closure

**Document ID:** `BOMA-ST2-EXP-003-LIFECYCLE-CLOSURE-001`  
**Date:** `2026-08-24`  
**Status:** `CLOSED / PASS / OWNER AUTHORIZED`  
**Experiment:** `ST2-EXP-003`  
**Architectural origin:** `R-DP-001` above accepted `Q-BLOCK-002`  
**Immutable Frozen Plan:** `LAB/PDSA/PDSA-ST2-EXP-003_INDEPENDENT_CAUCHY_REAL_ROUTE.md`  
**Frozen Plan commit:** `70dd2f307eba69d7309a90cc36ae6f49741abddd`

## 1. Closure authorization

After the mathematical H1–H6 program had completed and PR #8 had been merged
into `main`, the owner explicitly authorized lifecycle closure of
`ST2-EXP-003` and release of the single-active-experiment slot on 2026-08-24.

This is a lifecycle/governance transition. It is not a new mathematical
acceptance decision and does not rewrite the immutable Frozen Plan.

## 2. Final mathematical state before closure

Final branch head carrying the synchronized experiment state:

```text
3d4ed58e5d88b2a0bd84b3958cac2c8572385152
```

That exact head passed the three critical V5 workflows:

```text
Independent Cauchy Real Route
  run      32727267231
  artifact 9520001887
  sha256   e7c8e9959445e182eab133a11f7352fbf4a9a6ae270d7b81037b2008b663de8c

Dedekind-Cauchy Comparison / Research R Junction
  run      32727267177
  artifact 9520005288
  sha256   3ecf85142656442bad312ace22e62266a15de534fd228c106075247367cdbf34

Cauchy Quadratic Rebuild
  run      32727267183
  artifact 9520002118
  sha256   72475d7c6bc489bf532480f5075699f91304c4128b52e446275855e6a31555fa
```

Accepted-control regressions also passed on that same exact SHA, including the
accepted-R interface, selected C pair ring, selected C norm/witness field,
quadratic route probes, representation-neutral quadratic comparison,
same-carrier integration/Claim transparency, Stage C acceptance/transparency,
and the retained ST2-EXP-002 P/Q research route.

## 3. Merge identity

PR #8 was owner-authorized and merged into `main` as:

```text
merge commit 5431ac81e7327f5bf4b06b3ab7fdb2bcb5b69efd
parent 1     ea920b6b1e56444eddaf38ca91e6f7a968f10e0d
parent 2     3d4ed58e5d88b2a0bd84b3958cac2c8572385152
```

The merge commit tree is identical to the final exact-verified branch tree, so
the merge added ancestry but no post-verification file-content drift.

## 4. Final scientific disposition

```text
ST2-EXP-003 MATHEMATICAL RESULT:       PASS
ST2-EXP-003 LIFECYCLE:                 CLOSED
RESEARCH CAUCHY R PRODUCER:             RETAIN AS VERIFIED RESEARCH EVIDENCE
RESEARCH R JUNCTION:                    RETAIN AS VERIFIED RESEARCH EVIDENCE
H6 CAUCHY-NATIVE C CORE:                RETAIN AS VERIFIED RESEARCH EVIDENCE
CANONICAL R-DP-001 SELECTION:           RETAIN DEDEKIND
ACCEPTED R-BLOCK-001:                   UNCHANGED
CANONICAL C-DP-001 / C-ROUTE-P:         RETAIN
ACCEPTED C-BLOCK-001 / C-BLOCK-002:     UNCHANGED
CA-20:                                  UNCHANGED
PROMOTE CAUCHY R TO ACCEPTED EXPORT:    NO
PROMOTE H6 C TO ACCEPTED EXPORT:        NO
ACTIVE STAGE-TWO EXPERIMENT:            NONE
NEXT EXPERIMENT SLOT:                   OPEN / OWNER SELECTION REQUIRED
```

## 5. Research Junction identity

The verified Dedekind/Cauchy reconvergence is indexed for the closed experiment
as the research Junction:

```text
ST2-EXP-003-R-J-001
```

This spelling follows the repository's canonical Junction identifier grammar
while the ledger classification keeps it explicitly **research-only**. It does
not imply a canonical `UNIT.md`.

Its evidence record remains:

`LAB/PDSA/experiments/ST2-EXP-003_DEDEKIND_CAUCHY_R_JUNCTION_001.md`.

This identifier is research provenance only. It is not a canonical acceptance
Junction and does not replace `R-BLOCK-001` or accepted `R-ROUTE-D`.

## 6. Next-frontier boundary

Lifecycle closure frees the single-active-experiment slot but does **not**
select or authorize the next experiment. The candidate inventory and
transferable dossiers remain proposal material only. In particular,
`ST2-EXP-011` remains documented but unstarted until separately selected and
frozen by the owner.

Any future experiment must follow the candidate/Frozen-Plan discipline and
must begin from the then-current accepted `main`, not from an implicit
continuation of the now-closed ST2-EXP-003 branch.