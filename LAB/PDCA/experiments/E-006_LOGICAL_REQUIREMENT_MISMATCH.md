# E-006 — Logical Requirement Mismatch

**Cycle:** `PDCA-001`  
**Status:** Experimental / provisional  
**Source record:** `LAB/LOGICAL_REQUIREMENT_MISMATCH_PROBE_001.md`  
**Epistemic status:** `HYPOTHESIS`

## Question

If a Brick's declared logical requirements differ from those inferred from its formal content, can the architecture distinguish author error, backend configuration, deliberate strengthening, incomplete inference, and genuine incompatibility?

The probe explicitly avoids collapsing every mismatch into `invalid`.

## Test matrix

### Case A — Under-declaration

```text
Declared: none / intuitionistic-compatible
Inferred: classical principle required
```

If the inference is sound, the declaration is incomplete. The primary defect is requirement/provenance mismatch, not necessarily contradiction.

### Case B — Over-declaration

```text
Declared: classical
Inferred: intuitionistic sufficient
```

The content may remain valid, but the declared environment is stronger than necessary. This is not automatically invalid; it is an architectural strengthening that should be visible, especially in the intuitionistic trunk.

### Case C — Agreement

```text
Declared: classical
Inferred: classical
```

There is no declaration/inference mismatch. Compatibility with the active context still requires an independent check.

### Case D — Inconclusive inference

```text
Declared: intuitionistic
Inferred: unknown
```

An inconclusive inference does not establish that the declaration is correct or incorrect. The status must remain explicitly unresolved.

### Case E — Genuine context conflict

```text
Context: P
Brick: ¬P
Declared: intuitionistic
Inferred: intuitionistic
```

The requirement metadata can be internally coherent while the Brick is incompatible with its context. Logical requirement checking therefore cannot replace compatibility checking.

## Findings

The cases support a layered diagnosis:

```text
Requirement mismatch
        ≠
Logical contradiction
        ≠
Context incompatibility
        ≠
Backend failure
```

A future verifier should therefore be able to report more than a Boolean validity result.

## Provisional status model

A Brick may conceptually need independent statuses for:

```text
content status
requirement declaration status
requirement inference status
compatibility status
verification status
```

Example:

```text
Content:              verified
Declared requirement: classical
Inferred requirement: intuitionistic
Declaration status:   over-declared
Compatibility:        compatible
Overall:              admissible with warning
```

This is a conceptual model, not a final schema.

## Distinguishing failure sources

### Author error

The author declared an incorrect or incomplete requirement.

### Backend/toolchain configuration

A backend may expose classical facilities globally. That does not establish that a particular Brick semantically requires classical reasoning.

```text
backend has classical facilities
        ≠
Brick requires classical reasoning
```

### Deliberate architectural strengthening

An author may intentionally declare a stronger environment than minimally required. This is not automatically an error, but it is an architectural choice that must be explicit and, for the trunk, justified under the exceptional-use policy.

### Incomplete inference

Failure to detect a logical dependency is not proof that no such dependency exists.

```text
inferred = intuitionistic
```

must not automatically mean:

```text
proved independent of classical principles
```

unless the inference procedure provides that guarantee.

### Genuine incompatibility

A Brick may be well-formed and correctly annotated yet conflict with commitments already in context. This is a separate admissibility problem.

## Provisional diagnostic vocabulary

The probe suggests reporting categories such as:

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

## Architectural consequence

The Brick record should preserve evidence, not merely a final verdict. A future audit trail may need to retain:

```text
what the author declared
what the verifier inferred
what the backend exposed
what context was active
what decision was made
why the decision was made
```

This is directly relevant to PDCA: later correction must not destroy evidence of the earlier mismatch.

## Implications for the intuitionistic trunk

The trunk policy becomes more precise:

- An under-declared classical dependency should be surfaced and corrected or explicitly justified.
- An over-declared classical requirement should remain visible rather than silently accepted.
- A genuine context conflict remains a rejection condition unless the context itself is changed through an explicit architectural decision.
- An inconclusive inference must not be presented as proof of intuitionistic purity.

Thus the exceptional-use rule depends not only on the declared logic but also on the quality of evidence supporting that declaration.

## Preliminary conclusion

The hybrid model from `E-005` survives this probe and becomes more precise:

```text
Declaration → provenance
Inference   → evidence
Backend     → implementation evidence
Context     → compatibility domain
Decision    → architectural judgment
```

No layer should silently overwrite another.

## Relation to earlier experiments

```text
E-003 → dependency ≠ compatibility
E-004 → admissibility can be logic-relative
E-005 → declaration + inference should be distinguished
E-006 → mismatches require layered diagnosis
```

Each relation remains provisional.

## Limitations

This is a conceptual probe. It does not formally verify the inference model in Lean, Coq, Agda, Isabelle, or another proof assistant, and it does not establish a normative BOMA rule.

## Open questions

1. What can BOMA infer about logical dependence without becoming a proof assistant itself?
2. Which backend facts count as evidence rather than mere configuration?
3. How should uncertainty be represented?
4. When is over-declaration legitimate architecture rather than unnecessary strengthening?
5. Can the same Brick have different inferred requirements under different formalizations?
6. Should mismatch diagnostics be mandatory for every verified Brick or only when requirements are declared?

## Epistemic status

```text
Supported: declaration ≠ inference
Supported: layered diagnosis
Supported: logical requirement ≠ compatibility
Supported: backend environment ≠ BOMA requirement
Hypothesis: diagnostic vocabulary
Open: exact inference guarantees
Open: final Brick schema
```

## Migration note

This is a standalone PDCA record derived from the original probe. The original record remains preserved during migration and is not silently deleted or rewritten.
