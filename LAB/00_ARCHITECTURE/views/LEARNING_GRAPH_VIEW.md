# LEARNING GRAPH VIEW — How BOMA Reached the Current Accepted Architecture

**View ID:** `BOMA-VIEW-LEARNING-GRAPH-001`  
**Status:** GENERATED / DERIVED VIEW  
**Date:** 2026-08-21  
**Program:** `PDSA-ARCH-002`

## Why this view exists

The current Construction DAG answers:

```text
What is accepted now?
```

The Learning Graph answers a different question:

```text
How did BOMA learn which current distinctions, commitments, routes, and checks were necessary?
```

A failed experiment or superseded route can therefore remain valuable even when it is not part of the current canonical export.

Governing principle:

> نصحح الحالة الحالية دون محو تاريخ التعلم الذي أدى إليها.

This view is derived from PDSA studies, failed/superseded evidence, Decision Points, reverse-engineering records, and the theorem-transparency calibration. It does **not** replace those records.

## Generic BOMA learning cycle

```mermaid
flowchart LR
  A[Attempt / selected hypothesis]
  O[Observed result or failure]
  D[Diagnosis]
  C[Correction / branch decision]
  V[Verification]
  L[Retained lesson]
  A --> O --> D --> C --> V --> L
  L -. informs later work .-> A
```

The loop is intentionally not represented as a one-way march toward an inevitable final architecture.

## Major learning paths retained in the current project

```mermaid
flowchart TD
  subgraph N[N-Core formalization learning]
    N0[Pre-numerical TCT calibration]
    N1[Select R-B fresh inductive carrier\nN-DP-001]
    N2[Initial V5 attempt]
    N3[Failure exposes eliminator / universe under-specification]
    N4[N-DP-002 corrected explicit scope]
    N5[Verification assembly corrected]
    N6[V5 PASS 32163771789]
    N7[Retain lesson:\nglobal carrier is a formalization commitment,\nnot silently derived from TCT]
    N0 --> N1 --> N2 --> N3 --> N4 --> N5 --> N6 --> N7
  end

  subgraph NAR[N-Arithmetic route learning]
    A1[Independent addR / addL routes]
    A2[N-ADD-J-001 equality]
    M1[Independent mulR / mulL routes]
    M2[N-MUL-J-001 equality]
    O1[LEAdd route + independent LEInd route]
    O2[N-ORD-J-001 equivalence]
    A3[Retain lesson:\ncanonical spelling after reconvergence\ndoes not erase alternate producer]
    A1 --> A2 --> M1 --> M2 --> O1 --> O2 --> A3
  end

  subgraph Z[Z representation / reverse learning]
    Z1[Signed normal forms route]
    Z2[Difference-pair + equivalence route]
    Z3[Z-J-001 convergence / classification]
    Z4[Z-DP-001 selects signed export\npair route retained]
    Z5[Post-Z reverse N study]
    Z6[INTERFACE RECONVERGENCE /\nPROVENANCE DIVERGENCE]
    Z7[Retain lesson:\nfinal extensional interface does not recover\nbottom-up construction history]
    Z1 --> Z3
    Z2 --> Z3
    Z3 --> Z4 --> Z5 --> Z6 --> Z7
  end

  subgraph Q[Q formal identity learning]
    Q1[Raw positive-denominator fractions + FracEquiv]
    Q2[Respect proofs before carrier quotient]
    Q3[Q-DP-001 selects Quotient fracSetoid]
    Q4[QA-23 accepted]
    Q5[Retain alternatives:\nreduced fractions / external setoid]
    Q1 --> Q2 --> Q3 --> Q4 --> Q5
  end

  subgraph R[R completion / logic learning]
    R1[Representation-neutral R acceptance contract]
    R2[Dedekind and Cauchy considered]
    R3[R-DP-001 Dedekind selected\nCauchy retained]
    R4[Constructive cut/order core]
    R5[Need total comparability exposed]
    R6[R-DP-003 localizes classical witness]
    R7[Q approximation, multiplication, reciprocal decisions]
    R8[RA-22 accepted]
    R9[RE-R-001 reverse classification]
    R10[Retain lesson:\nDedekind / quotient / classical comparability /\nselected multiplication and reciprocal routes\nare transparent realizations, not necessity theorems]
    R1 --> R2 --> R3 --> R4 --> R5 --> R6 --> R7 --> R8 --> R9 --> R10
  end

  N7 --> NAR
  A3 --> Z
  Z7 --> Q
  Q5 --> R
```

## Theorem-transparency learning program

### R calibration: hidden dependency discovery

```mermaid
flowchart LR
  R0[Declared R Claim closure complete]
  R1[Prototype execution defect:\naudit workspace outside package root]
  R2[Fix execution architecture]
  R3[5 semantic residuals]
  R4[Classify generated / metatheory provenance]
  R5[2 residuals]
  R6[Expose implicit proposition decision\nas localized Classical.em]
  R7[1 residual]
  R8[Remove proposition-extensionality proof artifact]
  R9[0 boundary residuals]
  R10[Add Claim↔producer ancestry comparator]
  R11[CLAIM_PRODUCER_PASS]

  R0 --> R1 --> R2 --> R3 --> R4 --> R5 --> R6 --> R7 --> R8 --> R9 --> R10 --> R11
```

Retained lesson:

