# PDSA-C-005 — Conjugate, Norm, and Witness-Based Complex Field Closure

**Cycle ID:** `PDSA-C-005`  
**Status:** ACTIVE — PLAN FROZEN / DO NOT STARTED  
**Plan date:** 2026-08-22  
**Parent:** `PDSA-C-004 — CLOSED / selected ring-core V5 32574270735 PASS`  
**Decision:** `C-DP-001 — RESOLVED / USER-RATIFIED C-ROUTE-P`  
**Acceptance contract:** `BOMA-C-ACCEPT-001`

## Research question

Can the verified selected Route P commutative-ring core be promoted to a
nontrivial commutative-field-strength interface through conjugation, the real
sum-of-squares norm, and **existential inverse witnesses only**, while consuming
only the already accepted real integration certificate and introducing neither
a global inverse selector nor a new classical equality decision?

# PLAN — FROZEN

## Frozen input boundary

```text
R-BLOCK-001 accepted real interface
RStageIntegrationCertificate
PDSA-C-002 verified accepted-R boundary support
PDSA-C-003 verified Route P producer
PDSA-C-004 verified selected pair ring core / run 32574270735 PASS
CPairRingCoreCertificate
C-DP-001 user-ratified C-ROUTE-P
BOMA-C-ACCEPT-001 unchanged
BOMA-C-R-DEP-001 unchanged unless a genuinely new dependency is discovered
C-ROUTE-Q retained and excluded from selected-route verification assembly
```

No accepted N/Z/Q/R source, accepted theorem, frozen earlier PDSA PLAN, real
representation internal, real completeness/density/Archimedean field, built-in
complex type, global inverse selector, new axiom, proof placeholder, or new
explicit classical/Choice principle may be introduced.

## Construction and evidence scope

Create exactly the selected field-closure producer and its verification gate:

```text
LAB/payloads/lean/CStage/CPairNormInverse001.lean
LAB/20_FORMALIZATION/C_STAGE/C_PAIR_NORM_INVERSE_001_INPUTS.txt
.github/workflows/boma-c-pair-norm-inverse-001.yml
```

Update the existing partial `C-BLOCK-001`, C Claim register, V5 evidence index,
PDSA cycle/status, and current architecture/frontier documents only to reflect
actually verified producer scope.

## Frozen mathematical targets

```text
C5-01  conjugation and the real norm a²+b² on the selected carrier
C5-02  conjugation involution and preservation of real embeddings
C5-03  z * conjugate(z) = ιR(norm(z)), including the reverse product
C5-04  norm=0 entails double-negated coordinate/complex zero without equality stability
C5-05  z≠0 entails norm(z)≠0 constructively
C5-06  obtain a real inverse witness exclusively from C.inverseExists
C5-07  construct an explicit complex witness from conjugation and that real witness
C5-08  prove left/right complex inverse equations
C5-09  prove uniqueness of complex inverse witnesses from verified ring laws
C5-10  package selected CPairFieldCertificate without a global inverse selector
C5-11  instantiate the package on the accepted Stage-One real certificate
C5-12  exact read-only V5 assembly: R + C-boundary + Route P + pair core + closure
C5-13  honest producer/Claim mapping; comparison/integration remain unproduced
```

The proof is not required to derive the stronger implication
`norm(z)=0 → z=0`; if that implication needs equality stability, record the
distinction. Double-negated zero is sufficient to contradict the supplied
nonzero hypothesis and therefore establish the denominator's nonzeroness.

## Explicit exclusions

```text
new classical decidability for equality on RBOMA or CBOMA
global Choice-backed inverse function
Route P ↔ Route Q completed field isomorphism/Junction
representation-neutral universal comparison theorem
full C acceptance integration or CA-20 acceptance
algebraic closure, polynomial roots, or FTA
merge into main
```

Each excluded product requires a separate subsequent frozen cycle.

## Predeclared failure classes

```text
F1  ordinary missing lemma derivable from the accepted abstract real interface
F2  genuine absent real order/field strength requiring an explicit dependency question
F3  illicit use of double-negation elimination or implicit decidable equality
F4  sum-of-squares / conjugate equational proof-engineering failure
F5  accidental global real/complex inverse selector or Choice-backed witness
F6  Route Q, Dedekind internals, completeness, density, or Archimedean leakage
F7  workflow, checkout provenance, or exact-assembly observability failure
F8  documentation overclaims field acceptance, comparison, or integration
```

A failure and its repair belong in DO/STUDY. The PLAN is never edited after
freeze. Any actually necessary new logical principle or strengthened R export
must be surfaced rather than introduced silently.

## Exit condition

Close only after a retrievable exact V5 run proves the selected witness-based
field certificate, all promoted producer claims and retained limits are
synchronized, and ACT opens a separately frozen representation-neutral
comparison/integration cycle.

# DO — NOT STARTED

# STUDY — NOT STARTED

# ACT — NOT STARTED

```text
C-DP-001    RESOLVED / C-ROUTE-P SELECTED
C-ROUTE-Q   RETAINED
CA-20       NOT ELIGIBLE
```
