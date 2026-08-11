# E-005 — Logical Requirement Declaration

**Cycle:** `PDCA-001`  
**Status:** Experimental / provisional  
**Source record:** `LAB/LOGICAL_REQUIREMENT_DECLARATION_PROBE_001.md`  
**Epistemic status:** `HYPOTHESIS`

## Question

Should a Brick explicitly declare its logical requirements, or should those requirements be inferred solely from its formal content and context?

## Candidate models

```text
Model A — Explicit declaration
Brick → requires LogicRegime / logical principles

Model B — Inference
Brick content + Context → inferred logical requirements

Model C — Hybrid
Brick may declare requirements, while the verifier independently checks or infers them.
```

## Test cases

### T1 — Intuitionistically derivable commitment

```text
B1: P → P
```

No additional classical commitment is required merely to establish this proposition.

### T2 — Classical-strengthening commitment

```text
B2: P ∨ ¬P
```

This is not generally derivable in intuitionistic logic, while it is available classically.

### T3 — Direct contradiction

```text
Context: P
B3: ¬P
```

The candidate should be rejected under the ordinary reading, independently of any declared logical requirement.

### T4 — Explicit declaration with insufficient content

```text
B4:
  content: P
  requires: classical
```

The declaration requests a stronger regime although the content does not visibly require it.

### T5 — Hidden classical dependency

```text
B5:
  content: theorem T
  proof payload uses a classical principle
  declaration: no logical requirement
```

This tests whether declaration alone can be trusted.

## Observations

### T1

A minimal or empty explicit requirement can be meaningful when the commitment is already compatible with the baseline intuitionistic regime.

### T2

Formal content can reveal dependence on a stronger logical principle. If such a Brick enters an intuitionistic trunk, silently accepting the strengthening would hide an architectural decision.

Explicit declaration is therefore useful for provenance even where inference can detect the requirement.

### T3

Logical-requirement metadata cannot rescue a contradiction with context. A label such as `classical` does not make `P` and `¬P` jointly compatible.

### T4

A declared requirement stronger than apparently necessary is not automatically a contradiction. It is, however, an architectural strengthening candidate whose necessity should be visible and justifiable.

### T5

If the formal payload actually depends on a classical principle while the declaration says otherwise, the declaration is incomplete. Explicit metadata cannot be the sole source of truth.

## Preliminary result

The experiment favors **Model C — Hybrid**:

```text
Declaration provides provenance and architectural intent.
Formal inference provides verification of actual dependence.
Context checking determines admissibility.
```

These functions should not be collapsed into one field.

## Provisional representation

A future Brick record might expose:

```text
LogicalRequirements:
  declared: [...]
  inferred: [...]
  justification: ...
```

with distinctions between:

```text
Declared requirement
Inferred requirement
Verified requirement
Required justification
```

No exact schema is adopted.

## Consequence for an intuitionistic trunk

A classical-strengthening Brick entering an intuitionistic trunk should not be represented merely as:

```text
logic = classical
```

because that obscures the fact that the existing regime was strengthened.

A more informative conceptual event is:

```text
Existing regime: intuitionistic
New Brick: B
Required strengthening: classical principle P
Reason: explicit justification
Decision: exceptional trunk event / branch event
```

This preserves provenance and supports later calibration.

## Distinctions to preserve

```text
Logical requirement
    ≠ logical regime

Declared requirement
    ≠ inferred requirement

Inferred requirement
    ≠ justified necessity

Logical strengthening
    ≠ contradiction

Requirement metadata
    ≠ compatibility proof
```

## Implications for automated proof tools

A BOMA logical requirement should not be identified automatically with a Lean, Coq, Agda, or Isabelle configuration.

A backend may expose classical axioms or tactics globally while a particular Brick does not logically require them. Conversely, a proof artifact may rely on a classical theorem even if BOMA metadata declares no such dependence.

Backend configuration is therefore evidence about the formal environment, not automatically the BOMA logical requirement.

## Findings

```text
Explicit declaration useful for provenance       SUPPORTED
Inference necessary for verification             SUPPORTED
Declaration alone sufficient                     REJECTED
Inference alone sufficient for provenance        REJECTED
Hybrid model                                     FAVORED / PROVISIONAL
Logical metadata replaces compatibility check    REJECTED
```

## Open questions

1. What is the minimal vocabulary for logical requirements?
2. Should requirements be expressed as named principles, logic families, or both?
3. How should conservative extensions be represented?
4. Can a Brick be verified as intuitionistically independent of classical principles?
5. How should backend-specific proof dependencies be mapped without conflating backend and BOMA language?
6. Should `declared`, `inferred`, and `verified` become part of the eventual machine-readable Brick record?

## Limitations

This is a conceptual probe. It is not a formal Lean/Coq/Agda/Isabelle verification of the proposed model and does not establish a normative BOMA rule.

## Epistemic status

```text
Observed:    declarations improve provenance
Observed:    formal analysis is still necessary
Supported:   hybrid declaration/inference model
Open:        exact schema
Open:        logical requirement vocabulary
Open:        trunk admission policy
```

## Migration note

This is a standalone PDCA record derived from the original probe. The original record remains preserved during migration and is not silently deleted or rewritten.
