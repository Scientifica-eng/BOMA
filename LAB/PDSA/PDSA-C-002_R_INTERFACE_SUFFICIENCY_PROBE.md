# PDSA-C-002 — Accepted-R Interface Sufficiency Probe for the First C Boundary Lemmas

**CycleID:** `PDSA-C-002`  
**Status:** **ACTIVE — FORMAL PAYLOAD STAGED / V5 OUTCOME NOT YET CERTIFIED**  
**Date:** 2026-08-21  
**Branch:** `feature/c-stage-acceptance-001`  
**Parent:** `PDSA-C-001`  
**Dependency question:** `C-RQ-001`  
**Representation Decision:** `C-DP-001 OPEN — UNCHANGED`

## Research Question

Can the first route-neutral real facts expected by likely C constructions be proved from the **accepted `R-BLOCK-001` interface itself**, without using `LowerCut`, `CutEquiv`, quotient representatives, Dedekind membership search, or the selected multiplication/reciprocal implementation as mathematical premises?

The immediate theorem targets are:

```text
C-RL-001  ∀ x : RBOMA, 0 ≤ x*x
C-RL-002  ¬ ∃ x : RBOMA, x*x = -1
```

The cycle deliberately precedes any C carrier probe.

---

# PLAN

## Hypothesis

The accepted R integration certificate already exposes enough ordered-field behavior to derive both targets through abstract algebra/order reasoning.

Expected minimal certificate fields:

```text
orderTotal
orderAntisymm
nontrivial
addComm
addAssoc
addZeroLeft
addInverseRight
negOrderReversing
mulComm
mulOneLeft
distribRight
orderMulNonneg
```

Not expected to be used by the abstract proof:

```text
qEmbeddingInjective
qOrderExact
strictIrrefl
addTranslateOrderIff
inverseExists
inverseUnique
positiveInverse
dedekindLUB
rationalDensity
archimedeanUpper
```

This is a hypothesis about the **abstract interface proof body**. The final corollary that instantiates the accepted certificate necessarily references `rStageIntegrationCertificate`, whose own producer history remains governed by the R Claim/logic audits.

## Failure classification before execution

If the proof cannot be expressed from the certificate fields above, classify the failure before changing the contract:

```text
F1  missing ordinary downstream lemma, derivable from accepted fields
F2  accepted R interface genuinely lacks required mathematical strength
F3  formal packaging prevents access despite sufficient mathematical interface
F4  candidate proof route accidentally reaches representation-specific R machinery
F5  new logical commitment is required downstream
```

Do not widen the accepted R dependency surface merely to make the probe pass.

---

# DO

## D1 — Build the proof against an abstract R certificate

Created:

```text
LAB/payloads/lean/CStage/CRInterfaceNoSquareProbe001.lean
```

The file first takes an arbitrary:

```text
C : RStageIntegrationCertificate
```

and derives the following helper interfaces without unfolding the real representation:

```text
neg_zero_from_interface
add_inverse_unique_from_interface
neg_involutive_from_interface
mul_zero_right_from_interface
mul_zero_left_from_interface
mul_neg_right_from_interface
mul_neg_left_from_interface
mul_neg_neg_same_from_interface
```

It then proves the abstract targets:

```text
square_nonnegative_of_interface
minus_one_not_square_of_interface
```

and only afterwards instantiates them on:

```text
rStageIntegrationCertificate
```

through:

```text
square_nonnegative_from_accepted_R
minus_one_not_square_from_accepted_R
```

This two-level structure is intentional. It separates:

```text
interface sufficiency theorem
```

from:

```text
current accepted producer instance
```

and prevents the proof design from silently treating the Dedekind realization as its mathematical argument.

## D2 — Declare exact inherited assembly

Created:

```text
LAB/20_FORMALIZATION/C_STAGE/C_R_INTERFACE_PROBE_001_INPUTS.txt
```

