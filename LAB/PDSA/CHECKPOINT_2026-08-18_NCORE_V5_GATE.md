# BOMA CHECKPOINT — N-CORE V5 GATE

**Checkpoint ID:** `BOMA-CP-NCORE-V5-2026-08-18`  
**Date:** 2026-08-18  
**Status:** ACTIVE RESEARCH CHECKPOINT

## Purpose

Record the exact project state reached after continuing the Stage-One PDSA plan from canonical decomposition through the first formal N-Core candidate.

This checkpoint is designed to permit restart from repository evidence rather than conversational memory.

---

# 1. Mathematical construction reached

The calibrated pre-numerical construction is ACTIVE through:

```text
TCT-BLOCK-001  Construction Kernel
TCT-BLOCK-002  Generated Selected Configurations
TCT-BR-010     Structural Equivalence ≈
TCT-BR-009     Terminal Preservation — DERIVED
TCT-J-001      Canonicality Gate — PASS / RESOLVED
TCT-BLOCK-003  Canonical Decomposition
TCT-BLOCK-004  Structural Iteration History
TCT-BLOCK-005  Successor-Like Extension Structure
```

`PDSA-TCT-008` audited the full path and closed:

```text
PASS WITH DOCUMENTARY / TERMINOLOGICAL REFINEMENTS
```

No accepted natural-number carrier existed at that calibration boundary.

---

# 2. Natural-number target defined

`BOMA-N-ACCEPT-001 v1.0` is ACTIVE.

It defines NAC-01 through NAC-16 and separates:

```text
N-CORE
from
N-ARITHMETIC PACKAGE
```

The core requires formal carrier/globality, formal identity, initial role, global successor, faithful TCT bridge, no-confusion, generatedness, induction, recursion/universal adequacy, characterization, standardness/uniqueness, preservation certificate, and commitment ledger.

Addition, multiplication, and order remain downstream.

---

# 3. Formalization Decision Point

Canonical architecture now contains an explicit `Decision Point` unit type distinct from `Junction`.

`N-DP-001 — Formal Natural-Number Realization Regime` is:

```text
RESOLVED / SELECTED FOR STAGE ONE
```

Selected option:

```text
R-B — fresh BOMA-specific inductive-type realization
```

Preserved alternatives:

```text
R-A  set-theoretic / Peano-style
R-C  NNO / categorical
R-D  free-monoid-derived structural route
```

The selection is a methodological/formalization choice, not a theorem of unique necessity.

---

# 4. R-B formalization boundary

`BOMA-RB-FORMAL-001 v1.0` is ACTIVE.

The main new commitment is explicit:

```text
fresh inductive global carrier formation
+ dependent elimination / induction regime
```

Initial N-Core work does not require as hidden defaults:

```text
classical excluded middle
choice
quotient types
function extensionality
univalence
built-in Nat as the BOMA carrier
```

Pointwise recursion uniqueness is used to avoid adding function extensionality merely for packaging.

---

# 5. First formal candidate

Candidate:

```text
N-RB-CAND-001
```

Canonical formal candidate record:

`LAB/20_FORMALIZATION/N_CORE/RB_CANDIDATE_001.md`

Fresh carrier structure:

```text
N_BOMA : Type
z : N_BOMA
s : N_BOMA → N_BOMA
```

`TCT-BLOCK-006` now has a candidate, but its correct state is:

```text
CONDITIONAL / PENDING — FORMAL CANDIDATE EXISTS
```

It is not accepted as `ℕ`.

---

# 6. Written/formal proof candidates

Preferred unified backend payload:

`LAB/payloads/lean/NCore/NCoreRB001.lean`

It contains candidates for:

```text
constructor disjointness
constructor injectivity
dependent eliminator / induction demonstration
nondependent recursion
pointwise recursion uniqueness
selected-NF TCT backend representation
TCT realization and reification
bridge faithfulness
unary-algebra homomorphism structure
pointwise initiality
uniqueness of pointwise-initial unary algebras
```

Earlier payloads are retained as provenance:

```text
BOMANat.lean
TCTBridge.lean
TCTBridgeSelected.lean
```

They are not the preferred unified verification target.

---

# 7. Faithful TCT bridge status

`PDSA-N-005-TCT-BRIDGE-AUDIT-001` concludes:

```text
PASS AT ARCHITECTURAL / WRITTEN-PROOF LEVEL
V5 PENDING
```

The bridge keeps distinct:

