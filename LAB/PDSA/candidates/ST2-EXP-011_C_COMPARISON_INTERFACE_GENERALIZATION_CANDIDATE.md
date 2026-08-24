# ST2-EXP-011 — C Comparison Interface Generalization Candidate Dossier

**Status:** `CANDIDATE / NOT AUTHORIZED / NOT A FROZEN PLAN`  
**Candidate ID:** `ST2-EXP-011`  
**Refinement recorded:** `2026-08-24`  
**Observed on branch:** `feature/stage-two-st2-exp-003-cauchy-real-route-comparison`  
**Observed after H6 exact evidence:** run `32719705824`, H6 verified source head `ea5fdb61fcbafb0ece463910c24ef71183443b19`  
**Candidate-capture protocol:** `LAB/PDSA/FUTURE_EXPERIMENT_CANDIDATE_PROTOCOL_001.md`

## 1. Discovery

`ST2-EXP-003` successfully rebuilt the selected quadratic-field core natively over the independent Cauchy real carrier `RCBOMA`. The exact H6 target

`BOMA.C.StageTwo.CauchyQuadratic003.cauchyQuadraticFieldCertificate`

passed exact-head V5 with the final axiom surface `[propext, Classical.choice, Quot.sound]`.

During the final claim-cone comparison, one architectural limitation became explicit: the accepted representation-neutral complex comparison layer is representation-neutral only with respect to the **complex carrier**, not with respect to the **real scalar carrier/interface**.

The accepted source

`LAB/payloads/lean/CStage/CQuadraticComparison001.lean`

defines:

```text
QuadraticFieldPresentation (R : RStageIntegrationCertificate)
```

but its scalar coordinates, embedding, and coordinate laws are hard-wired to accepted `RBOMA` operations such as `rAdd`, `rNeg`, and `rMulCandidate`.

Therefore the existing `C-CL-COMPARE-001` producer cannot be instantiated directly for the H6 Cauchy-native quadratic field over `RCBOMA` without first transporting scalars through the H5 Dedekind/Cauchy isomorphism or generalizing the comparison interface itself.

This was deliberately **not** folded into H6 because Frozen `ST2-EXP-003` required rebuilding the selected quadratic-field meaning over the alternative real field, not redesigning the accepted universal C comparison abstraction.

## 2. Architectural attachment

Candidate attachment:

```text
origin_kind        DEPENDENCY_EDGE / INTERFACE_GENERALIZATION_CANDIDATE
origin             real-scalar interface consumed by C-CL-COMPARE-001
accepted producer  C-COMPARE-BLOCK-001 / CQuadraticComparison001
accepted scalar    RBOMA through RStageIntegrationCertificate
research scalar    independently certified RCBOMA
```

A future frozen Plan should choose one exact typed attachment already recognized by the Stage-Two governance vocabulary; this dossier does not amend that vocabulary or pre-authorize the choice.

## 3. Single controlled research question

Can the representation-neutral quadratic comparison machinery be reformulated over a **generic witness-based real field/scalar interface** so that:

1. accepted Route P over `RBOMA` remains an instance;
2. the H6 Cauchy-native quadratic field over `RCBOMA` becomes another direct instance;
3. comparison relations and, when explicit coordinate extractors are supplied, constructive comparison functions can be proved without transporting through the Dedekind/Cauchy H5 isomorphism;
4. no global coordinate selector, inverse selector, new `Classical.choose`, or new axiom is introduced merely to recover functionality?

## 4. Baseline and proposed alternative

**Baseline:** accepted `CQuadraticComparison001.lean`, where the complex presentation carrier is abstract but scalar coordinates are fixed to `RBOMA` and `RStageIntegrationCertificate`.

**Controlled alternative:** introduce a research-only scalar interface parameter `S` containing only the algebraic/witness fields actually required by quadratic comparison, then define a scalar-parametric quadratic presentation over `S`.

The exact interface width must be derived from declaration closure, not guessed. Likely fields include:

