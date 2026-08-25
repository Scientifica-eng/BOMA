# ST2-EXP-004 Failure 004 — Declaration-to-Source Closure Gap

**Experiment:** `ST2-EXP-004`  
**Gate:** `B — independent no-F-04 R survivor assembly`  
**Date:** `2026-08-25`  
**Disposition:** `PRESERVED SOURCE-PACKAGING FINDING / GATE-B METHOD REQUIRES FILE-CLOSURE REFINEMENT`

## Exact failed evidence

```text
head      140e965878dfde19ddf745c3c2912ac2a576137a
run       32830009155
job       97746372047
artifact  9556379998
sha256    7af12f00713439884d10cd0ce8bf304be57b100baa2b57f5fb164b2ecdb3af79
result    FAILURE
```

Frozen authority, Gate-A ancestry, accepted-source immutability, and pinned Lean
all passed. The Gate-B auditor successfully generated a candidate no-F-04
source manifest before Lean rejected that manifest.

## Candidate manifest boundary

The candidate manifest physically excluded:

```text
LAB/payloads/lean/RStage/RDedekindOrderClassicalWitness.lean
```

and did not contain the selected F-04 declaration names.

It included, among other survivor candidates:

```text
LAB/payloads/lean/RStage/RDedekindNonnegativeMultiplication.lean
```

but omitted:

```text
LAB/payloads/lean/RStage/RDedekindNonnegativeMulEmbedding.lean
LAB/payloads/lean/RStage/QPositiveMultiplicativeApproximation.lean
```

because the first Gate-B selector used only the source paths appearing in the
measured theorem declaration closures.

## Lean diagnostic

Lean rejected the candidate assembly with source-level errors including:

```text
unknown namespace `BOMA.R.DedekindNonnegativeMulEmbedding001`
unknown namespace `BOMA.R.QPositiveMultiplicativeApprox001`
Unknown identifier `rMulNonnegEnvelope_rOfQ`
```

The failure therefore establishes a distinction that Gate A intentionally did
not measure:

```text
theorem declaration closure independence
!=
whole-source elaboration independence
```

A theorem can have an F-04-free declaration closure while the unchanged source
file containing it still requires other helper source files to elaborate.

## Scientific interpretation

This run is **not** evidence that the affected theorem depends on F-04.
Gate A already established the theorem-level classification independently.

It is evidence that a Gate-B research manifest cannot be derived merely by
unioning the source locations of theorem-closure declarations. Whole-file
source prerequisites must also be accounted for.

This is a real formalization/provenance packaging fact and must remain visible
in the Study phase even if a refined Gate-B manifest later succeeds.

## Correction rule

Refine Gate B so source eligibility is established for complete unchanged source
files, preserving original accepted-manifest order, while:

1. physically excluding `RDedekindOrderClassicalWitness.lean`;
2. rejecting any source with a direct selected F-04 reference;
3. never editing accepted source text;
4. classifying a measured root as `SURVIVES_NO_F04` only if its complete source
   and required source prerequisites elaborate in the no-F-04 assembly;
5. classifying source-packaging failures separately from theorem-level F-04
   dependencies.

Do not modify the Frozen Plan or Gate-A record.
