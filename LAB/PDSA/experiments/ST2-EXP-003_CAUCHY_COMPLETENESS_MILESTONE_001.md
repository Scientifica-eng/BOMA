# ST2-EXP-003 — Independent Cauchy Completeness Milestone 001

**Experiment:** `ST2-EXP-003`  
**Status:** `ACTIVE / CAUCHY COMPLETENESS V5 PASS / DEDEKIND LUB BRIDGE OPEN`  
**Origin:** `DECISION_POINT / R-DP-001`  
**Frozen accepted reference:** `ea920b6b1e56444eddaf38ca91e6f7a968f10e0d`  
**Frozen Plan:** `70dd2f307eba69d7309a90cc36ae6f49741abddd`  
**Verified completion source:** `26565faa7b609f285615d86bc3a6bc0260a40041`  
**Exact V5 run:** `32641010707`  
**Canonical accepted R/C:** unchanged

## Result

The independent rational-Cauchy branch now proves the exact sequential
completion contract declared for `RCBOMA`:

```text
RCCauchyComplete :=
  ∀ u : RCSeq, IsRCCauchy u → ∃ x : RCBOMA, RCConverges u x
```

The audited root is

`BOMA.R.StageTwo.CauchyCompletion003.cauchyCompletionCertificate`.

Its actual dependency closure contains **574 internal declarations**, **zero
selected Dedekind declarations**, and zero downstream C declarations. The
exact comparison audit returns `CAUCHY_COMPLETE_PASS` with no residuals.

This establishes H3 of the frozen Plan. It does not establish the accepted
Dedekind least-upper-bound contract, a Dedekind/Cauchy isomorphism, a research
reconvergence Junction, or a downstream C rebuild.

## Proof architecture

The completeness proof is deliberately factored into four independently
inspectable layers.

1. `CauchyCompletionCore003` defines `rCClose`, quotient-valued Cauchy
   sequences, convergence, and the exact completeness proposition, and proves
   the closeness calculus.
2. `CauchyDensity003` proves that every `RCBOMA` class has an embedded-rational
   approximation at every positive rational radius.
3. `CauchyApproximation003` chooses one rational approximation at the explicit
   vanishing scale `qCauchyScale n` for each sequence term, then proves that
   the chosen rational sequence is Cauchy.
4. `CauchyCompletion003` packages that rational sequence as a `CauchySeq`,
   proves its embedded terms converge to its quotient class, and combines two
   half-radius bounds to obtain convergence of the original quotient-valued
   sequence.

The limit supplied for a Cauchy sequence `u` is therefore

```text
rCmk (approxCauchySeq u hu)
```

rather than a hidden standard-real or Dedekind object.

## Explicit F5 Choice boundary

The successful kernel axiom list is

```text
[propext, Classical.choice, Quot.sound]
```

but this equality of names is not treated as equality of source provenance.
Three data-producing Choice sites are now explicit and separately audited:

```text
ST2Exp003CauchyInverse.lean       reciprocal sequence values
ST2Exp003CauchyScale.lean         reciprocal scale (n+1)^-1
ST2Exp003CauchyApproximation.lean one rational approximation for each u(n)
```

The third site is the countable approximation selector required by the
completeness construction. It uses `Classical.choose` on the proved density
existential at each accepted-natural index. The final completeness theorem
therefore has an explicit classical data-selection cost rather than an
unattributed representative-selection step.

## Exact V5 evidence

```text
run                         32641010707
verified source             26565faa7b609f285615d86bc3a6bc0260a40041
completion root             CauchyCompletion003.cauchyCompletionCertificate
actual declaration count    574
selected Dedekind closure   0 declarations
residuals                   0
ordered field               true
rational density            true
vanishing rational scale    true
Cauchy completeness         true
Dedekind LUB bridge         false
Dedekind comparison         false
downstream C rebuild        false
alternative accepted        false
experiment closed           false
```

Artifact ID: `9493600201`.  
Artifact SHA-256:
`06057754d0042e5c5e166758fedb1ac6b881924c2b7736abd7134c55d9588741`.

Machine-readable evidence:

`LAB/20_FORMALIZATION/R_STAGE/ST2_EXP_003_CAUCHY_COMPLETION_VERIFIED_EVIDENCE_RUN_32641010707.json`.

## Scientific boundary after H3

The branch is now an independently constructed, sequentially Cauchy-complete,
totally ordered field in the project's explicit interface. This is a stronger
milestone than the prior ordered-field result, but it is not yet enough to call
it interchangeable with the accepted Dedekind producer.

The next frozen Plan gate is H4: identify and prove the accepted Dedekind
least-upper-bound contract on the Cauchy carrier, or prove the exact bridge
from the verified sequential completeness/density/Archimedean structure to
that contract. Direct Dedekind/Cauchy comparison and downstream C rebuilding
remain closed until that bridge is verified.
