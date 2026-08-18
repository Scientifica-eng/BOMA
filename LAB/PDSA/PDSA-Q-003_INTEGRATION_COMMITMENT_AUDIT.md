# PDSA-Q-003 — Rational Integration / Commitment Audit

**CycleID:** `PDSA-Q-003`  
**Status:** **CLOSED — QA-01..22 DISCHARGED / QA-23 ELIGIBLE**  
**Date:** 2026-08-18  
**Target:** `BOMA-Q-ACCEPT-001 v1.0`

## PLAN

Integrate the independently verified rational construction layers and determine whether the Stage-One candidate can reach the separate QA-23 closure decision without hiding representation, quotient, inverse, order, or verification commitments.

Required review dimensions:

```text
carrier / equality
denominator validity
fraction-equivalence correctness
well-defined arithmetic
field laws
nonzero inverse interface
Z/N embedding coherence
total order
ordered-field compatibility
generation / adequacy
representation-branch status
commitment ledger
V5 evidence
full-stack compatibility
```

## DO

The Q construction produced the following dependency path:

```text
accepted Z
   ↓
QG-01 cancellation
   ↓
positive denominator syntax
   ↓
RawFrac + FracEquiv
   ↓
raw arithmetic respect
   ↓
Q-DP-001
   ↓
QBOMA := Quotient fracSetoid
   ↓
additive / multiplicative / distributive laws
   ↓
unique nonzero inverse witnesses
   ↓
Z/N embedding preservation
   ↓
RawLE representative invariance
   ↓
qLE total order
   ↓
translation / negation / nonnegative multiplication / positive inverse
   ↓
generation + commitment audit
   ↓
QIntegrationCertificate.lean
```

Final full-stack V5:

```text
run     32178326013
Lean    4.32.1
result  PASS
```

## STUDY — acceptance matrix

| Obligation | Result | Evidence / interpretation |
|---|---|---|
| QG-01 nonzero multiplication cancellation | PASS | `QGatewayCancellation.lean`, V5 `32172230166` |
| QG-02 denominator discipline | PASS | structurally positive `PosDen`; zero denominator unrepresentable |
| QA-01 explicit rational carrier | PASS | `QBOMA := Quotient fracSetoid`; built-in `Rat` not used |
| QA-02 rational identity | PASS | `FracEquiv`; refl/symm/trans V5 `32172543345` |
| QA-03 representation boundary | PASS | RawFrac, PosDen, FracEquiv, quotient equality kept distinct |
| QA-04 integer embedding | PASS | `qOfZ`, injective |
| QA-05 zero / one | PASS | quotient zero/one + Z compatibility |
| QA-06 negation | PASS | raw respect + quotient lift + Z preservation |
| QA-07 addition | PASS | raw respect + quotient lift |
| QA-08 multiplication | PASS | raw respect + quotient lift |
| QA-09 nonzero inverse | PASS | unique-witness `QInvRel`, V5 `32176692789`; no Choice selector |
| QA-10 field laws | PASS | additive, multiplicative, distributive V5 layers + inverse witnesses |
| QA-11 Z arithmetic preservation | PASS | V5 `32177123730` |
| QA-12 N embedding coherence | PASS | only documented composition `N→Z→Q`, same V5 |
| QA-13 rational total order | PASS | `RawLE` + `qLE`, V5 `32177345921` |
| QA-14 Z-order extension | PASS | `qOfZ_order`, same V5 |
| QA-15 ordered-field compatibility | PASS | additive V5 `32177896509`; multiplicative/inverse V5 `32178098823` |
| QA-16 every rational is an integer fraction | PASS | V5 `32177245619` |
| QA-17 representation convergence | NOT TRIGGERED AS MULTI-CARRIER GATE | one formal Stage-One carrier built; raw syntax is production layer; alternatives retained |
| QA-18 representation Decision Point | PASS / RESOLVED | `Q-DP-001`: quotient/setoid selected methodologically |
| QA-19 adequacy / characterization | PASS AT DECLARED SCOPE | field + ordered-field laws, faithful Z embedding, generation, exact fraction equality classification; no universal-property claim |
| QA-20 commitment ledger | PASS | final `Q_COMMITMENT_LEDGER.md`; no Classical/Choice/sorry/axiom/Rat/gcd found in Q payload search |
| QA-21 formal verification | PASS | claim-level evidence plus final integration V5 `32178326013` |
| QA-22 rational integration gate | PASS | full N/Z/Q assembly and machine integration certificate PASS |

## QA-17 study result

The Stage-One construction did **not** build two independent formal rational carriers and then choose between them.

It built:

```text
raw valid fraction syntax
   +
verified representation equivalence
   ↓
formal identity Decision Point
   ↓
one quotient carrier
```

Therefore marking QA-17 as if two carriers had reconverged would falsify the provenance graph.

Retained branch candidates are:

```text
reduced canonical fractions
external-setoid identity
alternative denominator discipline
```

These remain valuable Stage-II experiments.

## QA-19 scope

The adequacy certificate is intentionally limited to what was actually constructed:

```text
nontrivial commutative field interface
ordered-field compatibility
faithful ordered Z embedding
coherent N embedding
every element represented by integer / positive denominator
formal equality exactly classified by FracEquiv
```

Not claimed:

```text
field-of-fractions universal property
uniqueness among all rational-field constructions
canonical reduced representative
gcd/reduction theorem
mathematical necessity of quotient realization
```

## Errors / learning extracted

The PDSA path generated several reusable lessons:

1. Cross-product transitivity is not free; it consumed an explicit nonzero-cancellation gateway.
2. Positive denominator syntax eliminates a later sign-normalization burden and simplifies order orientation.
3. Raw operation well-definedness should be verified before choosing quotient identity.
4. Quotient lifting required no additional global representative selector; the inverse interface could remain constructive as a unique witness.
5. Order should not be lifted by silently identifying propositions; witness-based `qLE` kept representative invariance explicit.
6. Ordered-field compatibility became much simpler after deriving the bridge `x≤y ↔ 0≤y-x`.
7. CI dependency paths must track semantic dependencies: the multiplicative-order workflow originally consumed but did not trigger on the additive-order file; this was corrected.
8. Several failed V5 attempts were proof-engineering or assembly failures, not mathematical counterexamples. They remain learning evidence rather than being erased.

## ACT

```text
QA-01..22                 DISCHARGED
Q-J-002                    PASS / RESOLVED
QA-23                      ELIGIBLE FOR SEPARATE DECISION
canonical Stage-One route  quotient/setoid carrier
Stage-II alternatives      RETAINED
real-number stage           STILL CLOSED until QA-23 ACCEPT
```

The next action is a separate QA-23 closure decision. This audit does not itself accept Q.
