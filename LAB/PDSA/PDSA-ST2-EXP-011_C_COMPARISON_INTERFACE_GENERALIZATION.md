# PDSA-ST2-EXP-011 — C Comparison Interface Generalization

**Cycle ID:** `PDSA-ST2-EXP-011`  
**Candidate:** `ST2-EXP-011`  
**Owner decision:** explicit execution selection on `2026-08-24`  
**Status:** `PLAN FROZEN / SINGLE ACTIVE STAGE-TWO EXPERIMENT`  
**Frozen accepted reference:** `b49826e58261a71634cd12756e8afda28920088f`  
**Research branch:** `feature/stage-two-st2-exp-011-c-comparison-interface-generalization`  
**Typed origin:** `BLOCK / C-COMPARE-BLOCK-001`  
**First divergence:** scalar carrier and scalar-operation hard-wiring inside the comparison presentation/relation interface  
**Direct affected Claim:** `C-CL-COMPARE-001`  
**Secondary audit Claim:** `C-CL-INTEGRATION-001`  
**Accepted R producer/export control:** `R-BLOCK-001 / RBOMA / RStageIntegrationCertificate`  
**Accepted C producer/export controls:** `C-BLOCK-001 / C-BLOCK-002 / CA-20`  
**Permanent alternative control:** `R-ROUTE-C / RCBOMA`, verified non-selected alternative from closed `ST2-EXP-003`  
**Experimental product status:** `RESEARCH ONLY UNTIL STUDY/ACT AND SEPARATE ARCHITECTURE DISPOSITION`

# PLAN — FROZEN

## Architectural origin and single changed factor

The experiment attaches to the existing `C-COMPARE-BLOCK-001`. It does **not**
create a new Block merely because a new Lean structure may be useful, and it
does **not** create a Junction merely because two real carriers may instantiate
the same interface.

The exact typed attachment is:

```text
origin_kind                BLOCK
origin_id                  C-COMPARE-BLOCK-001
source_dependency          BOMA-C-R-DEP-001 / real scalar supply
baseline_comparison_claim  C-CL-COMPARE-001
secondary_audit_claim      C-CL-INTEGRATION-001
baseline_scalar_carrier    RBOMA
alternative_scalar_carrier RCBOMA / R-ROUTE-C
first_divergence           scalar type/operation parameters of comparison presentation and Related relation
accepted_R_control         R-BLOCK-001 unchanged
accepted_C_control         C-BLOCK-001, C-BLOCK-002, CA-20 unchanged
```

Change exactly one scientific factor: **the scalar abstraction of the C
quadratic comparison machinery**. The relation-versus-function strength is a
fixed control, not a second changed factor: relation-level comparison remains
primary, and functional comparison remains available only from explicit
`CoordinateExtractor` data.

The accepted R and C producers, selected routes, accepted manifests, and
historical Stage-Two evidence are controls and may not be refactored to make the
experiment pass.

## Gate A — frozen declaration-closure observation

The interface is not guessed from the full field presentation. Inspection of
the declarations rooted at
`BOMA.C.QuadraticComparison001.quadraticComparison` on the frozen reference
shows the following actual comparison proof closure:

```text
Related / relation witness
  scalar carrier
  A.coord / B.coord

related_total_left, related_total_right
  coordinateGeneration

related_right_unique, related_left_unique
  coordinateUnique

related_zero
  coordinateZero

related_one
  coordinateOne

related_real
  coordinateReal

related_imag
  coordinateImag

related_neg
  coordinateNeg

related_add
  coordinateAdd

related_mul
  coordinateMul

related_inverse_witness
  related_mul
  related_right_unique
  related_one
  supplied source inverse-witness equation
```

Therefore `quadraticComparison` does **not** directly require the full current
`QuadraticFieldPresentation` laws such as scalar order, scalar completeness,
field associativity/commutativity proofs, `inverseExists`, or `inverseUnique`.
In particular, the existing inverse-preservation theorem transports a supplied
multiplicative inverse witness by multiplication preservation and relation
uniqueness; it does not select or construct an inverse.