The C manifest contains only the C probe source. The verification workflow separately consumes the already-authoritative:

```text
LAB/20_FORMALIZATION/R_STAGE/R_INTEGRATION_002_INPUTS.txt
```

before appending the C probe.

This avoids copying and silently drifting the accepted R assembly.

## D3 — Add read-only V5 gate

Created:

```text
.github/workflows/boma-c-r-interface-probe-001.yml
```

Properties:

```text
permissions: contents: read
triggers: workflow_dispatch + push on main / feature/c-stage-*
validates both manifests
assembles accepted R inputs first
appends only the C probe
runs lake env lean on the assembled source
writes no evidence back to main
```

This preserves the post-`PDSA-ARCH-002` rule that transparency/verification guards on `main` are read-only.

---

# STUDY — CURRENT

## S1 — Mathematical dependency result

The written abstract proof requires only ordered-ring/nontriviality fields of the accepted integration certificate plus ordinary equational reasoning.

In particular, its source-level argument does **not** use:

```text
Dedekind LUB completeness
rational density
Archimedean upper-bound characterization
inverse existence / uniqueness
positive inverse behavior
Q embedding facts
LowerCut
CutEquiv
Quotient induction
cut membership
Dedekind reciprocal
selected multiplication sign-quadrant lemmas
```

This materially supports the ex-ante dependency hypothesis from `BOMA-C-R-DEP-001`.

However:

```text
source-level dependency inspection
≠
V5 certification
```

The theorem remains formally uncertified until a retrievable workflow result proves that the assembled source elaborates under the pinned toolchain.

## S2 — Logical commitment result

The C probe source introduces no explicit call to:

```text
Classical.em
Classical.byContradiction
Choice
```

But the abstract proof consumes the **accepted total-order field** `orderTotal`. The current accepted R producer for total comparability has localized classical provenance under `R-DP-003`.

Therefore the correct classification is:

```text
new C-local logical commitment: NONE OBSERVED IN SOURCE
mathematical dependency: accepted R total-order Claim
producer provenance of that Claim: localized classical route currently selected in R
```

It would be false to relabel the downstream theorem “constructive” merely because its C source contains no `Classical` token.

## S3 — Representation dependence result

The abstract theorem statements use the accepted formal R carrier/operation names because that is the current exported Lean interface, but the proof does not inspect their Dedekind realization.

Classification:

```text
accepted R carrier interface dependency       YES
Dedekind representation premise               NO OBSERVED SOURCE-LEVEL USE
Dedekind quotient internals                    NO OBSERVED SOURCE-LEVEL USE
selected reciprocal architecture               NO USE
R completeness/density/Archimedean properties  NO USE
```

This distinction is the main scientific purpose of the probe.

## S4 — Verification-state limitation

At the time of this record, the available GitHub connector exposes neither a list endpoint for push-triggered runs of this new feature-branch workflow nor a run ID that can be inspected through the job/log tools.

Accordingly:

```text
V5 PASS = NOT CLAIMED
V5 FAIL = NOT CLAIMED
workflow gate = PRESENT
formal payload = PRESENT
verification outcome = PENDING RETRIEVABLE EVIDENCE
```

This limitation is operational evidence state, not a reason to downgrade the mathematical dependency observation or to fabricate a PASS.

---

# ErrorsDetected

No representation-level C error exists because no C carrier was constructed.

The cycle did detect one **methodological audit risk** in the first draft of the probe:

```text
first draft bound a private constant directly to rStageIntegrationCertificate
```

Although mathematically harmless, that form could blur the distinction between proving sufficiency of the abstract interface and merely proving a theorem from the current concrete certificate constant.

Correction:

```text
all core helper/target theorems were rewritten to accept
C : RStageIntegrationCertificate
as an explicit parameter;
accepted-R corollaries are separate final instantiations.
```

The first draft is preserved in Git history; it was corrected, not erased from provenance.

---

# Successes

