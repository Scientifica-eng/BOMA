# Z-D-BLOCK-001 — Difference-Pair / Equivalence Route

- **Operational Status:** **ACTIVE / V5 PASS / RETAINED ALTERNATIVE**
- **Epistemic Status:** **DERIVED EQUIVALENCE REPRESENTATION**
- **Members:** `Z-D-BR-001..003`
- **Depends on:** accepted N-Arithmetic addition package

## Export

```text
ZPair := (p,n)
(p,n) ~ (q,m) ↔ p+m = q+n
```

with reflexivity, symmetry, transitivity, normalization to signed normal form, and round-trip up to `~`.

No quotient carrier has been formed.

## Verification

The difference-pair route passed independently in final representation-convergence V5:

```text
run:   32168105466
Lean:  4.32.1
route: PASS
```

`Z-J-001` additionally established:

```text
p ~ q ↔ normalizePair(p) = normalizePair(q)
```

so the retained relation is completely classified by the selected signed normal forms.

## Decision-point effect

`Z-DP-001` did not select a quotient of this route as the Stage-One carrier. This is a methodological choice, not rejection of the route.

The pair representation remains first-class for:

```text
natural-difference generation
representation independence
equivalence-respecting arithmetic
group-completion interpretation
future Stage-Two branch experiments
```

## Current boundary

Pair arithmetic is being verified separately. Its verification status must not be conflated with this already-passed representation Block.
