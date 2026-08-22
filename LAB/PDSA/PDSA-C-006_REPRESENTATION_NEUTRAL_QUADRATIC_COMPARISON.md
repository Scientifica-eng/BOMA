# PDSA-C-006 — Representation-Neutral Quadratic Field Comparison

**Cycle ID:** `PDSA-C-006`  
**Status:** ACTIVE — PLAN FROZEN / DO STARTED / V5 PENDING  
**Plan date:** 2026-08-22  
**Parent:** `PDSA-C-005 — CLOSED / constructive field audit V5 32574920935 PASS`  
**Decision:** `C-DP-001 — RESOLVED / USER-RATIFIED C-ROUTE-P`  
**Acceptance contract:** `BOMA-C-ACCEPT-001 / CA-11`

## Research question

Can BOMA prove that arbitrary quadratic accepted-real field presentations with
the same distinguished generator and unique real/imaginary coordinates have a
canonical coordinate-preserving algebra equivalence **without** silently using
Choice to turn existential coordinate witnesses into globally selected data?

# PLAN — FROZEN

## Frozen input boundary

```text
RStageIntegrationCertificate / accepted R-BLOCK-001
verified C-R boundary support
verified retained Route P candidate
verified CPairRingCoreCertificate / PDSA-C-004
verified CPairFieldCertificate / PDSA-C-005
user-selected C-ROUTE-P and retained, probe-only C-ROUTE-Q
BOMA-C-ACCEPT-001 unchanged
no claim that Route Q is already a completed field
```

No accepted N/Z/Q/R source, frozen earlier PDSA PLAN, representation-specific
Dedekind internal, global Choice-backed coordinate extraction, new axiom,
unproved placeholder, new explicit classical principle, full Route Q field
implementation, or merge into `main` may be introduced.

## Construction and verification scope

Create exactly:

```text
LAB/payloads/lean/CStage/CQuadraticComparison001.lean
LAB/20_FORMALIZATION/C_STAGE/C_QUADRATIC_COMPARISON_001_INPUTS.txt
.github/workflows/boma-c-quadratic-comparison-001.yml
LAB/10_CONSTRUCTION/blocks/C-COMPARE-BLOCK-001/UNIT.md
```

Update current C Claim/evidence/architecture/PDSA records only for observed
results. Do not create a Route P ↔ Route Q Junction: Route Q has a verified
quadratic probe, not a completed field satisfying the accepted contract.

## Frozen mathematical targets

```text
C6-01  representation-neutral quadratic-field presentation over accepted R
C6-02  explicit mathematical distinction between existential and extractable coordinates
C6-03  canonical same-coefficients relation for any two valid presentations
C6-04  totality and single-valuedness in both relation directions
C6-05  preservation of zero, one, real embedding, negation, addition, multiplication
C6-06  preservation of the distinguished imaginary generator and inverse witnesses
C6-07  genuine inverse functions only when constructive coordinate extractors are supplied
C6-08  explicit selected Route P presentation and its constructive coordinate extractor
C6-09  no fabricated completed Route Q field, producer, Junction, or reconvergence
C6-10  exact read-only V5 assembly over the verified selected field producer
C6-11  print inherited-axiom baselines and report any new transitive axiom
C6-12  map CA-11/C-CL-COMPARE-001 without claiming final integration or CA-20
```

## Constructive boundary

The proposition:

```text
∀ z, ∃ a b, z = a + bI
```

does not automatically provide a definable global coordinate-extraction
function in Lean's constructive core. The universal result is therefore a
total, single-valued, invertible, structure-preserving **graph relation**.
Actual mutually inverse algebra maps are proved only for presentations that
also supply explicit constructive coordinate extractors as data. This
distinction must not be concealed behind a global choice principle.

## Predeclared failure classes

```text
F1  missing presentation-coordinate law derivable from accepted quadratic algebra
F2  accidental Choice-backed extraction from propositional existence
F3  graph functionality or algebra-preservation failure
F4  selected Route P presentation cannot instantiate the declared common interface
F5  false claim that the retained Route Q probe is already a complete field
F6  representation-specific leakage or unstated real dependency
F7  workflow/provenance/axiom-audit failure
F8  overclaim of full C acceptance before final integration
```

Any failure is recorded in DO/STUDY. The PLAN remains unchanged after freeze.

## Exit condition

Close only when exact V5 evidence verifies both the universal relational
quadratic-field equivalence and the conditional constructive functional
isomorphism, the selected pair presentation is instantiated, `CA-11` is mapped
precisely, Route Q remains retained/probe-only, and ACT opens a separately
frozen final integration/acceptance cycle.

# DO — ACTIVE / FIRST FORMAL VERIFICATION PENDING

## D1 — Stage a carrier-neutral quadratic-field presentation and comparison

Created:

```text
LAB/payloads/lean/CStage/CQuadraticComparison001.lean
LAB/20_FORMALIZATION/C_STAGE/C_QUADRATIC_COMPARISON_001_INPUTS.txt
.github/workflows/boma-c-quadratic-comparison-001.yml
LAB/10_CONSTRUCTION/blocks/C-COMPARE-BLOCK-001/UNIT.md
```

The source defines a carrier-neutral full quadratic-field presentation and instantiates it from the selected witness-based Route P field. For arbitrary presentations it constructs the same-real-coefficients relation, proves totality and uniqueness in both directions, and transports zero, one, the accepted-real embedding, the distinguished generator, negation, addition, multiplication, and inverse-witness equations.

A separate `CoordinateExtractor` structure makes constructive coordinate data explicit. Only presentations supplying such data receive actual mutually inverse algebra functions; the selected Route P extractor consists of its direct record projections. The retained Route Q probe is neither included in the assembly nor presented as a completed field or Junction.

```text
carrier-neutral comparison V5  PENDING
Route Q completed field        NO
new coordinate Choice          NONE
CA-20 acceptance               NOT ELIGIBLE
```

# STUDY — NOT STARTED

# ACT — NOT STARTED

```text
C-ROUTE-Q completed field   NO
Route P ↔ Route Q Junction  NOT TRIGGERED
CA-20 acceptance            NOT ELIGIBLE
```
