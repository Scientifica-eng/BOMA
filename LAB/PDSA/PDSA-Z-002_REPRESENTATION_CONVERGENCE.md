# PDSA-Z-002 — Integer Representation Convergence

**Status:** ACTIVE — PLAN / DO

## Route S
Fresh signed canonical syntax:
```text
zero
pos(n)  = +(s n)
neg(n)  = -(s n)
```
with natural embedding, sign reversal, and structural difference normalization.

## Route D
Natural difference pairs `(a,b)` representing `a-b`, with:
```text
(a,b) ~ (c,d) :⇔ a+d = c+b.
```
No quotient carrier is introduced yet.

## Convergence targets
```text
normalize(pairOfSigned(z)) = z
pairOfSigned(normalize(p)) ~ p
p ~ q ↔ normalize(p)=normalize(q)
```

## Guardrail
Do not open `Z-DP-001` for canonical representation selection until this convergence is established and formally checked.
