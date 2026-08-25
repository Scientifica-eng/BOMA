# PDSA-ST2-EXP-014 — Cauchy-Native Full C Closure

**Cycle ID:** `PDSA-ST2-EXP-014`  
**Program:** `ST2-RP-001 — Compositionality and Minimality of the R→C Boundary`  
**Queue position:** `1 / 4`  
**Owner authority:** `ST2-RP-001 OWNER_AUTHORIZED`  
**Status:** `PLAN FROZEN / NO DO IN THIS COMMIT`  
**Frozen accepted reference:** `fff2400b65b2c9a260fb28defd907ce24387cb80`  
**Research branch:** `feature/stage-two-st2-exp-014-cauchy-native-full-c`  
**Typed origin:** `DEPENDENCY_EDGE / BOMA-C-R-DEP-001`  
**Single changed scientific factor:** `C Route-P scalar producer: accepted Dedekind RBOMA → independently verified Cauchy RCBOMA`  
**Accepted C construction meaning:** fixed  
**Experimental product:** `RESEARCH ONLY UNTIL STUDY/ACT/LIFECYCLE CLOSURE`.

# PLAN — FROZEN

## 1. Research question

Can the complete nine-Claim meaning of the accepted Stage-One complex interface
be assembled **natively over the independently verified Cauchy real producer**
while preserving selected C Route-P quadratic/pair meaning and excluding H5 or
selected-Dedekind implementation transport from the native mathematical
closure?

The target is not a new accepted C and not a replacement of `C-BLOCK-002`.
It is a controlled producer-substitution experiment answering whether the
selected C meaning depends on the accepted real *interface* rather than on the
selected Dedekind producer history.

## 2. Exact prior evidence frozen as control

### 2.1 ST2-EXP-003 / H6

Closed `ST2-EXP-003` already provides a native Cauchy quadratic construction
over `RCBOMA` in:

```text
LAB/payloads/lean/CStage/ST2Exp003CauchyQuadraticRebuild.lean
```

H6 already verifies the mathematical content corresponding to seven accepted C
Claim families:

```text
C-CL-CARRIER-001
C-CL-REMBED-001
C-CL-FIELD-001
C-CL-I-001
C-CL-GEN-001
C-CL-COORDUNIQ-001
C-CL-NONREAL-001
```

The H6 source includes the Cauchy-native pair carrier, real embedding, imaginary
generator, `I² = -1`, coordinate generation/uniqueness, commutative ring laws,
norm, and existential nonzero inverse witnesses. Its native source boundary was
verified without H5 and without selected Dedekind/RStage implementation input.

This experiment must **reuse that verified H6 mathematics as fixed prior
evidence**. Re-proving or redesigning those seven meanings is forbidden unless
an exact dependency/semantic audit establishes a genuine missing obligation.
Such a missing obligation is a result to Study, not permission for silent scope
expansion.

### 2.2 ST2-EXP-011

Closed `ST2-EXP-011` provides the generic quadratic comparison layer and a
native Cauchy/H6 adapter in:

```text
LAB/payloads/lean/CStage/ST2Exp011GenericQuadraticComparison.lean
LAB/payloads/lean/CStage/ST2Exp011CauchyH6Comparison.lean
```

Its permanent comparison boundary is:

```text
scalar zero / one / neg / add / mul
+ explicit coordinate laws
```

and it preserves the firewall:

```text
relation totality + uniqueness
!=
chosen functional map
```

A function requires explicit `CoordinateExtractor` data. No hidden global
choice/selector may be introduced by 014.

### 2.3 Accepted C target

The accepted C acceptance contract contains exactly nine Claim families:

```text
C-CL-CARRIER-001
C-CL-REMBED-001
C-CL-FIELD-001
C-CL-I-001
C-CL-GEN-001
C-CL-COORDUNIQ-001
C-CL-NONREAL-001
C-CL-COMPARE-001
C-CL-INTEGRATION-001
```

014 tests the **meaning** of those nine families over the alternative scalar
producer. It does not inherit accepted status, alter `CA-20`, or add stronger
claims such as algebraic closure/FTA.