```text
canonical TCT selected presentations
backend TCTNF representation
formal N_BOMA carrier
```

On selected normal forms, backend equality represents `≈` only because PDSA-TCT-004 independently proved selected-presentation canonicality under BR-010.

The bridge is not a redefinition of BR-010 as equality on arbitrary syntax.

---

# 8. Characterization / standardness status

`PDSA-N-006-INITIALITY-STANDARDNESS-001` establishes at written mathematical level:

```text
existence of fold homomorphism
pointwise uniqueness of fold homomorphism
pointwise initiality of BOMAAlg
pointwise inverse maps between any two pointwise-initial unary algebras
```

This provides the selected R-B route for NAC-10, NAC-11, and NAC-12.

Dependent induction remains separately sourced from the inductive eliminator; ordinary initiality is not used as a silent substitute for dependent induction.

Current status:

```text
WRITTEN MATHEMATICAL PASS
V5 PENDING
```

---

# 9. Preservation / commitment ledger

Active ledger:

`LAB/20_FORMALIZATION/N_CORE/N_RB_CAND_001_PRESERVATION_COMMITMENT_LEDGER.md`

It distinguishes:

```text
PRESERVED TCT CONTRIBUTIONS
TRANSLATED / REPRESENTED CONTRIBUTIONS
NEW FORMAL COMMITMENTS
FORMALLY RE-DERIVED THEOREMS
BACKEND-ONLY REPRESENTATIONS
OPEN ITEMS
```

The largest new formalization cost is explicitly recorded as the transition:

```text
local/schematic generated presentations
        ↓
fresh global inductive carrier
        ↓
formal equality + global functions + dependent elimination
```

This transition is not presented as a TCT derivation.

---

# 10. V5 verification gate

Current gate:

`PDSA-N-007 — V5 Formal Verification Gate`.

CI workflows created for the new candidate include:

```text
.github/workflows/boma-ncore-rb-001.yml
.github/workflows/boma-ncore-rb-002.yml
.github/workflows/boma-ncore-rb-003.yml
```

The preferred current workflow/payload pair is:

```text
boma-ncore-rb-003.yml
LAB/payloads/lean/NCore/NCoreRB001.lean
```

The current research checkpoint does **not** record a successful V5 result unless an actual checker run is observed and its evidence is recorded.

---

# 11. Current blockers to accepted N-Core

Before NAC-15 closure:

```text
1. obtain/observe successful pinned-toolchain Lean checking of NCoreRB001.lean;
2. record exact checker/toolchain evidence;
3. resolve any syntax/universe/proof failures through PDSA Study rather than bypassing them;
4. finalize V5 status of the TCT bridge;
5. finalize V5 status of initiality/standardness results;
6. re-audit NAC-13 preservation and NAC-14 commitments after checker results;
7. perform final NAC-01..NAC-14 acceptance audit;
8. only then decide NAC-15 N-Core closure.
```

---

# 12. Explicitly blocked downstream work

Until N-Core closure:

```text
addition        BLOCKED FROM CANONICAL PROMOTION
multiplication  BLOCKED FROM CANONICAL PROMOTION
order           BLOCKED FROM CANONICAL PROMOTION
ℤ               BLOCKED
ℚ               BLOCKED
ℝ               BLOCKED
ℂ               BLOCKED
```

Experimental probes may be created only if clearly labeled and if they do not imply canonical downstream completion.

---

# 13. Learning checkpoint

Major learning extracted from the continuation:

```text
1. Canonical decomposition can export a guarantee without quotient construction.
2. CAL-001's depth failure was successfully repaired as Structural Iteration History.
3. Successor-like behavior can be proved structurally without claiming successor on ℕ.
4. Whole-path calibration must inspect titles and graph labels, not only proofs.
5. “Constructing ℕ” required an acceptance specification before a carrier was built.
6. Junction and Decision Point are different architectural roles.
7. Formalization selection is a methodological choice and must retain alternatives.
8. The global inductive carrier is a visible new commitment, not a theorem of TCT.
9. Pointwise uniqueness can avoid premature function extensionality.
10. Backend TCT datatypes can verify a bridge without replacing the pre-numerical ontology.
11. Initiality and dependent induction are complementary results with different provenance.
12. Machine verification is a separate epistemic level and must not be inferred from plausible code.
```

---

# 14. Restart instruction

Resume at:

```text
PDSA-N-007 — V5 Formal Verification Gate
```

Do not begin N-Arithmetic until the gate is closed and NAC-15 is explicitly accepted.
