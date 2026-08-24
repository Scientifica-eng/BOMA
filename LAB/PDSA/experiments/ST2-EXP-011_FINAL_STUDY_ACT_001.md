# ST2-EXP-011 — Final Study / Act 001

**Experiment:** `ST2-EXP-011 / C Comparison Interface Generalization`  
**Date:** `2026-08-24`  
**Frozen accepted reference:** `b49826e58261a71634cd12756e8afda28920088f`  
**Immutable Frozen Plan commit:** `5cc05ef1bea8e88787041c3bc30dd0aecf5412d4`  
**Architectural origin:** `BLOCK / C-COMPARE-BLOCK-001`  
**Direct affected Claim:** `C-CL-COMPARE-001`  
**Secondary audit Claim:** `C-CL-INTEGRATION-001`  
**Exact mathematical verification head:** `3a7510fb2fd71cfa7b75434a2ea265e654897ffe`  
**Mathematical result:** `PASS`  
**Disposition:** `DURABLE ARCHITECTURAL KNOWLEDGE + CANONICAL-REFACTOR CANDIDATE / EXPERIMENTAL SOURCES REMAIN RESEARCH-ONLY`

## 1. Question studied

The accepted `CQuadraticComparison001` already abstracts the complex carrier,
but its scalar presentation is formally hard-wired to the selected accepted
real carrier and integration certificate. The experiment asked whether the
quadratic comparison meaning itself can instead be factored through a generic,
minimal scalar/coordinate interface while preserving all of the following
controls:

```text
accepted RBOMA comparison meaning
native RCBOMA/H6 use without H5/Dedekind transport
relation comparison != functional comparison
functional map only from explicit CoordinateExtractor data
no global scalar/coordinate/inverse selector
accepted R and accepted C unchanged
one changed scientific factor: comparison scalar abstraction only
```

The answer is **yes**.

## 2. Gate A — actual declaration closure

The Frozen Plan did not guess a field interface. Inspection of the accepted
comparison source identified the exact comparison proof closure, recorded in:

`LAB/PDSA/experiments/ST2-EXP-011_GATE_A_DECLARATION_CLOSURE_001.md`.

The relation/certificate proof consumes:

```text
coord
coordinateGeneration
coordinateUnique
coordinateZero
coordinateOne
coordinateReal
coordinateImag
coordinateNeg
coordinateAdd
coordinateMul
```

and only the scalar operations required to state those coordinate formulas:

```text
zero
one
neg
add
mul
```

No scalar field law, order law, completeness law, density law, Archimedean law,
or inverse-existence/uniqueness field belongs to the direct comparison proof
closure. `related_inverse_witness` transports an already supplied inverse
witness through multiplication preservation and relation uniqueness; it does
not select or construct an inverse.

The exact-head dependency auditor confirmed the generic root with:

```text
status                         PROTOTYPE_PASS
internal declarations          42
external boundary declarations 19
dependency edges               354
unresolved                     0
internal axioms                0
external modules               Init.Core, Init.Prelude
```

This confirms the Gate-A source observation rather than forcing a wider field
interface to make Lean elaborate.

## 3. Gate B/C — generic comparison layer

Research source:

`LAB/payloads/lean/CStage/ST2Exp011GenericQuadraticComparison.lean`.

The scalar configuration is deliberately only:

```text
carrier
zero
one
neg
add
mul
```

The generic quadratic presentation then supplies its complex carrier/operations,
scalar embedding, distinguished imaginary generator, coordinate constructor,
and exactly the coordinate existence/uniqueness/preservation laws identified by
Gate A.

The generalized layer proves:

```text
Related
totality left/right
single-valuedness / uniqueness left/right
zero / one / scalar / I preservation
neg / add / mul preservation
supplied inverse-witness preservation
```

Kernel evidence on the exact verification head reports:

```text
BOMA.C.StageTwo.ComparisonInterface011.quadraticComparison
  does not depend on any axioms

BOMA.C.StageTwo.ComparisonInterface011.constructiveQuadraticIsomorphism
  does not depend on any axioms
```

Thus the generic comparison abstraction itself adds no logical axiom cost.

## 4. Gate D — accepted RBOMA instance and semantic preservation

Research adapter:

`LAB/payloads/lean/CStage/ST2Exp011AcceptedRBOMAComparison.lean`.

`fromAccepted` forgets the comparison-irrelevant fields of the accepted
`QuadraticFieldPresentation`; it does not edit that accepted source.

The theorem

`BOMA.C.StageTwo.ComparisonInterface011.AcceptedRBOMA.related_iff_accepted`

is proved by `rfl`. Therefore the new relation is not merely analogous to the
accepted relation: after the forgetful adapter, its shared-coordinate semantics
are definitionally the same.

The accepted selected pair presentation remains an instance, and its functional
self-comparison remains available because the accepted pair representation has
an explicit coordinate extractor.

The accepted adapter's axiom surface is:

```text
[propext, Classical.choice, Quot.sound]
```

which is inherited from the accepted formal ancestry. The generic comparison
root itself remains axiom-free. This is another instance of the BOMA distinction
between formal provenance and mathematical/interface necessity.

