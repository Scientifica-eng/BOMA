# ST2-EXP-003 — H5 Dedekind/Cauchy Order-Isomorphism Milestone 001

**Experiment:** `ST2-EXP-003`  
**Phase:** `H5 / combined Dedekind-Cauchy comparison`  
**Milestone status:** `EXACT PASS / ORDER ISOMORPHISM PROVED / FIELD ISOMORPHISM NOT YET PROVED`  
**Date:** `2026-08-24`  
**Canonical acceptance impact:** `NONE`  
**Research Junction:** `NOT DECLARED`

## 1. Exact verification evidence

- exact verified head: `abdcc2101657e2bee14a303f4ab84553cdf75ca2`
- workflow: `.github/workflows/boma-st2-exp-003-dedekind-cauchy-comparison.yml`
- workflow run: `32712378169`
- conclusion: `SUCCESS`
- pinned Lean: `4.32.1`
- artifact ID: `9514579950`
- artifact SHA-256: `d43d05f00eaba4aa14208106374ae91ce9fc465b45838222264ec676e5abbc66`

The exact-head gate also revalidated the immutable H4 ancestry, unchanged
accepted Q/R/C inputs and accepted R producer, H4 governance authorization, and
strict separation between the independently verified Cauchy manifest and the
combined H5 comparison assembly.

## 2. Verified H5 progression

The exact comparison route now contains the following verified layers:

1. LUB-selected comparison maps `cToD` and `dToC`;
2. exact preservation of the shared rational embedding;
3. monotonicity in both directions;
4. strict rational-image density in the independently constructed Cauchy
   carrier;
5. rational-lower-bound reflection in both directions;
6. full order reflection in both directions;
7. exact order equivalences `cToD_order_iff` and `dToC_order_iff`;
8. mutual inverse laws:

```lean
theorem dToC_cToD (x : RCBOMA) :
    dToC (cToD x) = x

theorem cToD_dToC (x : RBOMA) :
    cToD (dToC x) = x
```

The combined machine-checkable target is:

`BOMA.R.StageTwo.DedekindCauchyComparison003.dedekindCauchyOrderIsomorphismCertificate`

## 3. Logical commitment surface

The exact run reported:

- `dToC_cToD`: `[propext, Classical.choice, Quot.sound]`
- `cToD_dToC`: `[propext, Classical.choice, Quot.sound]`
- `dedekindCauchyOrderIsomorphismCertificate`:
  `[propext, Classical.choice, Quot.sound]`

The `Classical.choice` occurrence is source-attributable to the LUB-selected
comparison maps and inherited selected witnesses; this milestone does not claim
that every order-isomorphism proof between complete real presentations must use
Choice.

## 4. Meaning and boundary

The independently completed Cauchy carrier and the accepted Dedekind carrier
are now formally **order-isomorphic through the explicit H5 maps** while fixing
the accepted rational embedding exactly.

This milestone does **not** yet prove:

- preservation of addition;
- preservation of negation;
- preservation of multiplication;
- preservation of nonzero inverse witnesses;
- a field isomorphism;
- a research R Junction;
- any replacement of accepted `R-BLOCK-001`;
- any downstream rebuild of accepted C.

Those are subsequent H5 obligations under the frozen Plan.

## 5. Provenance boundary

No accepted producer, accepted manifest, frozen Plan, accepted R export,
accepted C export, or canonical `main` commit was modified by this milestone.
The H5 comparison sources remain research-only and are absent from
`ST2_EXP_003_CAUCHY_INDEPENDENT_INPUTS.txt`.

Current scientifically valid frontier:

```text
H4 independent Cauchy LUB          EXACT PASS
H5 foundation                      EXACT PASS
H5 Cauchy rational density         EXACT PASS
H5 order reflection                EXACT PASS
H5 mutual inverse                  EXACT PASS
H5 order isomorphism               EXACT PASS
field-operation preservation       NOT YET PROVED
field isomorphism                  NOT YET PROVED
research R Junction                NOT CREATED
downstream C rebuild               NOT STARTED
accepted R / C / main              UNCHANGED
```
