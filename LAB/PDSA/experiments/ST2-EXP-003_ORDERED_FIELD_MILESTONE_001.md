# ST2-EXP-003 — Independent Cauchy Ordered-Field Milestone 001

**Experiment:** `ST2-EXP-003`  
**Status:** `ACTIVE / INDEPENDENT CAUCHY ORDERED FIELD V5 PASS / COMPLETION OPEN`  
**Origin:** `DECISION_POINT / R-DP-001`  
**Frozen accepted reference:** `ea920b6b1e56444eddaf38ca91e6f7a968f10e0d`  
**Frozen Plan:** `70dd2f307eba69d7309a90cc36ae6f49741abddd`  
**Verified ordered-field source:** `fc1ac4fc9c8aebb90ff728619c347bea41f060bb`  
**Exact V5 run:** `32637591596`  
**Canonical accepted R/C:** unchanged

## Continuation provenance

This continuation record supplements the earlier execution Study and retains
its complete failed-run lineage. The previously preserved exact failures are:

```text
32630769132  quotient identity elaboration
32631916749  additive namespace boundary
32631997598  additive rewrite-target mismatch
32632080736  additive certificate ownership gap
32632711528  eventual-boundedness post-substitution drift
32633098730  product-bound namespace collision
32633963578  total-order tactic/namespace assumptions
```

The ordered-field continuation adds exact failures `32637335056` and
`32637512588` below. Nothing in this file rewrites the mechanisms already
recorded in `ST2-EXP-003_CAUCHY_REAL_ROUTE_STUDY.md`.

## Result

The independent rational-Cauchy branch now proves a **totally ordered field at
the project's witness-only inverse interface**. The proof assembly is rooted at

`BOMA.R.StageTwo.CauchyInverse003.cauchyOrderedFieldCertificate`.

The exact dependency closure contains **514 internal declarations** and
**zero selected Dedekind declarations**. No downstream complex declaration is
needed for the independent field milestone. This is branch-only research
evidence; it does not replace `R-BLOCK-001`, does not change `RA-22`, and does
not create a new accepted real export.

The completed independent route now includes:

```text
Cauchy asymptotic quotient identity
faithful accepted-Q embedding
additive commutative group
boundedness and product estimates
commutative ring
representative-invariant partial order
total order
ordered-ring compatibility
nonzero fixed-sign separation
nonzero multiplicative inverse witnesses
unique witness-only inverse contract
```

## Explicit logical provenance of inversion

The ordered-field proof does not hide reciprocal construction behind the
unchanged kernel axiom list. `positive_gap_inverse_sequence_exists` explicitly
uses:

```text
Classical.choose (hpoint n)
Classical.choose_spec (hpoint n)
```

to assemble one rational reciprocal value at each index from the accepted
pointwise existential `QInvRel` witness theorem. This is a **new source-level
data-selection use of Choice** in the Cauchy route even though the final kernel
axiom names remain:

```text
[propext, Classical.choice, Quot.sound]
```

The same axiom names already occurred earlier through rational trichotomy and
total-order witness extraction; therefore kernel-axiom equality is not treated
as provenance equality. The reciprocal selector is recorded separately.

No successful ordered-field target contains `sorryAx`, no new axiom is added,
and no standard-library real carrier is imported.

## Preserved inverse failure 1 — run 32637335056

```text
source commit  5b0aa06ecad92ae750cbc63cedf43189ab8ea031
failed gate    independent inverse source typecheck
mechanism      q_reciprocal_difference used `congr`; elaboration matched the
               wrong algebraic subterms after distributivity
classification ERR-ST2-028 / proof-elaboration / algebraic target matching
correction     replace automated congruence with explicit hfirst/hsecond
               equalities for the two distributed terms
```

This failure changed no mathematical assumption and did not weaken the inverse
contract.

## Corrected inverse source — run 32637421208

Commit `718a069d3201a69d5b47b8cbb5da0b3353d76583` typechecked the full inverse
source after the explicit factorization correction. At that point the general
workflow still audited the prior ordered-ring root, so this run was retained as
an intermediate source proof rather than final ordered-field closure evidence.

## Preserved inverse failure 2 — run 32637512588

```text
source commit  bf3efe665d2131770ac7e312c21ea3c678b062b0
Lean           PASS
closure        511 internal declarations / 0 selected Dedekind declarations
failed gate    exact milestone ownership comparison
missing owner  CauchyNonzeroGap003.cauchyNonzeroGapCertificate
classification ERR-ST2-029 / evidence-boundary / certificate ownership
mechanism      the final field proof consumed the sign-separation theorem but
               did not explicitly retain the prerequisite certificate wrapper
correction     add nonzeroGapCertificate as a field of the final ordered-field
               certificate; do not weaken the closure comparator
```

This is a provenance failure, not a mathematical counterexample. It confirms
that theorem reachability and declared milestone-certificate ownership are not
the same invariant.

## Final exact ordered-field V5 — run 32637591596 PASS

```text
verified source commit     fc1ac4fc9c8aebb90ff728619c347bea41f060bb
actual declaration count   514
selected Dedekind closure  0 declarations
residuals                   0
ordered_field_completed    true
Cauchy completeness        false
Dedekind LUB bridge         false
route comparison            false
downstream C rebuild        false
alternative accepted        false
experiment closed           false
```

Machine-readable evidence:

`LAB/20_FORMALIZATION/R_STAGE/ST2_EXP_003_ORDERED_FIELD_VERIFIED_EVIDENCE_RUN_32637591596.json`.

The exact workflow artifact is `9492731261`, digest
`325f581ae5fc185854e770d176dfc498a1e9f34d643d410fd26726b1b7548453`.

## Scientific boundary after this milestone

The branch has established an independent ordered field, **not yet an
independent real completion**. The next frozen Plan gate is Cauchy completeness.
No Dedekind/Cauchy comparison Junction and no downstream complex rebuild is
permitted before that completeness result is proved and its logical selection
costs are exposed.

The next work therefore begins by defining the branch's exact sequence-level
completion contract over `RCBOMA`, then either constructing the diagonal limit
with explicitly recorded representative selection or preserving any genuine
choice/diagonal obstruction as a scientific result.
