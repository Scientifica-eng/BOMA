# PDSA-C-009 / RE-C-001 — Accepted Complex Dependency Classification

**Status:** `FINAL STUDY MATRIX / RE-C-001 COMPLETE`  
**Accepted object:** `C-BLOCK-002 / CA-20 ACCEPT`  
**Formal root:** `BOMA.C.StageIntegration001.cStageIntegrationCertificate`  
**Exact initial closure:** run `32585583815` / source
`9a6f9e34639202c2a04d2a629e2b994f5d1562b8`  
**Six-stage cross-check:** run `32586145793` / source
`6820278f566fc637c39582c3efa648d5c1d136df`

## Classification invariant

`STRUCTURALLY NECESSARY` means necessary relative to the declared
`BOMA-C-ACCEPT-001` semantics, not metaphysically necessary for all possible
number systems or all presentations. A formal closure edge is not automatically
a mathematical premise: its source, direct consumer, and packaging must be read.

## Actual closure measurements

```text
internal declarations                    783
external formal-boundary leaves           76
declaration dependency edges            9629
resolved source ranges                   783
unresolved / unowned / undeclared          0
internal declarations directly in C      161
C-source → R-source edges                441
distinct R declarations consumed          25
distinct R certificate field projections  16
```

The exact selected C sources project these accepted R certificate fields:

- `RStageIntegrationCertificate.addAssoc`
- `RStageIntegrationCertificate.addComm`
- `RStageIntegrationCertificate.addInverseRight`
- `RStageIntegrationCertificate.addTranslateOrderIff`
- `RStageIntegrationCertificate.addZeroLeft`
- `RStageIntegrationCertificate.distribRight`
- `RStageIntegrationCertificate.inverseExists`
- `RStageIntegrationCertificate.mulAssoc`
- `RStageIntegrationCertificate.mulComm`
- `RStageIntegrationCertificate.mulOneLeft`
- `RStageIntegrationCertificate.negOrderReversing`
- `RStageIntegrationCertificate.nontrivial`
- `RStageIntegrationCertificate.orderAntisymm`
- `RStageIntegrationCertificate.orderMulNonneg`
- `RStageIntegrationCertificate.orderTotal`
- `RStageIntegrationCertificate.orderTrans`

There is **no direct C projection** of Dedekind completeness, rational density,
Archimedean bounds, or the Q embedding.

## Necessity and provenance matrix

| Component | Reverse classification | Evidence-based reason |
| --- | --- | --- |
| accepted real carrier, zero, one, negation, addition, multiplication | STRUCTURALLY NECESSARY | The selected quadratic extension needs an actual coefficient domain and ring operations; a different accepted R realization can supply them. |
| accepted-real nontriviality | STRUCTURALLY NECESSARY | `nontrivial` prevents the selected field and embedded generator from collapsing. |
| accepted-real additive/multiplicative laws | STRUCTURALLY NECESSARY | Exactly the algebraic certificate projections used by pair-ring and comparison producers. |
| accepted-real inverse witnesses | STRUCTURALLY NECESSARY FOR SELECTED FIELD CLOSURE | `inverseExists` is consumed locally on `cNorm z`; no global inverse function is assumed. |
| ordered-real positivity / nonnegative multiplication / totality | SELECTED-PROOF SUPPORT / LOGICAL-PROVENANCE SENSITIVE | `orderTotal`, `orderMulNonneg`, `negOrderReversing`, and related order laws support square positivity and selected norm nonvanishing. |
| faithful R embedding and unique `a+bI` generation | STRUCTURALLY NECESSARY | Explicit `CA-03`, `CA-05`, `CA-08`, and `CA-09` contract content. |
| commutative field and `I²=-1` | STRUCTURALLY NECESSARY | Core Stage-One quadratic extension semantics; not a consequence of merely choosing convenient coordinates. |
| pair-record carrier and record equality | METHOD / REPRESENTATION CHOICE | `C-DP-001` user-ratifies Route P; the common contract does not force ordered pairs. |
| Lean `CBOMA` abbreviation / generated constructors and eliminators | FORMALIZATION / PROOF-ENGINEERING ONLY | Implementation infrastructure; distinguish from mathematical carrier/equality obligations. |
| conjugation and sum-of-squares norm | SELECTED-PROOF SUPPORT | Reusable selected Route P inverse construction; not separately promoted Stage-One acceptance Claims. |
| existential unique inverse witnesses | STRUCTURALLY NECESSARY AT CONTRACT STRENGTH | The field obligation is witnessed without defining a Choice-backed total inversion function. |
| whole accepted R integration certificate | INHERITED BUNDLED-INTERFACE DEPENDENCY | Passed as one concrete value; actual declaration closure expands all its producer fields, not only fields directly projected by C. |
| Dedekind LUB completeness producer | INHERITED BUNDLED-INTERFACE DEPENDENCY | `rDedekind_lub_exists` is present in full formal closure but no C source projects completeness. |
| rational density producer | INHERITED BUNDLED-INTERFACE DEPENDENCY | `r_rational_image_dense` and its classical proof enter via the concrete whole R certificate, not a direct C density use. |
| Archimedean producer | INHERITED BUNDLED-INTERFACE DEPENDENCY | `r_archimedean_strict_upper` and grid witnesses occur in full closure but C never projects an Archimedean field. |
| Dedekind cuts, cut equivalence, quotient identity | INHERITED SELECTED-R REALIZATION / FORMALIZATION | `LowerCut`, `CutEquiv`, `RBOMA := Quotient ...` occur through the accepted real carrier/operations; C does not inspect cut internals as a mathematical premise. |
| `Classical.em` upstream order totality | INHERITED LOGICAL COMMITMENT / ACTUALLY CONSUMED | C nonsquare producer projects `orderTotal`; current accepted R total-order producer uses localized classical excluded middle. |
| `Classical.byContradiction` density path | INHERITED BUNDLED-INTERFACE DEPENDENCY / LOGICAL | One exact path goes through `rStageIntegrationCertificate → r_rational_image_dense`; density itself is not selected-C mathematical input. |
| `Classical.byContradiction` accepted R inverse path | INHERITED LOGICAL COMMITMENT / PRODUCER-PROVENANCE SENSITIVE | Real inverse witnesses are genuinely consumed; their current selected R producer may carry localized classical proof provenance. |
| `propext`, `Classical.choice`, `Quot.sound` | TRUSTED / INHERITED AXIOM BASELINE | Final C and accepted R `#print axioms` lists coincide; this does not justify labeling the whole build intuitionistic. |
| universal quadratic comparison graph | STRUCTURALLY NECESSARY UNDER CA-11 | Exists for every candidate satisfying the common interface and distinguishes mathematical equivalence from definitional carrier identity. |
| actual functional isomorphism | CONDITIONAL CONSTRUCTIVE DATA | Constructed only when coordinate-extractor data for the comparison peer is explicitly supplied; no unrestricted choice claim. |
| Route Q | RETAINED BRANCH CANDIDATE | Independently verified probe, not a completed field; `CA-14` remains NOT TRIGGERED. |
| algebraic closure / FTA | DEFERRED STRENGTHENING | Outside `BOMA-C-ACCEPT-001`; cannot be silently imported into accepted C. |
| V5 + formal audits + producer policies | GOVERNANCE NECESSARY / NOT OBJECT MATHEMATICS | Required for BOMA acceptance and reproducibility, not part of the abstract definition of a quadratic extension. |

