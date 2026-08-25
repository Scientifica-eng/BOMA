# ST2-EXP-015 — Failure 001: Gate-B Source Firewall Comment False Positive

**Classification:** `TECHNICAL VERIFICATION HARNESS FAILURE / RECOVERY ALLOWED`  
**Experiment:** `ST2-EXP-015`  
**Frozen Plan:** unchanged at `1accee613630ae876b6ca9dcf820737ab89a168c`  
**Failed exact head:** `616993c604c599cdb57bf247ee966302f1c12d4a`.

## Preserved exact failure provenance

```text
workflow   BOMA ST2-EXP-015 Cauchy Route Composition Square — V5
run        32877181553
job        97897852079
artifact   9574337781
sha256     9a01afc2f1e529e702d9bdc363f46c0c49c3b9d613ab5a82993b0c0c550db452
result     FAILURE
failed     Gate B — validate native Cauchy-Q manifest and firewall
```

The run passed, before failure:

```text
exact checked-out head / frozen baseline / immutable Plan
owner program authority and active 015 state
accepted Q/R/C manifest/source immutability
Gate-A baseline, nine-Claim, and four-corner inventory
```

Lean setup/elaboration and declaration-closure steps were skipped because the
textual source firewall failed first.

## Cause

The Gate-B workflow used this source-level forbidden regex:

```text
RBOMA|Dedekind|RStageIntegration002|ST2Exp002|CauchyQuadratic003|CCBOMA|...
```

The new native source's opening documentation explicitly says that it **does not
consume Dedekind completion**. Therefore the generic token `Dedekind` matched a
comment, even though the source opens only the Cauchy-real namespaces and the
independent manifest contains no Dedekind completion, 002 Q producer, H5, H6
Route-P field, 011 adapter, or 014 package.

This is a root-selection error in the verification harness: the scientific
criterion is absence of forbidden implementation dependencies/identifiers, not
absence of explanatory words in comments.

## Recovery

The repair narrows only the source regex by removing the generic prose token
`Dedekind`. Identifier-level guards remain in place:

```text
RBOMA
RStageIntegration002
ST2Exp002
CauchyQuadratic003
CCBOMA
ST2Exp011
ST2Exp014
Classical.choose
sorry / axiom
```

The manifest firewall still separately rejects `RDedekind` and the exact
forbidden producer names. Declaration-closure auditing remains unchanged and
continues to reject forbidden implementation producers after Lean elaboration.

## Frozen scientific boundary preserved

This recovery changes none of:

```text
Frozen Plan
single factor: RCBOMA fixed, Route P -> Route Q
Route-Q representation
new mathematical declarations
Claim cone
scalar producer
logical/foundational regime
witness-only inversion semantics
relation/function firewall
accepted Q/R/C sources or manifests
R-DP-001 / C-DP-001 SELECTS
accepted exports / acceptance contracts
queue order
```

No scientific failure class F3–F6 is inferred from this run because the
mathematical proof did not execute. The corrected exact head must rerun the full
V5 from the beginning; no PASS is transferred from this failed head.
