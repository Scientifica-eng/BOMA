# R-ARCH-BLOCK-001 — Accepted Archimedean Characterization of Selected Reals

- **Operational Status:** **PASS / ACTIVE**
- **Epistemic Status:** **DERIVED + VERIFIED**
- **Stage:** `R_STAGE`
- **PDSA:** `PDSA-R-012`
- **Acceptance obligation:** `RA-13`
- **Inputs:** `R-QARCH-BLOCK-001` rational natural-upper-bound subinterface, selected Dedekind carrier, principal Q embedding, derived strict real order

## Exported theorem

```text
∀ x : RBOMA,
  ∃ n : N_BOMA,
    x < rOfQ(qOfN(n)).
```

Formal theorem:

```text
BOMA.R.DedekindArchimedean001.r_archimedean_strict_upper
```

This is a strict embedded-natural upper-bound formulation of the Stage-I Archimedean property.

## Construction mechanism

For an explicit lower cut `A`:

```text
A.proper gives u ∉ A
u < u+1
q_le_natural_upper gives u+1 ≤ qOfN(n)
therefore u < qOfN(n)
```

Every `a∈A` is strictly below `u`; otherwise downward closure would imply `u∈A`. Hence:

```text
A ⊊ principalCut(qOfN n).
```

The statement then lifts through the selected quotient carrier.

## Verification

```text
V5 run 32359869558 — PASS
Lean 4.32.1
```

Historical first run:

```text
32359661238 — FAIL_OR_INCOMPLETE
```

Its failure was workflow assembly only: the `CutLE` provider `RDedekindSupremumProbe.lean` was omitted. The theorem payload itself was unchanged.

## Logical provenance

Actual consumed interfaces:

```text
Q natural-upper-bound        previously certified arithmetic contribution
LowerCut.proper              representation axiom
LowerCut.downward            representation axiom
principalCut                 Q→cut representation
Quotient/rLE/rLT             selected formal identity/order interface
```

Not consumed by this theorem:

```text
finite cut-membership search
cut_bracket_approx
real multiplication
real inverse
RA-12 rational density
standard-real Archimedean infrastructure
```

This separation is architecturally significant: RA-13 must not inherit the local `Classical.em` provenance of the stronger cut-bracketing route merely because both appear in the R-stage history.

## Acceptance effect

```text
RA-13 = PASS
```

This block does not change the selected completeness contract and does not imply Cauchy completeness.

## Reverse-engineering note

`RE-R-001` should compare this direct properness/natural-bound route against any alternative derivation through rational density or completeness, and should preserve the narrower logical dependency of the accepted route.
