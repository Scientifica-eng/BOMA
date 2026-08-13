# Logical Requirement Mismatch Probe 001

**Cycle:** `PDCA-001`  
**Status:** Experimental / provisional  
**Purpose:** test how BOMA should represent a mismatch between a Brick's declared logical requirements and requirements inferred from its formal content.

## 1. Question

Suppose a Brick contains both:

```text
Declared requirement
Inferred requirement
```

and the two do not agree. Can the architecture distinguish:

1. author error;
2. backend/toolchain configuration;
3. deliberate architectural strengthening;
4. incomplete inference;
5. genuine logical incompatibility?

The experiment should avoid collapsing all mismatches into `invalid`.

## 2. Test matrix

### Case A — Under-declaration

```text
Declared: none / intuitionistic-compatible
Inferred: classical principle required
```

**Interpretation:** The declaration is incomplete if the inference is sound.

The important point is that the Brick is not automatically contradictory. The primary defect is **provenance/requirement mismatch**.

### Case B — Over-declaration

```text
Declared: classical
Inferred: intuitionistic sufficient
```

**Interpretation:** The content may be valid, but the declared environment is stronger than necessary.

This should not automatically invalidate the Brick. It should produce an architectural warning because unnecessary logical strengthening matters in the trunk.

### Case C — Declaration and inference agree

```text
Declared: classical
Inferred: classical
```

**Interpretation:** No declaration/inference mismatch. Compatibility with the current context still has to be checked separately.

### Case D — Inference inconclusive

```text
Declared: intuitionistic
Inferred: unknown
```

**Interpretation:** This is not evidence that the declaration is correct or incorrect. The status should remain explicitly unresolved.

### Case E — Genuine conflict

```text
Context: P
Brick: ¬P
Declared: intuitionistic
Inferred: intuitionistic
```

**Interpretation:** The requirement metadata is internally coherent, but the Brick conflicts with the existing context. This demonstrates why logical requirement checking cannot replace compatibility checking.

## 3. Findings

The five cases support a layered diagnosis.

```text
Requirement mismatch
        ≠
Logical contradiction
        ≠
Context incompatibility
        ≠
Backend failure
```

A future BOMA verifier should therefore be able to report more than a Boolean validity result.

## 4. Provisional status model

A Brick could conceptually have independent statuses for:

```text
content status
requirement declaration status
requirement inference status
compatibility status
verification status
```

For example:

```text
Content:              verified
Declared requirement: classical
Inferred requirement: intuitionistic
Declaration status:   over-declared
Compatibility:        compatible
Overall:              admissible with warning
```

This is deliberately a conceptual model, not a final schema.

## 5. Distinguishing the five failure sources

### 5.1 Author error

The author declared an incorrect or incomplete requirement.

Example:

```text
Declared: intuitionistic
Actual dependency: classical axiom
```

The system should preserve the declaration as historical provenance and report the mismatch rather than silently rewriting it.

### 5.2 Backend/toolchain configuration

A backend may be configured with classical facilities globally. That does not prove that a particular Brick semantically requires classical reasoning.

Therefore:

```text
backend has classical axioms available
        ≠
Brick requires classical reasoning
```

### 5.3 Deliberate architectural strengthening

An author may intentionally declare a stronger logical environment than is minimally required by the current proof payload because the Brick is designed for a broader future context.

This is not automatically an error. It is an architectural choice that must be explicit and, for the trunk, justified under the project's exceptional-use policy.

### 5.4 Incomplete inference

A verifier may fail to detect a logical dependency because the current analysis is incomplete.

Therefore:

```text
inferred = intuitionistic
```

must not always be interpreted as:

```text
proved independent of classical principles
```

unless the analysis itself provides that guarantee.

### 5.5 Genuine incompatibility

A Brick may be logically well-formed and correctly annotated yet conflict with commitments already in context.

This is a separate admissibility problem.

## 6. Provisional diagnostic lattice

The experiment suggests reporting at least:

```text
AGREEMENT
UNDER_DECLARED
OVER_DECLARED
INFERENCE_INCONCLUSIVE
CONTEXT_CONFLICT
BACKEND_ENVIRONMENT_MISMATCH
UNRESOLVED
```

These are candidate diagnostic categories, not BOMA normative terms.

## 7. Important architectural consequence

The Brick record should preserve **evidence**, not merely the final verdict.

A useful future audit trail may therefore retain:

```text
what the author declared
what the verifier inferred
what the backend actually exposed
what context was active
what decision was made
why the decision was made
```

This is particularly important for the PDCA method: a later correction must not destroy the evidence of the earlier mismatch.

## 8. Implications for the trunk

The intuitionistic trunk policy becomes more precise:

- An under-declared classical dependency should be surfaced and corrected or explicitly justified.
- An over-declared classical requirement should be visible rather than silently accepted.
- A genuine context conflict remains a rejection condition unless the context itself is changed through an explicit architectural decision.
- An inconclusive inference must not be presented as proof of intuitionistic purity.

Thus the trunk's exceptional-use rule depends not only on the declared logic but also on the quality of the evidence supporting that declaration.

## 9. Preliminary conclusion

The hybrid model survives this probe and becomes more precise:

```text
Declaration → provenance
Inference   → evidence
Backend     → implementation evidence
Context     → compatibility domain
Decision    → architectural judgment
```

No single layer should silently overwrite another.

## 10. Open questions

1. What exactly can BOMA infer about logical dependence without becoming a proof assistant itself?
2. Which backend facts should count as evidence, and which are merely configuration?
3. How should uncertainty be represented quantitatively or categorically?
4. When is over-declaration legitimate architecture rather than unnecessary strengthening?
5. Can the same Brick have different inferred requirements under different formalizations?
6. Should mismatch diagnostics be mandatory for every verified Brick or only when requirements are declared?

## 11. Epistemic status

```text
Supported: layered diagnosis
Supported: declaration ≠ inference
Supported: logical requirement ≠ compatibility
Supported: backend environment ≠ BOMA requirement
Hypothesis: diagnostic status vocabulary
Open: exact inference guarantees
Open: final Brick schema
```