## 3. Exact changed factor and controls

### Changed factor — exactly one

```text
baseline scalar producer     RBOMA / R-ROUTE-D / selected Dedekind producer
experimental scalar producer RCBOMA / R-ROUTE-C / verified Cauchy producer
```

### Fixed controls

```text
C-ROUTE-P quadratic/pair construction meaning
nine accepted C Claim meanings as target comparison surface
ST2-EXP-003 H6 seven-Claim mathematics
ST2-EXP-011 generic comparison semantics
relation/function firewall
witness-only inverse semantics
accepted Q/R/C manifests and accepted mathematical sources
R-DP-001 SELECTS Dedekind
C-DP-001 SELECTS Route P
R-BLOCK-001 accepted export
C-BLOCK-001 / C-J-001 / C-BLOCK-002 / CA-20 accepted path
all historical Frozen Plans and evidence
```

### Forbidden second-factor changes

```text
changing C Route P to Route Q
changing the C acceptance contract
changing the C carrier meaning away from the H6 pair construction
changing inverse witnesses into a chosen inverse function
changing the scalar logical regime
removing orderTotal or any other production field as an independent variable
changing the C comparison relation meaning
changing accepted producer source to make the experiment pass
introducing a new foundational/logical principle merely for convenience
```

These belong to other experiments or owner decisions.

## 4. Native implementation boundary

The native 014 mathematical assembly may consume:

```text
ST2-EXP-003 independent Cauchy R manifest
ST2-EXP-003 H6 Cauchy quadratic source
ST2-EXP-011 generic comparison source
ST2-EXP-011 native Cauchy/H6 adapter
new 014 research-only full-Claim integration source(s)
```

The native assembly must exclude as implementation dependencies:

```text
ST2Exp003DedekindCauchyFieldIsomorphism.lean
H5 cToD / dToC transport
RStageIntegration002.lean
selected Dedekind implementation sources
accepted C pair/integration producer sources as mathematical implementation inputs
accepted RBOMA adapter from ST2-EXP-011
```

Accepted C files may be inspected as **comparison targets** and used in separate
external semantic/audit checks. They may not be required to elaborate the
native 014 producer.

H5 is allowed only after native closure as an external comparison oracle if a
comparison theorem genuinely benefits from it. H5 must not occur in the native
source manifest or native dependency closure.

## 5. Affected Claim cone

Direct experimental cone:

```text
C-CL-CARRIER-001
C-CL-REMBED-001
C-CL-FIELD-001
C-CL-I-001
C-CL-GEN-001
C-CL-COORDUNIQ-001
C-CL-NONREAL-001
C-CL-COMPARE-001
C-CL-INTEGRATION-001
```

This is a full C-Claim audit because the scalar producer is changed at the R→C
dependency edge. Accepted C remains a control and is not modified.

## 6. Gate A — exact baseline and gap inventory

Before writing a new mathematical integration certificate, record and verify:

```text
exact head descends from frozen Plan commit
Frozen Plan byte-identical to its own commit
accepted baseline = fff2400b65b2c9a260fb28defd907ce24387cb80
H6 source exists and its historical seven-Claim root(s) still elaborate
011 native Cauchy comparison source exists and still elaborates
accepted C acceptance specification still lists the same nine Claim families
accepted Q/R/C manifests and their manifest-listed sources are unchanged
```

Gate A must produce a claim-gap matrix that classifies each of the nine claims
as:

```text
H6_ALREADY_VERIFIED
011_ALREADY_VERIFIED
014_INTEGRATION_ONLY
UNEXPECTED_MISSING_OBLIGATION
```

Expected starting classification:

```text
seven H6 core families       H6_ALREADY_VERIFIED
C-CL-COMPARE-001             011_ALREADY_VERIFIED
C-CL-INTEGRATION-001         014_INTEGRATION_ONLY
```

This expected matrix is a hypothesis to verify, not a pre-declared PASS.

