# R-DENSITY-BLOCK-001 — Accepted Rational-Image Density in Selected Reals

- **Operational Status:** **PASS / ACTIVE**
- **Epistemic Status:** **DERIVED + VERIFIED**
- **Stage:** `R_STAGE`
- **PDSA:** `PDSA-R-011`
- **Acceptance obligation:** `RA-12`
- **Inputs:** selected Dedekind carrier/order, principal Q embedding, internal Q density

## Exported strict-order interface

Strict order is derived, not primitive:

```text
rLT x y := rLE x y ∧ x ≠ y
```

On rational images:

```text
rLT (rOfQ q) (rOfQ r) ↔ qLT q r.
```

## Exported density theorem

```text
x < y
  →
∃ q : QBOMA,
  x < rOfQ q ∧ rOfQ q < y.
```

Formal theorem:

```text
BOMA.R.DedekindRationalDensity001.r_rational_image_dense
```

## Construction mechanism

For cut representatives `A ⊊ B`:

```text
choose b ∈ B \ A
B.rounded gives c ∈ B with b<c
Q density gives b<m<c
then A ⊊ principalCut(m) ⊊ B.
```

The principal cut is therefore a concrete rational representative strictly between the original real endpoints.

## Verification

```text
V5 run 32359834460 — PASS
Lean 4.32.1
```

Historical first run:

```text
32359624237 — FAIL_OR_INCOMPLETE
```

The first failure was workflow assembly only: `RDedekindSupremumProbe.lean`, which provides `CutLE`, was omitted. The theorem payload did not require mathematical revision.

## Logical provenance

```text
internal Q density               previously certified
Dedekind roundedness             selected representation axiom
strict-inclusion witness         localized Classical.byContradiction / Classical.em
principal-cut sandwich           ordinary structural reasoning
quotient lift                    quotient equality/order interface
```

The classical witness step should not be attributed to the internal Q density theorem itself.

## Forbidden-shortcut audit

This block does not use:

```text
built-in Real
standard-real density
a prepackaged Archimedean real theorem
floor/ceiling
a global Choice selector for cut boundaries
```

## Acceptance effect

```text
RA-12 = PASS
```

No claim is made here that RA-13 follows automatically. The Archimedean characterization is maintained as an independent theorem and Block.

## Reverse-engineering note

`RE-R-001` should test whether the classical witness extraction is essential to the current exported strict-order interface or can be replaced by a witness-carrying strict-order relation in another branch.
