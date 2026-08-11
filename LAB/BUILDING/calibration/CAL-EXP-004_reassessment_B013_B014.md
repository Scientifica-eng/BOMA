# CAL-EXP-004 — Reassessment of B-013 and B-014

**Cycle:** `CAL-001`  
**Scope:** `B-013`–`B-014`  
**Status:** Provisional decision

## 1. Intention / Goal

Reassess the depth-based Bricks after replacing numerical equality of depths with structural equivalence of construction histories.

## 2. Findings

### B-013 — Depth Invariant

The original claim treated depth as an invariant associated with the number of extension occurrences. This formulation carries a risk of hidden numerical structure.

After CAL-EXP-003, the safer formulation is:

> A concrete construction history can be abstracted by its structural form, while details of token identity and provenance may be forgotten.

This reformulation no longer requires assigning a numerical depth to the history.

**Decision:** Retain B-013 as an experimental predecessor, but regard its numerical-depth wording as superseded. A repaired Brick should be created only after the structural abstraction has been made explicit.

### B-014 — Compatibility Under Extension

The original B-014 states compatibility using equal depth. Its underlying intuition survives, but the justification should be reformulated:

If two construction histories are structurally equivalent, then applying the same extension protocol to each produces histories that remain structurally equivalent, provided the extension protocol acts uniformly on the relevant constructional role.

This is a structural congruence claim, not a numerical equality claim.

**Decision:** Retain B-014 as evidence of the original route, but do not treat it as a valid numerical/pre-numerical foundation in its original wording.

## 3. New Status of the Path

The calibration has therefore separated the useful idea from the problematic language:

```text
OLD:
concrete history → numerical depth → equal depth → extension compatibility

REPAIRED:
concrete history → structural form → structural equivalence → extension compatibility
```

The repaired route is methodologically cleaner, but it has a cost: we now need to construct the notion of structural equivalence carefully rather than importing an abstract equivalence relation as a finished mathematical object.

## 4. Decision

1. Mark the original numerical formulations of B-013 and B-014 as superseded for the main construction path.
2. Preserve the original Bricks as historical experimental records.
3. Do not delete or overwrite the historical evidence.
4. Create repaired Bricks only after the next calibration step establishes the primitive status and operational behavior of structural equivalence.
5. Do not create B-015 yet.

## 5. Epistemic Status

**Reassessment complete; repaired route accepted provisionally.**

## 6. Next Cycle

Run `CAL-EXP-005`: establish the identification criterion for the eventual natural-number structure without making the criterion itself a hidden substitute for the natural numbers.
