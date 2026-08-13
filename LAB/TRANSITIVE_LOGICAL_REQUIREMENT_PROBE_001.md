# Transitive Logical Requirement Probe 001

**Cycle:** `PDCA-001`  
**Status:** Experimental / provisional  
**Purpose:** determine whether a Brick inherits every logical requirement of its dependencies, or whether logical requirements must be established relative to the actual use of those dependencies.

## 1. Question

Suppose:

```text
A requires classical reasoning
B depends on A
```

Does it follow that:

```text
B requires classical reasoning?
```

The naive rule would be:

```text
Requirements(B) = union of requirements of all dependencies
```

This experiment tests that rule.

## 2. Control cases

### Case A — Direct logical dependence

```text
A requires classical
B depends on A
B uses a theorem of A whose proof depends essentially on the classical principle
```

**Result:** B inherits a genuine logical requirement through its use of A.

Provisional conclusion:

```text
B requires classical
```

### Case B — Dependency without logical inheritance

```text
A requires classical
B depends on A
B uses only a result of A that is independently intuitionistically established
```

**Result:** The mere existence of the dependency does not establish that B requires classical reasoning.

Provisional conclusion:

```text
B may remain intuitionistically admissible
```

This is the critical counterexample to blind requirement union.

### Case C — A's classical requirement is irrelevant to B's interface

```text
A contains several commitments:
  a1 — intuitionistic
  a2 — classical

B depends on A but consumes only a1
```

**Result:** B should not automatically inherit `classical` merely because A as a whole contains a classical commitment.

The logical requirement relevant to B is determined by the portion of A actually used and the guarantees attached to that portion.

### Case D — Classical requirement hidden behind an opaque interface

```text
A exposes theorem T
A's internal proof of T uses classical reasoning
B consumes T
B does not inspect A's proof
```

Two interpretations are possible:

1. If T is certified as an intuitionistically valid theorem independently of A's internal proof method, B need not inherit the classical requirement.
2. If T's available certificate is itself only classical, B inherits the requirement through the certificate it relies upon.

**Learning:** logical dependence is attached to the evidence/guarantee being consumed, not simply to the implementation history of the provider.

## 3. Key distinction

The experiment rejects the simplistic rule:

```text
B depends on A
AND
A requires L
⇒
B requires L
```

as a universal rule.

A more precise candidate is:

```text
B requires L
```

when the evidence B actually relies on from A requires L, or when B's own formal content otherwise requires L.

## 4. Dependency and requirement graphs

This suggests that BOMA may eventually need two distinct relations:

```text
Dependency graph
A ──depends_on──→ B

Logical-requirement/evidence graph
A.evidence ──requires──→ L
B ──uses──→ A.evidence
```

The first describes structural dependence.
The second describes logical dependence of the evidence actually consumed.

They should not be collapsed.

## 5. Interface-level formulation

A useful provisional abstraction is:

```text
A provides:
  artifact X
  guarantee G
  logical requirement R_X
```

Then B consumes X through G.

B's requirement is determined by the guarantee/certificate it consumes, not by every property of A.

Conceptually:

```text
A
├── X₁ : intuitionistically certified
└── X₂ : classically certified

B uses X₁

⇒ B need not inherit classical
```

while:

```text
B uses X₂

⇒ B inherits the relevant classical requirement
```

## 6. Consequence for branches

This materially changes branch convergence.

Suppose a classical branch contains A, but the convergence Brick M consumes only an intuitionistically certified interface of A.

Then:

```text
classical branch history
        ≠
classical requirement of M
```

M may therefore be eligible for convergence into the intuitionistic trunk, subject to independent compatibility and verification.

However, the claim that M is intuitionistically independent must be supported by an actual certificate or analysis; it cannot be inferred merely from the shape of the dependency graph.

## 7. Provisional requirement propagation rule

Reject:

```text
Requirements(B) = union(all Requirements(dependencies(B)))
```

Prefer investigating:

```text
Requirements(B)
  = requirements of B's own content
    ∪ requirements of the certified evidence actually consumed by B
```

The exact semantics of `requirements of evidence` remains open.

## 8. Important limitation

The experiment uses conceptual proof certificates and interfaces. It does not yet implement a real dependency analyzer in Lean, Coq, Agda, Isabelle, or another backend.

Therefore it demonstrates an architectural distinction, not a completed algorithm.

In particular, proving that a theorem has an intuitionistic certificate may itself require a proof-theoretic analysis stronger than simple source-code inspection.

## 9. Findings

```text
Dependency does not universally propagate logical requirements     SUPPORTED
Requirement inheritance may depend on consumed evidence            SUPPORTED PROVISIONALLY
Provider's unrelated stronger commitments need not propagate       SUPPORTED PROVISIONALLY
Branch history does not automatically determine convergence logic   SUPPORTED PROVISIONALLY
Naive transitive union                                                  REJECTED
```

## 10. Architectural implications

The experiment suggests that BOMA should distinguish at least:

```text
Structural dependency
Logical requirement
Evidence/certificate consumed
Provider capability
Context
```

A future Brick record may therefore need a relation more precise than:

```text
depends_on: [A]
```

For example, conceptually:

```text
depends_on:
  - Brick: A
    uses: theorem_T
    evidence: certificate_E
```

No concrete syntax is adopted yet.

## 11. Open questions

1. What constitutes a BOMA-level certificate of intuitionistic independence?
2. Can logical requirements be attached to individual exported commitments rather than entire Bricks?
3. How should opaque external theorems be classified?
4. How should backend proof terms be mapped into BOMA evidence without conflating languages?
5. Can requirement propagation be soundly automated?
6. Does a Brick need to expose a public logical interface?
7. How should this interact with `Block` as a possible grouping of Bricks?

## 12. Epistemic status

```text
Supported: dependency ≠ universal requirement inheritance
Supported provisionally: evidence-sensitive propagation
Rejected: blind transitive requirement union
Open: certificate model
Open: implementation-level inference
Open: final Brick schema
```

No normative BOMA rule is established by this probe.
