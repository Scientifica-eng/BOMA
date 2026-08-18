# PDSA-Z-RE-001 — Reverse Engineer N from Accepted Z

**CycleID:** `PDSA-Z-RE-001`  
**Status:** **CLOSED — INTERFACE RECONVERGENCE / PROVENANCE DIVERGENCE**  
**Opened after:** `ZA-21 ACCEPT`  
**Source:** `Z-BLOCK-002`  
**Reference target:** `N-BLOCK-007`, `N-ARITH-BLOCK-001`  
**Comparison Junction:** `Z-RE-J-001`

## Governing constraint

The reverse construction phase did **not** define its carrier as `N_BOMA` and did not use `embedN` as the candidate definition.

`N_BOMA` remained frozen until the reverse candidates had been independently defined and passed a Z-only verification gate.

---

# PLAN

## Research question

What natural-number structure can be reconstructed from the accepted integer domain itself, and what information from the original bottom-up path is no longer recoverable without inspecting representation/provenance?

## Route C — nonnegative cone

Construct from accepted Z only:

```text
N_Cone(Z) := { z : Z_BOMA | 0 ≤ z }
```

with inherited/restricted:

```text
zero
one
successor x ↦ x+1
addition
multiplication
order
```

## Route G — generated reachability

Independently define:

```text
ReachZ(0)
ReachZ(x) → ReachZ(x+1)
```

and study whether:

```text
ReachZ(x) ↔ 0 ≤ x
```

is derivable autonomously from accepted Z.

## Comparison phase

Only after reverse candidates exist, allow the accepted bottom-up N back as a frozen comparison target through explicit encode/decode maps.

---

# DO

## D1 — Z-only nonnegative cone

Constructed:

```text
NFromZCone
coneZero
coneSucc
coneAdd
coneMul
coneLE
```

The carrier definition mentions accepted Z and `0≤x`, not `N_BOMA`.

Closure under successor, addition, multiplication, and inherited order behavior were established from the accepted ordered-ring Z package.

Canonical unit:

`Z-RE-BLOCK-001`.

## D2 — Z-only generated route

Constructed:

```text
ReachZ : Z_BOMA → Prop
```

with zero/successor constructors.

Established autonomously:

```text
ReachZ(x) → 0 ≤ x
```

and proposition-valued induction over ReachZ derivations.

Canonical unit:

`Z-RE-BLOCK-002`.

## D3 — independent reverse-core V5

Workflow run:

```text
32170817620
Lean 4.32.1
PASS
```

This gate preceded the bottom-up comparison layer.

## D4 — bottom-up comparison layer

After D1–D3, introduced:

```text
coneEncodeN : N_BOMA → N_Cone(Z)
coneDecodeN : N_Cone(Z) → N_BOMA
```

The decoder is explicitly **representation-aware**: it reads the `BOMANat` magnitude retained by the selected `ZSigned.pos n` constructor.

Established in the comparison layer:

```text
decode(encode(n)) = n
encode(decode(x)) = x
zero preservation
successor preservation
addition preservation
multiplication preservation
order equivalence
bottom-up naturals are ReachZ
nonnegative cone values are ReachZ via representation-aware decoder
comparison-assisted successor no-confusion / injectivity
comparison-assisted Type-valued recursion transport
```

## D5 — final comparison V5

After three localized proof-engineering corrections, final run:

```text
workflow run:    32171528363
verified commit: 335ad9780d8cfee45624998f59dae264c1057be1
Lean:            4.32.1
result:          PASS
```

Evidence:

`LAB/20_FORMALIZATION/Z_STAGE/evidence/Z_TO_N_COMPARISON_V5_LATEST.md`

---

# STUDY

## S1 — A natural semiring/order interface is recoverable from accepted Z

The nonnegative cone provides, from Z itself:

```text
zero
one
successor x+1
addition
multiplication
order
```

with the required closure.

After comparison, this interface matches the accepted bottom-up N interface exactly under encode/decode.

Thus H1 is supported.

## S2 — Generatedness has an autonomous Z-internal shadow

