# ST2-EXP-003 — Cauchy Real Route Study Continuation through H3

**Experiment:** `ST2-EXP-003`  
**Status:** `ACTIVE / H3 CAUCHY COMPLETENESS V5 PASS / H4 DEDEKIND LUB BRIDGE OPEN`  
**Parent study:** `ST2-EXP-003_CAUCHY_REAL_ROUTE_STUDY.md`  
**Typed origin:** `DECISION_POINT / R-DP-001`  
**Frozen Plan:** `70dd2f307eba69d7309a90cc36ae6f49741abddd`

This continuation does not rewrite the earlier Study. It records the later
ordered-field and completeness work, including every retained failed run used
by current governance.

## Preserved failure chain

The active experiment retains the following exact V5 failures:

```text
32630769132  ERR-ST2-020  quotient Setoid inference
32631916749  ERR-ST2-021  additive namespace ownership
32631997598  ERR-ST2-022  additive rewrite target mismatch
32632080736  ERR-ST2-023  additive certificate ownership gap
32632711528  ERR-ST2-024  boundedness post-substitution normalization
32633098730  ERR-ST2-025  product-bound namespace collision
32633963578  ERR-ST2-026/027 total-order tactic and namespace failures
32637335056  ERR-ST2-028  reciprocal algebraic congruence mismatch
32637512588  ERR-ST2-029  ordered-field certificate ownership gap
32638074040  ERR-ST2-030  completion-core namespace/orientation mismatch
32640562655  ERR-ST2-031  quotient-induction wrapper rewrite mismatch
32640838804  ERR-ST2-032  completion-source rational-order namespace omission
```

No failed run is treated as successful evidence. Corrections preserve the same
mathematical contracts and are verified only by later exact-head runs.

## Ordered-field transition

Exact ordered-field closure:

```text
verified source  fc1ac4fc9c8aebb90ff728619c347bea41f060bb
exact run        32637591596
closure          514 declarations
selected Dedekind declarations 0
status           ORDERED_FIELD_PASS
```

The inverse construction exposes `Classical.choose` for reciprocal sequence
assembly. This is a source-level data-selection commitment, not merely an
inherited kernel-axiom name.

## H3 construction strategy

The completion proof avoids a hidden double representative diagonal. It first
proves rational density in the research quotient, then chooses one rational
approximation to each quotient-valued sequence term at the explicit vanishing
scale `qCauchyScale n`. The chosen rational sequence is proved Cauchy and its
quotient class is used as the limit.

The stages are:

```text
CauchyCompletionCore003  exact quotient closeness/Cauchy/convergence contract
CauchyDensity003         embedded-Q density in RCBOMA
CauchyApproximation003   countable rational selector + selected sequence Cauchy
CauchyCompletion003      embedded-term convergence + final RCCauchyComplete
```

### ERR-ST2-030 — run 32638074040

The first completion-core assembly failed because `qPos` was not in the new
file's namespace context and because `rcle_add_right` produced a syntactically
opposite commutative addition order in `rCClose_mono`. The correction opened
`BOMA.R.Gateway001` and rewrote commutativity explicitly. No definition of
Cauchy convergence or completeness changed.

Corrected completion-core exact run: `32640435314` PASS.

### ERR-ST2-031 — run 32640562655

The first density source failed in the second half of
`rational_approximation_exists`: quotient induction exposed `Quotient.mk`
directly and `rw [rCAdd_mk]` no longer matched the wrapper spelling. The
correction used an explicit representative-level `change`. The density theorem
and radius remained unchanged.

Corrected density exact run: `32640650116` PASS.

## Explicit F5 Choice boundary

`ST2Exp003CauchyApproximation.lean` defines a noncomputable rational selector
at each accepted-natural index by applying `Classical.choose` to the proved
density existential at radius `qCauchyScale n`. It then proves the selected
sequence Cauchy with the error decomposition

```text
quarter + half + quarter = epsilon.
```

The selector source itself passed Lean in run `32640759293`.

### ERR-ST2-032 — run 32640838804

The first full completion source reached the final file but did not open
`BOMA.Q.Order001`, so `qLE` and `qle_trans` were unknown. Opening that exact
accepted rational-order namespace fixed the elaboration. No theorem statement,
limit object, or epsilon budget changed.

Corrected source-level full completeness run: `32640910046` PASS on commit
`2a2633c4130be6dc0b8bcb325f18345c1af2a654`.

## H3 exact completion-root V5 — run 32641010707 PASS

The CI root was then raised from the ordered-field certificate to

`BOMA.R.StageTwo.CauchyCompletion003.cauchyCompletionCertificate`.

Exact result:

```text
verified head                 26565faa7b609f285615d86bc3a6bc0260a40041
status                        CAUCHY_COMPLETE_PASS
actual declaration count      574
selected Dedekind declarations 0
residuals                     0
ordered field                 true
rational density              true
vanishing rational scale      true
Cauchy completeness           true
Dedekind LUB bridge           false
Dedekind comparison           false
downstream C rebuild          false
alternative accepted          false
experiment closed             false
```

The successful completion theorem and final certificate report kernel axioms

```text
[propext, Classical.choice, Quot.sound].
```

Source provenance distinguishes three explicit data selectors: reciprocal
values, the vanishing reciprocal scale, and countably many rational
approximations. The final closure contains no selected Dedekind declaration.

Artifact ID `9493600201`, SHA-256
`06057754d0042e5c5e166758fedb1ac6b881924c2b7736abd7134c55d9588741`.

## Study conclusion at H3

H3 is supported: the independent Cauchy carrier is a sequentially Cauchy-
complete totally ordered field under the project's explicit contracts. The
result does **not** yet support H4/H5 equivalence with the accepted Dedekind
real producer. The next controlled task is to identify the exact accepted
least-upper-bound contract and prove it independently or derive it through an
explicit theorem from the verified Cauchy completeness, density, order, and
Archimedean structure. No research comparison Junction is authorized before
that bridge passes.
