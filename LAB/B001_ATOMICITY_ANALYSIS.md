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

### Backend result

**VERIFIED.**

A dedicated Lean probe exists at:

`LAB/payloads/lean/B001_atomicity_probe.lean`

The PDCA-001 CI check accepted the probe together with the original B-001 artifact. Workflow Run `31480507673` completed successfully; the `Kernel/type check B-001 atomicity probe` step succeeded.

### Architectural interpretation

**Architectural sufficiency remains OPEN.**

The result establishes that `domain + initial` is a coherent independently representable backend artifact. It does not establish that this artifact deserves an independent BOMA Brick identity.

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

## 9. Evidence Update — E-007

**E-007 — Atomicity probe verified**

The independent `domain + initial` backend probe passes the declared Lean check.

```text
Workflow:   BOMA Lean — PDCA-001
Run:        31480507673
Step:       Kernel/type check B-001 atomicity probe
Result:     success
Toolchain:  leanprover/lean4:v4.32.1
```

### What E-007 establishes

- The candidate `domain + initial` can be represented independently in Lean.
- The original B-001 artifact and the probe can be checked in the same pinned environment.
- The current B-001 declaration is therefore not forced into one indivisible backend artifact by Lean.

### What E-007 does not establish

- that `domain + initial` is a BOMA Brick;
- that `successor` should be a separate Brick;
- that the decomposition is semantically minimal;
- that the current B-001 candidate should be permanently split.

## 10. First Experimental Finding

The atomicity experiment now supports the distinction:

```text
Backend separability  ≠  BOMA decomposability
```

This is an evidence-backed working distinction, but it is not yet promoted to a final normative BOMA rule.

## 11. Current Assessment

**Do not finalize B-001 atomicity yet.**

The evidence now shows more than syntactic possibility: a smaller candidate can actually pass the declared Lean verification path. This strengthens the case for testing a decomposition.

However, the architectural decision still requires a semantic test: whether `domain + initial` has an independent BOMA identity and whether `successor` is a meaningful later extension rather than an artificial split.

For the present cycle, B-001 remains a **candidate composite Brick** whose atomicity is unresolved.

## 12. Evidence Required for Decision

The final decision should cite:

1. the BOMA-level semantic definition;
2. the dependency relation among domain, initial, and successor;
3. whether each candidate fragment has an independent architectural identity;
4. whether decomposition improves traceability without creating artificial fragments;
5. the verified backend behavior of both the original artifact and the atomicity probe.

## 13. Decision Rule

The laboratory should prefer the **smallest semantically meaningful unit**, not the smallest syntactic fragment.

Therefore:

```text
syntactic atom ≠ architectural Brick
backend separability ≠ BOMA decomposability
```

A Brick is atomic relative to a declared BOMA architectural level, not relative to the parser of a verification backend.

## 14. Next Test

The next test is no longer merely whether Lean can separate the pieces. That has now been demonstrated.

The next question is:

> **Does `domain + initial` have an independent BOMA identity worth recording as a Brick, or is it only a prerequisite fragment whose meaning is completed by the successor extension?**

This question must be answered at the BOMA semantic/architectural level before B-001 is split.
