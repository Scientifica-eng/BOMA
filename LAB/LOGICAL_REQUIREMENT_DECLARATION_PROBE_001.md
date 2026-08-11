# Logical Requirement Declaration Probe 001

**Cycle:** `PDCA-001`  
**Status:** Experimental / provisional  
**Purpose:** test whether a Brick should explicitly declare its logical requirements, or whether those requirements should be inferred from its formal content.

## 1. Question

Given a Brick `B`, should BOMA represent its logical requirements as explicit metadata, or should admissibility be determined solely by inspecting the Brick's content and the surrounding context?

Candidate models:

```text
Model A — Explicit declaration
Brick → requires LogicRegime / logical principles

Model B — Inference
Brick content + Context → inferred logical requirements

Model C — Hybrid
Brick may declare requirements, while the verifier independently checks or infers them.
```

## 2. Test cases

### T1 — Intuitionistically derivable commitment

```text
B1: P → P
```

This should require no additional classical commitment.

### T2 — Classical-strengthening commitment

```text
B2: P ∨ ¬P
```

This is not generally derivable in intuitionistic logic, but is available classically.

### T3 — Direct contradiction

```text
Context: P
B3: ¬P
```

This should be rejected under the ordinary reading, independently of whether B3 declares a logical requirement.

### T4 — Explicit declaration with insufficient content

```text
B4:
  content: P
  requires: classical
```

The declaration claims a stronger logical regime although the content does not visibly require it.

### T5 — Hidden classical dependency

```text
B5:
  content: theorem T
  proof payload uses a classical principle
  declaration: no logical requirement
```

This tests whether declaration alone can be trusted.

## 3. Observations

### T1

No explicit logical requirement is needed merely because a Brick is checked in an intuitionistic environment. The commitment is already compatible with the baseline regime.

**Observation:** an empty or minimal requirement field is meaningful.

### T2

The content itself can reveal that a stronger logical principle is involved. If B2 is introduced into an intuitionistic trunk, silently accepting it would hide an architectural decision.

**Observation:** explicit declaration is valuable for provenance even when inference can detect the requirement.

### T3

The declaration of a logical regime cannot rescue an actual contradiction with the context. A label such as `classical` does not turn `P` and `¬P` into compatible commitments.

**Observation:** logical requirement metadata is not a substitute for compatibility checking.

### T4

A declared requirement that is stronger than the content appears to need is not automatically an inconsistency. It is, however, an unnecessary architectural commitment candidate and should be visible as such.

**Observation:** declarations can express intentional context requirements, but they need justification when they strengthen the environment without being necessary.

### T5

If the formal payload genuinely depends on a classical principle while the declaration says nothing, the declaration is incomplete.

**Observation:** explicit metadata alone cannot be the source of truth. The backend/formal analysis must be capable of detecting or validating the requirement.

## 4. Preliminary result

The experiment favors **Model C — Hybrid**.

The reason is asymmetric:

```text
Declaration provides provenance and architectural intent.
Formal inference provides verification of actual dependence.
Context checking determines admissibility.
```

Therefore the three functions should not be collapsed into one field.

## 5. Proposed provisional representation

A Brick record may eventually expose something like:

```text
LogicalRequirements:
  declared: [...] 
  inferred: [...] 
  justification: ...
```

with a distinction between:

```text
Declared requirement
Inferred requirement
Verified requirement
Required justification
```

No exact schema is adopted yet.

## 6. Important consequence for the intuitionistic trunk

The experiment suggests that a classical-strengthening Brick entering an intuitionistic trunk should not be represented merely as:

```text
logic = classical
```

because that would erase the fact that the trunk was changed.

A more informative conceptual event is:

```text
Existing regime: intuitionistic
New Brick: B
Required strengthening: classical principle P
Reason: explicit justification
Decision: exceptional trunk event / branch event
```

This preserves provenance and supports later calibration.

## 7. Distinctions that should remain separate

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

These distinctions are provisional but appear useful.

## 8. Implications for automated proof tools

The BOMA layer should not identify a BOMA logical requirement merely with a Lean/Coq/Agda/Isabelle setting.

For example, a backend may provide classical axioms or tactics globally, while a particular BOMA Brick does not logically require them. Conversely, a proof artifact may rely on a classical theorem even if the BOMA metadata does not explicitly declare that dependence.

Therefore backend configuration is evidence about the formal environment, not automatically the BOMA logical requirement.

## 9. Findings

```text
Explicit declaration useful for provenance       SUPPORTED
Inference necessary for verification             SUPPORTED
Declaration alone sufficient                     REJECTED
Inference alone sufficient for provenance        REJECTED
Hybrid model                                     FAVORED / PROVISIONAL
Logical metadata replaces compatibility check    REJECTED
```

## 10. Open questions

1. What is the minimal vocabulary for logical requirements?
2. Should requirements be expressed as named principles, a logic family, or both?
3. How should conservative extensions be represented?
4. Can a Brick be verified as intuitionistically independent of classical principles?
5. How should backend-specific proof dependencies be mapped without conflating backend and BOMA language?
6. Should `declared`, `inferred`, and `verified` statuses become part of the eventual machine-readable Brick record?

## 11. Epistemic status

```text
Observed:    declarations improve provenance
Observed:    formal analysis is still necessary
Supported:   hybrid declaration/inference model
Open:        exact schema
Open:        logical requirement vocabulary
Open:        trunk admission policy
```

No normative BOMA rule is established by this probe.
