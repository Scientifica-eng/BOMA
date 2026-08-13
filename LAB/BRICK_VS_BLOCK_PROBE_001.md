# Brick vs Block — Architectural Probe 001

**Cycle:** `PDCA-001`  
**Status:** Experimental / not normative  
**Purpose:** test the proposed project vocabulary against the original BOMA I/II architecture.

## 1. Source baseline

BOMA I uses `Block` as the formal architectural unit and defines an Atomic Block by absence of dependencies. BOMA II retains Block-oriented architecture while introducing the term `Minimal-Brick Construction` in its construction vocabulary.

Therefore the project proposal:

```text
Brick = smallest construction unit
Block = composition of Bricks
```

must be treated as a **project-level refinement/reinterpretation**, not as a direct quotation of the original BOMA terminology.

## 2. Candidate mapping

| Original / source concept | Proposed project concept | Probe result |
|---|---|---|
| Block | Brick or Block, depending on granularity | Requires distinction |
| Atomic Block | Candidate Brick | Compatible as a starting hypothesis |
| Block with dependencies | Composite Block | Potentially compatible |
| Minimal-Brick Construction | Brick-oriented construction layer | Strong terminological support |
| Branch / Decision Point | Block/Brick control structure | Must remain explicit |

## 3. Test 1 — Minimal injection

**Question:** Does replacing the lowest construction unit's name with `Brick` destroy the original architecture?

**Observation:** No, provided that all formal properties previously attached to the atomic construction unit remain explicit. The name alone does not alter dependency semantics, branchability, or verification obligations.

**Result:** PASS provisionally.

## 4. Test 2 — Block as composition

**Question:** Can `Block` be reserved for a meaningful composition of Bricks?

**Observation:** This is architecturally plausible, but it is not a direct restatement of BOMA I. It changes the granularity of the vocabulary. A Block must therefore receive an explicit project definition rather than being assumed equivalent to the original BOMA Block.

**Result:** PLAUSIBLE / REQUIRES FORMAL DEFINITION.

## 5. Test 3 — Atomicity preservation

**Question:** Does the new vocabulary preserve the important distinction between a unit with no dependencies and a unit that is merely small?

**Observation:** It can, but only if `Brick` is not defined merely as “small” or “backend-separable”. The existing PDCA evidence already shows that backend separability is insufficient.

**Result:** PASS CONDITIONALLY.

## 6. Test 4 — Composition semantics

A proposed hierarchy is:

```text
Brick
  ↓ composition
Block
  ↓ composition / organization
Larger architectural structure
```

This is acceptable as a project hypothesis only if the composition operation is explicit and does not erase the identity/dependency structure of its Bricks.

**Result:** OPEN.

## 7. Test 5 — Compatibility with BOMA II

BOMA II's use of `Minimal-Brick Construction` indicates that Brick terminology is not alien to the source evolution. However, the source does not by itself establish the exact proposed equation:

```text
Brick = minimal unit
Block = set/composition of Bricks
```

Therefore the proposal has textual/architectural motivation but still requires a project-level definition.

**Result:** SUPPORTING EVIDENCE, not proof.

## 8. Current finding

The experiment does **not** justify declaring:

```text
Brick := Block
```

nor:

```text
Brick := backend-separable component
```

It does support the following provisional direction:

> Use `Brick` for the project's smallest intentionally constructed semantic unit, and reserve `Block` for an explicit composition of Bricks when such a composition has architectural meaning.

This definition is deliberately phrased as a **project hypothesis** until it is reconciled with the authoritative BOMA/BOMA II documents and tested against concrete cases.

## 9. Consequence for B-001

The existing evidence for `domain + initial` remains relevant, but it is insufficient by itself to rename or split B-001.

The next gate is therefore:

```text
source semantics
      +
PDCA evidence
      +
concrete construction case
      ↓
project Brick definition
```

Only after this gate should an official Brick record be created or B-001 be decomposed.

## 10. Evidence

This probe builds on:

```text
E-007  backend separability
E-008  independent identity analysis
E-009  negative control
E-010  positive dependency control
E-011  source audit of BOMA I / BOMA II
```

New evidence:

```text
E-012  Brick-vs-Block vocabulary probe
```

Status: **Provisional**.
