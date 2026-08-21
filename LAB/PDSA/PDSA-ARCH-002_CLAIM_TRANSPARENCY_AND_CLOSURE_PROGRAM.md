# PDSA-ARCH-002 — Claim Transparency and Closure Program

**Status:** ACTIVE — ARCHITECTURAL IMPROVEMENT PROGRAM  
**Date:** 2026-08-20  
**Branch:** `architecture/claim-transparency-001`  
**Baseline:** `main@6bb10f16fba3caf171bebd1731a4d209832ae35b`  
**Baseline R integration evidence:** `R-J-002 V5 PASS / run 32385379288`, verified source commit `af0a03d83245b1e15e9903df00db89edf3317042`  
**Mathematical frontier:** unchanged — accepted through `R-BLOCK-001`; `RE-R-001 CLOSED`; `C NOT STARTED — USER HOLD`.

## 1. Purpose

Strengthen BOMA from an architecture that is transparent by disciplined design into an architecture whose transparency can itself be audited and, progressively, machine-checked.

The target invariant is:

```text
Accepted Formal Dependency Closure
  =
Declared Claims
+ Declared Supporting Lemmas
+ Explicit Trusted Base
```

Any consumed dependency outside those declared categories is an undeclared-dependency defect and must block transparency certification until classified or removed.

This program does **not** reopen accepted mathematics and does **not** authorize C.

## 2. Governing distinctions

The program preserves and adds explicit links among three different layers:

```text
Construction architecture
  Brick / Block / Junction / Decision Point

Assertion architecture
  Claim records and acceptance obligations

Formal realization
  Lean theorem / source / assembly / V5 evidence
```

A claim record is an audit object. It is not automatically a Brick, Block, Junction, or Decision Point.

## 3. Baseline invariants

During this program:

1. `N-Core`, `N-Arithmetic`, `Z`, `Q`, and `R` remain accepted unless a genuine mathematical defect is independently discovered.
2. Documentary or architectural normalization must not rewrite historical provenance.
3. A selected route remains a choice unless necessity was independently proved.
4. No hidden mathematical strengthening may be introduced merely to make the registry tidy.
5. No new C artifact is authorized.
6. Existing V5 evidence remains historical evidence tied to the source commit it actually verified.

## 4. Work plan

### Phase A — Claim vocabulary and trust boundary

1. Define a canonical Claim Record schema.
2. Define dependency classes:
   - `MATHEMATICAL_CLAIM`
   - `SUPPORTING_LEMMA`
   - `LOGICAL_COMMITMENT`
   - `REPRESENTATION_COMMITMENT`
   - `FORMALIZATION_COMMITMENT`
   - `VERIFICATION_INFRASTRUCTURE`
   - `TRUSTED_METATHEORY`
3. Create an explicit Trusted Base manifest.
4. Create the project Claim Registry.

### Phase B — Acceptance claim closure, reverse order

Audit accepted exports in this order:

```text
R-BLOCK-001
Q-BLOCK-002
Z-BLOCK-002
N-ARITH-BLOCK-001
N-BLOCK-007
```

For every accepted claim record:

```text
Claim ID
Statement / exact scope
Acceptance obligation
Producer unit(s)
Mathematical dependencies
Logical commitments
Representation commitments
Formalization commitments
Lean theorem/source
V5 evidence
Alternative producer/branch where known
Sensitivity / reopening conditions
```

### Phase C — Declared versus actual dependency closure

For each accepted export define:

```text
Declared Dependency Closure
Actual Formal Dependency Closure
```

and test the intended invariant:

```text
Actual closure ⊆ Declared closure + Explicit Trusted Base.
```

No residual `OTHER`, `IMPLICIT`, or unclassified category is allowed in a certified closure.

### Phase D — Granularity normalization

Apply this promotion rule:

A construction component deserves an independent Brick identity when it is independently reviewable and materially one or more of:

```text
replaceable
branchable
commitment-introducing
sensitivity-bearing
logically distinct
representation-distinct
independently reconvergent
```

Do not create Bricks for visual symmetry.

Priority normalization:

- resolve the status of `TCT-BR-001..008` candidate identifiers;
- preserve the fine N decomposition;
- do not fabricate `Q-BR-*` or `R-BR-*` merely because Q/R have internal definitions;
- promote only genuinely independent commitments.

### Phase E — Block membership and graph contracts

For every high-impact Block record:

```text
Block ID
Purpose
Members: Bricks / declared internal components
Consumes: Blocks / Claims / Junction outputs / Decision selections
Exports: Claims
Sensitivity
```

Standardize Junction contracts so every reconvergence declares the exact strength of relation:

```text
equality
equivalence
isomorphism
mutual interpretation
same downstream adequacy
```

Create a Decision Point ledger preserving selected and retained alternatives.

### Phase F — Machine-readable manifests and CI gates

Introduce machine-readable claim/dependency data only after the human-readable schema stabilizes.

Planned gates:

```text
Unknown Dependency
Missing Claim Producer
Missing Evidence
Undeclared Classical Usage
Undeclared Quotient / Choice / Axiom / sorry
Orphan Canonical Unit
Stale/Broken Junction
Verification Input Drift
```

Generalize explicit accepted-source manifests from the R integration pattern to N, N-Arithmetic, Z, Q, and R.

### Phase G — Generated views

Generate separate views rather than one overloaded diagram:

1. Construction DAG.
2. Claim Dependency Graph.
3. Decision/Branch/Junction Map.
4. Logic and Trust Map.
5. Learning Graph.

## 5. Execution order

```text
A1  Claim schema
A2  Trusted Base
A3  Claim Registry
B1  R claim closure
B2  Q claim closure
B3  Z claim closure
B4  N-Arithmetic claim closure
B5  N-Core claim closure
C   declared-vs-formal closure comparison
D   granularity normalization
E   membership / Junction / Decision ledgers
F   machine-readable manifests + CI gates
G   generated visualizations
```

R is first because `R_CLAIM_V5_INDEX`, the final acceptance closure audit, and `RE-R-001` already provide the richest dependency classification and therefore the safest calibration target for the new audit layer.

## 6. Acceptance criteria for this improvement program

The program is complete only when every accepted export can answer, for every acceptance-level claim:

```text
What is claimed?
Why is it required?
Who/what produces it?
What mathematical claims does it consume?
What logical principles does it consume?
What representation/formalization choices does it consume?
Where is the Lean realization?
Which V5 evidence verifies it?
Which alternatives exist?
What must be retested if it changes?
```

and when the declared dependency closure can be compared against the actual formal build closure without an unclassified residual dependency.

## 7. PDSA interpretation

### Plan

The phases above.

### Do

Begin with Claim schema, Trusted Base, Claim Registry, then R closure.

### Study

Measure mismatches between the current architectural records and the new claim/dependency closure representation. Distinguish documentation under-specification from genuine mathematical or logical hidden dependency.

### Act

Normalize only what the audit justifies. If a genuine hidden mathematical premise is found, open a separate PDSA correction rather than silently patching the registry.

## 8. Non-goals

This program does not:

```text
change accepted theorem statements merely for uniformity;
rebuild accepted number systems;
force every lemma to become a Brick;
erase failed/superseded experiments;
claim the trusted computing base is itself formally proved by BOMA;
start C.
```
