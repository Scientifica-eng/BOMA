# BOMA Logical Foundation

**Status:** Proposed — experimental policy
**Baseline:** BOMA I + BOMA II

## 1. Objective

This document defines the initial experimental policy for logic in BOMA developments. It does not amend BOMA I or BOMA II. Its purpose is to make logical commitments explicit and testable before they become normative.

## 2. Trunk Requirement

The common BOMA trunk is proposed to use an **intuitionistic logical foundation**.

The intended architectural form is:

```text
BOMA Trunk
└── Intuitionistic logical foundation
      ├── common foundational content
      └── common dependencies

Decision Point
├── Branch A: retains the intuitionistic regime
├── Branch B: adopts a classical regime explicitly
└── Branch C: adopts another explicitly declared logical regime
```

The intuitionistic requirement is therefore a property of the **BOMA trunk**, not a claim that every backend is inherently intuitionistic.

## 3. Why the Trunk Is Intuitionistic

The proposed policy aims to minimize logical commitments in the common ancestor of all branches. A stronger principle introduced later can then be visible as a branch-level architectural commitment rather than an implicit assumption inherited by every development.

The policy is deliberately not an absolute prohibition against ever extending the trunk. If intuitionistic reasoning becomes genuinely insufficient for the foundational construction itself, the project may introduce a non-intuitionistic commitment only under demonstrated necessity and with complete traceability.

The relevant principle is therefore:

> **Prefer intuitionistic logic in the trunk; depart from it only under demonstrated necessity, and introduce the weakest precisely identified extension sufficient to continue the construction.**

## 4. Exceptional Trunk Extension

An exceptional extension of the trunk must satisfy all of the following before it is accepted as a construction step:

1. **Necessity:** the obstacle to continuing intuitionistically is documented precisely.
2. **Alternatives:** weaker or different ways of proceeding are investigated and recorded.
3. **Identification:** the exact additional logical principle or regime is identified.
4. **Minimality:** the smallest sufficient logical commitment is preferred over importing a stronger logic wholesale.
5. **Transparency:** the extension, its rationale, and its consequences are visible in the BOMA record.
6. **Traceability:** all affected dependencies and downstream results can be identified.
7. **Backend separation:** a backend limitation or convenience alone does not count as logical necessity.

This creates a high evidential threshold without making the foundational program formally incapable of responding to a genuine logical obstruction.

## 5. Branch Freedom

Branches are not restricted to a binary choice between intuitionistic and classical logic.

A branch may investigate another logical regime when:

1. the regime is explicitly identified;
2. its relevant principles are stated sufficiently precisely;
3. the branch records its logical dependencies;
4. any new foundational commitments are represented through the applicable BOMA mechanism;
5. the selected backend can provide an adequate representation or the limitation is recorded explicitly.

Possible examples include, without constituting an approved BOMA list:

- classical logic;
- modal logics;
- relevant logics;
- linear logic;
- paraconsistent logics;
- many-valued logics;
- other constructive or substructural systems.

The list is illustrative and intentionally non-exhaustive.

## 6. Logical Regime vs Logical Principle

A logical regime is not merely a bag of named axioms. It includes the inferential framework under which those principles are interpreted.

Therefore the laboratory should distinguish:

- the **base logic** or proof system;
- additional axioms or principles;
- derived consequences;
- backend-specific mechanisms;
- libraries or automation that do not themselves constitute foundational commitments.

This distinction is important for determining whether an apparent logical extension is actually an architectural injection.

## 7. Classical Extension as a Test Case

A classical branch is an important early experiment because it provides a clear contrast with the intuitionistic trunk.

For example, if a classical principle is not derivable from the trunk, its availability in the branch should be represented as an explicit branch-level commitment rather than hidden in imported automation.

The exact representation of classical principles is backend-dependent and must not be inferred from backend names alone.

## 8. Conservativity Questions

When a branch adopts a stronger logical regime, the laboratory should ask whether the extension is conservative over a specified fragment of the trunk.

At minimum, records should make it possible to distinguish:

- the common trunk;
- the logical extension;
- results that depend on the extension;
- results that remain derivable from the trunk alone.

This is especially important when comparing branches.

## 9. Backend Mapping

The same BOMA logical regime may be represented differently by Lean, Coq, Agda, Isabelle, or Informal argumentation.

The backend layer must therefore record representation facts separately from BOMA logical facts.

A backend's default environment, imported library, tactic, automation, or configuration must not be treated as a BOMA logical principle unless the experiment explicitly establishes that interpretation.

## 10. Informal Mode

Informal is treated as a distinct verification/documentation mode.

An Informal payload may state logical rules, assumptions, definitions, and arguments, but it does not receive the same formal verification status as a kernel-checked payload.

Its epistemic status and evidential role must therefore be recorded explicitly.

## 11. Candidate Logical Metadata

A future Brick/Block record may require fields resembling:

```yaml
LogicalRegime:
  Name: TBD
  BaseSystem: TBD
  AdditionalPrinciples: []
  InheritedFrom: TBD
  IntroducedHere: []
  VerificationStatus: TBD
```

This schema is provisional. It should not become normative until experiments demonstrate which distinctions are necessary.

## 12. Initial Policy

The current policy for the laboratory is:

1. **The trunk is intuitionistic by default.**
2. **The trunk may depart from intuitionistic logic only under demonstrated necessity.**
3. **Any exceptional trunk extension must be explicit, minimal, justified, transparent, and traceable.**
4. **Branches may remain intuitionistic.**
5. **Branches may adopt classical logic explicitly.**
6. **Branches are not restricted to classical extensions; other logical regimes remain admissible in principle.**
7. **Any change of logical strength or regime must be explicit and traceable.**
8. **Backend terminology does not define BOMA logical semantics.**
9. **No logical regime beyond these policies is endorsed merely by being listed as a possibility.**

## 13. Questions for PDCA

The first logical experiments should investigate:

- What is the smallest formal representation of the intuitionistic trunk?
- How do we record logical regime without conflating it with backend syntax?
- How do we identify a genuine logical injection?
- What evidence is sufficient to establish that intuitionistic construction has become genuinely insufficient?
- How do we identify the weakest sufficient logical extension?
- How should a branch record a change in logical regime?
- What does conservativity mean when logical strength changes?
- Can the same BOMA logical commitment be represented faithfully across more than one backend?

## 14. Status

All policies in this document are **Proposed** until supported by laboratory evidence and the BOMA change-control process.