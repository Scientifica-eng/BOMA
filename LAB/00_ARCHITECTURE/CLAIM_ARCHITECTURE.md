# CLAIM ARCHITECTURE — Assertion and Dependency Audit Layer

**Document ID:** `BOMA-ARCH-CLAIMS-001`  
**Status:** ACTIVE ON `architecture/claim-transparency-001`  
**Date:** 2026-08-20  
**Governing program:** `PDSA-ARCH-002`

## 1. Purpose

Define a canonical audit layer for mathematical assertions and their dependencies without changing the existing Construction Unit taxonomy.

BOMA continues to use:

```text
Brick
Block
Junction
Decision Point
```

for construction architecture.

This document adds **Claim Records** as assertion-audit records that link acceptance obligations to construction producers and formal evidence.

A Claim Record is not automatically a construction unit.

## 2. Why a separate Claim layer is required

Construction granularity and theorem granularity are not identical.

Examples:

- one Brick can export several claims;
- one Block can package many theorem families;
- a Junction can certify an equivalence without becoming the producer of every downstream theorem;
- Q and R contain important internal definitions and theorem families that are not independent Bricks;
- Lean supporting lemmas may be required by a proof without deserving architectural unit identities.

Therefore:

```text
Construction Unit ≠ Claim ≠ Lean theorem
```

but all three must be traceably linked.

## 3. Claim Record schema

Every acceptance-level Claim Record should contain, where applicable:

```text
Claim ID
Stage
Title
Statement / scope
Acceptance obligation(s)
Operational status
Epistemic status
Producer unit(s)
Consumes mathematical claims
Logical commitments
Representation commitments
Formalization commitments
Supporting lemmas / proof interfaces
Lean theorem(s)
Lean source file(s)
Verification evidence
Alternative producer / retained branch
Sensitivity / reopening conditions
Notes / provenance
```

### Required identity rule

A Claim ID must identify a stable mathematical assertion at the chosen BOMA audit granularity, not a line number or an implementation accident.

Recommended form:

```text
<STAGE>-CL-<FAMILY>-<NNN>
```

Examples:

```text
R-CL-ORDER-001
R-CL-COMP-001
Q-CL-INV-001
```

Existing established claim labels need not be renamed merely for symmetry; aliases may be recorded when needed.

## 4. Dependency classification

Every dependency in a certified claim closure must be classified as one or more of:

### `MATHEMATICAL_CLAIM`

A mathematical assertion consumed by the claim.

### `SUPPORTING_LEMMA`

A proof-level mathematical lemma that is not promoted as an acceptance claim at the current audit granularity.

### `LOGICAL_COMMITMENT`

A proof-logical principle or explicit nonconstructive boundary, e.g. localized `Classical.em`.

### `REPRESENTATION_COMMITMENT`

A construction-specific representation choice, e.g. selected signed normal forms or Dedekind lower cuts.

### `FORMALIZATION_COMMITMENT`

A proof-assistant identity/packaging choice, e.g. a `Quotient` carrier or a particular eliminator regime.

### `VERIFICATION_INFRASTRUCTURE`

CI, assembly manifests, evidence promotion workflow, checker/toolchain plumbing.

### `TRUSTED_METATHEORY`

Declared host-level logical/type-theoretic resources and trusted checker boundary.

No certified closure may leave a required dependency classified only as:

```text
OTHER
IMPLICIT
UNKNOWN
```

## 5. Claim epistemic status

Claim Records inherit the existing BOMA separation among status dimensions.

Typical epistemic values:

```text
DERIVED
CONSTRUCTED
DECLARED CHOICE
METHODOLOGICAL CHOICE
FORMALIZATION-DEPENDENT
ROUTE-SPECIFIC
PENDING
REJECTED
```

A Claim Record must not turn a selected representation or proof route into mathematical necessity.

## 6. Producer rule

Every accepted Claim Record must have at least one explicit producer or producer chain.

Valid producers include:

```text
Brick
Block
Junction output
Decision-selected construction followed by a proof producer
```

An acceptance claim with no explicit producer is a transparency defect.

## 7. Evidence rule

For claims requiring V5 under BOMA governance, the record must identify:

```text
Lean theorem or checked certificate
source file / assembly target
canonical evidence file
verified source commit
workflow run where available
pinned toolchain
```

The evidence file is authoritative for the run/commit it records. A later documentation commit does not retroactively become the verified source commit.

## 8. Closure invariant

For an accepted export `E`, define:

```text
DeclaredClosure(E)
```

as the transitive closure of its declared Claim Records, supporting lemmas/interfaces, logical/representation/formalization commitments, and Trusted Base entries.

Define:

```text
ActualFormalClosure(E)
```

as the dependencies actually consumed by the formal acceptance assembly/certificate.

Transparency target:

```text
ActualFormalClosure(E)
  ⊆
DeclaredClosure(E) ∪ TrustedBase
```

After normalization, the stronger target is semantic equality modulo explicitly classified proof-engineering details.

Any residual required dependency not represented on the declared side is an `UNDECLARED DEPENDENCY` until resolved.

## 9. Granularity rule

Do not convert every claim or supporting lemma into a Brick.

Promote a component to an independent Brick when it is independently reviewable and materially one or more of:

```text
replaceable
branchable
introduces a distinct commitment
has independent sensitivity
carries distinct logical cost
carries distinct representation cost
can reconverge independently
```

Otherwise keep it as an internal component or supporting lemma and expose it through Claim Records.

## 10. Block mapping rule

High-impact Blocks should eventually expose:

```text
Members:
  Bricks
  declared internal components

Consumes:
  Blocks
  Claims
  Junction outputs
  Decision selections

Exports:
  Claims
```

Block membership does not erase Brick identity or claim provenance.

## 11. Junction mapping rule

A claim based on reconvergence must identify the Junction and the exact convergence strength:

```text
equality
equivalence
isomorphism
mutual interpretation
same downstream adequacy
```

A visual meeting of routes is not enough.

## 12. Decision mapping rule

If a claim depends on a Decision Point selection, the Claim Record must identify:

```text
selected option
unselected retained alternatives
whether the claim statement itself is representation-independent
whether only its current producer is route-specific
```

## 13. Historical and Learning Graph rule

Superseded claims, failed proof attempts, and earlier epistemic classifications remain in PDSA/Learning Graph provenance.

The active Claim Registry records the current accepted/audited claim state; it must not rewrite history to make the path appear linear or error-free.

## 14. Certification states for claim closure

Recommended audit states:

```text
UNMAPPED
PARTIALLY MAPPED
DECLARED-CLOSURE COMPLETE
FORMAL-CLOSURE COMPARED
TRANSPARENCY PASS
TRANSPARENCY FAIL — UNDECLARED DEPENDENCY
```

`TRANSPARENCY PASS` is stronger than mathematical acceptance: it certifies the declared-vs-actual dependency audit at the stated granularity.

## 15. Initial rollout

`PDSA-ARCH-002` applies this schema first to `R-BLOCK-001`, then Q, Z, N-Arithmetic, and N-Core.

No status in this document authorizes complex-number construction.