```text
C carrier selected                             NO
C-DP-001 resolved                              NO
abstract R-interface proof written             YES
accepted-R instantiation separated             YES
LowerCut/CutEquiv opened in C proof             NO
Dedekind completeness used by abstract proof    NO
R density/Archimedean used by abstract proof    NO
real inverse selector introduced                NO
new explicit C Classical/Choice call            NO
read-only V5 gate staged                        YES
certified V5 outcome available                  NOT YET
```

---

# HiddenAssumptions / Risks

1. The Lean source has been inspected for dependency discipline but is not yet certified by a retrievable V5 run.
2. The current accepted total-order Claim has localized classical producer provenance; downstream use of that Claim must retain that logical ancestry even though the C proof source adds no classical call.
3. `C-RL-003` (sum of squares zero only trivially) has not yet been formalized. It is likely useful to the coordinate route but should not be promoted as a universal C Claim unless route comparison shows that status is warranted.
4. The accepted R inverse-witness interface is not needed by `C-RL-001/002`, but a future proof that a chosen C carrier is a field probably will consume inverse strength. That later use must be measured independently.
5. Successful boundary lemmas do not select a C representation. They only remove one suspected reason to reach into R internals.

---

# LessonsLearned

1. An accepted-stage certificate can function as a clean downstream abstraction boundary only if the next-stage proof is written **against the certificate interface**, not merely in a file that happens not to unfold the representation.
2. Source-level absence of a classical keyword is weaker than logical-independence evidence; producer ancestry still matters.
3. C does not currently need R completeness to establish the first quadratic-extension separation fact.
4. The most valuable first formal C experiment was indeed a boundary experiment rather than an ordered-pair implementation.
5. Formal verification status and mathematical dependency diagnosis must remain separate states.

---

# ACT — CURRENT

## A1 — Retain `C-RQ-001` as verification-pending, not closed

Current classification:

```text
C-RQ-001
  mathematical/source-level diagnosis: SUPPORTS SUFFICIENCY
  formal V5 certification: PENDING RETRIEVABLE EVIDENCE
  final status: OPEN
```

Do not mark the question `PASS` until an exact workflow run / verified source state can be cited.

## A2 — Preserve the abstract theorem as reusable downstream support

`C-RL-001` and `C-RL-002` are route-neutral supporting lemmas, not C Bricks merely because they have names.

They may later be owned by a small C boundary-support Block only if independent replaceability/branching or packaging actually justifies such a unit.

## A3 — Keep the representation Decision blocked from resolution

```text
C-DP-001 = OPEN
SELECTS = NONE
```

The boundary result supplies evidence to all candidate routes equally. It is not evidence in favor of the pair carrier over the polynomial route.

## A4 — Next formal work after V5 evidence is available

After `C-RQ-001` receives formal PASS evidence, begin **comparable, noncanonical probes** of at least:

```text
C-ROUTE-P
C-ROUTE-Q
```

with the same probe rubric from `C-DP-001` before selecting a representation.

If one route needs `C-RL-003` or additional R facts, open and classify those dependencies at that time rather than preloading them into the common contract.

---

# ConstructionGraphEffects

```text
R-BLOCK-001 accepted interface
   ↓
C-RQ-001 abstract boundary probe
   ↓
C-RL-001 / C-RL-002 supporting theorem candidates

C-DP-001 remains OPEN in parallel
no C carrier / Brick / Block / Junction created by this experiment
```

---

# LearningGraphEffects

```text
PDSA-C-001 identifies first R-boundary risk
   ↓
first direct-certificate draft
   ↓
observation: proof/producer separation could be sharper
   ↓
rewrite against abstract RStageIntegrationCertificate parameter
   ↓
source-level dependency diagnosis supports accepted-R sufficiency
   ↓
read-only V5 gate staged
   ↓
formal outcome intentionally left OPEN until exact evidence is retrievable
```

This learning sequence must remain visible after eventual V5 PASS or any later proof simplification.