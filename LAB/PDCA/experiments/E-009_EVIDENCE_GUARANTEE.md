# E-009 — Evidence / Guarantee

**Cycle:** `PDCA-001`  
**Status:** Experimental / provisional  
**Source record:** `LAB/EVIDENCE_GUARANTEE_PROBE_001.md`  
**Epistemic status:** `HYPOTHESIS`

## Question

What does a Brick actually provide: a commitment, evidence for that commitment, a guarantee that another Brick may safely rely upon, or some combination of these?

## Minimal model

For a Brick `A` exposing a commitment `X`, distinguish:

```text
A commits to X
A provides evidence E for X
A offers guarantee G about X/E
```

These statements are related but are not assumed to be identical.

## Cases

### Case A — Commitment without accepted evidence

```text
A declares: X
Evidence: absent
```

A declaration alone does not establish verification.

```text
Commitment: present
Evidence: missing
Verification: unresolved
```

### Case B — Commitment with backend evidence

```text
A declares: X
Backend artifact: E
Backend accepts E
```

This establishes backend-level evidence about the artifact. It does not automatically establish every BOMA-level semantic claim about X.

Thus:

```text
backend verification ≠ automatic BOMA guarantee
```

### Case C — Evidence with an explicit guarantee

Suppose A exposes:

```text
X
certificate E
Guarantee G: E certifies X under logic L
```

A consumer B may rely on G without reproducing A's internal construction.

This supports distinguishing internal evidence from the exported guarantee.

### Case D — Same commitment, different evidence

```text
A₁: X via intuitionistic evidence
A₂: X via classical evidence
```

The commitment may be extensionally the same while the evidence and its logical requirements differ.

Therefore:

```text
Commitment identity
        ≠
Evidence identity
        ≠
Logical requirement of evidence
```

### Case E — Same commitment/evidence, different guarantees

An artifact may support X while being exposed through different contracts:

```text
G₁: X available only under classical assumptions
G₂: X has an intuitionistic certificate
```

The consumer's admissibility depends on the guarantee it is entitled to rely upon.

This makes the consumer-facing contract potentially narrower than the provider's internal capabilities.

### Case F — Defective guarantee

```text
X
E appears to support X
G claims intuitionistic validity
actual E requires classical reasoning
```

The commitment may be valid in a stronger environment while the guarantee is defective.

This is an evidence/guarantee mismatch, distinct from a mere content error.

## Provisional three-layer model

The experiment supports retaining:

```text
Brick
 │
 ├── Commitment
 │     What is asserted / introduced?
 │
 ├── Evidence
 │     What supports the commitment?
 │
 └── Guarantee
       What may another Brick safely rely on?
```

This is a conceptual model, not a final schema.

## Why Guarantee is not redundant

A proof artifact and a reusable contract answer different questions.

A provider may have strong internal capabilities while intentionally exposing a narrower guarantee. Conversely, an internal proof may use classical machinery while the exported result has an independently verified intuitionistic certificate.

Therefore:

```text
internal capability
        ≠
consumer-facing guarantee
```

## Consequence for logical requirement propagation

The earlier blind rule remains rejected:

```text
Requirement(B) = union(Requirements(all dependencies))
```

A more precise candidate is:

```text
Requirement(B)
  = requirements(B's own content)
    ∪ requirements(of guarantees consumed by B)
```

The guarantee is a candidate bridge between structural dependency and logical requirement.

## BOMA / backend separation

Backend artifacts may substantiate BOMA evidence without becoming BOMA's ontology.

Conceptually:

```text
BOMA:
  Commitment X
  Evidence E
  Guarantee G

Backend:
  theorem / proof term / declaration / proof object
```

Lean, Coq, Agda, Isabelle, and other systems can provide implementation-level evidence; their internal vocabulary should not automatically redefine BOMA concepts.

## Negative control

A backend may successfully verify a local derivation without exposing a reusable interface.

Therefore:

```text
verified artifact
        ≠
certified reusable interface
```

This distinction becomes especially relevant if a future `Block` aggregates multiple Bricks.

## Provisional statuses

A future system may need independent statuses such as:

```text
COMMITMENT_DECLARED
EVIDENCE_PRESENT
EVIDENCE_VERIFIED
GUARANTEE_DECLARED
GUARANTEE_VERIFIED
GUARANTEE_MISMATCH
UNRESOLVED
```

These are candidate diagnostics, not normative BOMA vocabulary.

## Findings

```text
Commitment ≠ Evidence                         SUPPORTED
Evidence ≠ Guarantee                          SUPPORTED PROVISIONALLY
Backend verification ≠ BOMA guarantee         SUPPORTED
Same commitment can have different evidence   SUPPORTED
Logical requirement can attach to guarantee   SUPPORTED PROVISIONALLY
Invalid guarantee distinct from content error SUPPORTED
```

## Architectural implication

A Brick may eventually be better understood as a **verifiable contribution with an explicit reusable contract**, rather than as a bare statement.

This must still be tested against complexity: the model should preserve the distinctions without making every Brick unnecessarily heavy.

## Relation to previous experiments

```text
E-008 → requirements may depend on consumed evidence
E-009 → evidence and consumer-facing guarantee are distinct candidates
```

This gives a more precise interpretation of what it means for a dependency to be logically relevant.

## Limitations

This is a conceptual probe. It does not implement the evidence/guarantee model in Lean, Coq, Agda, Isabelle, or another backend and does not establish a normative BOMA rule.

## Open questions

1. Is Guarantee intrinsic to every Brick or only to exported interfaces?
2. Can a Brick have multiple guarantees for the same commitment?
3. Can guarantees be weaker or stronger than provider evidence?
4. Who is authoritative for a guarantee: BOMA, a backend, or both?
5. How should a Block aggregate guarantees from its Bricks?
6. Can a guarantee be consumed without importing the entire provider Brick?
7. What is the minimum metadata required to preserve provenance without overengineering the Brick?

## Epistemic status

```text
Supported: commitment/evidence distinction
Supported: backend verification/evidence distinction
Supported provisionally: guarantee as consumer-facing contract
Supported provisionally: guarantee-sensitive logical propagation
Open: guarantee ontology
Open: final Brick representation
Open: Block-level aggregation
```

No normative BOMA rule is established by this probe.

## Migration note

This is a standalone PDCA record derived from the original probe. The original record remains preserved during migration and is not silently deleted or rewritten.
