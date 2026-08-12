# CLOSURE-CORE-013 — Formalization Boundary

Status: experimental / provisional

## Question
Can global referenceability be postponed until formalization, while the pre-formal layer remains local and operational?

## Result
Yes, as a design option. Local references suffice for finite construction, extension, composition, depth recovery, and comparison. A global domain need not be assumed before formalization.

## Boundary
Pre-formal layer:
- local construction
- local referenceability
- finite composition
- construction depth

Formalization boundary:
- global domain or totality
- formal identity
- formal operations
- chosen mathematical framework

## Caution
This does not prove that global referenceability is impossible pre-formally. It shows only that it is not required for the finite operational layer.

## Plan position
Stage 7 — Closure / Completeness.
