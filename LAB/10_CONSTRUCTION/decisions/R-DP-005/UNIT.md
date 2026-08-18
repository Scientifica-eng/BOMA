# R-DP-005 — Real Multiplication Sign Architecture

- **Operational Status:** **OPEN — REPRESENTATION PROBES REQUIRED**
- **Epistemic Status:** **MATHEMATICAL / ARCHITECTURAL DECISION POINT**
- **Input:** `R-ADD-GROUP-BLOCK-001`, selected Dedekind carrier `RBOMA`
- **Targets:** `RA-04`, `RA-07`, `RA-09`, `RA-10`, later `RA-08`

## Decision question

How should multiplication on arbitrary signed Dedekind reals be constructed so that:

```text
its definition is representative-invariant;
sign handling is explicit;
logical commitments remain localized;
rational multiplication is preserved;
field laws can be audited without importing built-in Real;
Stage-II alternatives remain testable?
```

## Candidate A — positive/negative-part decomposition

Define the nonnegative envelope of a cut by a union rather than a logical case split:

```text
A⁺ := max(A,0)
    := A ∪ principalCut(0)

A⁻ := max(-A,0)
```

Then construct multiplication first for nonnegative cuts and define signed multiplication algebraically through:

```text
xy = x⁺y⁺ + x⁻y⁻ - x⁺y⁻ - x⁻y⁺.
```

### Hypothesis

This may keep the **operation definition** free of an unrestricted classical `if x≥0 then ... else ...`, while allowing order comparability to enter only in proofs that identify `x⁺/x⁻` with ordinary sign cases.

### Required probes

```text
A1  max-with-zero cut is a valid LowerCut;
A2  it respects CutEquiv and lifts to RBOMA;
A3  nonnegative-cut multiplication is a valid LowerCut;
A4  nonnegative multiplication respects identity;
A5  signed decomposition preserves rational multiplication;
A6  algebraic laws can be proved with localized logical provenance.
```

## Candidate B — direct sign-case multiplication

Define raw multiplication by explicit cases according to the sign of the two inputs.

### Advantage

Closer to textbook Dedekind-cut multiplication and may shorten local proofs.

### Risk

If implemented by proposition-valued `if` / decidability of cut signs, classical reasoning becomes embedded inside the **definition of the operation**, making dependency provenance coarser and potentially contaminating later branch comparisons.

Candidate B remains legitimate if its proof burden is substantially lower and the logical commitment can still be isolated transparently.

## Candidate C — shift-to-positive multiplication

For each pair, shift inputs by sufficiently large rationals/naturals into a positive region, multiply there, then algebraically subtract correction terms.

### Advantage

May reuse a single positive multiplication kernel.

### Risks

```text
requires a shift-existence theorem on arbitrary R;
requires proof of independence from shift choice;
may consume RA-13-like Archimedean structure prematurely;
may create unnecessary coupling between multiplication and global approximation.
```

Candidate C is retained unless probes show the choice burden is clearly inferior.

## Decision criteria

Compare:

```text
definition-level logical commitments
representative invariance
proof reuse
Q-embedding preservation cost
law-proof complexity
interaction with RA-08 inverse
reverse-engineering clarity
Stage-II branch value
```

## Current preference

Candidate A is the primary probe because it may separate **constructive definition** from **classical sign identification**. This is only a working hypothesis.

## Decision lock

Do not promote a formal `rMul` until at least:

```text
1. Candidate A positive-part layer passes V5;
2. a valid nonnegative multiplication kernel is tested;
3. the logical commitments of Candidate B are recorded for comparison;
4. Q-embedding preservation is demonstrated for the selected route or an explicit blocker is identified.
```

No built-in Real multiplication may be used as a shortcut.