The minimal research presentation may consequently expose only the data needed
to state and prove this closure:

```text
scalar carrier
scalar zero / one / neg / add / mul
complex carrier
complex zero / one / neg / add / mul
scalar embedding
imaginary generator
coordinate constructor
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

This source-level declaration closure is frozen as the starting observation.
The Do phase must independently confirm it with the repository's Lean
dependency-audit tooling and `#print axioms`; any additional required field is
a scientific result and must be recorded before the interface is widened.
Silent interface inflation is forbidden.

## Research question

Can the existing quadratic comparison meaning be factored through one generic,
minimal scalar/coordinate presentation so that:

1. the accepted `RBOMA` comparison remains an instance with the same relation
   semantics;
2. the closed-experiment `RCBOMA`/H6 construction becomes a direct native
   instance;
3. the native Cauchy instance has no mathematical implementation dependency on
   H5 transport or selected Dedekind sources;
4. relation-level comparison remains independent of global coordinate choice;
5. functional comparison is constructed only from explicit
   `CoordinateExtractor` data; and
6. no accepted R/C producer or selected route changes during the experiment?

## Frozen hypotheses and proof gates

`GATE A — exact closure confirmation`: reproduce the declaration closure above
with exact-head Lean dependency evidence. If the kernel/source audit exposes an
additional dependency, preserve it as a result; do not silently strengthen the
interface.

`GATE B — generic minimal interface`: define a research-only scalar operation
configuration and a generic quadratic-coordinate presentation whose fields are
no wider than Gate A requires.

`GATE C — generic relation comparison`: generalize `Related`, left/right
totality, left/right uniqueness, zero/one/scalar/I preservation,
neg/add/mul preservation, and supplied inverse-witness preservation. No global
selector and no `Classical.choose` may be introduced.

`GATE D — accepted RBOMA instance`: adapt the accepted
`QuadraticFieldPresentation`/selected pair presentation to the generic layer and
prove pointwise equivalence between the accepted `Related` semantics and the
new generic relation. The accepted producer sources themselves remain byte
identical to the frozen reference.

`GATE E — native RCBOMA/H6 instance`: instantiate the generic scalar and
quadratic presentation directly with `RCBOMA`, `rCZero`, `rCOne`, `rCNeg`,
`rCAdd`, `rCMul` and H6 `CCBOMA`, `ccZero`, `ccOne`, `ccNeg`, `ccAdd`, `ccMul`,
`ccOfR`, `ccI`. The native Lean assembly must exclude
`ST2Exp003DedekindCauchyFieldIsomorphism.lean`, accepted Dedekind/RStage
integration producers, and H5 `cToD` transport from its mathematical source
manifest. H5 may only be used later as an external comparison oracle.

`GATE F — relation/function firewall`: preserve a generic
`CoordinateExtractor` as explicit data. Functional `coordinateMap` and any
constructive isomorphism package may be defined only from that data. No theorem
of relation totality may be converted into a global map by hidden choice.

`GATE G — comparative Study`: compare declaration closure, source dependency
closure, kernel axioms, accepted RBOMA semantics, native RCBOMA semantics,
interface width, H5 need, and logical cost. Classify the result before any
canonical refactor or architecture promotion.

## Frozen controls and allowed differences

| Control | Accepted/reference side | Experimental side |
| --- | --- | --- |
| Accepted R route | `R-DP-001 SELECTS R-ROUTE-D` | unchanged |
| Accepted R producer/export | `R-BLOCK-001 / RBOMA` | unchanged |
| Accepted C route | `C-DP-001 SELECTS C-ROUTE-P` | unchanged |
| Accepted C producer/export | `C-BLOCK-001 → C-J-001 → C-BLOCK-002 / CA-20` | unchanged |
| Comparison meaning | shared-coordinate relation | same relation meaning over generic scalar |
| Changed factor | scalar hard-wired to `RBOMA` | scalar carrier/ops abstracted |
| Relation strength | total + single-valued relation | same |
| Function availability | only explicit extractor | exactly the same control |
| Inverse treatment | supplied witness preservation | supplied witness preservation; no selector |
| Cauchy provenance | H6 direct Cauchy rebuild exists | direct `RCBOMA` generic instance |
| H5/Dedekind | available historical comparison evidence | forbidden as native implementation dependency |
| Historical plans/failures | immutable | unchanged |

