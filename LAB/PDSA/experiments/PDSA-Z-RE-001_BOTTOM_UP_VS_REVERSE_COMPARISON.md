# PDSA-Z-RE-001 — Bottom-Up N vs Reverse N-from-Z Comparison

**Experiment:** `PDSA-Z-RE-001-COMP-001`  
**Status:** **CLOSED — INTERFACE RECONVERGENCE / PROVENANCE DIVERGENCE**  
**Date:** 2026-08-18

## Compared routes

### Bottom-up route

```text
pre-numerical TCT
  → canonical decomposition / iteration history
  → successor-like extension
  → R-B formal N-Core
  → induction / generatedness / recursion / initiality
  → N-Arithmetic
  → accepted Z
```

### Reverse route

```text
accepted Z
  → N_Cone(Z) := {x | 0 ≤ x}
  → coneZero / coneSucc / coneAdd / coneMul / coneLE

accepted Z
  → ReachZ generated from 0 by +1
  → ReachZ(x) → 0 ≤ x

then comparison layer only:
  N_BOMA ↔ N_Cone(Z)
```

The reverse carrier and ReachZ predicate were constructed and V5-checked before `N_BOMA` was reintroduced as a comparison reference.

---

## Comparison matrix

| Dimension | Bottom-up N | Reverse from accepted Z | Comparison result |
|---|---|---|---|
| carrier / identity | fresh `BOMANat` in R-B | subtype-like nonnegative cone of `Z_BOMA` | **extensionally equivalent after comparison; different identity construction** |
| zero | constructor `z` | integer zero restricted to cone | **reconverges** |
| successor | constructor `s` | `x ↦ x + 1` in Z | **reconverges under encode/decode** |
| successor ≠ zero | derived from inductive no-confusion + TCT route | comparison-assisted via decoder | **same interface, different proof provenance** |
| successor injective | derived internally + independent TCT transfer | comparison-assisted via decoder | **same interface, different proof provenance** |
| generatedness | explicit N-Core obligation; all carrier elements generated | `ReachZ` generated predicate independent of cone | **ReachZ→cone is Z-only; cone→ReachZ currently representation/comparison-assisted** |
| induction | Sort-polymorphic N eliminator / explicit adequacy | `ReachZ` gives proposition-valued induction intrinsically | **partial autonomous recovery** |
| Type-valued recursion | `fold` derived/verified in N-Core | transported only after representation-aware decoder | **not autonomously recovered from abstract Z interface** |
| pointwise initiality | explicit N-Core theorem in declared unary-algebra scope | not independently derived from ordered-ring Z | **not reverse-derived in current experiment** |
| addition | accepted N arithmetic after dual-route convergence | restriction of accepted Z addition to cone | **reconverges** |
| multiplication | accepted N arithmetic after dual-route convergence | restriction of accepted Z multiplication to cone | **reconverges** |
| order | dual additive/inductive natural order | restriction of accepted Z order | **reconverges exactly under `encode_order`** |
| arithmetic/order compatibility | separately built and audited | inherited from accepted ordered Z and cone closure | **interface reconvergence; dependency compression** |
| natural embedding | constructed during Z stage from N | used only later as comparison map `coneEncodeN` | **round-trip PASS; not reverse-carrier definition** |
| exact decoder | intrinsic identity on N carrier | pattern matches selected `ZSigned` positive payload | **representation-aware, not abstract-Z-only** |
| formal commitments | pre-numerical metatheory + R-B inductive carrier + formal scope | accepted ordered-ring Z + nonnegative subtype/predicate + generated predicate | **different starting commitments** |
| dependency topology | long constructive DAG from TCT | short reverse path consuming already-integrated Z | **strong provenance divergence** |
| pre-numerical provenance | explicit and retained | not reconstructible from Z extensional interface | **lost/compressed** |
| original Decision Points | explicit N realization and universe choices | not inferable merely from recovered cone | **lost/compressed** |
| human/AI learning history | full PDSA lineage from hidden-assumption audits onward | only sees accepted Z unless repository provenance is consulted | **not mathematically recoverable** |

---

## V5 evidence

### Reverse core before comparison

```text
run: 32170817620
result: PASS
```

This validates the Z-only definitions of the nonnegative cone, its inherited operations/order, `ReachZ`, `ReachZ→nonnegative`, and propositional reachability induction.

### Bottom-up comparison

After three localized proof-engineering Study corrections, final run:

```text
run: 32171528363
verified commit: 335ad9780d8cfee45624998f59dae264c1057be1
Lean: 4.32.1
result: PASS
```

Verified comparison layer includes:

```text
decode(encode(n)) = n
encode(decode(x)) = x
zero preservation
successor preservation
addition preservation
multiplication preservation
order equivalence
bottom-up naturals are ReachZ
cone values are ReachZ via representation-aware decoder
comparison-assisted successor no-confusion/injectivity
comparison-assisted Type-valued recursion transport
```

---

## Study — what is genuinely recovered from Z?

### Autonomous Z-interface recovery

The accepted Z ordered-ring interface is sufficient to define and verify:

```text
nonnegative cone
zero
one
successor x+1
closure under + and *
inherited total order
ReachZ generated from zero by +1
ReachZ → nonnegative
proposition-valued induction over ReachZ derivations
```

These are genuine reverse products.

### Representation-aware recovery

Exact decoding in the current selected implementation uses:

```text
ZSigned.zero
ZSigned.pos n
ZSigned.neg n
```

and therefore reads the `BOMANat` magnitude retained inside the signed representation.

Consequently, the exact cone↔`BOMANat` round trip is **not** evidence that every abstract ordered-ring realization of the accepted integer interface internally reveals the original N carrier in the same way.

### Comparison-assisted recovery

The current proofs of:

```text
nonnegative → ReachZ
successor no-confusion on the cone
successor injectivity on the cone
Type-valued recursion on the cone
```

use the representation-aware decoder and/or previously accepted N theorems as comparison evidence.

They demonstrate interface recoverability, not autonomous reconstruction of the original derivational route.

---

## Information compressed by N → Z

Passing from bottom-up N into accepted Z preserves enough extensional structure to recover the natural arithmetic/order interface, but it does not expose by itself:

```text
pre-numerical TCT construction history
why the original N carrier was selected
N-DP-001 / N-DP-002 decision history
dual-route N no-confusion provenance
dual-route addition/multiplication/order histories
original recursion/initiality derivation provenance
CAL-001 hidden-assumption learning history
human–AI PDSA learning graph
```

Those remain repository/provenance knowledge, not invariants readable from the accepted Z structure.

---

## Final classification

The strongest justified result is:

> **INTERFACE RECONVERGENCE / PROVENANCE DIVERGENCE**

More precisely:

```text
carrier-equivalence under selected representation comparison: PASS
0/S/+/*/≤ interface preservation:                       PASS
Z-only nonnegative-cone reconstruction:                 PASS
Z-only ReachZ→nonnegative and Prop induction:            PASS
abstract-Z-only exact recovery of original recursion:    NOT ESTABLISHED
abstract-Z-only original initiality/provenance recovery: NOT ESTABLISHED
bottom-up construction-history recovery:                FAIL BY TYPE OF INFORMATION / NOT AN EXTENSIONAL INVARIANT
```

This is not a mathematical failure. It demonstrates a central BOMA distinction:

```text
same reusable mathematical interface
        ≠
same construction history
        ≠
same logical/epistemic provenance
```

The reverse experiment therefore validates branch/reconvergence at the level of mature number-domain architecture while also showing where extensional reconstruction stops recovering foundational history.
