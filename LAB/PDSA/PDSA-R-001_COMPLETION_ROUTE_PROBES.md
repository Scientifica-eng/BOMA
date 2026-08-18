# PDSA-R-001 — Real Completion Route Probes

**CycleID:** `PDSA-R-001`  
**Status:** **ACTIVE — STUDY COMPLETE EXCEPT FINAL DEDEKIND EMBEDDING RECHECK**  
**Date:** 2026-08-18  
**Input:** `Q-BLOCK-002`  
**Decision Point:** `R-DP-001`

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

Important: the probe keeps extensional cut identity external. It does not silently assume function or proposition extensionality.

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

### Deeper Cauchy embedding probe

`RCauchyEmbeddingProbe.lean` constructs the constant rational sequence and proves it is Cauchy directly.

Observed in embedding workflow:

```text
Cauchy constant-sequence embedding  PASS
```

This entry cost does not require the Q-density theorem.

### Deeper Dedekind embedding probe

`RDedekindEmbeddingProbe.lean` constructs:

```text
principalCut(q) := {a : Q | a < q}
```

Its roundedness explicitly consumes the shared Q-density gateway.

The probe also tests:

```text
CutEquiv reflection of Q equality
principal-cut inclusion ↔ accepted qLE
```

The last observed V5 `32180195661` failed only in the newly added principal-order reflection theorem at one reflexive endpoint. The error was:

```text
expected qLE r r
provided qle_refl q
```

This was corrected in commit `58e706da34f3eb95dc6d5ffff1fca8a52309cdea` without changing `principalCut`, `CutEquiv`, Q density, or the order definition. Final recheck remains the only lock before Act.

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

This is a representation-level least-upper-bound certificate and is direct evidence about the cost of the selected completeness obligation.

## Representation verification

The shared representation workflow completed:

```text
run 32179389952
shared qLT/qPos/qClose gateway       PASS
Dedekind LowerCut/CutEquiv syntax    PASS
Cauchy QSeq/IsCauchy/CauchyEquiv     PASS
Lean                                 4.32.1
```

A representation probe PASS means only that the representation layer is coherent enough to type-check. It does **not** mean field operations or real completeness are complete.

## STUDY — actual comparison

| Dimension | Dedekind Route D | Cauchy Route C |
|---|---|---|
| Basic representation | PASS | PASS |
| Identity probe | external `CutEquiv`, PASS | asymptotic `CauchyEquiv`, PASS as syntax |
| Direct Q embedding entry | requires Q density for roundedness | constant sequences; PASS without density |
| Q density dependency | explicit and now V5 PASS | not required merely for constant embedding |
| Accepted N dependency | indirect through Q | direct sequence indexing by `BOMANat` |
| Early completeness skeleton | union/LUB probe V5 PASS | no corresponding diagonal completeness construction built yet |
| Expected algebra burden | cut addition manageable; multiplication/inverse sign-sensitive | pointwise addition straightforward; multiplication/inverse require Cauchy estimates/eventual separation |
| Identity/formalization cost | predicate-cut equivalence; quotient or external identity still to choose | sequence equivalence; quotient or external identity still to choose |
| Stage-II branch value | high | high |

## Hypothesis results

### H-D1 — supported

Dedekind completeness has shown a direct verified structural skeleton: supremum by union of lower cuts passed V5 before full real field operations were built.

### H-D2 — supported

Principal-cut roundedness required an explicit internal Q-density theorem. That density theorem was constructed and verified separately rather than hidden inside the cut definition.

### H-C1 — partially supported

Cauchy syntax and constant-rational embedding are inexpensive and verified. The projected diagonal completeness burden has not yet been constructed, so that part remains a forward cost rather than a proved negative result.

### H-C2 — not yet experimentally discharged

No Cauchy nonzero-inverse construction has been built. The expected eventual-separation burden remains an explicit open cost, not a theorem.

### H-C3 — supported structurally

Cauchy representation consumes `BOMANat` directly as sequence index. Dedekind representation consumes Q order/predicate structure instead.

## Decision criterion emerging from Study

The central new mathematical obligation of Stage-One R is a transparent completeness theorem.

Current evidence favors Route D for a first canonical construction because:

```text
its representation is verified;
its shared Q-density dependency is now explicit and verified;
its direct least-upper-bound skeleton is already verified;
its remaining identity commitment can stay explicit through CutEquiv;
Route C remains a coherent, low-entry-cost branch but its difficult completeness and inverse obligations are still ahead.
```

This is a methodological construction-cost comparison, not a claim that Dedekind completion is mathematically more real, more fundamental, or uniquely necessary.

## ACT lock

Do not resolve `R-DP-001` until the corrected principal-cut embedding/order-reflection probe is observed under V5.

If that recheck passes, the intended Act is:

```text
select Route D — Dedekind-style lower cuts for Stage One
retain Route C — Cauchy completion as a first-class Stage-II branch
```

If it fails for a substantive mathematical reason, reopen Study rather than selecting D from the other evidence alone.
