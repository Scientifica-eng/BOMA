# PDSA-N-ORD-001 — Dual-Route Natural Order

**Status:** ACTIVE — PLAN / DO

## Question
Can an addition-based witness order and an independently generated structural order be proved equivalent and then reconverge into one canonical order interface?

## Route A — additive witness
```text
LEAdd(a,b) :⇔ ∃k, a+k=b
```
Depends on accepted addition.

## Route B — inductive structural order
```text
z ≤ᵢ b
(a ≤ᵢ b) ⇒ (s a ≤ᵢ s b)
```
Depends directly on accepted N-Core only; it must not depend on addition or multiplication.

## Junction target
```text
LEAdd(a,b) ↔ LEInd(a,b)
```

## Downstream
After convergence choose one canonical spelling, then establish partial/total order laws and addition/multiplication monotonicity. Preserve both production histories.
