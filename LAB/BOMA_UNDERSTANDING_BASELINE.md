# BOMA Understanding Baseline

**Status:** Foundational project-memory document

**Purpose:** Preserve the current authoritative understanding of BOMA I and BOMA II so that future laboratory work does not silently drift from the original architecture.

> This document records understanding and constraints. It does not amend BOMA I or BOMA II. Any proposed change to the architecture must be explicitly identified as a proposal and tested before becoming normative.

## 1. Governing Principle

The laboratory is not an exercise in applying BOMA to a pre-existing mathematical subject. The project is to develop the architecture itself and, where appropriate, use the architecture to construct formal mathematics from the beginning.

The original BOMA papers remain the architectural baseline. The laboratory is an experimental environment for testing, refining, and operationalizing that architecture.

## 2. BOMA I — Core Architectural Understanding

BOMA (Branch-Oriented Architecture for Mathematical Foundations) is a meta-architectural framework for constructing, documenting, comparing, and correcting formal foundational developments.

Its central concern is not merely which mathematical statements are accepted, but how a development is constructed: dependencies, injections, genuine choices, branches, epistemic status, local consistency, and the traceability of corrections.

### 2.1 Block

In the current BOMA I formulation, a Block is a formal architectural unit with identity, content, dependencies, and status. Blocks form the basic path-level units of the development.

The current formal treatment therefore must not be silently replaced by a new Brick/Block hierarchy. Any such replacement is an architectural proposal requiring explicit comparison with the original definitions.

### 2.2 Dependency

Dependencies are explicit architectural relations between units of development. A later unit must not conceal the prior content on which its formal content depends.

### 2.3 Injection

Injection identifies content introduced into a development that is not already derivable from the prior dependency closure. This is a central BOMA distinction because imported or introduced foundational content must remain visible.

### 2.4 Minimal Injection

The Minimal Injection Principle requires that injected content be necessary, individually non-derivable from prior content, and no stronger than required for the intended step. Minimality is therefore architectural and epistemic, not merely syntactic.

### 2.5 Epistemic Status

Paper II refines the epistemic classification to four statuses:

- **LN — Logical Necessity**
- **FN — Foundational Necessity**
- **AN — Architectural Necessity**
- **MC — Methodological Choice**

This classification is not interchangeable with Lean categories such as theorem, axiom, definition, or declaration.

### 2.6 Decision Point

A Decision Point marks a genuine architectural alternative. A decision is not created merely because Lean offers multiple tactics, syntactic forms, or implementation techniques.

A genuine Decision Point must concern an admissible alternative development at the relevant architectural level.

### 2.7 Branch

A Branch is a distinct development produced by selecting an alternative at a Decision Point. The inherited prefix is preserved exactly. A Git branch, Lean namespace, or source file can be used to represent a BOMA Branch operationally, but none is semantically identical to the BOMA concept.

### 2.8 Local Consistency

Local consistency is a property of a path/development itself. It is not established by agreement with another branch. A contradiction between two branches can itself be structurally informative when each branch is locally consistent.

### 2.9 Correction

Paper II distinguishes two correction modes:

- **Additive Correction:** extend the current path with new Blocks without modifying existing Blocks or opening a Branch.
- **Branch Correction:** reopen the Decision Point associated with the flawed methodological choice and continue through a different option.

The correction mode depends on the flaw type and epistemic status. Applying the wrong correction mode is architecturally incoherent.

### 2.10 ERRATA

A discovered flaw must be logged as an immutable ERRATA entry before correction. The affected Block carries an ErratumStatus reference.

### 2.11 Internal Counter-Model

Paper II introduces the Internal Counter-Model as a diagnostic tool relative to one locally consistent path. It can establish non-derivability and prescribe an additive correction without comparing two branches.

This must remain distinct from a separation formula, which is inherently comparative between paths.

### 2.12 Architectural DAG and Convergence

Paper II extends the branch-tree view to an Architectural DAG. Convergent Blocks provide the architectural criterion for identifying results that survive divergent foundational choices. A result appearing identically on multiple branches is not called foundationally neutral merely by assertion; convergence supplies a structural certificate of invariance relative to the relevant Decision Point.

## 3. BOMA II — Operational Understanding

Paper II turns the conceptual framework into an operational specification. A BOMA-compliant development is characterized by six properties:

1. **Traceability**
2. **Transparency**
3. **Auditability**
4. **Minimal-Brick Construction**
5. **Branchability**
6. **Correctability**

The exact wording and formal definitions in Paper II remain authoritative over this summary.

### 3.1 Minimal-Brick Construction

This is the critical point for the current laboratory. Paper II already uses the term **Brick** in connection with minimal, traceable construction. Therefore, introducing Brick as the smallest construction unit is not an arbitrary invention; however, the exact relationship between Brick and the formally defined Block must be derived carefully rather than assumed.

