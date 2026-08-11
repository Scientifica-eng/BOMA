# E-008 — Transitive Logical Requirement

**Cycle:** `PDCA-001`  
**Status:** Experimental / provisional  
**Source record:** `LAB/TRANSITIVE_LOGICAL_REQUIREMENT_PROBE_001.md`  
**Epistemic status:** `HYPOTHESIS`

## Question

If a Brick depends on another Brick that has a stronger logical requirement, does that requirement automatically propagate to the dependent Brick?

The naive rule under test is:

```text
Requirements(B) = union(requirements of all dependencies(B))
```

## Control cases

### Case A — Direct logical dependence

```text
A requires classical
B depends on A
B uses a theorem of A whose proof depends essentially on the classical principle
```

**Result:** B inherits a genuine classical requirement through the evidence it consumes.

### Case B — Dependency without logical inheritance

```text
A requires classical
B depends on A
B uses a result of A that is independently intuitionistically established
```

**Result:** dependency alone does not establish that B requires classical reasoning.

This is the critical counterexample to blind requirement union.

### Case C — Stronger commitment irrelevant to the consumed interface

```text
A:
  a1 — intuitionistic
  a2 — classical

B depends on A but consumes only a1
```

**Result:** B should not automatically inherit the classical requirement merely because A as a whole contains a classical commitment.

### Case D — Opaque provider proof

```text
A exposes theorem T
A's internal proof of T uses classical reasoning
B consumes T
```

Two cases must be distinguished:

1. If T has an independently certified intuitionistic justification, B need not inherit the classical requirement.
2. If the certificate available to B itself requires classical reasoning, B inherits that relevant requirement.

The logical dependence is therefore attached to the evidence/guarantee actually consumed, not simply to the implementation history of the provider.

## Finding: naive transitive propagation is rejected

The universal rule:

```text
B depends on A
AND
A requires L
⇒
B requires L
```

is rejected as a general rule.

A more precise candidate is:

```text
B requires L
```

when B's own content requires L, or when the certified evidence actually consumed from its dependencies requires L.

## Two distinct graphs

The probe suggests keeping separate:

```text
Structural dependency graph
A ──depends_on──→ B

Logical/evidence graph
A.evidence ──requires──→ L
B ──uses──→ A.evidence
```

Structural dependence describes architecture. Logical dependence describes the requirements of the evidence actually consumed.

## Interface-level abstraction

A provider may expose multiple artifacts with different guarantees:

```text
A
├── X₁ : intuitionistically certified
└── X₂ : classically certified
```

If B consumes X₁:

```text
B need not inherit classical
```

If B consumes X₂:

```text
B inherits the relevant classical requirement
```

This suggests that future requirement analysis may need to operate at the level of exported commitments/evidence rather than treating the whole Brick as having one undifferentiated logical requirement.

## Consequence for branch convergence

Suppose a classical branch contains A, but a convergence Brick M consumes only an intuitionistically certified interface of A.

Then:

```text
classical branch history
        ≠
classical requirement of M
```

M may therefore be eligible for convergence into the intuitionistic trunk, subject to independent compatibility and verification.

However, intuitionistic independence must be supported by an actual certificate or sound analysis; it cannot be inferred from the dependency graph alone.

## Provisional requirement model

Reject:

```text
Requirements(B) = union(all Requirements(dependencies(B)))
```

Investigate instead:

```text
Requirements(B)
  = requirements of B's own content
    ∪ requirements of the certified evidence actually consumed by B
```

The exact semantics of evidence requirements remains open.

## Architectural implications

The experiment suggests distinguishing at least:

```text
Structural dependency
Logical requirement
Evidence / certificate consumed
Provider capability
Context
```

A future dependency record may therefore need to say more than:

```text
depends_on: [A]
```

A conceptual richer relation could be:

```text
depends_on:
  - Brick: A
    uses: theorem_T
    evidence: certificate_E
```

No concrete syntax is adopted.

## Findings

```text
Dependency does not universally propagate logical requirements   SUPPORTED
Requirement inheritance may depend on consumed evidence         SUPPORTED PROVISIONALLY
Provider's unrelated stronger commitments need not propagate   SUPPORTED PROVISIONALLY
Branch history does not automatically determine convergence      SUPPORTED PROVISIONALLY
Naive transitive requirement union                               REJECTED
```

## Relation to previous experiments

```text
E-004 → admissibility is logic-relative
E-005 → declaration and inference should be distinguished
E-006 → mismatches need layered diagnosis
E-007 → branch context does not determine intrinsic Brick identity
E-008 → structural dependency does not universally propagate logic
```

This strengthens the need to keep structural and logical relations separate.

## Limitations

This is a conceptual probe. It does not implement a dependency analyzer in Lean, Coq, Agda, Isabelle, or another backend.

It therefore establishes an architectural distinction rather than a completed inference algorithm.

In particular, proving intuitionistic independence may itself require proof-theoretic analysis rather than source-code inspection.

## Open questions

1. What constitutes a BOMA-level certificate of intuitionistic independence?
2. Can logical requirements attach to individual exported commitments rather than entire Bricks?
3. How should opaque external theorems be classified?
4. How should backend proof terms map into BOMA evidence without conflating languages?
5. Can requirement propagation be soundly automated?
6. Does a Brick need to expose a public logical interface?
7. How should this interact with `Block` as a possible grouping of Bricks?

## Epistemic status

```text
Supported: dependency ≠ universal requirement inheritance
Supported provisionally: evidence-sensitive propagation
Rejected: blind transitive requirement union
Open: certificate model
Open: implementation-level inference
Open: final Brick schema
```

No normative BOMA rule is established by this probe.

## Migration note

This is a standalone PDCA record derived from the original probe. The original record remains preserved during migration and is not silently deleted or rewritten.
