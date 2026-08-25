# ST2-EXP-004 — R Total-Order Logical Regime Candidate Dossier

**Candidate ID:** `ST2-EXP-004`  
**Status:** `OWNER-SEQUENCED NEXT / DOSSIER RECORDED / NOT ACTIVE / PLAN NOT YET FROZEN`  
**Dossier date:** `2026-08-24`  
**Observed at exact accepted main:** `50f3031b8d2657cbe0710e73e5935d997d40e49b`  
**Architectural attachment:** `DECISION_POINT / R-DP-003`  
**Decision class:** logical / methodological  
**Selected Stage-One regime:** constructive `rLE` partial-order core + localized classical `CutComparability` witness  
**Direct accepted Claim:** `R-CL-ORDER-001`  
**Potential downstream cone:** `R-CL-MUL-001`, `R-CL-INV-001`, `R-CL-FIELD-001`, `R-CL-INTEGRATION-001`, and order-dependent accepted C Claims through the production R→C interface.

## 1. Observation

Current accepted Dedekind order is deliberately split into two layers.

Constructive core:

```text
LAB/payloads/lean/RStage/RDedekindOrderConstructive.lean

rLE_refl
rLE_trans
rLE_antisymm
CutComparability := ∀ A B : LowerCut, CutLE A B ∨ CutLE B A
rLE_total_of_cutComparability
```

Localized selected witness:

```text
LAB/payloads/lean/RStage/RDedekindOrderClassicalWitness.lean

cutComparability_classical : CutComparability
rLE_total_classical : ∀ x y : RBOMA, rLE x y ∨ rLE y x
```

The provider uses two explicit calls to `Classical.em`.

`R-DP-003` classifies this witness as a localized logical commitment and retains
a Stage-Two constructive-locatedness/revised-order branch candidate.

## 2. Exact accepted baseline

Frozen-reference candidate main:

```text
50f3031b8d2657cbe0710e73e5935d997d40e49b
```

The baseline representation and operations are controls:

```text
LowerCut
CutEquiv
cutSetoid
RBOMA := Quotient cutSetoid
CutLE
rLE
rOfQ
rZero / rOne
rAdd / rNeg
rMulCandidate
accepted inverse-witness architecture
Dedekind LUB construction
accepted density / Archimedean constructions
```

The experiment must not change `R-DP-001`, `R-DP-002`, `R-DP-004`,
`R-DP-005`, `R-DP-006`, the selected Dedekind carrier/identity, or any accepted
Q/R/C source.

## 3. Single controlled factor

Change only the logical regime at `R-DP-003`:

```text
BASELINE
  constructive partial-order core
  + cutComparability_classical
  + rLE_total_classical

ALTERNATIVE
  same constructive partial-order core
  - selected F-04 classical comparability provider
  - disjunctive-totality conclusion unless independently recovered
```

The experimental alternative is therefore a **no-F-04 partial-order regime**.

This is intentionally not described as a constructive total order. If a proof
merely assumes an abstract `CutComparability`, it has isolated the interface but
has not removed the logical commitment.

## 4. Why this is the correct one-factor experiment

The accepted R commitment ledger contains other localized classical providers:

```text
F-05  finite membership search / fine cut bracketing
F-06  positive representative extraction
F-07  strict rational-density witness extraction
```

These remain controls. `ST2-EXP-004` must not remove them, rewrite them, or claim
that eliminating F-04 makes all of accepted R constructive.

The experiment asks only:

> Which accepted R and downstream C results genuinely depend on the specific
> F-04 disjunctive-totality provider at `R-DP-003`, and which survive on the
> unchanged Dedekind carrier with only the constructive partial-order core?

## 5. Existing evidence exposing the dependency

`RStageIntegrationCertificate` contains an explicit field:

```text
orderTotal : ∀ x y : RBOMA, rLE x y ∨ rLE y x
```

and the accepted producer fills it with:

```text
orderTotal := rLE_total_classical
```

`ST2-EXP-001` also established that the selected C production proof consumes a
sixteen-property R interface containing:

```text
orderTotal
```

with the accepted adapter likewise filled by `rLE_total_classical`.

A concrete accepted R theorem already known to use the selected totality witness
is:

```text
BOMA.R.DedekindPositiveDecomposition001.rPosNeg_decomposition
```

whose proof performs its sign split using `rLE_total_classical rZero x`.

By contrast, the following are visibly constructive at source level and are
candidate survivors:

```text
rLE_refl
rLE_trans
rLE_antisymm
rLT definition and irrefl/reflection facts
rAdd_mono / rAdd_mono_left / rAdd_mono_right
rAdd_nonneg / rAdd_nonpos
```

Source-level visibility is only a prediction; final classification must use
actual declaration-closure audits.

## 6. Research hypotheses

### H1 — exact dependency isolation

The accepted closure can be partitioned into declarations that do and do not
depend on:

```text
cutComparability_classical
rLE_total_classical
```

without changing the accepted carrier or any other logical provider.

### H2 — substantial partial-order survival

