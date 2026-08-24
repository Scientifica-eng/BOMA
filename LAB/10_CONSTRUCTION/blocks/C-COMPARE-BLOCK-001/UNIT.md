# C-COMPARE-BLOCK-001 — Representation-Neutral Quadratic Field Comparison

- **Operational status:** **ACTIVE — UNIVERSAL QUADRATIC COMPARISON V5 32575465002 PASS**
- **Epistemic status:** **DERIVED CARRIER-NEUTRAL COMPARISON / SCALAR-INTERFACE BOUNDARY REFINED BY ST2-EXP-011**
- **Verified accepted cycle:** `PDSA-C-006 — CLOSED / run 32575465002 PASS`
- **Learning integration:** `ST2-EXP-011 CLOSED / PASS / BOMA-ST2-LEARNING-INTEGRATION-002`
- **Accepted implementation input:** accepted `RBOMA / RStageIntegrationCertificate` ancestry + `C-BLOCK-001` selected witness-field producer
- **Canonical comparison dependency:** scalar `zero/one/neg/add/mul` + explicit quadratic coordinate laws
- **Direct Claim:** `CA-11 / C-CL-COMPARE-001`
- **Functional-map boundary:** explicit `CoordinateExtractor` required
- **Route Q:** **PERMANENT VERIFIED ALTERNATIVE / NON-SELECTED / NOT ACCEPTED EXPORT**
- **Route P ↔ Route Q research Junction:** `ST2-EXP-002-PQ-J-001 / NON-ACCEPTANCE`
- **Stage acceptance:** `CA-20 = ACCEPT / C-BLOCK-002 downstream export`

## Common comparison meaning

The accepted comparison meaning is representation-neutral in the complex
carrier: presentations expose a scalar embedding, distinguished imaginary
generator, and unique real/imaginary coordinate expression, and the comparison
relation pairs elements carrying the same coordinates.

Historically the accepted `QuadraticFieldPresentation` implementation packages
this over the selected accepted real carrier `RBOMA`. `ST2-EXP-011` established
that this scalar hard-wiring is **not** part of the mathematical comparison
necessity.

## Canonical comparison scalar dependency — ST2-EXP-011 integrated

The direct comparison proof closure requires only these scalar operations:

```text
zero
one
neg
add
mul
```

plus the quadratic presentation's explicit coordinate interface:

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

This is the permanent architectural dependency surface for
`C-COMPARE-BLOCK-001 / C-CL-COMPARE-001`.

It is intentionally distinct from `BOMA-C-R-DEP-001`, whose exact sixteen
properties describe the larger **production C mathematical dependency** learned
by `ST2-EXP-001`.

Therefore:

```text
C production R→C surface
  = sixteen-property ordered-field/witness contract

C quadratic comparison surface
  = zero/one/neg/add/mul + explicit quadratic coordinate laws
```

The narrower second surface does not imply that the selected C producer as a
whole needs only five scalar operations.

## Universal comparison strength

For presentations `A` and `B` over a shared admissible scalar interface, the
relation-level meaning is shared coordinates:

```text
Related(A,B,x,y)
  := there exist scalar coordinates a,b
     such that x and y are the corresponding coordinates in A and B.
```

Its verified comparison certificate provides:

```text
totality in both directions
single-valuedness / uniqueness in both directions
zero / one / scalar-embedding preservation
distinguished-I preservation
negation / addition / multiplication preservation
transport of supplied inverse-witness equations
```

Inverse-witness transport does not select or construct a scalar inverse. Scalar
order, completeness, density, Archimedean structure, and a general field-law
bundle are not direct comparison-proof requirements.

## Accepted RBOMA semantics remain unchanged

The ST2-EXP-011 accepted adapter proves that the generic relation is
**definitionally the same shared-coordinate relation** as the existing accepted
comparison (`related_iff_accepted` by `rfl`).

Thus the architecture has learned a smaller dependency boundary without
changing the accepted Claim meaning.

The accepted `CQuadraticComparison001` Lean source and accepted C manifests are
not rewritten by this integration Act. Their larger formal ancestry is retained
as accepted implementation/provenance until a separately controlled refactor is
performed.

## Native Cauchy/H6 compatibility

The same generic comparison interface was instantiated natively over the
verified `RCBOMA` + H6 complex research producer without using H5 `cToD`
transport or selected Dedekind/RStage-integration implementation sources.

Permanent conclusion:

```text
H5/Dedekind implementation transport is not mathematically required by the
quadratic comparison meaning once this Block is factored through its verified
scalar/coordinate interface.
```

This is robustness evidence only. `RCBOMA` and H6 remain non-selected and
non-accepted.

## Constructive relation/function firewall

Existential coordinate generation and relation totality/uniqueness do not
silently become a chosen global function.

```text
all admissible presentations
  → canonical comparison relation / invertible algebra graph

presentations + explicit CoordinateExtractor
  → actual comparison functions
```

No global coordinate selector or inverse selector is introduced by the generic
comparison layer. Functional comparison remains conditional on explicit
extractor data.

## Logical-commitment interpretation

Exact ST2-EXP-011 evidence classified:

```text
generic comparison roots   NO AXIOMS
native H6 roots             [propext, Quot.sound]
accepted RBOMA adapter      [propext, Classical.choice, Quot.sound]
```

The accepted-adapter Choice cost is inherited formal provenance, not a generic
comparison-interface requirement.

## Explicit exclusions

```text
replacement of accepted CQuadraticComparison001 by experimental sources
promotion of RCBOMA/H6 to accepted R/C
change of C-DP-001 SELECTS C-ROUTE-P
replacement of C-J-001
new Block / Decision Point / Junction created by shared-interface compatibility
global Choice-backed coordinate selection
claim that this Block itself decides CA-20
claim that ST2-EXP-011 automatically completed a canonical source refactor
```

`C-J-001` remains the accepted same-carrier integration Junction and
`C-BLOCK-002 / CA-20` remains the accepted export. The scalar-generic factoring
is permanent architectural knowledge and a future accepted-source refactor
candidate, not an implicit promotion.

## Provenance

```text
accepted comparison evidence
  PDSA-C-006 / V5 32575465002 PASS

ST2-EXP-011
  Frozen reference  b49826e58261a71634cd12756e8afda28920088f
  Frozen Plan       5cc05ef1bea8e88787041c3bc30dd0aecf5412d4
  final closed head 632a7134f26daf9dd781e3546804941f429a4246
  exact run         32754345656
  artifact          9530261359
  digest            d93c6f1ec34858f6cbc1556e92b86a241f6399e6a3cf894204608a51d63de2e5
  merge             72394878854aa69e865d17567959bec1daa70e6d

integration authority
  LAB/PDSA/STAGE_TWO_SUCCESSFUL_EXPERIMENTS_ARCHITECTURE_INTEGRATION_002.md
```
