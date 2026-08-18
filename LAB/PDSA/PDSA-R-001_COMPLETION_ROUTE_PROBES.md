# PDSA-R-001 — Real Completion Route Probes

**CycleID:** `PDSA-R-001`  
**Status:** **CLOSED — ROUTE D SELECTED / ROUTE C RETAINED**  
**Date:** 2026-08-18  
**Input:** `Q-BLOCK-002`  
**Decision Point:** `R-DP-001 RESOLVED`

## PLAN

Before constructing a real carrier, compare Dedekind and Cauchy routes using actual formal representation probes over accepted BOMA N/Q infrastructure.

Research question:

> Which route should be the canonical Stage-One completion path, and which costs are mathematical versus merely representational/backend costs?

Shared requirements:

```text
strict rational order qLT derived from accepted qLE
positive rational predicate
no built-in Real carrier
no assumed equivalence between completeness notions
no canonical route before both probes type-check
```

## DO

### Shared gateway

`RPreCompletionGateway.lean` defines:

```text
qLT
qPos
qClose
```

and basic strict-order facts from accepted Q total order.

### Route D probe

`RDedekindProbe.lean` defines:

```text
LowerCut
  lower : QBOMA → Prop
  nonempty
  proper
  downward
  rounded

CutEquiv A B := ∀q, A.lower q ↔ B.lower q
```

The probe keeps extensional cut identity external. It does not silently assume function or proposition extensionality.

### Route C probe

`RCauchyProbe.lean` defines:

```text
QSeq := BOMANat → QBOMA
IsCauchy
CauchySeq
CauchyEquiv
```

The Cauchy predicate uses positive rational epsilon and accepted N order, without introducing a primitive metric or absolute-value carrier.

### Shared density gateway

`QRationalDensityGateway.lean` constructs, from accepted Q only:

```text
strict translation
multiplicative cancellation from unique inverse witnesses
positive half = inverse witness of two
positive midpoint construction
x < y → ∃m, x < m ∧ m < y
```

V5:

```text
32179943679 PASS
```

No global Choice-based inverse selector is introduced.

### Cauchy rational embedding probe

`RCauchyEmbeddingProbe.lean` constructs the constant rational sequence and proves it is Cauchy directly.

Final embedding workflow:

```text
32180417291 PASS
Cauchy constant-sequence embedding PASS
```

This entry cost does not require the Q-density theorem.

### Dedekind rational embedding probe

`RDedekindEmbeddingProbe.lean` constructs:

```text
principalCut(q) := {a : Q | a < q}
```

Its roundedness explicitly consumes the shared Q-density gateway.

The final probe verifies:

```text
principalCut construction
CutEquiv reflection of Q equality
principal-cut inclusion / accepted Q-order interface
```

Final embedding workflow:

```text
32180417291 PASS
```

### Dedekind completeness skeleton probe

`RDedekindSupremumProbe.lean` defines cut inclusion and constructs the union of any nonempty family of lower cuts having an explicit upper bound.

It proves:

```text
each member ≤ union cut
union cut ≤ every common upper bound
```

V5:

```text
32180113386 PASS
```

This is a representation-level least-upper-bound certificate and direct evidence about the cost of the central completeness obligation.

## Representation verification

The shared representation workflow completed:

```text
run 32179389952
shared qLT/qPos/qClose gateway       PASS
Dedekind LowerCut/CutEquiv syntax    PASS
Cauchy QSeq/IsCauchy/CauchyEquiv     PASS
Lean                                 4.32.1
```

## STUDY — actual comparison

| Dimension | Dedekind Route D | Cauchy Route C |
|---|---|---|
| Basic representation | PASS | PASS |
| Identity probe | external `CutEquiv`, PASS | asymptotic `CauchyEquiv`, PASS as syntax |
| Direct Q embedding | principal cuts PASS | constant sequences PASS |
| Q density dependency | explicit and V5 PASS | not required merely for constant embedding |
| Accepted N dependency | indirect through Q | direct sequence indexing by `BOMANat` |
| Early completeness skeleton | union/LUB V5 PASS | no diagonal completeness construction built yet |
| Expected algebra burden | cut addition manageable; multiplication/inverse sign-sensitive | pointwise addition straightforward; multiplication/inverse require estimates/eventual separation |
| Identity/formalization cost | predicate-cut equivalence; quotient or external identity still to choose | sequence equivalence; quotient or external identity still to choose |
| Stage-II branch value | high | high |

## Hypothesis results

### H-D1 — supported

Dedekind completeness has a verified direct structural skeleton: supremum by union of lower cuts passed V5 before full real field operations were built.

### H-D2 — supported

Principal-cut roundedness required an explicit internal Q-density theorem. That theorem was constructed and verified separately rather than hidden inside the cut definition.

### H-C1 — partially supported

Cauchy syntax and constant-rational embedding are inexpensive and verified. The projected diagonal completeness burden has not yet been constructed, so that part remains a forward cost rather than a negative theorem.

### H-C2 — not yet experimentally discharged

No Cauchy nonzero-inverse construction has been built. The expected eventual-separation burden remains an explicit open cost.

### H-C3 — supported structurally

Cauchy representation consumes `BOMANat` directly as sequence index. Dedekind representation consumes Q order/predicate structure instead.

## ACT

`R-DP-001` is resolved as:

```text
SELECT Route D — Dedekind-style lower cuts for Stage One
RETAIN Route C — Cauchy completion as a first-class Stage-II branch
```

Reason:

The defining new Stage-One R obligation is a transparent completeness theorem. Both representations and rational embeddings passed formal probes, but Route D additionally produced an already verified least-upper-bound-by-union skeleton. That gives the canonical Stage-One route a shorter, more transparent path to the central new acceptance property.

This is a methodological construction choice. It does not assert that Dedekind completion is uniquely necessary, ontologically prior, or mathematically superior to every Cauchy realization.

## Construction Graph effects

```text
Q-BLOCK-002
   ↓
shared qLT/qPos/qClose + Q-density gateway
   │
   ├──────── Route D LowerCut / CutEquiv ────────► SELECTED
   │               │
   │               ├── principal Q embedding PASS
   │               └── union/LUB skeleton PASS
   │
   └──────── Route C CauchySeq / CauchyEquiv ───► RETAINED
                   └── constant Q embedding PASS
```

## Learning Graph effects

Reusable findings:

1. A route comparison should type-check both representations before selection.
2. Entry-cost and completeness-cost are distinct: Cauchy had the cheaper Q embedding, Dedekind the more direct verified completeness skeleton.
3. Q density is a reusable shared gateway rather than a hidden Dedekind lemma.
4. External representation identity can postpone extensionality commitments while preserving mathematical comparison.
5. Failed proof-engineering steps in density/principal-order reflection were not mathematical counterexamples and remain Study evidence.

## Next cycle

`PDSA-R-002` must resolve **formal identity for Dedekind reals** before field operations are promoted.

Minimum alternatives:

```text
A  Quotient LowerCut by CutEquiv
B  LowerCut syntax with external CutEquiv as real identity
```

Raw Lean structure equality is not an acceptable silent default because the predicate field makes extensional identity substantive.
