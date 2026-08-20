# TRUSTED BASE — Explicit Metatheory and Verification Boundary

**Document ID:** `BOMA-ARCH-TRUST-001`  
**Status:** ACTIVE ON `architecture/claim-transparency-001`  
**Date:** 2026-08-20  
**Governing program:** `PDSA-ARCH-002`

## 1. Purpose

Make explicit the resources BOMA relies on but does not itself reconstruct as object-level mathematics.

The purpose is not to claim that the trusted base is infallible. The purpose is to prevent trusted metatheory, proof-assistant infrastructure, and CI execution assumptions from being mistaken for hidden mathematical claims of the constructed number systems.

## 2. Governing distinction

```text
BOMA-constructed mathematics
  ≠
Declared metatheory
  ≠
Formalization infrastructure
  ≠
Verification/CI infrastructure
```

A transparency audit is complete only when every dependency is either represented in the constructed/claim graph or explicitly classified in this trusted boundary.

## 3. Current formal checker/toolchain boundary

Pinned repository toolchain:

```text
leanprover/lean4:v4.32.1
```

The repository `lake-manifest.json` currently records:

```text
fixedToolchain: true
packages: []
```

Thus the active canonical R integration build does not rely on an external Lake package set. This does not mean it is independent of Lean's own core/prelude/runtime environment.

## 4. Trusted metatheory categories

### TB-META-001 — Lean dependent type-theoretic framework

BOMA formal payloads are checked within Lean 4's type-theoretic framework. The project does not reconstruct the proof theory of Lean from the pre-numerical object layer.

Classification:

```text
TRUSTED_METATHEORY
```

### TB-META-002 — Inductive definitions and generated eliminators

Where an accepted formalization selects an inductive carrier or inductive predicate, the availability and correctness of the corresponding Lean-generated recursors/eliminators is part of the checker/metatheory boundary.

The **selection** of such an inductive formalization remains a BOMA formalization commitment and must still be exposed separately where relevant.

Classification:

```text
TRUSTED_METATHEORY
+
FORMALIZATION_COMMITMENT where selected by BOMA
```

### TB-META-003 — Proposition/type universe and equality infrastructure

Lean's primitive/formal equality and universe/type infrastructure are host-level resources. BOMA must still distinguish these from its own object-level identity/equivalence choices such as `≈`, `FracEquiv`, or `CutEquiv`.

Classification:

```text
TRUSTED_METATHEORY
```

### TB-META-004 — Quotient infrastructure

Lean's quotient/setoid infrastructure is available as part of the formal environment.

Important distinction:

```text
availability of Quotient infrastructure = TRUSTED_METATHEORY / FORMALIZATION INFRASTRUCTURE
choosing QBOMA := Quotient fracSetoid     = BOMA FORMALIZATION COMMITMENT
choosing RBOMA := Quotient cutSetoid      = BOMA FORMALIZATION COMMITMENT
```

The presence of Quotient support therefore does not make either quotient identity mathematically necessary.

## 5. Explicit logical commitments are not absorbed into the Trusted Base

The existence of a classical facility in Lean does **not** authorize silent classical reasoning in accepted BOMA claims.

Uses such as:

```text
Classical.em
Classical.byContradiction
Choice / classical witness extraction
```

must be classified at the actual claim/proof dependency where they are consumed.

Therefore:

```text
Lean can express classical reasoning
  ≠
all BOMA claims may silently use classical reasoning.
```

Localized classical use remains a `LOGICAL_COMMITMENT`, not a blanket Trusted Base exemption.

## 6. Meta-level finite syntax / derivation reasoning

The pre-numerical TCT path permits explicitly declared host-level/meta-level reasoning over supplied syntax/derivation witnesses, including meta-finite inspection where documented by the active metatheory contract.

This does not automatically construct object-level:

```text
natural-number cardinality
numerical length
depth
completed global carrier
```

Classification:

```text
TRUSTED_METATHEORY / DECLARED METATHEORY CONTRACT
```

Any promotion of such meta-level structure into the object layer requires an explicit construction unit/claim boundary.

## 7. Verification infrastructure boundary

### TB-VERIFY-001 — Lean kernel/checker execution

BOMA treats successful Lean checking under the pinned toolchain as V5 verification evidence within its governance regime.

The project does not prove the implementation correctness of the Lean kernel inside BOMA.

Classification:

```text
VERIFICATION_INFRASTRUCTURE
```

### TB-VERIFY-002 — Lake/project invocation

`lake env lean` and repository toolchain resolution are operational mechanisms used to invoke the checker.

Classification:

```text
VERIFICATION_INFRASTRUCTURE
```

### TB-VERIFY-003 — Git/GitHub source identity

Commit SHAs, repository file identity, branch refs, and recorded source paths are treated as the operational provenance mechanism tying evidence to source states.

Classification:

```text
VERIFICATION_INFRASTRUCTURE
```

### TB-VERIFY-004 — GitHub Actions execution

GitHub Actions provides the current V5 execution environment and evidence-promotion workflow.

BOMA does not infer mathematical truth merely from a green workflow label. The checked target, source assembly, toolchain, verified source commit, and evidence record remain part of the audit.

Classification:

```text
VERIFICATION_INFRASTRUCTURE
```

### TB-VERIFY-005 — Assembly manifests/workflows

Explicit source manifests and workflow assembly logic define which formal files are presented together to the checker for an integration target.

These are not object-level mathematical assumptions, but an omitted or unintended input can create a verification-traceability defect. Accordingly they belong to the actual formal dependency audit.

Classification:

```text
VERIFICATION_INFRASTRUCTURE
+
FORMALIZATION / PROOF-ENGINEERING DEPENDENCY
```

## 8. Not claimed by BOMA

Current acceptance does not by itself prove:

```text
correctness of CPU/hardware
correctness of operating system
correctness of GitHub service implementation
correctness of the Lean implementation relative to an independently formalized metatheory
correctness of every compiler/runtime layer below the checker
```

These are outside the present mathematical construction claim.

Their existence must not be confused with hidden number-theoretic premises.

## 9. Trusted Base audit rule

For each accepted export, every actual dependency should land in one of:

```text
Declared mathematical claim
Declared supporting lemma/interface
Declared logical commitment
Declared representation commitment
Declared formalization commitment
Declared verification infrastructure
Trusted Base entry
```

If it lands in none of these, record:

```text
UNDECLARED DEPENDENCY
```

until explicitly classified or removed.

## 10. Change sensitivity

Re-audit affected formal closures if any of the following changes materially:

```text
lean-toolchain
Lake dependency set
quotient/formal identity infrastructure used by accepted carriers
workflow assembly mechanism
accepted source manifest
metatheory contract for pre-numerical reasoning
logical regime of an accepted proof
```

A toolchain change is not automatically a mathematical change, but it requires new verification evidence under BOMA V5 governance.

## 11. Current boundary summary

As of the baseline for `PDSA-ARCH-002`:

```text
Lean toolchain             leanprover/lean4:v4.32.1
External Lake packages     none recorded
Accepted mathematical end R-BLOCK-001
RE-R-001                    CLOSED / COMPLETE
C                           NOT STARTED — USER HOLD
```

This document changes no mathematical theorem and authorizes no downstream construction stage.
