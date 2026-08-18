# R-LOGIC-BR-001 — Dedekind Cut Comparability

- **Operational Status:** **ACTIVE — V5 PASS**
- **Epistemic Status:** **DERIVED UNDER EXPLICIT CLASSICAL META-PROOF**
- **Depends on:** `R-DP-001`, `R-DP-002`, accepted Q total order
- **Decision:** `R-DP-003 RESOLVED`

## Statement

For selected Dedekind lower cuts:

```text
CutComparability :=
  ∀ A B : LowerCut,
    CutLE A B ∨ CutLE B A
```

where `CutLE` is lower-set inclusion.

## Why this is a separate Brick

The selected Stage-One real acceptance target requires a total order, but the current `LowerCut` representation itself contains no hidden excluded-middle or comparability field.

The construction therefore isolates exactly the new disjunctive property rather than marking the whole real-number stage as undifferentiated “classical mathematics.”

## Constructive interface around the Brick

Without using the classical witness, the verified order core proves:

```text
rLE reflexive
rLE transitive
rLE antisymmetric
CutComparability → rLE totality
```

Thus the Brick is consumed only where disjunctive total comparability is required.

## Proof provenance

Current proof:

`LAB/payloads/lean/RStage/RDedekindOrderClassicalWitness.lean`

The proof uses explicit calls to:

```text
Classical.em
```

for:

```text
CutLE A B ∨ ¬ CutLE A B
A.lower q ∨ ¬ A.lower q
```

No new BOMA axiom named `CutComparability` is postulated.

Classification:

```text
mathematical statement  DERIVED
proof regime            CLASSICAL AT THIS BRICK
architectural scope     TOTALITY GATE ONLY
```

## Verification

Split V5:

```text
run 32181726522
Lean 4.32.1
constructive quotient-order core PASS
isolated classical witness PASS
```

The earlier bundled failed experiment remains provenance; the split experiment is the governing evidence because it distinguishes constructive structure from classical comparability.

## Downstream rule

Downstream R files should consume the verified totality theorem/interface rather than introduce unrelated local classical reasoning merely to compare real cuts.

Any additional materially classical theorem must receive its own commitment provenance.

## Reopening conditions

Reopen if:

```text
a constructive proof of CutComparability is obtained;
LowerCut is strengthened with a locatedness-style structure;
Stage-One total-order acceptance is revised;
the completion route changes.
```

## Retained branch value

This Brick creates a clean Stage-II logical-regime experiment:

```text
current Dedekind route + classical comparability
        versus
constructive/located cut or Cauchy variants
```

The comparison can measure exactly which downstream theorems inherit the classical proof requirement.
