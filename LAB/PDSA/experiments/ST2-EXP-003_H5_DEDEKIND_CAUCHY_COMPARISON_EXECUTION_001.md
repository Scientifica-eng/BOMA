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

Initial workflow commit:
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
same pre-step condition. The corresponding H4 and C-stage PR-triggered
workflows on the same commit also terminated with no step records.

A controlled H5-only runner-image probe changed `runs-on` from `ubuntu-latest`
to `ubuntu-22.04` at commit
`a111e4659f729048d549dceb91d5e1b1803a12f5`. PR-triggered run
`32654478378` again terminated with `steps = null`. This excludes the selected
Ubuntu image as the observed cause. The H5 workflow was then restored to
`ubuntu-latest` at commit
`31bed714fb7e196aaf403da6f3b1b5f0735983f5`.

The available GitHub connector's commit-run listing is explicitly restricted to
pull-request-triggered runs. Therefore this record makes no claim about an
unobserved push-triggered execution unless its run ID becomes independently
available.

These pre-step executions are **not classified as mathematical, Lean,
manifest, H5 governance, or experiment failure evidence**. No `ERR-ST2-*` class
is assigned from them, and no H5 claim is promoted to PASS.

The public GitHub status page reported Actions operational during the
investigation, so the exact repository/account hosted-runner cause remains
unresolved from the available evidence. The repository record therefore states
only the directly observed fact: the visible PR jobs terminated before step 1
and produced no usable Lean log.

## 6. Current proof route after foundation

The current LUB-selected maps remain the preferred H5 route. A direct buffered
lower-cut map was analyzed but does not remove the need for an inner rational
approximation theorem when proving the inverse compositions, so it is retained
only as a fallback design.

The next theorem required after the foundation is a Cauchy-route analogue of
accepted Dedekind rational density:

```lean
theorem rC_rational_image_dense {x y : RCBOMA} (hxy : rCLT x y) :
    ∃ q : QBOMA,
      rCLT x (rCOfQ q) ∧ rCLT (rCOfQ q) y
```

A proof route has been reduced to already verified independent interfaces:

1. translate `x < y` to a positive additive difference
   `d = rCAdd y (rCNeg x)` using `rcle_add_right`, additive inverse laws,
   total-order strictness, and antisymmetry;
2. obtain one fixed positive rational gap below `d` from the already verified
   nonzero-gap machinery (`eventually_positive_gap_of_nonzero` or the same
   representative-level witness mechanism);
3. split that rational gap into smaller positive error budgets using the
   accepted-Q `positive_half_exists` gateway;
4. use `rational_approximation_exists` at a sufficiently small radius to pick a
   rational approximation to `x`;
5. translate the approximation inequalities to obtain a rational strictly
   above `x` but still below `x + gap <= y`.

No selected Dedekind producer, new locatedness principle, or new axiom is
expected in this density lemma. Any explicit data selection introduced by the
chosen proof must still be source-attributed separately from the inherited
kernel axiom list.

Once strict rational density is verified, H5 should proceed by rational-envelope
reflection rather than by ad hoc field algebra:

```text
Cauchy reflection:
  rLE (rOfQ q) (cToD x)  ->  rCLE (rCOfQ q) x

Dedekind reflection:
  rCLE (rCOfQ q) (dToC z)  ->  rLE (rOfQ q) z
```

The intended contradiction pattern is the same on both sides: if the reflected
order failed, totality plus strict rational density supplies an embedded
rational strictly between the alleged upper endpoint and the source element;
that rational is then a member of the relevant rational-envelope family, which
contradicts the LUB inequality.

With reflection in hand, the rational envelopes below `x` and below
`dToC (cToD x)` coincide exactly, and likewise on the Dedekind side. LUB
uniqueness then gives the two composition laws:

```lean
dToC (cToD x) = x
cToD (dToC z) = z
```

Only after those equalities pass exact-head Lean should H5 promote the maps to
an order isomorphism. Preservation of addition, negation, multiplication, and
nonzero inverse witnesses remains a subsequent obligation. A research-only
R-route Junction is forbidden until that stronger comparison is actually
proved and its dependency/logical costs are audited.

## 7. Current H5 boundary

Current scientifically valid status:

`H5 AUTHORIZED / COMBINED FOUNDATION WRITTEN / LEAN VERIFICATION NOT YET OBTAINED / NO JUNCTION`

H4 remains the latest independently verified mathematical frontier. Accepted
`R-BLOCK-001`, selected `C-ROUTE-P`, accepted `C-BLOCK-002 / CA-20`, and `main`
remain unchanged.
