# BOMA — Project Handoff / START HERE

BOMA builds a transparent, traceable mathematical architecture from a declared pre-numerical constructional layer toward standard number systems.

Governing method: **PDSA — Plan → Do → Study → Act**. Historical `PDCA` identifiers are provenance only.

## Mandatory reading order

1. `LAB/00_ARCHITECTURE/ARCHITECTURE.md`
2. `LAB/00_ARCHITECTURE/CONSTRUCTION_TOPOLOGY.md`
3. `LAB/BOMA_PDSA_GOVERNANCE_AND_PDCA_LEGACY_CORRECTION_2026-08-18.md`
4. `LAB/PDSA/STATUS.md`
5. `LAB/00_ARCHITECTURE/N_CORE_DAG.md`
6. `LAB/00_ARCHITECTURE/N_ARITHMETIC_DAG.md`
7. `LAB/00_ARCHITECTURE/Q_DAG.md`
8. `LAB/00_ARCHITECTURE/Q_COMMITMENT_LEDGER.md`
9. `LAB/00_ARCHITECTURE/REGISTRY.md`
10. `LAB/00_ARCHITECTURE/GRAPH.md`

## Do not linearize BOMA

The canonical construction is a DAG. Valid topology includes vertical dependency, horizontal independence, parallel contributors, Decision Point branches, and split → independent development → verified reconvergence.

Reconvergence never erases branch provenance.

## Accepted natural-number stage

```text
NAC-15 = ACCEPT
N-BLOCK-007 = accepted N-Core
NAA-18 = ACCEPT
N-ARITH-BLOCK-001 = accepted N-Arithmetic
```

Key reconvergence experiments:

```text
addition       right recursion ↔ left recursion
multiplication right recursion ↔ left recursion
order          additive witness ↔ independent inductive order
```

## Accepted integer stage

Two integer representations were constructed and reconverged:

```text
signed canonical normal forms
        ↕
difference pairs + explicit equivalence
```

`Z-DP-001` selected signed normal forms as the Stage-One export while retaining the pair route.

```text
ZA-01..20 PASS
Z-J-002 PASS
ZA-21 ACCEPT
Z-BLOCK-002 = Accepted Stage-One Integer Interface
```

Verification:

```text
representation           32168105466
arithmetic convergence   32169328837
ring laws                32169564747
order convergence        32169832933
ordered-ring laws        32170144944
Lean                     4.32.1
```

No quotient carrier or Lean built-in `Int` was required for the accepted Stage-One integer construction.

## Mandatory post-Z reverse experiment — completed

After Z acceptance, BOMA executed the required reverse-engineering experiment before opening Q:

```text
Z_BOMA
   ↓
N_Cone(Z) / ReachZ
   ↓
comparison with bottom-up N_BOMA
```

Reverse core V5: `32170817620`.

Final comparison V5: `32171528363`.

`Z-RE-J-001` classification:

> **INTERFACE RECONVERGENCE / PROVENANCE DIVERGENCE**

The reverse route reconverges on `0,S,+,*,≤`, but bottom-up construction/PDSA provenance is not recoverable from Z as an extensional object. Exact decoding in the current comparison is representation-aware because `ZSigned` retains `BOMANat` magnitudes.

## Accepted rational stage

Stage One constructs Q from accepted Z through an explicit cancellation and identity architecture:

```text
Z-BLOCK-002
   ↓
Q-GATE-BLOCK-001  nonzero cancellation
   ↓
positive-denominator RawFrac + FracEquiv
   ↓
raw arithmetic respect
   ↓
Q-DP-001
   ↓
Q-BLOCK-001 quotient carrier / identity layer
   ↓
field + order + embedding + generation packages
   ↓
Q-J-002 PASS
   ↓
QA-23 ACCEPT
   ↓
Q-BLOCK-002 Accepted Stage-One Rational Interface
```

`Q-DP-001` selected:

```text
QBOMA := Quotient fracSetoid
```

as a **methodological/formalization choice**, not as a claim that rationals must mathematically be quotient objects.

The accepted Q interface includes:

```text
nontrivial commutative field behavior
unique nonzero inverse witnesses without a global Choice selector
faithful ordered Z embedding
coherent N→Z→Q embedding
total order
translation invariance
negation order reversal
nonnegative multiplication monotonicity
positive inverse behavior
integer-fraction generation
```

Final integration:

```text
run    32178326013
Lean   4.32.1
result PASS
```

The Q source audit records the explicit quotient commitment and found no Q payload occurrence of `Classical`, `Choice`, `sorry`, `axiom`, built-in `Rat`, or `gcd`.

Retained Stage-II branches include reduced canonical fractions, external-setoid identity, and alternative denominator disciplines. Stage One does not falsely claim multi-carrier Q reconvergence.

## Current frontier

> **Real-number stage — NEXT.**

The accepted chain is now:

```text
pre-numerical constructional layer → N → Z → Q
```

The next action is a representation-neutral **R acceptance specification**, followed by an explicit completion Decision Point. No Dedekind, Cauchy, or other completion regime is canonical yet.
