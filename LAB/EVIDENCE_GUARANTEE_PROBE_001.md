# Evidence / Guarantee Probe 001

**Cycle:** `PDCA-001`  
**Status:** Experimental / provisional  
**Purpose:** investigate whether a BOMA Brick should distinguish its mathematical commitment from the evidence supporting it and the guarantee offered to consumers.

## 1. Question

The previous probe showed that logical requirements may depend on the evidence actually consumed rather than on the full provider Brick.

This raises a more basic question:

> What does a Brick actually provide?

Candidate answers:

```text
Commitment
Evidence
Guarantee
```

The experiment tests whether these should be treated as distinct architectural layers.

## 2. Minimal model

Consider a Brick `A` exposing a commitment `X`.

There are at least three different statements:

```text
A commits to X

A provides evidence E for X

A guarantees G about X/E
```

These statements are related, but they are not obviously identical.

## 3. Case A — Commitment without accepted evidence

```text
A declares: X
Evidence: absent
```

**Result:** A declaration is not sufficient to establish that X is verified.

Provisional status:

```text
Commitment: present
Evidence: missing
Verification: unresolved
```

This demonstrates that a Brick should not collapse author assertion and verification result.

## 4. Case B — Commitment with backend evidence

```text
A declares: X
Backend artifact: E
Backend accepts E
```

**Result:** We have evidence that the selected backend accepts the artifact. This still does not automatically establish every BOMA-level semantic claim about X.

Provisional status:

```text
Commitment: present
Evidence: backend-verified
BOMA interpretation: separate
```

This preserves the earlier BOMA/backend separation.

## 5. Case C — Evidence with a stated guarantee

Suppose A exposes:

```text
X
certificate E
Guarantee G: E certifies X under logic L
```

A consumer B may rely on G without reproducing the internal construction of E.

**Result:** The guarantee is part of the interface consumed by B.

This supports distinguishing:

```text
internal evidence
```

from:

```text
exported guarantee
```

## 6. Case D — Same commitment, different evidence

Two Bricks may both establish X:

```text
A₁: X via intuitionistic evidence
A₂: X via classical evidence
```

The commitment is extensionally similar, but the logical requirements of the evidence may differ.

Therefore:

```text
Commitment identity
        ≠
Evidence identity
        ≠
Logical requirement of evidence
```

This is directly relevant to branch convergence.

## 7. Case E — Same evidence, different guarantees

An artifact may establish X but be exported under different interfaces:

```text
G₁: X is available only under classical assumptions
G₂: X has an intuitionistic certificate
```

The consumer's admissibility depends on the guarantee it is entitled to rely upon.

This suggests that logical requirements belong at least partly to **certified interfaces**, not only to source Bricks.

## 8. Case F — Invalid guarantee

Suppose:

```text
X
E appears to support X
G claims intuitionistic validity
actual E requires classical reasoning
```

**Result:** The guarantee is defective even if the underlying commitment X happens to be true in a stronger environment.

This is not merely a content error. It is an **evidence/guarantee mismatch**.

A future verifier should therefore be able to distinguish:

```text
content failure
certificate failure
guarantee failure
```

## 9. Provisional three-layer model

The experiments support retaining the following distinction:

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

This is a conceptual model, not yet a final schema.

## 10. Why Guarantee is not redundant

It may be tempting to represent only:

```text
commitment + proof
```

But a consumer needs to know what has been certified for reuse.

For example, a proof artifact might be internally classical while the exported theorem has an independently verified intuitionistic certificate. Conversely, a provider may expose only a weaker guarantee than its internal implementation could support.

Therefore the consumer-facing contract can be narrower than the provider's internal state.

## 11. Consequence for logical requirement propagation

The previous rule can now be refined.

Reject:

```text
Requirement(B) = union(Requirements(all dependencies))
```

Investigate instead:

```text
Requirement(B)
  = requirements(B's own content)
    ∪ requirements(of guarantees consumed by B)
```

The guarantee is the candidate bridge between structural dependency and logical requirement.

## 12. Consequence for BOMA/backend separation

A backend proof term may be one piece of evidence, but BOMA should not necessarily expose the backend's internal vocabulary as its own.

Conceptually:

```text
BOMA:
  Commitment X
  Evidence E
  Guarantee G

Lean:
  theorem / term / declaration

Coq:
  theorem / proof term

Agda:
  type / inhabitant

Isabelle:
  theorem / proof object
```

The backend artifacts implement or substantiate BOMA evidence; they do not automatically redefine BOMA's ontology.

## 13. Negative control — proof artifact without reusable guarantee

A backend may successfully check a local derivation but provide no explicit reusable interface.

**Result:** This is evidence of local verification, but not necessarily a reusable BOMA guarantee.

Thus:

```text
verified artifact
        ≠
certified interface
```

This distinction may become important when a Block aggregates many Bricks.

## 14. Provisional statuses

A future system may need to report independently:

```text
COMMITMENT_DECLARED
EVIDENCE_PRESENT
EVIDENCE_VERIFIED
GUARANTEE_DECLARED
GUARANTEE_VERIFIED
GUARANTEE_MISMATCH
UNRESOLVED
```

No final vocabulary is adopted.

## 15. Findings

```text
Commitment ≠ Evidence                         SUPPORTED
Evidence ≠ Guarantee                          SUPPORTED PROVISIONALLY
Backend verification ≠ BOMA guarantee         SUPPORTED
Same commitment can have different evidence   SUPPORTED
Logical requirement can attach to guarantee   SUPPORTED PROVISIONALLY
Invalid guarantee is distinct from content failure SUPPORTED
```

## 16. Architectural implication

A Brick may eventually be better understood not as a single statement but as a **verifiable contribution with an explicit reusable contract**.

However, this must not turn every Brick into an unnecessarily heavy formal object. The next experiment should test the smallest structure that can preserve these distinctions without making the system impractical.

## 17. Open questions

1. Is Guarantee intrinsic to every Brick or only to exported interfaces?
2. Can a Brick have multiple guarantees for the same commitment?
3. Can guarantees be weaker or stronger than the provider's internal evidence?
4. Who is authoritative for a guarantee: BOMA, a backend, or both?
5. How should a Block aggregate guarantees from its Bricks?
6. Can a guarantee be consumed without importing the entire provider Brick?
7. What is the minimum metadata required to preserve provenance without overengineering the Brick?

## 18. Epistemic status

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
