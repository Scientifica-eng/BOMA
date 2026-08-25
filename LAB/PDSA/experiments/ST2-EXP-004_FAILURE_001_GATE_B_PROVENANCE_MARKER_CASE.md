# ST2-EXP-004 Failure 001 — Gate-B Provenance Marker Case Mismatch

**Experiment:** `ST2-EXP-004`  
**Gate:** `B — independent no-F-04 R survivor assembly`  
**Date:** `2026-08-25`  
**Disposition:** `PRESERVED TOOLING / GOVERNANCE FAILURE — NO MATHEMATICAL RESULT`

## Exact failed evidence

```text
head  063231419980f58f6925d8ca11367824fc60bfe6
run   32829472543
job   97744697814
result FAILURE
```

The job failed in step:

```text
Verify frozen authority and Gate-A record
```

All later mathematical steps, including pinned Lean setup and the no-F-04
survivor assembly, were skipped. No workflow artifact was produced because the
failure occurred before evidence generation.

## Cause

The workflow required a literal marker with:

```text
GATE A final disposition:** `PASS / DEPENDENCY MAP VERIFIED / GATE B NEXT`
```

while the immutable Gate-A record uses the human heading capitalization:

```text
Gate A final disposition:** `PASS / DEPENDENCY MAP VERIFIED / GATE B NEXT`
```

The failure is therefore a case-sensitive documentary assertion mismatch. It is
not evidence about F-04, theorem survivability, source packaging, or Lean.

## Correction rule

Change only the workflow marker to match the existing Gate-A record. Do not
modify:

- the Frozen Plan;
- the Gate-A record;
- accepted Q/R/C sources or manifests;
- Gate-B survivor algorithm;
- any mathematical theorem.

Then rerun Gate B on a new exact head and preserve this failed run as historical
evidence.
