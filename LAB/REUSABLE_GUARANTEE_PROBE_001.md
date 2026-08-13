# Reusable Guarantee Probe 001

**Cycle:** `PDCA-001`  
**Status:** Experimental / provisional  
**Purpose:** test what makes a contribution safely reusable by another Brick without importing irrelevant commitments, hidden logical requirements, or unverifiable claims.

## 1. Question

A previous experiment suggested that a Brick may be understood through three distinct layers:

```text
Commitment
Evidence
Guarantee
```

The present experiment asks:

> What minimum conditions make a guarantee safely reusable by another Brick?

The objective is not to define the final Brick schema, but to identify the smallest set of conditions that survives negative controls.

## 2. Candidate model

A provider Brick `A` exports a contribution `X` through a guarantee `G`.

A consumer Brick `B` uses `G`.

Candidate safety conditions:

```text
1. Identity       — the consumed contribution is unambiguously identified.
2. Evidence       — there is evidence supporting the contribution.
3. Guarantee      — the provider states what the consumer may rely upon.
4. Scope          — the guarantee states its logical/contextual assumptions.
5. Compatibility  — the guarantee is admissible in B's context.
6. Provenance     — the consumer can trace the guarantee to its source/evidence.
```

These are hypotheses, not adopted requirements.

## 3. Positive control — complete reusable contribution

```text
A exports X
A provides evidence E
A exports guarantee G: X holds under intuitionistic context I
B consumes G
B's context satisfies I
```

**Result:** The contribution is provisionally safely reusable.

The consumer need not inspect all of A. It consumes the explicit contract `G` and can trace it to `E`.

## 4. Negative control — commitment without evidence

```text
A exports X
A declares X
No evidence E
```

**Result:** Not safely reusable as a verified contribution.

The declaration may be recorded as a commitment, but it cannot by itself support a verification claim.

Status:

```text
Commitment       PRESENT
Evidence         ABSENT
Guarantee        UNSUPPORTED
Reusable safely  NO
```

## 5. Negative control — evidence without scope

```text
A provides E for X
A says X is verified
No logical/contextual assumptions are stated
B operates under a restricted context
```

**Result:** Reuse is unresolved.

The evidence may be valid somewhere, but the consumer cannot determine whether its own context satisfies the conditions under which the guarantee is valid.

**Learning:** A reusable guarantee needs an explicit or inferable scope.

## 6. Negative control — valid guarantee, incompatible context

```text
G guarantees X under classical logic
B's target context is intuitionistic-only
```

**Result:** G is not admissible for B merely because G is valid in its own environment.

This reinforces:

```text
valid guarantee
    ≠
admissible guarantee
```

Admissibility remains contextual and policy-sensitive.

## 7. Negative control — hidden stronger requirement

```text
G is declared intuitionistically valid
actual evidence E requires an essential classical principle
```

**Result:** The guarantee is defective or at minimum mismatched with its evidence.

The consumer must not receive an apparently intuitionistic contract whose support requires stronger logic.

Status:

```text
Guarantee/evidence mismatch
```

This is distinct from merely having a stronger implementation environment if the exported guarantee itself has been independently certified at the weaker level.

## 8. Positive control — stronger provider, weaker exported guarantee

Suppose A is implemented in a classical backend environment but exports X together with an independently verified intuitionistic guarantee G.

**Result:** B may consume G without inheriting the provider's entire implementation environment, provided the intuitionistic guarantee itself is trustworthy.

This establishes an important separation:

```text
Provider implementation environment
        ≠
Consumer-facing logical guarantee
```

Backend strength alone does not determine BOMA admissibility.

## 9. Negative control — guarantee without provenance

```text
G claims X
G has no traceable source/evidence
```

**Result:** The claim may be mathematically true, but it is not sufficiently auditable for the proposed reusable-contract model.

**Learning:** Provenance is not the same as truth. It is a condition for accountable reuse.

## 10. Negative control — ambiguous identity

Suppose A exports a statement named `T`, but the consumer cannot uniquely determine which commitment/version/context `T` denotes.

**Result:** Safe reuse fails even if a valid proof exists somewhere.

**Learning:** Reusability requires identity and version/context resolution, not merely a proof artifact.

## 11. Positive control — weakening of guarantee

Suppose A internally knows a stronger result `G₂`, but exports only a weaker guarantee `G₁` that is fully certified in B's context.

**Result:** B may safely rely on `G₁` without importing `G₂`.

This suggests that guarantees may form a partial order by strength, but no ordering theory is adopted yet.

Conceptually:

