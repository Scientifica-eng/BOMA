# R-NEG-CANDIDATE-BLOCK-001 — Verified Dedekind Negation Candidate

- **Operational Status:** **VERIFIED CANDIDATE — INVERSE CERTIFICATION PENDING**
- **Epistemic Status:** **CONSTRUCTED / NOT YET RA-05 ACCEPTED**
- **Stage:** `R_STAGE`
- **Input:** `RBOMA`, accepted Q order/negation, `R-ADD-BLOCK-001`
- **Blocked by:** `R-DP-004 — Rational Archimedean Approximation Gateway`

## Construction

```text
q ∈ cutNeg(A)
iff
∃ r : Q_BOMA,
  r ∉ A ∧ q < -r.
```

Formal lift:

```text
rNeg : RBOMA → RBOMA
```

## Verified claims

The candidate:

```text
is a valid LowerCut;
respects CutEquiv;
lifts to the formal quotient carrier;
preserves principal rational negation.
```

In particular:

```text
rNeg(rOfQ q) = rOfQ(-q).
```

V5:

```text
32184767097 PASS
```

## Important non-claim

This unit does **not** yet establish:

```text
rAdd x (rNeg x) = rZero.
```

Therefore:

```text
RA-05 ≠ PASS yet.
```

The missing theorem is intentionally isolated behind `R-DP-004`; it requires a certified arbitrarily-fine rational boundary approximation theorem rather than mere rational order density.

## Dependency significance

Current evidence separates:

```text
negation representation / quotient well-definedness
from
additive-inverse certification.
```

This distinction must be preserved for `RE-R-001` so reverse engineering can determine whether the approximation gateway is intrinsic to the exported inverse interface, specific to the selected Dedekind realization, or replaceable by another certified contribution.
