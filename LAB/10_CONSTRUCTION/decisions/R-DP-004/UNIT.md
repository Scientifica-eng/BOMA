# R-DP-004 — Rational Archimedean Approximation Gateway

- **Operational Status:** **RESOLVED — ROUTE A SELECTED**
- **Epistemic Status:** **MATHEMATICAL / ROUTE DECISION POINT**
- **Input:** accepted `Q-BLOCK-002`, `R-ADD-BLOCK-001`, selected Dedekind route
- **Target:** `BOMA-R-ACCEPT-001 / RG-01 / RA-05`, with future relevance to `RA-12 / RA-13`

## Trigger

Study of the natural Dedekind negation candidate exposed a new obligation when proving the additive-inverse law. The definition of a negative cut was independently verified, but showing

```text
A + (-A) ≈ principalCut(0)
```

requires arbitrarily fine rational bracketing across the boundary of an arbitrary lower cut.

This dependency was isolated before entering the inverse proof.

## Required target interface

The accepted route now proves:

```text
∀ (A : LowerCut) (eps : Q_BOMA),
  0 < eps →
  ∃ b r : Q_BOMA,
    b ∈ A ∧
    r ∉ A ∧
    0 < r-b ∧
    r-b < eps.
```

Concrete Lean theorem:

```text
cut_bracket_approx
```

with width represented as `qAdd r (qNeg b)`.

V5:

```text
32186209544 PASS
```

## Candidate A — reusable Archimedean Q interface — SELECTED

Route A was realized as a chain of independently auditable contributions.

### A1 — natural upper bounds for every rational

For every accepted rational:

```text
∀ q : QBOMA, ∃ n : N_BOMA, q ≤ qOfN(n).
```

The proof is reconstructed directly from the explicit positive-denominator fraction representation:

```text
negative / zero numerator → bounded by 0;
positive numerator p      → bounded by its embedded numerator magnitude,
                             because denominator ≥ 1.
```

No floor, ceiling, built-in `Rat`, or real-number theorem is used.

V5:

```text
32185265579 PASS
```

### A2 — Archimedean scaling

For every rational gap and positive rational step:

```text
∀ gap delta,
  0 < delta →
  ∃ n : N_BOMA,
    gap ≤ qOfN(n) * delta.
```

The proof consumes the already-accepted nonzero inverse as an existential witness and therefore does not introduce a global inverse selector or Choice.

V5:

```text
32185547400 PASS
```

### A3 — rational finite grid crossing

Define:

```text
qGrid(a,delta,n) = a + qOfN(n)*delta.
```

The arithmetic layer proves that, for a known point `u` outside a proper lower cut, a positive-step grid eventually reaches a point outside the cut.

This arithmetic crossing theorem is independent of any decision procedure for cut membership.

### A4 — isolated finite membership search

From an inside grid base and a finite endpoint known outside, obtain adjacent points:

```text
b ∈ A
r ∉ A
r = b + delta.
```

The only nonconstructive step in this finite-search layer is explicit proposition-level:

```text
Classical.em (A.lower (qGrid ... n))
```

It is not part of the Archimedean arithmetic theorem itself.

V5:

```text
32186080453 PASS
```

### A5 — cut bracketing

Choose `0 < delta < eps` by the previously accepted rational-density gateway, combine A3 and A4, and obtain adjacent inside/outside points of exact width `delta`.

V5:

```text
32186209544 PASS
```

## Candidate B — direct cut-bracketing theorem — RETAINED / NOT SELECTED

The direct representation-specific route remains a legitimate Stage-II branch candidate, but it was not necessary to pursue for the Stage-One canonical path after Route A produced the required theorem with stronger reuse value.

This is not a rejection theorem about Candidate B.

## Decision rationale

Route A is selected because it provides reusable certified contributions across multiple future obligations:

```text
RA-05 additive inverse
RA-12 rational density inside RBOMA
RA-13 Archimedean characterization of the accepted real domain
future reverse-engineering comparison against the Cauchy branch
```

It also cleanly separates three kinds of dependency:

```text
fraction-representation arithmetic
ordered-field Archimedean scaling
logical finite membership search over an arbitrary LowerCut predicate
```

That separation would be lost in a one-off direct inverse proof.

## Logical provenance

Do not summarize this decision as “the Archimedean proof is classical.”

The evidence supports the more precise statement:

```text
Q natural upper bounds        constructive proof region
Q Archimedean scaling         constructive proof region
Q grid crossing               constructive proof region
finite search of cut members  explicit local Classical.em
cut bracket theorem           consumes the above interfaces
```

The local classical search is route/representation-sensitive and must remain visible to `RE-R-001`.

## Forbidden shortcuts audit

The selected route does not use:

```text
built-in Rat Archimedean instances
built-in Real
standard floor/ceiling
Choice for a global boundary selector
```

## ACT

```text
R-DP-004 = RESOLVED
Route A = SELECTED
Route B = RETAINED BRANCH CANDIDATE
```

Promote the reusable approximation contribution as a separate construction block before consuming it in the real additive-inverse theorem.

## Remaining RA-05 lock

`RA-05` itself is still not PASS merely because this gateway is closed.

The next claim-level gate must explicitly prove:

```text
rAdd x (rNeg x) = rZero
```

using `cut_bracket_approx`, and then lift the result to the formal `RBOMA` carrier.
