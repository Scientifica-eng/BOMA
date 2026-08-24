# ST2-EXP-011 — Preserved Failure 001

**Experiment:** `ST2-EXP-011`  
**Failure ID:** `ERR-ST2-011-001`  
**Date:** `2026-08-24`  
**Exact head:** `1dd9beb0b792e634029ffdf12e09c1f50e4cccf8`  
**Workflow:** `BOMA ST2-EXP-011 C Comparison Interface Generalization — V5`  
**Run ID:** `32749650430`  
**Job ID:** `97503327944`  
**Artifact ID:** `9528463341`  
**Artifact SHA-256:** `1c9d3b5e3af2b1e7d5727a321f18fbdf5ab7f1faee3b6a7e30c448829378953e`  
**Result:** `FAIL / GOVERNANCE-SCAN FALSE POSITIVE / LEAN NOT REACHED`

## Observed mechanism

The run successfully verified:

```text
exact workflow head
accepted baseline ancestor
Frozen Plan ancestor
Frozen Plan byte immutability
accepted Q manifest and all manifest sources unchanged
accepted R integration manifest and all manifest sources unchanged
accepted C manifest and all manifest sources unchanged
```

It then failed the research source-boundary scan before Lean setup. The generic
source opening comment explicitly said that the source contained no named
accepted/alternative scalar carriers and spelled those carrier/route names in
the prose. The grep policy interpreted those documentary words as mathematical
source dependencies:

```text
4: ... contains no RBOMA,
5: RCBOMA, Dedekind, Cauchy, ...
Generic comparison core is not scalar-name independent
```

No declaration, theorem, interface field, manifest dependency, or Lean proof
caused this failure.

## Correction

Change only the documentary comment so the lexical preflight no longer mistakes
an explanatory negation for an implementation reference. Keep the stronger
formal dependency-closure audit unchanged; it remains the authority for actual
declaration provenance.

This failure is retained as evidence and is not reclassified as a mathematical
failure of Gate A/B/C.