```text
A source scan can look clean while theorem elaboration still consumes hidden logical/metatheoretic dependencies.
Actual formal closure must be measured, not inferred from stylistic inspection.
```

Historical records:

```text
LAB/PDSA/experiments/PDSA-ARCH-002-R-FORMAL-CLOSURE-PROTOTYPE-FAILURE-001.md
LAB/PDSA/experiments/PDSA-ARCH-002-R-FORMAL-CLOSURE-STUDY-001.md
```

### Q calibration: valid theorem ≠ acceptance producer

```mermaid
flowchart LR
  Q0[Boundary PASS on first theorem-level run]
  Q1[Claim/producer residual:\nzmul_ne_zero]
  Q2[Inspect actual closure]
  Q3[Consumed gateway is\nzmul_right_cancel_nonzero]
  Q4[Keep zmul_ne_zero theorem\nbut remove false acceptance ownership]
  Q5[0 residuals / PASS]

  Q0 --> Q1 --> Q2 --> Q3 --> Q4 --> Q5
```

Retained lesson:

```text
A theorem may be correct, useful, and historically retained without being a producer of the accepted Claim closure.
Do not inflate acceptance ownership to make an audit pass.
```

Historical record:

```text
LAB/PDSA/experiments/PDSA-ARCH-002-Q-FORMAL-CLOSURE-STUDY-001.md
```

### Z calibration: explicit Claim ≠ necessarily downstream-consumed theorem

```mermaid
flowchart LR
  Z0[Boundary PASS]
  Z1[3 Claim/producer residuals]
  Z2[signed_roundtrip\nembedN_zero\nembedN_one]
  Z3[Diagnose root undercoverage]
  Z4[These properties are explicitly accepted Claims]
  Z5[Add them to audit roots\nwithout deleting ownership]
  Z6[0 residuals / PASS]

  Z0 --> Z1 --> Z2 --> Z3 --> Z4 --> Z5 --> Z6
```

Retained lesson:

```text
The acceptance root surface is not identical to the set of theorems later consumers happen to reference.
An explicitly accepted property remains in the stage surface even when it is definitionally simple or downstream-unused.
```

Historical record:

```text
LAB/PDSA/experiments/PDSA-ARCH-002-Z-FORMAL-CLOSURE-STUDY-001.md
```

### N-Arithmetic: earlier lessons improve first-pass design

```mermaid
flowchart LR
  A0[Human Claim audit names route equations]
  A1[Root both recursion-route computation equations]
  A2[Root convergence + canonical laws]
  A3[Root both order routes + equivalence]
  A4[First theorem-level comparison]
  A5[0 residuals / PASS]
  A0 --> A1 --> A2 --> A3 --> A4 --> A5
```

Retained lesson:

```text
A first-pass success can itself depend on accumulated learning from earlier failures.
Do not interpret it as evidence that route-sensitive transparency was trivial.
```

### N-Core: definitions, backend witnesses, and canonical ontology

```mermaid
flowchart LR
  N0[Existing V5 theorem-ownership map]
  N1[Separate canonical TCT from backend TCTNF]
  N2[Use definitions as roots for definitional accepted interfaces]
  N3[Use named backend witnesses only where historical ownership already declares them]
  N4[Do not promote anonymous examples / #check to Claim identities]
  N5[Include independent Route-B named witnesses]
  N6[First theorem-level comparison]
  N7[0 residuals / PASS]

  N0 --> N1 --> N2 --> N3 --> N4 --> N5 --> N6 --> N7
```

Retained lesson:

```text
Formal verification syntax must not silently become canonical ontology.
A backend witness can certify a Claim without becoming the mathematical object the Claim is about.
```

## Operational learning: evidence-write race

```mermaid
flowchart LR
  E0[One Registry change triggers Q and R]
  E1[Both verify same branch SHA]
  E2[Stage A writes evidence commit]
  E3[Stage B exact-HEAD guard sees branch moved]
  E4[Otherwise-valid evidence rejected]
  E5[Diagnosis: evidence-promotion race, not math defect]
  E6[Shared concurrency group]
  E7[Guard verification-input drift only]
  E8[Q/R regression PASS]

  E0 --> E1 --> E2 --> E3 --> E4 --> E5 --> E6 --> E7 --> E8
```

Retained lesson:

```text
Evidence provenance must bind to the source actually verified while distinguishing verification-input drift from evidence-only branch movement.
```

This operational lesson now governs N-Core, N-Arithmetic, Z, Q, and R transparency workflows.

## Learning vs current-state classification

| Artifact/result | Current-state role | Learning role |
|---|---|---|
| accepted Block / Claim certification | authoritative current accepted interface | endpoint of one or more learning paths |
| failed V5 run | not current proof evidence | diagnosis of missing scope, assumption, or assembly condition |
| retained alternative route | not selected canonical export | demonstrates non-necessity / provides comparison or future branch |
| superseded proof implementation | not current source of truth | documents proof-engineering or logical-cost learning |
| reverse-engineering study | not forward construction member | classifies which information survives or is lost downstream |
| transparency residual | not acceptable final closure | exposes hidden dependency, over-ownership, or root undercoverage |

## Current Learning Graph frontier

The current learned state is:

```text
N-Core → R
mathematical acceptance preserved
+
independent machine transparency PASS for every accepted export
+
historical route/failure provenance retained
```

The Learning Graph does **not** continue into C because that stage has not been authorized.

```text
C NOT STARTED — USER HOLD
```