```text
scalar carrier
zero / one / neg / add / mul
commutative-ring laws
nontriviality
witness-only inverse contract if comparison preserves inverse witnesses
```

Order, density, Archimedean, and completeness data should be excluded unless actual closure proves they are needed.

## 5. Relation to the original ST2-EXP-011 candidate

The original register described `ST2-EXP-011` as varying constructive coordinate-extractor data while preserving the universal comparison graph. This dossier **refines rather than replaces** that question.

There are now two separable dimensions that a future Plan should control explicitly:

```text
A. scalar-interface genericity:
   RBOMA-specific scalar contract -> generic real/scalar witness-field contract

B. functional comparison strength:
   relation-only comparison -> actual functions only when CoordinateExtractor data exist
```

A sound experiment should avoid changing A and B simultaneously unless the Frozen Plan explicitly justifies the combined design. Preferred decomposition is to generalize the scalar interface first while retaining the existing relation/extractor distinction.

## 6. Predicted invariants

Expected to remain unchanged if the abstraction is adequate:

- zero, one, negation, addition, multiplication preservation;
- scalar embedding preservation;
- distinguished imaginary generator preservation;
- coordinate generation and coordinate uniqueness;
- relation totality in both directions;
- relation single-valuedness in both directions;
- inverse-witness preservation when supplied by the candidate presentation contract;
- functional isomorphism only under explicit coordinate extractor data;
- accepted `C-ROUTE-P`, `C-BLOCK-001`, `C-COMPARE-BLOCK-001`, `C-BLOCK-002`, and `CA-20` remain unchanged during research.

## 7. Predicted divergences / scientific value

The experiment should measure:

- the exact minimal scalar interface actually consumed by `C-CL-COMPARE-001`;
- whether accepted comparison currently over-bundles `RStageIntegrationCertificate`;
- whether Cauchy-native H6 can instantiate the generic comparison directly;
- whether Dedekind/Cauchy H5 transport becomes unnecessary for downstream quadratic comparison;
- source-level and kernel-level logical differences;
- whether relation-only comparison remains fully constructive relative to supplied scalar laws;
- the exact additional principle, if any, required to turn relation graphs into functions without supplied extractors.

## 8. Impact cone

Primary:

```text
C-CL-COMPARE-001
C-CL-INTEGRATION-001 (research comparison only; accepted integration unchanged)
```

Secondary research evidence:

```text
ST2-EXP-002 P/Q comparison machinery
ST2-EXP-003 H5 real isomorphism
ST2-EXP-003 H6 Cauchy quadratic rebuild
BOMA-C-R-DEP-001 interface-width conclusions
```

The experiment must not silently claim preservation of accepted `CA-20`; accepted CA-20 is a baseline control, not a research output to overwrite.

## 9. Preconditions before execution

A future agent must first:

1. verify the then-current repository head and accepted baseline;
2. confirm no other Stage-Two experiment is active, unless governance has since changed explicitly;
3. obtain explicit owner authorization for `ST2-EXP-011`;
4. create and freeze a new PDSA Plan from the then-current authorized reference;
5. preserve all historical ST2-EXP-003 evidence, especially H5 and H6 exact runs;
6. inspect the actual declaration closure of accepted `CQuadraticComparison001` before choosing the generic scalar fields.

## 10. Independence boundary

For the direct Cauchy instantiation, do **not** prove adequacy merely by composing through:

```text
RCBOMA --cToD--> RBOMA --accepted C comparison--> ...
```

That transport is useful as a later comparison oracle, but it would not establish that the generalized scalar interface itself supports a native `RCBOMA` instance.

Similarly, do not import accepted `CPairCore001` or `CPairNormInverse001` as the implementation of the Cauchy-native candidate. The H6 source is the independent downstream realisation to test.

## 11. Suggested implementation decomposition

### Gate A — accepted closure extraction

Extract theorem-level closure for the accepted comparison certificate and classify which fields of `RStageIntegrationCertificate` are actually consumed.

