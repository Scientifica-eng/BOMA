# C-COMPARE-BLOCK-001 — Representation-Neutral Quadratic Field Comparison

- **Operational status:** **ACTIVE — UNIVERSAL QUADRATIC COMPARISON V5 32575465002 PASS**
- **Epistemic status:** **DERIVED CARRIER-NEUTRAL COMPARISON / CONSTRUCTIVE SCOPE DECLARED**
- **Verified cycle:** `PDSA-C-006 — CLOSED / run 32575465002 PASS`
- **Current cycle:** `PDSA-C-007 — final integration PLAN FROZEN`
- **Input:** accepted real certificate + `C-BLOCK-001` selected witness-field producer
- **Acceptance target:** `CA-11 / C-CL-COMPARE-001`
- **Route Q:** **RETAINED VERIFIED PROBE ONLY / NOT A COMPLETED FIELD**
- **Route P ↔ Route Q Junction:** **NOT TRIGGERED**
- **Stage acceptance:** `CA-20 = NOT ELIGIBLE`

## Common presentation

`QuadraticFieldPresentation` packages a carrier-neutral field, faithful accepted-real
embedding, distinguished generator, unique real/imaginary coordinate expression,
and the coordinate algebra laws of the quadratic relation `I² = -1`.

The selected pair producer instantiates this mathematical interface without
declaring that all admissible carriers must themselves be records or products.

## Universal comparison strength

For arbitrary presentations `A` and `B` over the same accepted real certificate,
the comparison relation is:

```text
Related(A,B,x,y)
  := ∃ a b : RBOMA,
       x = coordA(a,b) ∧ y = coordB(a,b).
```

Its verified `QuadraticComparisonCertificate` states:

```text
total in both directions
single-valued in both directions
preserves zero, one, and the real embedding
preserves negation, addition, and multiplication
sends the distinguished generator of A to that of B
transports inverse-witness equations
```

## Constructive functional-isomorphism boundary

Existential coordinate generation in `Prop` does not automatically provide a
global computable coordinate-extraction function. Therefore:

```text
all presentations                   → canonical invertible algebra graph
presentations + explicit extractors → actual inverse algebra functions
```

The selected Route P carrier supplies its extractor by direct coordinate
projection. Any later independent candidate must provide its own constructive
extractor before a functional isomorphism is claimed without an additional
Choice commitment.

## Explicit exclusions

```text
completed Route Q field
Route P ↔ Route Q completed-field Junction
global Choice-backed coordinate selection
final C integration Junction
CA-20 acceptance
merge into main
```
