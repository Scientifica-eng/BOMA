# R-DP-006 — Real Multiplicative-Inverse Architecture

- **Operational Status:** **OPEN — COMPARATIVE PROBE REQUIRED**
- **Epistemic Status:** **MATHEMATICAL / ARCHITECTURAL DECISION POINT**
- **Input:** `R-MUL-BLOCK-001`, `R-COMP-BLOCK-001`, `R-QARCH-BLOCK-001`, accepted Q inverse interface
- **Primary target:** `RA-08`
- **Downstream:** inverse-dependent portion of `RA-09`, final field closure, `RA-22`

## Decision question

How should a multiplicative inverse for each nonzero selected real be constructed without importing a standard real reciprocal and while keeping the dependency path auditable?

Required output is structurally:

```text
x ≠ rZero
  →
∃ y : RBOMA,
  rMulCandidate x y = rOne
```

with the corresponding right-inverse law by commutativity, representative invariance, compatibility with the rational embedding, and explicit sign handling.

## Candidate A — direct positive Dedekind reciprocal, then signed extension

For a positive lower cut `A`, define a reciprocal cut using positive rational points known to lie outside `A` and their already-certified Q inverse witnesses.

Schematic membership:

```text
q ∈ recip(A)
  iff
q < 0
  or
∃ r > 0, r ∉ A, ∃ rinv,
  QInvRel r rinv ∧ q < rinv.
```

The positivity witness for `A` is used to prove properness; it should not appear in the extensional lower predicate itself.

### Expected advantages

```text
close to the selected Dedekind representation;
uses explicit Q inverse witnesses already available;
likely reuses CutBracketApprox for the hard inverse-product direction;
transparent representative-level witness analysis.
```

### Expected costs

```text
route-specific;
requires inverse-order lemmas on Q;
requires extracting/transporting positive-real witnesses;
likely consumes fine boundary bracketing again;
must prove proof-parameter independence / CutEquiv respect.
```

## Candidate B — completeness-level inverse on stabilized RBOMA

For positive `x`, form an approximating family such as rational/real candidates `q ≥ 0` satisfying `q*x < 1` or an equivalent non-strict formulation, take a supremum using `R-COMP-BLOCK-001`, and prove the supremum multiplies with `x` to one.

### Expected advantages

```text
operates above the raw Dedekind representation;
may reveal the inverse as a consequence of ordered completeness rather than cut syntax;
potentially more reusable for another completion carrier.
```

### Expected costs

```text
requires a carefully bounded nonempty approximation family;
requires multiplication/supremum interaction or an equivalent continuity argument;
may still need Q density and Archimedean approximation;
may introduce more infrastructure than the direct cut route.
```

## Required comparison dimensions

```text
new theorem burden;
representation dependence;
use of Q density / CutBracketApprox / Archimedean scaling;
logical commitments and witness selection;
formal proof robustness;
Q reciprocal preservation;
reverse-engineering clarity;
Stage-II branch value.
```

## Forbidden shortcuts

Do not discharge this decision by:

```text
built-in Real reciprocal;
field instances on standard reals;
assuming nonzero elements already have inverses;
untracked Choice selecting a boundary/reciprocal representative;
using completeness as a slogan without proving the supremum/product interface.
```

## Initial comparative hypothesis

Candidate A appears to have the smaller immediate proof surface because Q inverse witnesses and fine cut bracketing are already certified. Candidate B may be architecturally more carrier-neutral, but its multiplication/supremum interaction is not yet available.

This is a hypothesis, not a decision.

## Decision lock

Do not promote `RA-08` until:

```text
1. at least one candidate produces a valid positive inverse object;
2. representative invariance is established;
3. positive inverse-product = one passes V5;
4. nonzero signed extension passes V5;
5. Q inverse preservation is audited;
6. Candidate A/B dependency cost is recorded;
7. the selected route is explicitly resolved here.
```

## Reverse-engineering significance

`R-DP-006` is mandatory input to `RE-R-001`. The reverse audit must determine whether the accepted inverse is:

```text
intrinsically Dedekind-route-specific;
derivable from higher ordered-complete-ring structure;
or replaceable by an equivalent reusable contribution.
```