If an `UNEXPECTED_MISSING_OBLIGATION` is discovered, preserve it exactly. It may
be repaired only if it is implementation/packaging work inside the fixed
scientific factor. If it changes C meaning, scalar assumptions, or experimental
scope, stop under `OWNER_REQUIRED`.

## 7. Gate B — native nine-Claim research certificate

Construct a research-only certificate/interface whose fields or theorem roots
cover the exact nine Claim meanings over `RCBOMA`/H6.

The certificate should reuse existing verified H6/011 theorem roots rather than
copy or reprove them. It may introduce only the integration/wrapping theorem
structure needed to make the nine-family closure explicit and auditable.

Required properties:

```text
all nine Claim families have named theorem/certificate roots
no accepted object receives ACCEPT status
no selected route changes
no new inverse selector
no hidden coordinate selector
no stronger C theorem is silently added to the target
```

## 8. Gate C — native comparison completion

Verify that `C-CL-COMPARE-001` is supplied by the 011 generic comparison layer
instantiated natively over H6/RCBOMA.

Required controls:

```text
same shared-coordinate relation meaning
zero/one/neg/add/mul + coordinate-law direct closure
functional map only from explicit CoordinateExtractor
no Classical.choose in new 014 sources
no H5/Dedekind implementation transport
```

014 may wrap/re-export the already verified native H6 comparison root for the
full certificate; it must not redesign the comparison interface.

## 9. Gate D — native source/declaration independence

Build an explicit 014 native manifest and exact Lean assembly. Prove that the
native mathematical closure excludes H5 and selected Dedekind implementation
producers.

At minimum audit the root(s) for:

```text
full nine-Claim integration certificate
Cauchy-native field certificate
Cauchy-native comparison certificate/root
```

Use the repository dependency-audit tooling and source-boundary scans. Record
both declaration closure and source-manifest closure; do not conflate them.

Forbidden native dependency markers include, where applicable:

```text
ST2Exp003DedekindCauchyFieldIsomorphism
cToD
dToC
RStageIntegration002
BOMA.R.Dedekind
accepted-RBOMA 011 adapter
```

False positive path/name matches must be handled by exact manifest/declaration
classification rather than weakening the scientific exclusion.

## 10. Gate E — claim-by-claim semantic comparison

Produce an evidence table for all nine accepted C Claim families:

```text
Claim ID
accepted meaning summary
native 014 theorem/certificate root
producer provenance: H6 / 011 / 014 integration
kernel axioms
native source closure classification
semantic disposition: SAME / CONTROLLED DIVERGENCE / FAIL
```

A PASS does not require definitional equality with the accepted Dedekind-backed
carrier. It requires the same declared Claim meaning at the acceptance-contract
level, with any representation-dependent difference explicitly classified.

Do not claim:

```text
accepted C replaced
Cauchy C selected
Dedekind unnecessary for all mathematics
route uniqueness/non-uniqueness theorem beyond tested scope
algebraic closure
```

## 11. Gate F — external reconvergence/control comparison

Only after Gates B–E establish native closure independently, optionally use
already-verified H5/Junction evidence as an **external oracle** to compare the
native Cauchy result with the selected Dedekind-side meaning.

The external comparison must be isolated from native implementation manifests.
Its role is robustness evidence, not construction.

If no new external theorem is needed because existing H5/003/011 evidence
already provides sufficient comparison, record that fact rather than adding
redundant proof machinery.

## 12. Gate G — exact V5, provenance, and regression

A PASS requires all relevant evidence on one exact verified research head:

```text
exact workflow head == checked-out head
Frozen Plan commit is an ancestor of verified head
Frozen Plan file byte-identical to frozen commit
accepted Q/R/C manifests unchanged from frozen baseline
accepted manifest-listed mathematical sources unchanged from frozen baseline
no sorry
no new axiom
no hidden Classical.choose/global selector in new 014 sources
native H6/011/014 assembly elaborates under pinned Lean
important roots have #print axioms evidence
native dependency closure excludes H5/Dedekind implementation producers
all nine Claim meanings classified
C-CL-COMPARE-001 relation/function firewall preserved
C-CL-INTEGRATION-001 represented by native research certificate
accepted C regressions pass
architecture consistency passes
autonomous-program governance audit passes
exact run IDs, job IDs, artifact IDs and SHA-256 digests are preserved
```

