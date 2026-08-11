# B-001 — Brick Atomicity Analysis

**Status:** Proposed analysis
**Cycle:** PDCA-001

## 1. Question

Does the B-001 target constitute one BOMA Brick, or should its components be separated into smaller Bricks?

The current target is:

> A minimal inductive object domain with a distinguished initial object and a successor constructor.

The current Lean representation is a single `inductive` declaration, but backend syntactic unity is not evidence of BOMA atomicity.

## 2. Candidate Decomposition

At the semantic level the candidate contains at least:

- **Domain formation:** the existence of an object domain `BOMAObject`;
- **Initial constructor:** a distinguished object `initial`;
- **Successor constructor:** a constructor `successor : BOMAObject → BOMAObject`.

The experiment must determine whether these are independently meaningful BOMA units or whether the intended foundational object is their inseparable combination.

## 3. Atomicity Criterion

A candidate should be treated as a Brick at a given architectural level when further decomposition would remove a necessary part of the unit's intended meaning or produce fragments that are not independently meaningful/traceable at that level.

This criterion is provisional. It is itself subject to PDCA evidence.

## 4. Test A — Domain Without Constructors

Question:

> Can the object domain be introduced as a meaningful BOMA unit without committing to any constructor?

If yes, domain formation may be a separate Brick. If no, it is evidence for keeping domain formation coupled to its minimal constructors.

## 5. Test B — Initial Without Domain

Question:

> Can `initial` be a meaningful BOMA unit independently of the object domain that contains it?

Expected answer: no. An initial object requires a carrier/domain in which it exists.

This is evidence that the initial constructor is not independent of the domain.

## 6. Test C — Successor Without Domain

Question:

> Can `successor` be a meaningful BOMA unit without a previously established object domain?

Expected answer: no. Its type requires a domain and an input object from that domain.

This is evidence that successor is dependent on the domain at the semantic level.

## 7. Test D — Domain + Initial Without Successor

Question:

> Is a domain with only a distinguished initial object a coherent foundational unit for this experimental path?

If yes, then successor may be independently introduced as a later Brick. This would favor decomposition:

```text
B-001a: object domain + initial
B-001b: successor structure
```

If the experimental purpose specifically requires the successor structure to define the intended object domain, then coupling may still be justified, but that claim must be recorded rather than assumed.

## 8. Test E — Successor as a Separate Extension

A strong candidate decomposition is:

```text
D-000
  │
  └── B-001a: minimal pointed object domain
          │
          └── B-001b: successor constructor
```

This decomposition has an important advantage: it allows the laboratory to test whether the notion of a Brick corresponds to a semantically minimal commitment rather than a convenient Lean declaration.

## 9. Current Assessment

**Do not finalize B-001 atomicity yet.**

The single-declaration implementation is insufficient evidence. The decomposition tests above should be performed before B-002 is admitted.

For the present cycle, B-001 remains a **candidate composite Brick** whose atomicity is unresolved.

## 10. Evidence Required

The final decision should cite:

1. the BOMA-level semantic definition;
2. the dependency relation among domain, initial, and successor;
3. whether each candidate fragment has an independent architectural identity;
4. whether decomposition improves traceability without creating artificial fragments;
5. the verified backend behavior, once the Lean CI check has run.

## 11. Decision Rule

The laboratory should prefer the **smallest semantically meaningful unit**, not the smallest syntactic fragment.

Therefore:

```text
syntactic atom ≠ architectural Brick
```

A Brick is atomic relative to a declared BOMA architectural level, not relative to the parser of a verification backend.
