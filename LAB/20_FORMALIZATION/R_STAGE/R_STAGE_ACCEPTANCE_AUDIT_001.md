# R_STAGE_ACCEPTANCE_AUDIT_001 — Representation, Completion Scope, Hidden Dependencies, and Formal Commitments

**Status:** **PASS FOR RA-14 / RA-16 / RA-17 / RA-18 / RA-19; RA-20 INDEXED**  
**Date:** 2026-08-20  
**Selected route:** Dedekind lower cuts over accepted `QBOMA`  
**Formal carrier:** `RBOMA := Quotient cutSetoid`

## Audit purpose

Discharge the non-theorem acceptance obligations that must be explicit before the final real integration gate:

```text
RA-14 representation adequacy
RA-16 multiple-route convergence discipline
RA-17 completion-notion scope
RA-18 no hidden standard-real dependency
RA-19 formal commitment ledger
RA-20 claim-level V5 traceability
```

This audit does not itself make `RA-22 = ACCEPT`.

---

# RA-14 — Representation adequacy

## Selected representation class

A raw selected real representation is a `LowerCut` over accepted `QBOMA` with fields:

```text
lower    : QBOMA → Prop
nonempty : ∃q, lower q
proper   : ∃q, ¬ lower q
downward : lower b → a≤b → lower a
rounded  : lower a → ∃b, lower b ∧ a<b
```

This is the complete representation class claimed in Stage I.

## Representation identity

Raw structure equality is **not** the accepted real identity.

The external representation relation is:

```text
CutEquiv A B := ∀q : QBOMA, A.lower q ↔ B.lower q.
```

The formal carrier is then:

```text
cutSetoid : Setoid LowerCut
RBOMA := Quotient cutSetoid.
```

Thus the selected representation classifies extensional lower regions of `QBOMA`, not Lean structure syntax.

## No stronger representation claim

Stage I does not claim here:

```text
all complete ordered fields are uniquely represented by these raw cuts;
Cauchy sequences are already identified with these quotient classes;
a universal completion property has been proved;
all standard models of R have been constructed and compared.
```

### RA-14 result

```text
RA-14 = PASS
```

---

# RA-16 — Multiple-route convergence discipline

`R-DP-001` built and compared independent representation/embedding probes for:

```text
Route D — Dedekind lower cuts
Route C — Cauchy sequences
```

Stage I selected Route D and retained Route C as a first-class future branch.

However, Route C has **not** been built through a complete formal carrier, full ordered-field structure, and its selected completeness theorem.

Therefore Stage I has only one completed formal real carrier under acceptance review.

No false reconvergence claim is made.

### RA-16 result

```text
RA-16 = NOT TRIGGERED
```

Reason: more than one complete formal real carrier has not been built in Stage I.

The Cauchy route remains Stage-II branch material.

---

# RA-17 — Completion-notion scope

The selected completion theorem is exactly:

```text
For every F : RBOMA → Prop,
if F is nonempty and has an explicit upper bound,
then F has a least upper bound in RBOMA.
```

The implementation is `rDedekind_lub_exists`.

The construction forms a witness-based union lower cut and lifts it through the quotient.

## Scope boundary

The accepted claim is:

```text
Dedekind least-upper-bound completeness.
```

It is **not** automatically enlarged to:

```text
Cauchy completeness;
nested-interval completeness;
metric completeness;
sequential completeness;
equivalence of all standard completeness notions.
```

No such implication is required for Stage-I acceptance unless separately constructed.

### RA-17 result

```text
RA-17 = PASS
```

---

# RA-18 — No hidden standard-real dependency

## Carrier audit

The canonical real carrier is explicitly:

```text
RBOMA := Quotient cutSetoid
```

where `cutSetoid` is formed from `CutEquiv` on project-defined `LowerCut` values over project-defined `QBOMA`.

No built-in real carrier appears in the definition.

## Completeness audit

The least-upper-bound theorem is constructed from the selected lower-cut representation itself. It does not call an external real completeness theorem.

## Build-environment audit

Repository package configuration:

```text
lakefile.toml:
  name = "BOMA"

lake-manifest.json:
  packages = []
```

Thus the verified Stage-I assemblies have no external Lake package dependency such as Mathlib from which a standard `Real` carrier/completeness package could be silently imported.

The pinned toolchain is:

```text
leanprover/lean4:v4.32.1
```

V5 workflows assemble the BOMA dependency chain by concatenating repository payloads and checking the resulting Lean source.

## Audit boundary

The claim here is intentionally scoped:

> No hidden standard-real dependency was found or required in the active canonical Stage-I R dependency closure and its V5 build environment.

This is not a claim that the words “real” or experimental comparison artifacts never occur anywhere in repository history.

### RA-18 result

```text
RA-18 = PASS
```

---

# RA-19 — Formal commitment ledger

The ledger records commitments by role rather than collapsing them into a single “classical” label.

## F-01 — Predicate-valued cut representation

**Status:** USED / EXPLICIT

```text
LowerCut.lower : QBOMA → Prop
```

Role: selected Dedekind representation.

## F-02 — Quotient formation

**Status:** USED / EXPLICIT

```text
Setoid LowerCut
Quotient cutSetoid
Quotient.mk
Quotient.sound
Quotient.exact
Quotient.inductionOn
```

Role: formal identity and representative-independent definitions/proofs.

## F-03 — Function/proposition extensionality for real identity

