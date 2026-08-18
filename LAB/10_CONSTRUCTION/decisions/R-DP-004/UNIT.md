# R-DP-004 — Rational Archimedean Approximation Gateway

- **Operational Status:** **OPEN — COMPARATIVE PROBE REQUIRED**
- **Epistemic Status:** **MATHEMATICAL / ROUTE DECISION POINT**
- **Input:** accepted `Q-BLOCK-002`, `R-ADD-BLOCK-001`, selected Dedekind route
- **Target:** `BOMA-R-ACCEPT-001 / RG-01 / RA-05`, with future relevance to `RA-13`

## Trigger

Study of the natural Dedekind negation candidate exposes a new obligation when proving the additive-inverse law. The definition of a negative cut can be formed without this obligation, but showing

```text
A + (-A) ≈ principalCut(0)
```

requires arbitrarily fine rational bracketing across the boundary of an arbitrary lower cut.

This dependency must be explicit rather than hidden inside the negation proof.

## Required target interface

A route sufficient for `RA-05` should derive a theorem of the following form, or an explicitly stronger theorem:

```text
CutBracketApprox :=
  ∀ (A : LowerCut) (eps : Q_BOMA),
    0 < eps →
    ∃ a r : Q_BOMA,
      a ∈ A ∧
      r ∉ A ∧
      0 < r-a ∧
      r-a < eps
```

A non-strict lower inequality may replace `0 < r-a` if the final additive-inverse proof separately establishes the required strict separation. Any change must be recorded, not silently weakened.

## Candidate A — general Archimedean Q interface

First prove a reusable theorem about the accepted rational ordered field, such as an explicit BOMA Archimedean property or an equivalent small-step principle. Then derive `CutBracketApprox` as a consumer.

### Advantages

```text
reusable beyond negation;
likely useful for RA-12 rational density in R;
likely useful for RA-13 Archimedean characterization;
clean separation between Q structure and Dedekind representation.
```

### Cost

Requires a transparent derivation from the explicit `QBOMA` fraction construction and the earlier N/Z interfaces. No built-in `Rat`, floor/ceiling theorem, or hidden standard Archimedean package may be imported.

## Candidate B — direct cut-bracketing theorem

Prove `CutBracketApprox` directly from the explicit fraction/N/Z representation, without first packaging a general Archimedean ordered-field theorem.

### Advantages

```text
potentially smaller immediate proof burden;
exactly matches the current RA-05 need.
```

### Cost

```text
less reusable;
may duplicate arithmetic infrastructure later for RA-13;
risks embedding representation-specific detail into the Dedekind operation layer.
```

## Decision criteria

Compare:

```text
minimal new arithmetic infrastructure
proof transparency
reuse across RA-05 / RA-12 / RA-13
representation dependence
formal-verification robustness
logical commitments
Stage-II branch value
```

## Forbidden shortcuts

Do not use, merely to discharge this gate:

```text
built-in Rat Archimedean instances
built-in Real
standard floor/ceiling without reconstruction
Choice for a global boundary selector
an unrecorded stronger analysis import
```

## Current hypothesis

Candidate A is architecturally preferable **if** its general Q theorem can be derived with modest additional infrastructure, because the same certified contribution can then support multiple R obligations. This is a hypothesis, not yet a decision.

## Decision lock

Do not promote `RA-05` until:

```text
1. the negation candidate itself is independently verified;
2. one approximation route passes V5;
3. the additive-inverse theorem consumes that route explicitly;
4. the new commitment is added to the R dependency/learning graph.
```