A nontrivial subset of the accepted R mathematical structure survives in a
no-F-04 assembly, including at least the quotient identity, Q embedding,
constructive partial order, additive monotonicity, and any later results whose
actual closures avoid the two F-04 declarations.

### H3 — accepted total-order contract divergence

`R-CL-ORDER-001` in its accepted total-order form and
`RStageIntegrationCertificate.orderTotal` cannot be certified by simply deleting
F-04. If no independent same-carrier no-F-04 totality proof is found, this is an
expected architectural divergence, not an experiment failure.

### H4 — downstream C sensitivity is narrower than whole-R failure

Because the canonical C-production interface contains `orderTotal`, accepted C
integration is expected to lose at least part of its current support when F-04
is removed. The exact affected C Claim subset must be measured rather than
assumed from package ancestry.

### H5 — constructive locatedness is a separate strengthening question

If recovering disjunctive totality requires adding locatedness data, changing
`LowerCut`, changing the accepted order statement, or assuming a new principle,
that requirement must be reported explicitly. It must not be silently folded
into the one-factor alternative.

## 7. Predicted invariant cone

Expected to remain byte-identical and mathematically fixed:

```text
accepted N / N-Arithmetic / Z / Q
R-DP-001 selected Dedekind route
R-DP-002 quotient identity
LowerCut / CutEquiv / RBOMA
constructive rLE core
R-DP-004 / R-DP-005 / R-DP-006 decisions
accepted operation definitions
Dedekind completeness construction
C-DP-001 SELECTS C-ROUTE-P
C-BLOCK-001 / C-COMPARE-BLOCK-001 / C-J-001 / C-BLOCK-002 accepted sources
BOMA-C-R-DEP-001 production contract as accepted current-state reference
ST2-EXP-001..003 and ST2-EXP-011 Frozen Plans/evidence
```

The experiment may prove that some later accepted theorem cannot be rebuilt under
the alternative, but it must not edit the accepted theorem/source to make the
experiment pass.

## 8. Predicted divergence / impact cone

### Direct R impact

```text
R-CL-ORDER-001
  accepted disjunctive totality is directly at risk

R-CL-INTEGRATION-001
  current integration certificate explicitly contains orderTotal
```

### R consequences to measure

```text
R-CL-MUL-001
R-CL-INV-001
R-CL-FIELD-001
R-CL-COMP-001
R-CL-DENSITY-001
R-CL-ARCH-001
```

No dependency may be inferred merely from file order. Each must be classified by
actual declaration closure.

### Downstream C impact

`BOMA-C-R-DEP-001` contains `orderTotal` in the verified sixteen-property
production surface. The experiment must identify which accepted C Claim roots
actually consume that field and which remain reconstructible when the
alternative R interface omits it.

The direct comparison surface learned by `ST2-EXP-011` is a useful control:
`C-COMPARE-BLOCK-001` itself needs only scalar `zero/one/neg/add/mul` plus
explicit coordinate laws, so its generic comparison meaning should not be
misclassified as directly requiring R totality merely because the accepted
adapter has larger ancestry.

## 9. Independence boundary

The no-F-04 alternative assembly must exclude:

```text
LAB/payloads/lean/RStage/RDedekindOrderClassicalWitness.lean
BOMA.R.DedekindOrderClassical001.cutComparability_classical
BOMA.R.DedekindOrderClassical001.rLE_total_classical
```

Experiment-specific Lean sources must contain no:

```text
Classical.em
Classical.byContradiction
Classical.choose
axiom
sorry
```

This prohibition applies to new ST2-EXP-004 sources. It does **not** pretend that
unchanged accepted F-05/F-06/F-07 source files are constructive; those remain
separately classified controls.

An abstract `CutComparability` hypothesis may be used only in an explicit
**interface-isolation probe**. Any result depending on that hypothesis must be
labelled conditional and must not be counted as no-F-04 constructive recovery.

## 10. Suggested execution decomposition

### Gate A — exact baseline dependency map

Measure actual declaration closures from the accepted main for roots covering:

```text
R order / integration
R multiplication / inverse / field closure
R completeness / density / Archimedean
C accepted production Claim roots
C comparison Claim root as a control
```

Classify every root as:

```text
F04_DIRECT
F04_TRANSITIVE
F04_FREE
OTHER_CLASSICAL_ONLY
```

where `OTHER_CLASSICAL_ONLY` means classical provenance exists but not through
F-04.

### Gate B — no-F-04 independent R assembly

Construct a manifest beginning with the accepted Q inputs and unchanged selected
Dedekind sources, but omitting `RDedekindOrderClassicalWitness.lean`. Include
only declarations that Gate A classifies as F04-free, then kernel-check the
result.

### Gate C — conditional comparability interface probe

Separately verify that downstream totality consumers can be parameterized by the
existing narrow `CutComparability` interface without importing the selected
classical provider. This gate measures interface shape only.

Its output must be labelled:

```text
CONDITIONAL ON CutComparability
```

not constructive totality.

### Gate D — same-carrier constructive recovery attempt

Search for a proof of the required alternative conclusion from unchanged
`LowerCut` fields and accepted Q structure with no F-04 provider and no new
logical principle.

