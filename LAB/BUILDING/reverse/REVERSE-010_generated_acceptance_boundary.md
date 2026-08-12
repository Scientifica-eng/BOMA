# REVERSE-010 — Generated Acceptance Boundary

**Path:** Reverse engineering  
**Status:** Provisional result

## 1. Intention / Goal

Test whether the notion of a generated carrier is sufficient to determine the domain without adding an independent membership rule.

## 2. Experiment

Start with an initial carrier `c₀` and an admissible transition `E`:

```text
c₀ → c₁ → c₂ → ...
```

Consider three candidate acceptance rules:

### A — Actual generation
A carrier is admitted because it is actually produced by the protocol.

### B — Potential generation
A carrier is admitted if it could be produced by some permitted finite continuation of the protocol.

### C — External domain selection
A carrier is admitted by a separate rule specifying membership in a mathematical domain.

## 3. Result

Rule A is the weakest operational criterion. It requires only the constructional history already present.

Rule B is stronger than A and introduces a modality of possibility that must itself be specified; it is not automatically equivalent to actual generation.

Rule C is clearly a further mathematical choice because it introduces an independent domain-selection relation.

Therefore the reverse decomposition can proceed furthest without an external membership rule by using **actual generation** as the provisional acceptance criterion.

However, this does not create a completed mathematical domain by itself. It yields the currently generated carriers, or the constructional horizon of the protocol. Moving from that horizon to a formal mathematical domain still requires an explicit identification/closure choice.

## 4. Critical Finding

The boundary between pre-mathematical construction and mathematical domain formation is now sharper:

```text
actual generation
      ↓
currently generated carriers
      ↓
[explicit choice / formalization boundary]
      ↓
mathematical domain
```

The lower side can be described operationally. The upper side requires a domain concept or an equivalent formal mechanism.

## 5. Decision

Accept actual generation as the weakest provisional acceptance criterion.

Do not yet identify the generated carriers with the natural numbers or with a mathematical set.

Treat the transition from generated carriers to a mathematical domain as a candidate **foundational choice point**, not as a derived fact.

## 6. Next Experiment

Compare the forward and reverse paths at this boundary. Test whether the forward construction already produces the same notion of generated carrier, and whether its next steps can remain entirely on the pre-mathematical side until the domain-selection choice is made explicitly.