`ReachZ` is independently generated from integer zero by repeated `+1` and proves:

```text
ReachZ(x) → 0 ≤ x.
```

Its inductive definition also gives **Prop-valued induction** without importing the original N eliminator.

However the current proof of the converse:

```text
0 ≤ x → ReachZ(x)
```

uses the representation-aware decoder in the comparison phase.

Therefore the experiment does not promote full `ReachZ ↔ nonnegative` as an abstract Z-interface-only theorem.

## S3 — Exact recovery is representation-sensitive

The selected signed integer carrier literally stores:

```text
pos n
neg n
```

with `n : BOMANat`.

The exact decoder exploits that retained payload. Hence:

```text
N_Cone(ZSigned) ≃ BOMANat
```

is a valid selected-representation result, but it is not evidence that an arbitrary abstract ordered-ring realization of integers reveals the original natural carrier by the same mechanism.

H3 is supported.

## S4 — Type-valued recursion/initiality provenance is not autonomously recovered

The reverse generated predicate supplies proposition-valued induction, but the current Type-valued recursor on the cone is transported through:

```text
coneDecodeN → BOMANat.fold.
```

Likewise, the original pointwise initiality theorem is not independently reconstructed from the accepted Z ordered-ring interface.

Therefore H2 is supported in the precise current sense:

> extensional Z structure recovers the natural arithmetic/order interface, but does not by itself reproduce the original R-B recursion/initiality derivation history.

## S5 — Passing through Z compresses foundational provenance

The reverse route cannot read from the extensional accepted Z interface alone:

```text
pre-numerical TCT history
CAL-001 hidden-assumption audit
N-DP-001 realization choice
N-DP-002 universe/eliminator choice
dual-route N no-confusion history
addition/multiplication/order branch histories
human–AI PDSA learning graph
```

These are repository/provenance data, not algebraic invariants of the resulting Z object.

## S6 — Comparison failures were proof-engineering, not mathematical divergence

Three failed comparison runs progressively localized:

1. recursive simplification caused by unfolding a proof-bearing comparison constructor;
2. an incorrect rewrite direction in reachability transport;
3. a remaining recursive `simpa` in successor preservation.

All were corrected by replacing heuristic simplification with explicit definitional/equality chains. The reverse carrier, ReachZ definition, encode/decode design, and comparison target were not changed to force success.

This is a reusable PDSA learning result:

> when the architecture distinguishes reverse construction from comparison, proof-engineering failure can be repaired without contaminating the already-verified reverse candidate.

---

# Bottom-up versus reverse result

Detailed matrix:

`LAB/PDSA/experiments/PDSA-Z-RE-001_BOTTOM_UP_VS_REVERSE_COMPARISON.md`

Summary:

```text
carrier equivalence in selected representation   PASS
zero / successor interface                        PASS
addition / multiplication                         PASS
order                                              PASS
Z-only cone construction                           PASS
Z-only ReachZ → nonnegative                        PASS
Z-only Prop induction                              PASS
abstract-Z-only exact decoder                      NOT ESTABLISHED
abstract-Z-only Type-valued recursion              NOT ESTABLISHED
original initiality provenance                     NOT RECOVERED
pre-numerical / PDSA construction history          NOT RECOVERED
```

---

# ACT

The correct classification is:

> **INTERFACE RECONVERGENCE / PROVENANCE DIVERGENCE**

This rejects both extremes:

- it is stronger than “partial numerical resemblance,” because the selected reverse cone is formally equivalent to accepted N and preserves `0,S,+,*,≤`;
- it is weaker and more precise than “full independent reconstruction,” because exact decoding and Type-valued recursion currently depend on representation/bottom-up comparison, while original foundational history is not recoverable from Z as an extensional object.

`Z-RE-J-001` records the resolved comparison Junction.

The experiment establishes a reusable BOMA principle:

```text
same mathematical interface
        ≠
same construction graph
        ≠
same logical/epistemic provenance.
```

The mandatory post-Z reverse experiment is therefore complete. The rational-number stage may now open, while the reverse result remains first-class evidence for later Stage-II branch analysis.