Pinned Lean toolchain remains the repository historical Stage-Two toolchain
unless current synchronized main explicitly changes it before Do:

```text
leanprover/lean4:v4.32.1
```

## 13. Study obligations

Study must answer, separately:

1. Are all nine accepted C Claim meanings reproducible natively over `RCBOMA`?
2. Which claim roots were already supplied by H6, which by 011, and which needed
   only 014 integration packaging?
3. Does any mathematical 014 root require H5 or selected Dedekind implementation
   provenance?
4. Does the full nine-Claim result strengthen the earlier H6 conclusion from a
   seven-Claim rebuild to a complete accepted-interface-meaning rebuild?
5. Which dependency is mathematical, which is formal packaging, and which is
   external comparison only?
6. Does the evidence preserve a scientifically coherent Cauchy scalar/quadratic
   baseline for `ST2-EXP-015`?
7. Did any newly discovered prerequisite become sequence-critical before 015?

## 14. Act boundary

Allowed Act classifications:

```text
CLOSED / PASS
CLOSED / INFORMATIVE FAIL
BLOCKED / RECOVERY IN PROGRESS
OWNER_REQUIRED
```

A successful 014 may integrate verified **knowledge** about producer
substitutability/full Cauchy-native Claim closure under `ST2-RP-001` routine
merge authority, provided accepted selections/exports remain unchanged.

A PASS does not authorize:

```text
selecting R-ROUTE-C
replacing R-BLOCK-001
selecting a different C route
replacing C-BLOCK-002 / CA-20
changing an acceptance contract
```

## 15. Predeclared failure classes

```text
F1   frozen baseline / Plan ancestry / byte identity fails
F2   H6 historical seven-Claim evidence no longer elaborates on the frozen baseline
F3   011 native H6 comparison no longer elaborates or its semantics changed
F4   an accepted C Claim meaning is genuinely absent from H6+011 and requires a second scientific change
F5   native full-Claim certificate requires H5/cToD/dToC implementation transport
F6   native full-Claim certificate requires selected Dedekind/RStage implementation source
F7   comparison completion requires hidden global coordinate choice/selector
F8   full integration requires a chosen inverse selector rather than witness semantics
F9   accepted Q/R/C source or manifest changes are needed to obtain PASS
F10  new 014 source introduces sorry, axiom, or forbidden Classical.choose
F11  Claim meaning is silently weakened/strengthened relative to the accepted C target
F12  exact dependency/provenance/artifact evidence is incomplete or does not match verified head
F13  implementation changes more than the scalar-producer factor
F14  a sequence-critical prerequisite is discovered such that ST2-EXP-015 should not follow directly
```

`F14` is a program stop condition and sets `OWNER_REQUIRED` before queue change.
Other failures are recoverable autonomously only when correction remains inside
this immutable Plan and does not alter the single changed factor or target
meaning.

## 16. Frozen execution order

```text
1. commit this Plan alone before Do;
2. record exact Frozen Plan commit and activate 014 in current-state governance;
3. create the 014 native manifest and Gate-A claim-gap evidence;
4. construct only the missing native full-nine-Claim integration layer;
5. verify 011 native comparison inclusion and relation/function firewall;
6. run exact native source/declaration independence audits;
7. produce nine-Claim semantic comparison evidence;
8. run exact-head pinned Lean, #print axioms, regressions and governance audits;
9. preserve failed/successful heads and artifacts;
10. write Study/Act only after evidence is complete;
11. close lifecycle on one exact verified head;
12. evaluate the exact 014→015 transition gate;
13. auto-continue to 015 only if the program prerequisites remain true.
```

No `ST2-EXP-015` Plan may be frozen before 014 lifecycle closure and transition
assessment.

# END FROZEN PLAN

This file is immutable after this commit. Do, Study, Act, lifecycle closure,
knowledge integration, and transition are separate evidence records.