The laboratory must determine whether Brick is:

- a refinement of the existing Block concept;
- a lower-level implementation unit from which Blocks are composed;
- a replacement for some uses of Block;
- or a distinct concept that coexists with Block.

No option is normative yet.

### 3.2 Machine-Readable Block Record

Paper II specifies a Block Summary Record containing, among other fields:

- identity and status;
- EpistemicStatus and justification;
- Conservativity and basis;
- Depends_on;
- Introduces;
- Exports;
- Injects;
- Derives;
- DecisionPoint information;
- ErratumStatus and correction mode;
- FormalPayload, including language/source/verification status.

This record is intended to support automated compliance checking.

## 4. Separation Between BOMA and Proof Assistants

BOMA is the architectural language. Lean is a formal verification backend and must not silently become the definition of BOMA.

The relationship must therefore be explicit:

```text
BOMA architectural concept
        |
        | explicit mapping
        v
Backend representation
        |
        v
Lean elaboration / environment
        |
        v
Lean kernel checking
```

A Lean term, declaration, theorem, axiom, namespace, module, import, tactic, or kernel result may implement or provide evidence for a BOMA concept, but none becomes a BOMA concept automatically.

### 4.1 Mandatory Non-Conflation Rules

- **Brick != Lean declaration**
- **Block != Lean namespace/module**
- **Branch != Git branch or Lean namespace**
- **Decision Point != tactic or syntactic choice**
- **Verification != kernel checking**
- **Injection != import**
- **Proof != proof term**
- **Assumption != axiom**

Mappings must be typed as Equivalent, Approximate, Implemented-by, Composed-of, No-counterpart, or Backend-specific.

## 5. Brick Question — Explicit Open Issue

The current project proposes using **Brick** for the least construction unit and allowing a set of Bricks to form a **Block** when useful.

This is a hypothesis, not yet a revised BOMA definition.

The decisive test is architectural:

> Does introducing Brick below Block improve atomic traceability, Minimal Injection, dependency accounting, correction, and automated verification without destroying or duplicating the semantics already assigned to Block in BOMA I/II?

The laboratory must answer this experimentally.

A Brick is therefore provisionally understood as:

> the smallest independently identifiable unit of foundational content at the chosen architectural analysis level.

This wording intentionally avoids claiming that Brick is the smallest syntactic or mathematical object possible.

## 6. Laboratory Starting Condition

The laboratory begins from an empty **BOMA development**, not from a pre-existing mathematical theory selected for convenience.

The first experimental construction must therefore be chosen because it is useful for testing the architecture itself, not because it represents a favorite mathematical example.

The first construction must record:

- what existed before the step;
- exactly what is introduced;
- why it is needed;
- what is derivable versus injected;
- how the unit maps to the backend;
- what verification establishes;
- what architectural metadata is necessary;
- and what the Check phase reveals.

## 7. Paper III Boundary

Paper II explicitly positions the next major stage as a fully developed mathematical example, including correction of specified Bricks, construction of the natural numbers, first branch development, convergence, and architectural metrics.

The current laboratory should not silently assume that this Paper III program is already validated. The laboratory is a controlled environment for learning what operational machinery is actually required before scaling up.

## 8. Change-Control Rule

No laboratory observation may silently rewrite BOMA I or BOMA II.

Every proposed architectural change must be labeled as one of:

- **Observation** — directly observed in an experiment.
- **Interpretation** — an explanation of an observation.
- **Proposal** — a candidate architectural change.
- **Tested Proposal** — a proposal tested against explicit criteria.
- **Validated Revision** — a revision accepted after successful testing.
- **Rejected/Deprecated** — a proposal shown inadequate or superseded.

The original papers remain the reference baseline until a deliberate revision process changes them.

## 9. Anti-Drift Checklist

Before any future laboratory construction, verify:

- [ ] Have BOMA I and BOMA II definitions been checked?
- [ ] Are we changing BOMA or merely implementing/testing it?
- [ ] Is the concept BOMA-Core or backend-specific?
- [ ] Are Brick and Block being conflated?
- [ ] Is an apparent choice genuinely a Decision Point?
- [ ] Is the content derived or injected?
- [ ] Is Minimal Injection being evaluated explicitly?
- [ ] Is Verification being confused with Lean kernel checking?
- [ ] Is a correction additive or branching, and why?
- [ ] Has the observation been recorded before changing the architecture?

## 10. Current Working Position

The project should proceed **brick by brick**, but only after the Brick/Block relation has been experimentally clarified against the existing BOMA definitions.

The immediate objective is therefore not to invent a mathematical subject. It is to establish the smallest construction protocol that can faithfully express BOMA's existing architectural commitments and expose where the architecture itself needs refinement.