## Frozen execution order

1. Commit this Plan before any 011 implementation and preserve this commit as
   the immutable Frozen-Plan ancestor.
2. Activate 011 in current research-governance records without modifying any
   earlier Frozen Plan, Study/Act, failure, or lifecycle record.
3. Implement the generic comparison layer in a source that has no dependency on
   accepted `RBOMA` or Cauchy `RCBOMA` names.
4. Implement the accepted-RBOMA adapter in a separate source and prove semantic
   equivalence of the old and generic `Related` relations plus comparison roots.
5. Implement the native Cauchy/H6 adapter in a separate source whose assembly
   consumes the independent Cauchy manifest and H6 source but not H5/Dedekind
   comparison or selected Dedekind producer sources.
6. Verify the relation/function firewall with explicit extractor-only function
   constructors and source scans for hidden selectors/choice.
7. Run exact-head pinned Lean, `#print axioms`, dependency-closure audits,
   accepted-source/manifests immutability, Claim-cone audit, architecture
   consistency, and relevant accepted R/C regressions.
8. Preserve exact failed and successful heads, workflow run IDs, artifact IDs,
   SHA-256 digests, mechanisms, and corrections in execution evidence.
9. Write Study/Act only after the evidence is complete. A Lean elaboration alone
   is not a PASS.
10. Close the lifecycle formally and classify the result as research-only,
    permanent verified architecture, canonical-refactor candidate, or negative
    result. Any Learning-to-Construction integration is a separate Act that
    preserves `SELECTS`, accepted exports, and historical provenance.

## Required PASS evidence

A `PASS` requires all of the following:

```text
exact verified head == workflow head
Frozen Plan commit is an ancestor of verified head
Frozen Plan file byte-identical to its frozen commit
accepted Q/R/C manifests unchanged from b49826e...
accepted R/C producer sources unchanged from b49826e...
no sorry
no new axiom
no hidden global coordinate/inverse selector
no Classical.choose in experimental comparison sources
generic layer typechecks
important roots have #print axioms evidence
actual declaration/source dependency closure recorded
accepted RBOMA adapter verified
old/new accepted Related semantics proved equivalent
native RCBOMA/H6 adapter verified
native Cauchy mathematical manifest excludes H5/Dedekind implementation sources
relation/function distinction verified
C-CL-COMPARE-001 and C-CL-INTEGRATION-001 impact audited
architecture consistency audit passes
relevant accepted R/C regressions pass
run IDs + artifact IDs + exact SHA + artifact digests preserved
```

If an additional scalar law or logical principle is genuinely necessary, that
is a result to Study. The interface may not be widened invisibly until CI turns
green.

## Predeclared failure classes

```text
F1   Gate-A closure is wider than the frozen source-level observation
F2   generic relation requires scalar field/order laws not used by the baseline comparison proof
F3   accepted RBOMA adapter changes relation semantics
F4   native RCBOMA adapter needs H5/cToD or selected Dedekind sources
F5   H6 lacks a coordinate law required by the generic presentation
F6   relation totality/uniqueness cannot be retained without a stronger principle
F7   functional comparison introduces hidden choice/global selector
F8   inverse preservation accidentally becomes inverse selection
F9   accepted Q/R/C source or manifest changes are needed to make the experiment pass
F10  C-CL-COMPARE-001 or C-CL-INTEGRATION-001 meaning changes unexpectedly
F11  frozen Plan, exact-head, artifact, axiom, or dependency provenance fails
F12  implementation changes more than the comparison scalar abstraction
```

A negative finding is preserved exactly. It is never converted into a false
`PASS`, a silent second-factor change, a fabricated Junction, or an automatic
acceptance promotion.

# END FROZEN PLAN

Execution, Study, Act, lifecycle closure, and any later architecture integration
are separate records. This Plan is immutable after its own initial commit.
