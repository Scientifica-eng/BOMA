# B-001 — Brick Atomicity Analysis

**Status:** Active experimental analysis  
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

### Current result

**Open at the BOMA semantic level.**

The Lean backend can clearly represent a domain separately from constructors, but this only establishes representability, not that such a domain is a meaningful BOMA Brick. The architectural question therefore remains open.

## 5. Test B — Initial Without Domain

Question:

> Can `initial` be a meaningful BOMA unit independently of the object domain that contains it?

### Current result

**Negative at the semantic level.**

An initial object is typed as an element/object of some carrier/domain. Without a domain, the identity and typing of `initial` cannot be stated as the intended object-level commitment.

This supports treating `initial` as dependent on domain formation rather than as an independent Brick.

## 6. Test C — Successor Without Domain

Question:

> Can `successor` be a meaningful BOMA unit without a previously established object domain?

### Current result

**Negative at the semantic level.**

The intended successor has the form:

```text
successor : BOMAObject → BOMAObject
```

It therefore presupposes both a domain and an input object in that domain. It is not an independent fragment in the absence of a carrier/domain.

This establishes dependency, but dependency alone does not decide whether successor must belong to the same Brick as the domain.

## 7. Test D — Domain + Initial Without Successor

Question:

> Is a domain with only a distinguished initial object a coherent foundational unit for this experimental path?

### Current result

**Backend coherence: provisionally YES. Architectural sufficiency: OPEN.**

A dedicated Lean probe now exists:

`LAB/payloads/lean/B001_atomicity_probe.lean`

It represents a minimal pointed object domain independently of the successor constructor. The probe is included in the PDCA-001 CI check.

This means the backend does not force `successor` to be introduced in the same formal declaration. It does **not** yet prove that BOMA should split the candidate.

## 8. Test E — Successor as a Separate Extension

A strong candidate decomposition is:

```text
D-000
  │
  └── B-001a: minimal pointed object domain
          │
          └── B-001b: successor structure
```

The probe demonstrates that the first part can be represented independently. The remaining question is whether introducing successor as a later architectural commitment is semantically preferable rather than merely syntactically possible.

## 9. First Experimental Finding

The first atomicity probe establishes a useful distinction:

```text
Backend separability  ≠  BOMA decomposability
```

Lean can separate a candidate representation, but BOMA must decide whether the separated parts are independently meaningful and worth tracking as Bricks.

This is now recorded as an observation, not yet as a normative rule.

## 10. Current Assessment

**Do not finalize B-001 atomicity yet.**

The current evidence weakens the argument that `initial + successor` must be one Brick merely because they appear in one Lean `inductive` declaration. It provides positive evidence that a decomposition is technically possible, while leaving its architectural justification unresolved.

For the present cycle, B-001 remains a **candidate composite Brick** whose atomicity is unresolved.

## 11. Evidence Required

The final decision should cite:

1. the BOMA-level semantic definition;
2. the dependency relation among domain, initial, and successor;
3. whether each candidate fragment has an independent architectural identity;
4. whether decomposition improves traceability without creating artificial fragments;
5. the verified backend behavior of both the original artifact and the atomicity probe.

## 12. Decision Rule

The laboratory should prefer the **smallest semantically meaningful unit**, not the smallest syntactic fragment.

Therefore:

```text
syntactic atom ≠ architectural Brick
backend separability ≠ BOMA decomposability
```

A Brick is atomic relative to a declared BOMA architectural level, not relative to the parser of a verification backend.

## 13. Next Test

Run the updated CI and record whether the independent atomicity probe is accepted by Lean. Then examine whether the resulting candidate `domain + initial` has an independent BOMA identity sufficient to justify `B-001a`.
