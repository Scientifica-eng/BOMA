# PDSA-N-007 — V5 Formal Verification Gate

**CycleID:** `PDSA-N-007`  
**Track:** Natural Numbers / R-B Formal Verification  
**Date opened:** 2026-08-18  
**Status:** **ACTIVE — V5 EVIDENCE GATE**

## Inputs

```text
N-RB-CAND-001
BOMA-N-ACCEPT-001 v1.0
BOMA-RB-FORMAL-001 v1.0
PDSA-N-004 local obligation audit
PDSA-N-005 faithful TCT bridge audit
PDSA-N-006 characterization / standardness audit
N-RB-CAND-001 preservation & commitment ledger
```

Preferred unified backend payload:

`LAB/payloads/lean/NCore/NCoreRB001.lean`

Dedicated CI workflow:

`.github/workflows/boma-ncore-rb-003.yml`

---

# PLAN

## ResearchQuestion

Do the formal proof candidates for the fresh R-B N-Core candidate elaborate and check under the repository's pinned reproducible Lean environment without requiring undeclared logical/formal commitments?

## V5 acceptance requirements

A successful V5 gate must provide machine evidence for the unified payload covering at least:

```text
fresh BOMANat carrier
constructor disjointness
constructor injectivity
dependent eliminator / induction demonstration
nondependent fold
pointwise recursion uniqueness
selected-NF TCT representation
base/extension realization
realize/reify inverse laws
bridge faithfulness
unary-algebra homomorphisms
pointwise initiality
pointwise-initial uniqueness theorem
```

## Toolchain requirement

The run must use the repository-pinned Lean toolchain rather than an unspecified local installation.

The current repository toolchain is expected to be resolved from:

```text
lean-toolchain
```

The exact version must be recorded in the verification evidence once a successful run is observed.

## Failure handling

Any checker failure is a **Study result**.

Classify failure as one of:

```text
SYNTAX / ELABORATION
UNIVERSE / TYPE-SCOPE
MISSING IMPORT / BUILD CONFIG
INVALID PROOF
UNDECLARED FORMAL PRINCIPLE
WORKFLOW / ENVIRONMENT
```

Do not weaken the mathematical acceptance target merely to make the code compile.

If the failure reveals a mathematical or formalization assumption, reopen the relevant contract/Decision Point.

## Success handling

A successful checker run upgrades the verified payload claims to V5 only within the exact declared formal regime/toolchain scope.

It does **not** by itself:

```text
close NAC-15
construct arithmetic
prove cross-framework equivalence
make Lean the canonical definition
```

After V5 success, perform a final NAC-01..NAC-14 closure audit before N-Core acceptance.

---

# DO

Backend files and workflows have been created.

Current session has no local Lean executable, so no local V5 result is claimed.

CI evidence must be inspected rather than assumed.

---

# STUDY

OPEN — pending observed checker result.

---

# ACT

PENDING.

Until V5 evidence is recorded:

```text
TCT-BLOCK-006 = CONDITIONAL / PENDING
NAC-15        = NOT ELIGIBLE FOR CLOSURE
N-Arithmetic  = BLOCKED
```
