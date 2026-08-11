# BOMA Philosophy

**Status:** Proposed foundational philosophy
**Baseline:** BOMA I + BOMA II

## 1. Purpose

BOMA is treated as an architectural framework for constructing, tracing, comparing, verifying, and revising foundational developments. The laboratory exists to test and refine that architecture rather than silently redefining it.

The project distinguishes the **meaning of a construction** from the **language or system used to represent or verify it**.

## 2. Build From Zero

The experimental program begins with an empty development and constructs the project incrementally. No external mathematical theory is assumed merely to provide convenient test material.

The first question is therefore architectural: what is the smallest meaningful, traceable addition to an empty development?

## 3. Brick and Block

`Block` remains the established BOMA concept in the existing baseline.

`Brick` is a proposed finer-grained construction concept. A Brick is intended to denote the smallest independently identifiable unit at a chosen architectural level. A Block may group one or more Bricks when that grouping has a justified structural or semantic role.

This distinction is experimental and must not be treated as a silent redefinition of the original BOMA Block.

## 4. Independence of Meaning From Backend

BOMA concepts are primary. Backend systems are representational and verification mechanisms.

Candidate verification backends include:

- Lean
- Coq
- Agda
- Isabelle
- Informal

`Informal` is a documentation/argumentation mode, not a proof assistant.

The working principle is:

> BOMA meaning is not identical to backend representation.

A single BOMA unit may have zero, one, or several backend payloads. A backend artifact may also fail to correspond one-to-one with a BOMA unit.

## 5. Logical Pluralism With a Conservative Trunk

The laboratory proposes an **intuitionistic logical foundation for the trunk**.

This is motivated by the desire to keep the common foundational development conservative and to make stronger logical commitments explicit rather than inherited silently by every branch.

The proposed default is:

> **Trunk logic is intuitionistic.**

A branch may adopt a stronger or otherwise different logical regime only through an explicit architectural decision and explicit dependency/injection accounting.

The branch is not limited to the classical extension. The framework must remain open to other coherent logical regimes when they are useful and formally representable.

Thus:

```text
Intuitionistic trunk
        |
        +-- Branch A: intuitionistic
        |
        +-- Branch B: classical extension
        |
        +-- Branch C: other explicitly declared logic
```

The list of possible branch logics is intentionally **not closed** to intuitionistic and classical logic.

## 6. Logic Is an Architectural Commitment

A logical principle is not treated merely as a backend configuration option when it changes what may be derived in the development.

If a branch introduces a logical principle not available in the trunk, that introduction should be represented as an explicit architectural event, subject to the applicable BOMA rules for dependency, injection, epistemic status, and verification.

The laboratory must distinguish at least:

- the underlying logical regime;
- principles available in that regime;
- principles explicitly injected into a branch;
- backend mechanisms used to realize those principles.

For example, use of a classical principle in a branch should not be confused with the fact that a particular backend has classical automation or libraries available.

## 7. The Logic Is Not Assumed to Be Binary

The laboratory explicitly rejects the assumption that the space of logical regimes is exhausted by:

`intuitionistic / classical`.

Other families or regimes may be relevant, including modal, relevant, linear, paraconsistent, many-valued, constructive variants, and other systems, subject to precise definitions and actual experimental need.

Their inclusion in the philosophy does **not** mean that BOMA endorses all such systems. It means that the branch architecture does not prohibit them merely because they are not classical.

A branch must declare its logical regime sufficiently precisely for its dependencies and verification claims to be meaningful.

## 8. Backend Neutrality and Logic

The logical regime belongs to the BOMA-level description of a development. Lean, Coq, Agda, Isabelle, or Informal text may realize that regime differently.

Therefore the laboratory must avoid statements of the form:

`Lean = intuitionistic` or `Lean = classical`.

Instead, the correct question is:

> Which logical principles are available in this BOMA development, and how are they represented and verified by the selected backend?

## 9. Traceability Over Convenience

Convenient representation must not erase architectural distinctions.

When a backend combines several concepts into one artifact, the BOMA record should preserve the conceptual distinctions required for traceability. Conversely, BOMA should not invent distinctions solely because a backend happens to expose them.

## 10. Verification Has Two Levels

The project distinguishes:

1. **Formal verification** — what a selected backend accepts according to its formal checking mechanism.
2. **Architectural verification** — whether the development and its records satisfy the applicable BOMA criteria.

A backend acceptance result is evidence for the first level; it is not automatically sufficient for the second.

## 11. PDCA as the Learning Mechanism

The laboratory uses:

`Plan -> Do -> Check -> Act -> Extract Evidence -> Next Cycle`

The purpose of PDCA is not merely quality control. It is a controlled method for discovering missing architectural distinctions and testing proposed rules.

An observed problem must not be silently repaired in the specification. It is recorded, interpreted, tested, and only then considered for a normative change.

## 12. Epistemic Discipline

The project distinguishes:

- **Proposed** — working hypothesis;
- **Observed** — experimental fact;
- **Validated** — survived an explicit check criterion;
- **Corrected** — changed because evidence exposed a deficiency;
- **Deprecated** — retained for traceability but no longer recommended;
- **Normative** — accepted into the specification after sufficient evidence.

## 13. Non-Conflation Principles

The following distinctions are foundational working rules:

- Brick is not automatically a Lean declaration.
- Block is not automatically a namespace or module.
- Branch is not automatically a Git branch.
- Injection is not automatically an import.
- Verification is not automatically kernel checking.
- Proof is not automatically a proof term.
- Logical regime is not automatically a backend setting.

## 14. Open Questions

The following remain deliberately open and should be answered experimentally:

1. What exactly makes a Brick atomic without making it an arbitrary syntactic fragment?
2. When does a collection of Bricks acquire a Block-level identity?
3. What is the minimal BOMA record required to describe a Brick independently of a backend?
4. How should logical regime be represented in a Block/Brick record?
5. Which logical extensions should count as ordinary branch alternatives and which require a distinct architectural mechanism?
6. How should conservativity be stated when branches differ in logical strength?
7. How should cross-backend equivalence be established without assuming that the systems share the same foundations?
8. Which aspects of an Informal payload can count as verification evidence, and with what status?

## 15. Status of This Philosophy

This document is a **proposed laboratory philosophy**, not an amendment to BOMA I or BOMA II.

Any principle promoted to normative BOMA status must pass through the laboratory's evidence and change-control process.