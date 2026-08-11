# B-001 — Cross-Case Identity Criterion Test

**Cycle:** PDCA-001  
**Status:** Experimental test  
**Purpose:** determine whether the provisional criteria extracted from B-001 are specific to B-001 or can be applied to a structurally different candidate.

## 1. Hypothesis under test

The current provisional criterion says that a candidate deserves independent Brick status only when it has, at the declared architectural level:

1. an identifiable subject/content;
2. self-contained intended meaning;
3. traceable dependencies;
4. a non-artificial reason for existing as a separate unit.

The criterion is deliberately not being promoted to a BOMA rule yet.

## 2. Control candidate

We introduce a **control candidate**, not a new Brick:

> **C-CTRL-001 — a successor operation considered without a separately introduced carrier/domain.**

This is deliberately chosen because it is structurally related to B-001 but should expose whether the criterion incorrectly labels every separable syntactic component as an independent Brick.

The control candidate is not added to `BRICKS/` and does not receive a Brick ID.

## 3. Criterion A — Identifiability

Question:

> Can the candidate be identified independently without silently importing the rest of B-001?

For `C-CTRL-001`, the intended content is:

```text
successor : X → X
```

But the carrier `X` must itself be specified. Therefore the control can be named syntactically, but its BOMA subject is not determined without a domain/carrier commitment.

**Result:** FAIL for independent BOMA identifiability.

## 4. Criterion B — Self-contained intended meaning

A successor operation has no determined object-level meaning unless its domain and codomain are fixed. The expression

```text
successor : X → X
```

is therefore a schema for a family of possible operations until `X` is fixed.

**Result:** FAIL for self-contained BOMA meaning.

## 5. Criterion C — Traceable dependency

The control has an explicit dependency on a carrier/domain:

```text
successor
    ↓
carrier/domain
```

The dependency is traceable, but this criterion alone is insufficient to grant Brick status.

**Result:** PASS as a dependency test, but not sufficient for Brick identity.

## 6. Criterion D — Non-artificiality

Separating successor from its carrier merely because Lean can express the function type independently would create an artificial architectural unit. Its intended BOMA meaning is incomplete without the domain commitment.

**Result:** FAIL.

## 7. Control result

| Criterion | C-CTRL-001 |
|---|---|
| Identifiable independently | FAIL |
| Self-contained meaning | FAIL |
| Dependencies traceable | PASS |
| Non-artificial separation | FAIL |
| Independent Brick candidate | **NO** |

This is useful because the criterion rejects a backend-separable component that should not automatically become a Brick.

## 8. Comparison with `domain + initial`

The earlier candidate `domain + initial` was found to have a provisional independent identity because its content can be stated without committing to successor and because its intended meaning remains coherent as a foundational object-level commitment.

The contrast is therefore:

```text
Candidate A: domain + initial
    → independent meaning: supported
    → candidate Brick identity: supported provisionally

Candidate B: successor without carrier/domain
    → independent meaning: not supported
    → candidate Brick identity: rejected
```

This comparison strengthens the criterion because it discriminates between two cases rather than merely describing the original case.

## 9. What the test does NOT prove

The control test does not prove that `domain + initial` must become a Brick.

It only provides evidence that the provisional identity criterion is not vacuous and is not simply equivalent to backend separability.

It also does not settle whether `domain + initial` should be the first Brick or whether a still smaller meaningful foundation exists.

## 10. Evidence

**E-009 — Cross-case identity criterion test**

The criterion was applied to a structurally related control candidate and rejected it as an independent Brick candidate because its meaning depends essentially on an unspecified carrier/domain.

Status: **Observed / provisional evidence**.

## 11. Architectural consequence

The laboratory now has evidence for a stronger distinction:

```text
Backend separability
        ≠
Independent BOMA identity
        ≠
Automatic Brick status
```

The current provisional rule is:

> **A candidate component should not receive Brick status merely because it can be represented or verified independently by a backend. It must also possess an independently meaningful BOMA identity at the declared architectural level.**

This remains provisional until tested against additional cases.

## 12. Next test

Apply the same criterion to a positive control: a candidate that is intentionally designed to have an independent identity but is dependent on a prior Brick. The purpose is to verify that **dependency does not disqualify Brick status**.
