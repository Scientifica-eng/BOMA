# Calibration Point 001 — Anti-Drift Baseline

**Cycle:** `PDCA-001`  
**Purpose:** establish a stable reference against which future self-reviews can detect hallucination, unsupported inference, architectural drift, and loss of the current objective.

## 1. Why this exists

PDCA-001 is intentionally exploratory. Exploration creates a risk: a locally plausible result can gradually become treated as an established BOMA principle without sufficient evidence.

This calibration point is therefore a **reference snapshot**, not a new BOMA specification.

## 2. Current objective

The immediate objective is:

> **Learn, through a small controlled PDCA cycle, how BOMA should be constructed from zero, while preserving the distinction between BOMA concepts, backend verification systems, experimental evidence, and normative decisions.**

The current architectural question is the nature and atomicity of the first Brick candidate, `B-001`.

## 3. Non-negotiable distinctions

### 3.1 BOMA vs backend

```text
BOMA concept
    ≠
Lean / Coq / Agda / Isabelle artifact
```

A backend implementation may provide evidence about a formal artifact. It does not define BOMA semantics by itself.

### 3.2 Verification vs architectural acceptance

```text
backend verification success
    ≠
BOMA architectural acceptance
```

### 3.3 Separability vs atomicity

```text
backend separability
    ≠
BOMA decomposability
```

### 3.4 Dependency vs non-atomicity

```text
dependency
    ≠
non-atomicity
```

A dependent unit may still have independent architectural identity.

### 3.5 Experimental vs normative

Current conclusions about Brick identity and B-001 decomposition are **provisional**. They must not be silently promoted to normative BOMA rules.

## 4. Current evidence baseline

At the calibration point:

- `B-001` exists as an experimental Brick record.
- Its Lean artifact passes the declared CI verification.
- An atomicity probe demonstrates backend separability of `domain + initial`.
- A semantic identity analysis provisionally supports independent identity for `domain + initial`.
- A negative control rejects a successor component whose meaning is incomplete without an independently specified carrier/domain.
- A positive control supports the proposition that dependency does not itself prevent independent Brick identity.
- The official decomposition into `B-001a` / `B-001b` has **not** been adopted.
- `B-002` remains blocked.
- The authoritative Brick definition remains a source gap in the current branch and must not be invented from experimental evidence.
- The logical-core question remains separate and unresolved.

Evidence references:

```text
E-007  Atomicity/backend separability
E-008  Independent identity analysis
E-009  Cross-case negative control
E-010  Positive dependency control
```

## 5. Current provisional architectural hypothesis

The evidence currently supports testing the decomposition:

```text
B-001a — Minimal Pointed Object Domain
B-001b — Successor Structure
```

with:

```text
B-001b depends on B-001a
```

but this is a **candidate architecture**, not an accepted one.

## 6. Current unresolved questions

1. What is the authoritative BOMA definition of `Brick` in the source documents?
2. Does that definition support the candidate decomposition?
3. Is `domain + initial` genuinely the smallest semantically meaningful unit at the intended architectural level?
4. Is successor an independently meaningful extension rather than an internal component?
5. What should be the formal relationship between `Brick` and `Block`?
6. How should the logical-core policy be formalized and tested?
7. Which parts of the current experimental methodology should become permanent BOMA development discipline?

## 7. Calibration procedure

When a future self-review is requested against this point, review the work since this calibration point under these headings:

### A. Evidence integrity

- Did I claim anything not supported by a repository artifact, source document, or explicitly labeled inference?
- Did I confuse a tool result with a BOMA conclusion?
- Did I invent files, definitions, commits, test results, or source content?

### B. Architectural alignment

- Am I still building BOMA from zero through the laboratory cycle?
- Have I prematurely introduced later Bricks or Blocks?
- Have I silently changed the meaning of Brick, Block, dependency, or atomicity?

### C. Epistemic discipline

Classify important statements as one of:

```text
Observed
Verified
Derived
Hypothesized
Provisional
Normative
Unknown
```

Any statement presented as normative without adequate source/evidence is a calibration failure.

### D. Traceability

For every substantive decision, identify:

```text
claim → evidence → interpretation → decision
```

If the chain is missing, downgrade confidence and document the gap.

### E. Objective drift

Check whether the work is still serving the current milestone. If a technically interesting task does not reduce uncertainty relevant to the current milestone, mark it as drift rather than allowing it to become an implicit new objective.

## 8. Anti-hallucination rule

When repository evidence, source documents, or tool output are unavailable or ambiguous:

> **Do not fill the gap with a plausible reconstruction. Mark the gap explicitly and stop the affected inference.**

In particular, do not claim to have read or verified a source that was not actually retrieved in the current evidence chain.

## 9. Anti-retcon rule

A later correction must not rewrite history so that the earlier error disappears.

Use:

```text
earlier belief
→ observed contradiction
→ correction
→ current belief
```

The learning history is part of the experiment.

## 10. Calibration outcome categories

Future reviews should end with one of:

```text
GREEN — aligned; no material epistemic or architectural drift detected.
YELLOW — minor drift, ambiguity, or unsupported inference; correction required.
RED — material hallucination, fabricated evidence, architectural drift, or loss of objective; return to the calibration point before continuing.
```

A `RED` result should block further architectural expansion until the discrepancy is explicitly corrected and documented.

## 11. Current snapshot

```text
Milestone:        Learn how to construct BOMA from zero
Cycle:            PDCA-001
Current target:   B-001 atomicity / Brick identity
B-001:            Experimental
Decomposition:    Supported / Not Adopted
B-002:            Blocked
Logical Core:     Open
Brick definition: Source Gap Open
Evidence ledger:  Active
Learning log:     Active
Calibration:      CAL-001
```