## 5. Gate E — native RCBOMA/H6 instance without H5

Research adapter:

`LAB/payloads/lean/CStage/ST2Exp011CauchyH6Comparison.lean`.

The adapter defines its scalar operations directly from:

```text
RCBOMA
rCZero
rCOne
rCNeg
rCAdd
rCMul
```

and its quadratic presentation directly from the H6 pair carrier and operations:

```text
CCBOMA
ccZero
ccOne
ccNeg
ccAdd
ccMul
ccOfR
ccI
```

The native assembly is formed from the independent Cauchy-real manifest, the H6
Cauchy quadratic rebuild manifest, and the ST2-EXP-011 native adapter manifest.
It excludes the H5 Dedekind/Cauchy field-isomorphism source and selected
Dedekind/RStage integration sources as mathematical implementation dependencies.

The dependency audit for the native comparison root reports:

```text
status                         PROTOTYPE_PASS
internal declarations          481
external boundary declarations 72
dependency edges               5112
unresolved                     0
internal axioms                0
```

The workflow also rejects any native closure containing H5 transport,
`cToD`, selected Dedekind implementation declarations, or accepted-RBOMA adapter
dependencies. That rejection check passed.

Kernel evidence reports:

```text
h6Presentation
h6NativeSelfComparison
h6NativeSelfIsomorphism
  axioms [propext, Quot.sound]
```

Notably, the native H6 comparison does **not** require `Classical.choice` from
this comparison layer.

Conclusion for Gate E:

```text
RCBOMA/H6 -> generic C comparison
```

is a direct native mathematical path. The path

```text
RCBOMA -> H5 cToD -> RBOMA -> accepted comparison
```

is not required for the implementation of the native comparison instance.
H5 remains useful historical comparison/Junction evidence, not a mathematical
implementation dependency of this result.

## 6. Gate F — relation/function firewall

The generic relation proves totality and uniqueness but does not turn those
existentials into a selected function. No global selector was introduced.

Functional comparison is defined only from explicit data:

```text
CoordinateExtractor
  re
  im
  sound
```

`coordinateMap` and `ConstructiveQuadraticIsomorphism` both take such extractor
data explicitly. Source scans found no `Classical.choose`, hidden coordinate
selector, or global inverse selector in the experimental comparison sources.

This preserves the intended distinction:

```text
relation-level comparison
!=
functional comparison
```

and avoids converting existence/uniqueness into choice by convenience.

## 7. Gate G — exact evidence matrix

### 7.1 Preserved negative evidence

The first custom verification failed at exact head
`1dd9beb0b792e634029ffdf12e09c1f50e4cccf8`:

```text
run       32749650430
job       97503327944
artifact  9528463341
sha256    1c9d3b5e3af2b1e7d5727a321f18fbdf5ab7f1faee3b6a7e30c448829378953e
failure   ERR-ST2-011-001
```

The failure was a lexical governance-scan false positive: a documentary comment
spelled concrete route/carrier names while saying they were absent. Exact-head,
Frozen-Plan, and accepted Q/R/C immutability gates had already passed; Lean was
not reached. The correction changed only the comment. The failure remains
preserved in:

`LAB/PDSA/experiments/ST2-EXP-011_FAILURE_001_SOURCE_BOUNDARY_COMMENT_FALSE_POSITIVE.md`.

### 7.2 Successful exact-head experimental evidence

Exact head:

`3a7510fb2fd71cfa7b75434a2ea265e654897ffe`

Custom workflow:

```text
BOMA ST2-EXP-011 C Comparison Interface Generalization — V5
run       32749848852
job       97503958518
artifact  9528564348
sha256    b7c89c1444cde0491dd3ad737247895c3de1bdd3af44d11e9607b09d052b096f
result    SUCCESS
```

The workflow passed all of these gates on that exact head:

```text
exact workflow head
baseline ancestor
Frozen Plan ancestor
Frozen Plan byte immutability
accepted Q/R/C manifests unchanged
all accepted manifest-listed Q/R/C sources unchanged
generic scalar-name independence
no sorry / no new axiom declarations / no Classical.choose in experiment sources
accepted RBOMA generic instance
accepted old/new Related semantic equivalence
native RCBOMA/H6 instance without H5 implementation path
#print axioms roots
generic/accepted/native declaration dependency closures
C-CL-COMPARE-001 direct Claim audit
C-CL-INTEGRATION-001 secondary audit
repository architecture consistency audit
artifact preservation
```

The accepted-adapter closure also completed with `PROTOTYPE_PASS`, zero unresolved
declarations, and zero internal axioms. Its larger closure records formal
accepted ancestry rather than a wider generic mathematical requirement.

### 7.3 Accepted C regressions on the same exact head

```text
C Comparable Quadratic Route Probes — V5
  run 32749848851  SUCCESS

C Same-Carrier Integration and Claim Transparency — V5
  run 32749848885  SUCCESS

C Stage Acceptance and Six-Stage Transparency — V5
  run 32749848856  SUCCESS
```

Therefore the experiment did not obtain success by weakening or editing the
accepted C acceptance path.

## 8. Claim-family Study

### Direct Claim