Possible outcomes:

```text
RECOVERED_SAME_CARRIER
NOT_RECOVERED_WITH_CURRENT_CUT_INTERFACE
REQUIRES_LOCATEDNESS_OR_ACCEPTANCE_CHANGE
```

The second or third outcome is scientifically valid.

### Gate E — downstream C impact

Build an alternative R consumer interface omitting `orderTotal`, then test the
accepted C Claim roots individually. Record exact survivors and losses.

Do not edit accepted C sources. Research adapters/probes may restate a minimal
alternative interface only when needed for dependency measurement.

### Gate F — logical-cost comparison

For baseline and alternative roots, record:

```text
actual declaration closure
Classical.* dependencies
Quot.sound / propext
new assumptions/hypotheses
```

Distinguish removal of F-04 from persistence of F-05/F-06/F-07.

### Gate G — Study / Act

Classify the result without forcing acceptance preservation:

```text
FULL SAME-CARRIER TOTALITY RECOVERY
PARTIAL-ORDER ROBUSTNESS / EXACT IMPACT CLASSIFIED
REQUIRES STRONGER CUT/ORDER ACCEPTANCE CONTRACT
INFORMATIVE FAILURE
```

Any proposal to change accepted `RA-09`, `RA-22`, `R-BLOCK-001`, or downstream
C acceptance is a separate owner decision after the experiment.

## 11. Required exact-head verification gates

Before any PASS claim:

```text
exact branch head pinned
frozen accepted reference is ancestor
Frozen Plan byte-identical to its freeze commit
accepted Q/R/C manifests byte-identical to frozen main
all accepted manifest-listed Q/R/C sources byte-identical to frozen main
ST2-EXP-001..003 + ST2-EXP-011 Frozen Plans/evidence preserved
no-F-04 manifest excludes RDedekindOrderClassicalWitness.lean
no-F-04 declaration closures exclude both selected F-04 declarations
experiment sources contain no Classical.* / axiom / sorry
Lean 4.32.1 exact assemblies PASS for every claimed survivor
baseline/alternative dependency comparison artifact preserved
R Claim impact matrix preserved
C Claim impact matrix preserved
architecture consistency audit PASS
historical Stage-Two lifecycle preservation PASS
```

## 12. Success criteria

The experiment succeeds scientifically if it produces a kernel-checked,
exact-head, Claim-level classification of F-04 sensitivity while preserving the
single-factor boundary.

Minimum PASS result:

```text
exact F-04-free R survivor set proved
exact F-04-dependent R set proved
exact downstream C survivor/loss set measured
other classical commitments not conflated with F-04
accepted sources/manifests unchanged
no hidden replacement principle introduced
```

Full recovery of accepted totality is **not** required for PASS.

A stronger result may be recorded only if independently proved:

```text
same accepted LowerCut/RBOMA carrier
no selected F-04 provider
no replacement classical/choice principle
same accepted disjunctive totality theorem
```

## 13. Failure criteria worth preserving

Preserve as evidence:

```text
an accepted theorem unexpectedly depends transitively on F-04;
a supposedly F04-free alternative accidentally imports the classical witness;
a research adapter reintroduces totality as an unlabelled assumption;
constructive recovery requires modifying LowerCut or CutEquiv;
C impact is broader/narrower than predicted;
other classical providers are accidentally removed and confound the experiment;
a lifecycle audit incorrectly treats closed 011 as requiring no later active experiment.
```

These are informative results, not reasons to delete the failed run.

## 14. Acceptance boundary

Even if the experiment is successful:

```text
R-DP-003 selected Stage-One decision does not change automatically
RA-09 / RA-22 do not weaken automatically
R-BLOCK-001 remains accepted Dedekind R
C-DP-001 / C-ROUTE-P remain selected
C-BLOCK-002 / CA-20 remain accepted
no stronger claim of constructive real totality is inferred without proof
no experimental source becomes an accepted manifest input automatically
```

A changed acceptance contract requires a separate explicit owner decision after
Study/Act.

## 15. Governance prerequisite before activation

The repository currently has a post-integration ST2-EXP-011 lifecycle audit
whose current-frontier check still assumes `active_experiment = NONE` and
`ST2-EXP-004 = NOT ACTIVE / NO FROZEN PLAN`.

Before setting the machine ledger's active pointer to `ST2-EXP-004`, that audit
must be generalized **without weakening 011 historical closure** so that:

```text
011 CLOSED / PASS / INTEGRATED evidence remains immutable;
a later independently frozen ST2-EXP-004 record may become active;
current frontier state may advance while historical closure stays monotone.
```

This governance repair is a pre-Do gate. It must not alter any mathematical
accepted source or Frozen Plan.

## 16. Handoff

A future agent must begin from the exact then-current accepted `main`, not from
an ST2-EXP-003/011 research branch. It must first freeze an independent Plan,
then satisfy the lifecycle-governance prerequisite, then activate exactly one
experiment.

The first implementation task after Plan freeze is **Gate A dependency
measurement**, not an attempted rewrite of the accepted R order proof.
