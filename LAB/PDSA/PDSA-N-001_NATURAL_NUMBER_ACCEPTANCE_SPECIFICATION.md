# PDSA-N-001 — Natural-Number Acceptance Specification

**CycleID:** `PDSA-N-001`  
**Track:** Natural Numbers / Formalization Boundary  
**Date opened:** 2026-08-18  
**Date closed:** 2026-08-18  
**Status:** **CLOSED — ACCEPTANCE SPECIFICATION ACTIVE v1.0**  
**Cycle type:** Acceptance-specification / formalization-governance cycle

## Inputs

```text
PDSA-TCT-008  calibrated pre-numerical path
TCT-BLOCK-005  successor-like structural package
historical Phase 9 framework comparisons
historical Closure Core / formalization-boundary learning
```

---

# PLAN

Define what a future formal realization must satisfy **before** BOMA may call it a natural-number core.

Separate:

```text
N-CORE
carrier, identity, initial role, successor, generatedness,
induction/recursion adequacy, faithful TCT realization, identification evidence

N-ARITHMETIC PACKAGE
addition, multiplication, order, and later arithmetic structure
```

The specification must not choose a realization framework silently.

---

# DO

## D1 — Draft specification

Created:

`LAB/00_ARCHITECTURE/NATURAL_NUMBER_ACCEPTANCE_SPECIFICATION.md`

The draft introduced obligations NAC-01 through NAC-16.

## D2 — Stress test

Created:

`LAB/PDSA/experiments/PDSA-N-001-ACCEPTANCE-STRESS-001.md`

Tested the specification against:

```text
current pre-numerical TCT core
cyclic successor structure
ℤ with successor x ↦ x+1
natural-number-like chain plus extra elements
collapsing/fixed-point successor structure
first-order Peano-style axiomatization alone
set-theoretic standard realization style
initial-algebra realization style
NNO realization style
free monoid on one generator
```

## D3 — Promote specification

Stress-test clarifications were incorporated and the canonical specification was promoted to:

```text
BOMA-N-ACCEPT-001
Version 1.0
Status ACTIVE
```

---

# STUDY

## S1 — Successor properties do not characterize ℕ alone

The stress tests confirmed that local successor behavior is insufficient.

Examples:

- an injective successor on `ℤ` still has `0` in its image;
- a natural-looking chain can coexist with extra unrelated carrier elements;
- cyclic/collapsing structures can satisfy fragments of a successor vocabulary while failing the intended constructional ancestry.

Therefore no-confusion and **global generatedness** are independent obligations.

## S2 — The current TCT core correctly fails N-Core acceptance

This is a positive result.

TCT currently lacks the formal carrier/globality, formal equality, object-level global successor, induction/recursion adequacy, and uniqueness/standardness certificate required by the specification.

Thus the acceptance gate prevents renaming the pre-numerical construction as ℕ.

## S3 — First-order Peano-style axioms are not automatically a uniqueness certificate

Under ordinary first-order model theory, first-order Peano-style theories may have nonstandard models.

Therefore BOMA requires the realization record to state the logical/semantic regime and actual standardness/uniqueness theorem used.

The label “Peano” is not sufficient evidence.

## S4 — Universal-property routes remain admissible but framework-relative

Initial algebra and NNO styles can potentially satisfy the same exported N-Core obligations by different production routes.

This reinforces the BOMA rule:

```text
compare certified contributions
rather than erase construction routes
```

## S5 — Free monoid is a strong finite-core model but not automatically complete N-Core evidence

The free monoid on one generator mirrors much of the TCT constructional core, but the monoid universal property alone does not automatically supply the full induction/recursion/standardness package demanded by N-Core acceptance.

This preserves the historical distinction between finite constructional structure and global natural-number realization.

## S6 — Arithmetic belongs downstream

Addition, multiplication, and order are not needed to decide whether the underlying natural-number core is adequately characterized.

Keeping them in a separate N-Arithmetic package prevents familiar arithmetic from contaminating the core-realization criterion.

---

# ERRORS / RISKS DETECTED

1. “Peano axioms” is too ambiguous without logic/semantics and uniqueness evidence.
2. A formal carrier can contain additional unrelated elements unless generatedness is separately proved.
3. A universal property must be stated with its ambient category/targets/morphisms; the name alone is insufficient.
4. A formal realization could erase the TCT ancestry unless a preservation/commitment ledger is mandatory.
5. Arithmetic could be introduced too early merely because a standard model already carries it.

---

# SUCCESSES

1. The target is now defined before construction.
2. The acceptance specification rejects the current TCT core as ℕ while accepting it as the correct input to formalization.
3. The specification is compatible with multiple realization styles without declaring them equivalent by fiat.
4. The TCT-to-formal bridge and new-commitment ledger are mandatory.
5. N-Core and N-Arithmetic are explicitly separated.

---

# HUMAN / AI RESEARCH RECORD

## Human contribution

The human research authority required a transparent construction whose roots precede the numbers and required cumulative PDSA learning rather than replacement of earlier paths.

That goal forces the acceptance specification to preserve the constructional ancestry and expose formal completion commitments rather than importing a ready-made ℕ.

## AI contribution

The AI research agent:

- decomposed the meaning of “having constructed ℕ” into explicit acceptance obligations;
- stress-tested those obligations against successful and defective candidate structures;
- identified the first-order standardness/uniqueness issue;
- separated N-Core from the downstream arithmetic package;
- promoted the stress-tested specification to v1.0.

## Verification status

This is an architectural/mathematical acceptance specification, not a formal proof of existence of any candidate N-Core.

---

# ACT

## Decision A — activate BOMA-N-ACCEPT-001 v1.0

The authoritative target is:

`LAB/00_ARCHITECTURE/NATURAL_NUMBER_ACCEPTANCE_SPECIFICATION.md`.

## Decision B — keep TCT-BLOCK-006 reserved

The specification defines the target but does not construct the formal natural-number domain.

## Decision C — next PDSA cycle

Open an explicit realization-regime Decision Point:

```text
PDSA-N-002 — Formal Natural-Number Realization Regime Comparison
```

At minimum compare:

```text
set-theoretic / Peano-style realization
initial-algebra realization
NNO / categorical realization
free-monoid-derived realization where appropriate
```

against NAC-01 through NAC-14.

The selected Stage-One canonical route must be justified by the comparison and must preserve alternatives as distinct branches for later Stage-Two study.

---

# LearningGraphEffects

```text
L-N-001-01  Define “success” before constructing a familiar object.
L-N-001-02  Local successor properties do not imply global natural-number structure.
L-N-001-03  Generatedness is a separate global obligation.
L-N-001-04  First-order axioms are not automatically a uniqueness/standardness certificate.
L-N-001-05  Universal-property routes can export similar guarantees through different frameworks.
L-N-001-06  Formalization must preserve TCT ancestry through an explicit bridge and commitment ledger.
L-N-001-07  N-Core and arithmetic should be separate construction stages.
```

---

# Closure conclusion

**PDSA-N-001 CLOSED.**

BOMA now has an active, stress-tested Natural-Number Acceptance Specification. The next scientific task is to compare formal realization regimes against that specification before constructing the formal natural-number core.