```text
G₂  stronger
 ↓
G₁  weaker
```

A consumer should be allowed to depend on the weakest sufficient certified guarantee rather than the full provider capability.

## 12. Experiment — smallest safe reusable unit

Compare the following candidate packages:

### Package P1

```text
X
```

**Result:** insufficient.

### Package P2

```text
X + E
```

**Result:** better, but the consumer may still not know what E certifies or under which assumptions.

### Package P3

```text
X + E + G
```

**Result:** sufficient in the toy model when identity, scope, provenance, and compatibility are also resolvable.

### Package P4

```text
X + E + G + explicit scope + provenance
```

**Result:** strongest candidate among the tested minimal packages.

This suggests that the reusable unit may be conceptually closer to a **certified contribution** than to a bare statement.

## 13. Important distinction: reuse vs verification

The experiment distinguishes two questions:

```text
Can the artifact be verified?

Can another Brick safely reuse the verified result?
```

They are not equivalent.

A local backend proof can answer the first while leaving the second unresolved because the BOMA-level contract, scope, provenance, or logical interface is missing.

## 14. Important distinction: truth vs admissibility

A guarantee may be mathematically valid but inadmissible in a target context.

Conversely, a guarantee may be syntactically compatible while lacking sufficient evidence.

Therefore the following dimensions should remain separate:

```text
Truth / validity
Evidence
Guarantee
Context compatibility
Policy admissibility
Provenance
```

## 15. Provisional reusable-contract model

The experiment supports the following conceptual form:

```text
CertifiedContribution
├── identity
├── commitment
├── evidence
├── guarantee
├── scope / logical requirements
└── provenance
```

A consumer performs approximately:

```text
resolve(identity)
verify/provide evidence
interpret(guarantee)
check(scope ⊆ consumer context)
check(compatibility)
apply(policy)
```

No concrete data format is adopted.

## 16. Consequence for Brick identity

This experiment does **not** imply that every Brick must contain all six elements as intrinsic fields.

A Brick may be the producer of one or more certified contributions. Some metadata may belong to the exported interface rather than to the intrinsic Brick.

This distinction should prevent overengineering the atomic unit.

## 17. Consequence for Blocks

If a Block aggregates several Bricks, it should not automatically expose the union of all internal guarantees.

Instead, it may expose a selected set of certified contributions:

```text
Block
├── Brick A
│    ├── internal contribution
│    └── exported G₁
├── Brick B
│    └── exported G₂
└── public interface
     ├── G₁
     └── G₂
```

This keeps internal implementation separate from reusable external contracts.

## 18. Findings

```text
Commitment alone is insufficient for verified reuse          SUPPORTED
Evidence alone may be insufficient for contextual reuse     SUPPORTED
Guarantee requires scope/context interpretation              SUPPORTED PROVISIONALLY
Valid guarantee may be inadmissible in a target context      SUPPORTED
Provider's stronger implementation need not propagate        SUPPORTED
Provenance is required for auditable reuse                   SUPPORTED PROVISIONALLY
Identity ambiguity can prevent safe reuse                     SUPPORTED
Weakest sufficient certified guarantee is useful              SUPPORTED PROVISIONALLY
Certified contribution is a useful abstraction                SUPPORTED PROVISIONALLY
```

## 19. Current candidate principle

> A contribution is safely reusable only when the consumer can identify what is being reused, determine what is guaranteed, establish that the supporting evidence is adequate, determine the relevant logical/contextual scope, verify compatibility with its own context, and preserve provenance sufficient for audit.

This is an **experimental principle**, not a BOMA normative rule.

## 20. Open questions

1. Which of the six conditions are intrinsic to a Brick and which belong to its exported interface?
2. Can one Brick export multiple guarantees over the same commitment?
3. What is the formal meaning of guarantee strength?
4. How can a backend certificate establish a BOMA-level guarantee without conflating the two languages?
5. Can safe reuse be checked mechanically?
6. What is the minimum provenance needed for long-term reproducibility?
7. How are guarantees invalidated when a dependency changes?
8. How should Blocks compose and weaken/strengthen guarantees?

## 21. Epistemic status

```text
Certified contribution model       PROVISIONALLY SUPPORTED
Commitment/evidence/guarantee      SUPPORTED
Scope as reusable-contract data    PROVISIONALLY SUPPORTED
Provenance as audit requirement    PROVISIONALLY SUPPORTED
Guarantee strength ordering        OPEN
Mechanical reuse checker           OPEN
Final Brick schema                 OPEN
Final Block interface              OPEN
```

No normative BOMA rule is established by this probe.