**Status:** NOT REQUIRED BY SELECTED IDENTITY CONSTRUCTION

`CutEquiv` is deliberately external:

```text
∀q, A.lower q ↔ B.lower q
```

and quotient identity is taken over that relation.

The accepted `rLE` is likewise defined by explicit representative witnesses rather than identifying predicates by proposition extensionality.

This ledger entry does not assert that Lean's metatheory lacks extensionality principles; it states that the selected real identity/order construction does not consume them as object-level bridges.

## F-04 — Classical excluded middle for total cut comparability

**Status:** USED / LOCALIZED

Provider:

```text
RDedekindOrderClassicalWitness.lean
```

Two explicit `Classical.em` calls construct `CutComparability`, which then yields real-order totality.

The constructive reflexive/transitive/antisymmetric `rLE` core is kept separate.

## F-05 — Classical finite membership search for fine cut bracketing

**Status:** USED / LOCALIZED

Provider:

```text
RDedekindFiniteExitSearch.lean
```

An explicit `Classical.em` decides membership at a predecessor point in a finite rational grid.

This contribution is consumed by fine cut-bracketing and therefore by theorem paths such as additive inverse and the direct reciprocal inverse-product proof.

It is **not** consumed by RA-13's direct Archimedean theorem.

## F-06 — Classical contradiction for positive representative extraction

**Status:** USED / LOCALIZED

Provider:

```text
RDedekindPositiveRepresentativeWitness002.lean
```

`Classical.byContradiction` extracts a positive rational witness from a nonzero nonnegative real representative.

Role: direct positive reciprocal / nonzero inverse route.

## F-07 — Classical witness extraction for strict rational density in RBOMA

**Status:** USED / LOCALIZED

Provider:

```text
RDedekindRationalDensity.lean
```

`Classical.byContradiction` / `Classical.em` extract a rational point witnessing failure of extensional equality under strict cut inclusion.

This classical use belongs to RA-12's current strict-order representation. It is independent of RA-13.

## F-08 — Global representative selector / Choice for completeness

**Status:** NOT USED IN SELECTED COMPLETENESS CONSTRUCTION

`supCutFromFamily` uses existential representative witnesses inside its membership predicate and `Quotient.inductionOn`; it does not choose one representative globally for every family element.

## F-09 — Global inverse selector / Choice

**Status:** NOT REQUIRED BY ACCEPTED FIELD INTERFACE

The selected field closure exports:

```text
x≠0 → ∃ y, x*y=1
```

plus uniqueness and the corresponding left-inverse witness.

The acceptance interface therefore does not require a globally chosen function `inv : RBOMA → RBOMA`.

No claim is made that Choice is absent from Lean's metatheory; the claim is that a Choice-based global selector is not part of the accepted construction interface.

## F-10 — Sequence/countability machinery

**Status:** NOT PART OF CANONICAL STAGE-I DEDekind CARRIER

Cauchy sequence machinery exists as a retained alternative-route probe, but Route C is not the accepted Stage-I carrier and its sequence machinery is not imported to discharge the selected Dedekind completeness theorem.

## F-11 — Metric / absolute-value / power infrastructure

**Status:** NOT REQUIRED FOR SELECTED DEDekind COMPLETENESS CLAIM

The canonical LUB theorem, density theorem, and Archimedean theorem do not depend on an imported real metric/absolute-value package.

## F-12 — Bounded-family predicate machinery

**Status:** USED / EXPLICIT

```text
RUpperBound (F : RBOMA → Prop) (U : RBOMA)
```

Role: selected least-upper-bound completeness statement.

No built-in set-theoretic real-analysis library is needed to state the family.

## F-13 — Formal verification infrastructure

**Status:** USED / META-LEVEL

```text
Lean 4.32.1
Lake project with zero external packages
GitHub Actions V5 evidence
```

Per the governing metatheory contract, successful Lean verification establishes encoded claims under their declared assumptions; it does not by itself prove that the representation choices were logically forced.

### RA-19 result

```text
RA-19 = PASS
```

The ledger remains extensible if `R-J-002` exposes an unrecorded dependency.

---

# RA-20 — Claim-level V5 verification

Canonical index:

```text
LAB/20_FORMALIZATION/R_STAGE/R_CLAIM_V5_INDEX.md
```

The index maps promoted acceptance-level theorem families to authoritative evidence files and V5 runs.

A provenance inconsistency found during this audit was corrected:

```text
R-COMP-BLOCK-001
  old documented run: 32182124371
  canonical evidence: 32182056311 PASS
```

No theorem changed; metadata was corrected to match the evidence file.

### RA-20 result

```text
RA-20 = PASS
```

subject to final full-assembly integration at `R-J-002`.

---

# Consolidated audit result

```text
RA-14  PASS
RA-16  NOT TRIGGERED
RA-17  PASS
RA-18  PASS
RA-19  PASS
RA-20  PASS
```

Still not discharged by this document:

```text
RA-21  final integration gate
RA-22  final Stage-I real acceptance
```

## Required next action

Build and run `R-J-002` as a final integration artifact that consumes the stabilized carrier/identity, order, Q embedding, additive group, ordered-ring multiplication, nonzero inverse, Dedekind LUB completeness, rational density, Archimedean theorem, commitment ledger, and V5 index.

Only a PASS at that gate may authorize `RA-22 = ACCEPT`.
