# ST2-EXP-003 — Independent Cauchy LUB Milestone 001

**Experiment:** `ST2-EXP-003`  
**Status:** `ACTIVE / H4 DEDEKIND-LUB CONTRACT V5 PASS / H5 COMPARISON NOT STARTED`  
**Origin:** `DECISION_POINT / R-DP-001`  
**Frozen accepted reference:** `ea920b6b1e56444eddaf38ca91e6f7a968f10e0d`  
**Frozen Plan:** `70dd2f307eba69d7309a90cc36ae6f49741abddd`  
**H4 source completion commit:** `cb31e12e2b4fb7a07488a09c2a9394d4ab61946c`  
**Exact audited H4 head:** `0f4a706d94c394b8e8a9eec836859caac772a944`  
**Exact V5 run:** `32643579395`  
**Canonical accepted R/C:** unchanged

## Result

H4 is now proved at the exact least-upper-bound strength required by the
accepted RA-11 contract, but on the independent rational-Cauchy quotient
`RCBOMA` rather than by importing the selected Dedekind lower-cut producer.

The final theorem is:

```text
BOMA.R.StageTwo.CauchyLUB003.rCauchy_lub_exists
```

For every family `F : RCBOMA → Prop`, nonemptiness and one explicit upper
bound imply an element `s : RCBOMA` such that every member of `F` is below `s`
and `s` is below every common upper bound. The integration root is:

```text
BOMA.R.StageTwo.CauchyLUB003.cauchyLUBCertificate
```

The exact dependency closure contains **625 internal declarations**, **zero
selected Dedekind declarations**, and **zero residuals**. This proves the H4
contract independently; it does not yet prove any isomorphism/equality between
`RCBOMA` and the accepted Dedekind `RBOMA` carrier.

## Construction path

The proof proceeds through three explicit stages:

1. `CauchyLUBBracket003` — for every positive rational step `delta`, construct
   adjacent embedded rationals `b` and `b+delta` with `b` not an upper bound
   and `b+delta` an upper bound.
2. `CauchyLUBSequence003` — at the vanishing scale `qCauchyScale n`, select one
   lower bracket endpoint and prove the selected rational sequence is Cauchy.
3. `CauchyLUB003` — build matching upper endpoints, prove lower/upper sequences
   asymptotically equivalent, prove order closure from embedded pointwise bounds
   to quotient classes, and use the lower class as the least upper bound.

No `LowerCut`, `BOMA.R.Dedekind*`, `BOMA.R.StageIntegration002`, or downstream
`BOMA.C.*` declaration occurs in the independent H4 dependency closure.

## Logical provenance

All printed H4 targets depend on:

```text
[propext, Classical.choice, Quot.sound]
```

Source-level provenance is more precise than that shared kernel list:

- finite first-upper search uses localized proposition-level `Classical.em`;
- the shrinking bracket sequence uses explicit `Classical.choose` and
  `Classical.choose_spec` once per accepted-natural index;
- the final LUB assembly introduces no hidden Dedekind producer and no new
  unrecorded selector.

Thus finite proposition search and countable data selection remain separately
classified even though both ultimately appear under the same kernel
`Classical.choice` commitment.

## Preserved H4 failure 1 — run 32641626366

```text
source commit  ac7345bbbc0fe1e3e2e1804fa603e00214922fe6
failed gate    H4 rational bracket source typecheck
mechanism      quotient additive normalization did not identify
               rCOfQ qZero with the rCZero alias automatically
correction     make the zero-carrier conversion explicit by definitional rfl
classification ERR-ST2-033 / quotient-alias elaboration
```

The corrected bracket source passed exact V5 run `32642913594` on commit
`1d604528278c3c8c1fd0c8e967d2ea2226a4e158`.

## Preserved H4 failure 2 — run 32643073959

```text
source commit  927028a3e5bd01b6784381546104bf3e5609fb13
failed gate    H4 lower-bracket sequence certificate typecheck
mechanism      certificate type used anonymous implication binders and later
               attempted to recover hne/hUB through implicit-term notation
correction     name hne and hUB explicitly in the certificate field type
classification ERR-ST2-034 / dependent-certificate binder elaboration
```

The corrected lower-bracket sequence passed exact V5 run `32643154639` on
commit `fa65174f2518c3e474a92c655554a3b55ca0393a`.

## Preserved H4 failure 3 — run 32643253314

```text
source commit  63d1dd5988634676b3a4961cc9a64ee3132b482f
failed gate    full H4 LUB source typecheck
mechanism      the proof used common_upper_bound through an undeclared
               namespace side effect; the local H4 source did not own the name
correction     add h4_common_upper_bound directly from accepted le_total and
               use it in both quotient order-closure lemmas
classification ERR-ST2-035 / namespace-ownership elaboration
```

The completed H4 source then passed on commit
`cb31e12e2b4fb7a07488a09c2a9394d4ab61946c`; the subsequent H4-rooted audit
passed on exact head `0f4a706d94c394b8e8a9eec836859caac772a944`.

## Final audited H4 V5 — run 32643579395 PASS

```text
actual declaration count      625
selected Dedekind closure     0 declarations
residuals                     0
ordered field                 true
sequential Cauchy completeness true
exact family LUB contract     true
Dedekind/Cauchy comparison    false
downstream C rebuild          false
alternative accepted          false
experiment closed             false
```

Machine-readable evidence:

`LAB/20_FORMALIZATION/R_STAGE/ST2_EXP_003_LUB_VERIFIED_EVIDENCE_RUN_32643579395.json`.

Workflow artifact: `9494260356`; SHA-256:
`487e43f17949555fd0a518052538b993ec7552f09a5b00da4aa0f1b7e1d90437`.

## Boundary after H4

H4 establishes that the Cauchy route independently satisfies the same
least-upper-bound **contract shape and strength** used by the accepted real
integration. It does not establish carrier identity or an order/field
isomorphism with the selected Dedekind route.

The frozen Plan therefore permits the next scientific gate, H5, only after
this H4 result and its failure lineage are enforced by current governance. H5
must compare two already independently completed real routes; it must not use
the accepted Dedekind producer to retroactively prove H4.