`C-CL-COMPARE-001` is the actual changed implementation/support boundary. Its
accepted meaning is preserved: shared real coordinates induce a total,
single-valued relation preserving the distinguished field structure and
supplied inverse witnesses.

### Secondary audit Claim

`C-CL-INTEGRATION-001` remains unchanged. The experiment does not replace
`C-J-001`, `C-BLOCK-002`, or `CA-20`; it only demonstrates that the comparison
machinery can be factored through a narrower scalar interface and instantiated
natively over the already verified Cauchy/H6 research route.

No other accepted C Claim meaning was changed. H6 provenance remains H6
provenance; generic-interface instantiation does not make H6 accepted C.

## 9. Architectural interpretation

The scientific result is durable, but it does not justify manufacturing a new
Decision Point or Junction.

### What is established

1. `C-COMPARE-BLOCK-001` contains a real scalar/interface boundary narrower than
   the accepted `RStageIntegrationCertificate` formal package.
2. That comparison boundary needs scalar operations plus coordinate laws, not
   the sixteen-property production R→C surface from ST2-EXP-001 and certainly
   not the whole accepted R certificate.
3. Both selected accepted `RBOMA` and verified alternative `RCBOMA/H6` can
   instantiate the same relation-level comparison abstraction.
4. Native Cauchy comparison does not mathematically depend on H5 transport or
   selected Dedekind implementation sources.
5. Relation totality/uniqueness does not justify a global functional selector;
   explicit extractor data remains the correct constructive boundary.

### What is not established

```text
RBOMA = RCBOMA as provenance                       NO
R-ROUTE-C selected or accepted                     NO
H6 accepted as canonical C                         NO
C-ROUTE-P selection changed                        NO
C-J-001 replaced                                   NO
new reconvergence Junction required                NO
new Decision Point required                        NO
accepted CQuadraticComparison001 refactored        NO
```

A shared generic interface is compatibility/abstraction evidence, not a
provenance identity and not automatically a Junction.

## 10. ACT

### Mathematical result

`ST2-EXP-011 = PASS`.

### Disposition of experimental code

Keep the new generic core and adapters as **research-only verified evidence** in
the experiment lineage. Do not silently substitute them for accepted
`CQuadraticComparison001` during this experiment.

### Durable architecture disposition

The learned scalar-generic comparison boundary qualifies for
**permanent verified architecture knowledge** and is a **candidate for a future
canonical refactor** of the accepted comparison implementation. The permanent
Construction DAG should record the narrower comparison-interface fact inside
or adjacent to the existing `C-COMPARE-BLOCK-001`, without fabricating a Block,
Decision Point, or Junction.

That Learning-to-Construction update must be a separate architecture-integration
Act after experiment lifecycle closure. It must preserve:

```text
R-DP-001 SELECTS R-ROUTE-D / Dedekind
R-BLOCK-001 accepted export
C-DP-001 SELECTS C-ROUTE-P
C-BLOCK-001 / C-J-001 / C-BLOCK-002 accepted path
CA-20 ACCEPT
ST2-EXP-003 H5/H6 historical provenance
```

The architecture integration should also distinguish two different R→C
surfaces now known by evidence:

```text
production C mathematical dependency (ST2-EXP-001)
  = exact sixteen-property ordered-field/witness surface

quadratic comparison scalar dependency (ST2-EXP-011)
  = scalar operation signature + explicit quadratic coordinate laws
```

They answer different questions and must not be collapsed.

### Sequence disposition

`ST2-EXP-004` remains the explicitly selected **next** experiment, but it may not
start on this branch and may not reuse this Plan. It requires:

```text
ST2-EXP-011 lifecycle CLOSED
Study/Act complete
required Learning-to-Construction integration complete
main synchronized and verified
new read of current main
independent Frozen Plan from that main
independent branch
```

Only then may `R-DP-003` total-order logical regime become the single changed
factor of `ST2-EXP-004`.

## Final Study judgment

```text
ST2-EXP-011 MATHEMATICAL RESULT:                 PASS
GENERIC COMPARISON INTERFACE:                    VERIFIED
ACCEPTED RBOMA INSTANCE:                         VERIFIED / SAME RELATED SEMANTICS
NATIVE RCBOMA/H6 INSTANCE:                       VERIFIED
H5/DEDEKIND NATIVE IMPLEMENTATION DEPENDENCY:    NOT REQUIRED
RELATION/FUNCTION FIREWALL:                      PRESERVED
NEW GLOBAL SELECTOR / Classical.choose:          NO
NEW GENERIC-LAYER AXIOMS:                        NO
ACCEPTED R/C PRODUCERS:                          UNCHANGED
SELECTED ROUTES:                                 UNCHANGED
NEW BLOCK / DECISION / JUNCTION:                 NOT JUSTIFIED
PERMANENT ARCHITECTURE KNOWLEDGE:                YES
CANONICAL REFACTOR CANDIDATE:                    YES
AUTOMATIC ACCEPTANCE PROMOTION:                  NO
NEXT EXPERIMENT:                                 ST2-EXP-004 AFTER FULL 011 CLOSURE + INTEGRATION
```
