# ST2-EXP-004 Failure 006 — Gate C local-name typo

**Experiment:** `ST2-EXP-004`
**Gate:** `C — conditional comparability interface isolation`
**Classification:** `Lean elaboration defect in research probe; scientific question not yet decided`
**Exact head:** `4facab3acc958a5b5822d6d918827dfe835dacb4`

## Evidence

```text
run       32833374816
artifact  9557672580
sha256    de3c974ce27bda83cbf26857013acf9e84c565cc39c915063595aabb59dea596
result    FAILURE
```

The workflow passed the exact-head and Frozen-Plan checks, accepted Q/R/C immutability, forbidden-token checks, pinned Lean setup, and Gate-B survivor-base regeneration. Compilation then reported:

```text
Unknown identifier `h0x`
x : RBOMA
hx0 : rLE x rZero
```

The local reference in `rNeg_nonneg_of_nonpos004` uses `h0x` although the theorem binder is named `hx0`.

## Correction boundary

The correction is only the local identifier `h0x` to `hx0`. No theorem statement, logical boundary, accepted source, accepted manifest, Frozen Plan, or selected F-04 provider changes.

This record is immutable historical evidence.