## Bundled-interface contamination is real formal dependence

The accepted final C certificate directly mentions the concrete
`BOMA.R.StageIntegration002.rStageIntegrationCertificate`. The actual closure
therefore contains all fields packed into that value, including:

```text
BOMA.R.DedekindCompleteness001.rDedekind_lub_exists
BOMA.R.DedekindRationalDensity001.r_rational_image_dense
BOMA.R.DedekindArchimedean001.r_archimedean_strict_upper
BOMA.R.DedekindProbe001.LowerCut
BOMA.R.DedekindProbe001.CutEquiv
```

The machine classifier also exposes the exact inherited sensitive path:

```text
cStageIntegrationCertificate
  → rStageIntegrationCertificate
  → r_rational_image_dense
  → principal_cut_between_strict_cuts
  → strict_cut_inclusion_witness
  → Classical.byContradiction
```

Thus all three statements must remain simultaneously true:

1. The selected C source never directly asks for real completeness, density,
   or an Archimedean theorem.
2. The concrete final Lean declaration closure nevertheless contains those
   producers and their currently inherited logical provenance.
3. This contamination is a bundled-interface/formalization choice, not proof
   that the excluded properties are mathematically necessary for C.

A future experiment may replace the oversized concrete certificate with a
narrow real-field/order projection interface and compare both closures. Such
a replacement is a separately frozen branch, not retroactive evidence that the
current accepted closure was smaller than measured.

## Exact logical boundary

`orderTotal` really is projected by the selected nonsquare argument. Its
currently accepted producer path includes localized `Classical.em`; therefore
claiming complete classical independence would be false. The final accepted C
and accepted R `#print axioms` lists both equal:

```text
[propext, Classical.choice, Quot.sound]
```

No new C-local `Classical.*`, global selector, or axiom declaration was added.
Inherited quotient infrastructure remains visible, not hidden.

## Candidate Stage-Two branches

| Candidate | Single changed point | Expected comparison |
| --- | --- | --- |
| `BR-C-R-INTERFACE-001` | narrow the consumed real certificate | same C claims; fewer bundled completeness/density/Archimedean dependencies |
| `BR-C-ROUTE-Q-001` | independently complete retained quotient/adjoining route | representation-neutral field comparison; trigger CA-14 only after actual field completion |
| `BR-C-LOGIC-001` | replace classical total-order producer | track actual downstream square/norm proof obligations and logical closure |
| `BR-C-INV-001` | change witness-only inverse packaging | compare constructive witnesses, selectors, and explicit Choice costs |
| `BR-C-COMPARE-001` | vary coordinate-extractor data | distinguish universal relation comparison from functional isomorphism scope |
| `BR-R-CAUCHY-001` | replace selected Dedekind real realization | trace actual C sensitivity to the accepted real interface and inherited representation |

These are recorded research candidates only. No branch is started, no accepted
mathematical source changes, and Route Q is not promoted by this audit.