### Gate B — generic scalar interface

Create a branch-only scalar witness-field interface with exactly those required fields. No accepted source is modified.

### Gate C — generic quadratic presentation

Port `QuadraticFieldPresentation`, `Related`, totality/uniqueness, operation preservation, and inverse-witness preservation to the generic scalar interface.

### Gate D — accepted RBOMA instance

Instantiate the generic interface from accepted `RStageIntegrationCertificate` and show that the existing selected Route P satisfies the generalized contract.

### Gate E — native RCBOMA/H6 instance

Instantiate the same generic interface directly from the independently verified Cauchy ordered-field sources and H6 quadratic rebuild, without H5/Dedekind sources in the mathematical assembly.

### Gate F — extractor/function layer

Re-establish the explicit principle:

```text
relation comparison: available from coordinate generation/uniqueness
functional comparison: available only with explicit CoordinateExtractor data
```

No inferred global selector.

### Gate G — comparison study

Compare generic versus accepted producer closure, source costs, kernel axioms, and whether the abstraction should remain research-only or motivates a later canonical refactor.

## 12. Required verification gates for any future PASS claim

At minimum:

- exact-head pin;
- frozen-Plan ancestor;
- accepted Q/R/C manifests and accepted producers unchanged;
- no `sorry` or new `axiom`;
- no new global inverse or coordinate selector unless separately authorized and classified;
- Lean typecheck of the generic layer;
- `#print axioms` for the generic relation certificate and any functional certificate;
- dependency closure using `lean_dependency_audit.py` or its then-current successor;
- proof that the native Cauchy instantiation closure excludes selected Dedekind/H5 mathematical sources;
- proof that the accepted RBOMA instance still matches the intended accepted comparison semantics;
- artifact preservation with run ID, exact source SHA, artifact ID, and digest.

Do not claim `ST2-EXP-011 PASS` from source elaboration alone.

## 13. Success criteria

A strong positive result would show:

1. one generic scalar interface supports both accepted `RBOMA` and independent `RCBOMA`;
2. one generic quadratic comparison theorem supports the accepted Route P and H6 Cauchy-native quadratic field;
3. relation-level comparison introduces no stronger logical commitments than the scalar instances already carry;
4. functional maps remain explicitly extractor-dependent;
5. the native Cauchy comparison does not need Dedekind/H5 as a mathematical dependency.

An informative negative result is also valuable if the closure demonstrates a genuine scalar-specific dependency or a necessary additional logical principle. Preserve that result rather than widening the interface silently.

## 14. Non-goals / acceptance boundary

This candidate does **not** authorize:

- modification of `main`;
- modification of any historical Frozen Plan;
- replacement of accepted `RBOMA` or `R-BLOCK-001`;
- replacement of accepted `C-ROUTE-P` or `C-BLOCK-002`;
- promotion of H6 `CCBOMA` to accepted C;
- use of a new global selector merely for API convenience;
- retroactive claim that ST2-EXP-003 proved all accepted C comparison/integration layers.

## 15. Future-agent handoff

Start by reading, in this order:

```text
LAB/PDSA/FUTURE_EXPERIMENT_CANDIDATE_PROTOCOL_001.md
LAB/PDSA/STAGE_TWO_BRANCH_EXPERIMENT_REGISTER_001.md
this dossier
LAB/PDSA/PDSA-ST2-EXP-003_INDEPENDENT_CAUCHY_REAL_ROUTE.md
LAB/PDSA/experiments/ST2-EXP-003_FINAL_STUDY_ACT_001.md
LAB/payloads/lean/CStage/CQuadraticComparison001.lean
LAB/payloads/lean/CStage/ST2Exp003CauchyQuadraticRebuild.lean
LAB/payloads/lean/RStage/ST2Exp003DedekindCauchyFieldIsomorphism.lean
```

Then verify every referenced SHA/run against GitHub before relying on it. This dossier records the discovery context; GitHub current state remains authoritative at execution time.
