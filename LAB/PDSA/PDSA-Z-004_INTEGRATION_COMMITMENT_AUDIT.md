# PDSA-Z-004 — Integer Integration / Commitment Audit

**CycleID:** `PDSA-Z-004`  
**Status:** **CLOSED — ZA-01..20 PASS / ZA-21 ELIGIBLE**  
**Date:** 2026-08-18

## Research question

Are the selected integer carrier, retained representation branch, arithmetic, order, embedding, characterization, formal commitments, and V5 evidence mutually compatible and sufficient to discharge ZA-01 through ZA-20 without hidden principles?

## Inputs

```text
BOMA-Z-ACCEPT-001 v1.1
N-ARITH-BLOCK-001
Z-S-BLOCK-001
Z-D-BLOCK-001
Z-J-001
Z-DP-001
Z-BLOCK-001
Z-ARITH-BLOCK-001..003
Z-ARITH-J-001
Z-ORD-BLOCK-001
Z-ORD-J-001
PDSA-Z-003
all Z_STAGE V5 evidence records
```

---

## ZA integration matrix

| ZA | Obligation | Evidence | Result |
|---|---|---|---|
| ZA-01 | explicit integer carrier | selected fresh `ZSigned`, `Z-BLOCK-001` | **PASS** |
| ZA-02 | integer identity/equality | formal equality on signed normal forms; pair `~` retained as representation relation only | **PASS** |
| ZA-03 | zero / one | `zero`, `zone := embedN(1)` | **PASS** |
| ZA-04 | faithful N embedding | `embedN`, `embedN_injective` | **PASS** |
| ZA-05 | negation | `zneg`, involution, zero behavior | **PASS** |
| ZA-06 | commutative additive group | `Z-ARITH-BLOCK-003`, V5 ring laws | **PASS** |
| ZA-07 | every integer a natural difference | `generated_by_natural_difference` | **PASS** |
| ZA-08 | multiplication | dual-route converged `zmul` | **PASS** |
| ZA-09 | commutative-ring laws | assoc/comm/one/zero/distributivity | **PASS** |
| ZA-10 | N arithmetic preservation | zero/one/add/mul embedding theorems + injectivity | **PASS** |
| ZA-11 | total integer order | dual-route converged `zLE`, total-order laws | **PASS** |
| ZA-12 | N-order extension | `embedN_order` iff theorem | **PASS** |
| ZA-13 | ordered arithmetic compatibility | addition translation, negation reversal, nonnegative multiplication monotonicity | **PASS** |
| ZA-14 | representation accounting | signed carrier vs pair relation vs normalization vs backend artifacts explicitly separated | **PASS** |
| ZA-15 | parallel representation convergence | `Z-J-001` V4+V5 | **PASS** |
| ZA-16 | canonical representation Decision Point | `Z-DP-001` signed selected; pair retained | **PASS** |
| ZA-17 | characterization certificate | signed normal-form exhaustiveness + pair classification + natural-difference generation + faithful N embedding | **PASS IN DECLARED STAGE-ONE SCOPE** |
| ZA-18 | commitment ledger | this audit | **PASS** |
| ZA-19 | formal verification | pinned Lean 4.32.1, route/law evidence below | **PASS** |
| ZA-20 | final integer integration | compatibility review below / `Z-J-002` | **PASS** |

ZA-21 remains a separate closure decision.

---

# ZA-17 scope statement

The project does **not** claim a group-completion universal property that has not been built.

The accepted Stage-One characterization is instead the conjunction of:

```text
1. exhaustive signed normal-form carrier;
2. exact signed round trip;
3. pair round trip up to ~;
4. p ~ q iff equal signed normal forms;
5. faithful embedding of accepted N_BOMA;
6. every signed integer is an explicit difference of two embedded naturals;
7. accepted commutative-ring and total-order interfaces.
```

This is sufficient for the present Stage-One identity/adequacy target. A group-completion universal property remains a legitimate later branch or strengthening, not a silently assumed theorem.

---

# ZA-18 commitment ledger

## Inherited commitments

From accepted N-Core / N-Arithmetic:

```text
R-B dependent type-theoretic inductive regime
formal equality on N_BOMA
accepted recursion/induction scope
accepted N addition/multiplication/order
```

## New integer-stage commitments

### C-Z1 — fresh signed inductive representation

A new backend/formal carrier syntax:

```text
ZSigned ::= zero | pos n | neg n
```

is a **DECLARED REPRESENTATION / FORMALIZATION CHOICE** selected at `Z-DP-001`.

### C-Z2 — explicit difference-pair representation branch

`ZPair` is a product-like backend structure used as an alternative representation and semantic proof producer.

### C-Z3 — explicit pair equivalence relation

```text
(p,n) ~ (q,m) iff p+m = q+n.
```

This is a declared representation relation and is proved to be an equivalence.

### C-Z4 — normalization choice

Structural cancellation `diff` supplies the signed normal form of a natural pair. Its compatibility with pair equivalence is derived and V5 checked.

### C-Z5 — canonical representation selection

Signed normal forms are selected as the Stage-One export carrier. This is methodological/formalization-specific, not foundational necessity.

## Principles explicitly *not* introduced

Repository audit of the active BOMA code path found no use of:

```text
Lean built-in Int as the carrier or theorem source
Quotient / Quotient.sound / quotient carrier formation
Classical
choice
sorry
new axiom declarations
```

No quotient type is required despite the retained pair branch.

No new universe escalation was required by the Z construction; the signed carrier and pair representation live in the inherited ordinary type scope over `BOMANat`.

---

# Verification ledger

| Layer | Workflow run | Result |
|---|---:|---|
| representation routes + convergence | `32168105466` | PASS |
| arithmetic routes + convergence | `32169328837` | PASS |
| canonical group/ring/embed/generation laws | `32169564747` | PASS |
| order routes + convergence | `32169832933` | PASS |
| total-order / ordered-ring laws | `32170144944` | PASS |

Pinned environment:

```text
Lean 4.32.1
```

All evidence records are under:

`LAB/20_FORMALIZATION/Z_STAGE/evidence/`

---

# Compatibility / non-circularity review

Canonical dependency direction is:

```text
accepted N-Arithmetic
   ↓
parallel Z representations
   ↓
Z-J-001
   ↓
Z-DP-001
   ↓
selected Z carrier
   ↓
parallel Z arithmetic routes
   ↓
Z-ARITH-J-001
   ↓
commutative-ring laws
   ↓
parallel Z order routes
   ↓
Z-ORD-J-001
   ↓
ordered-ring laws
   ↓
Z-J-002 integration
```

No proof of an earlier stage consumes a later integer theorem as a premise.

The pair branch is reused downstream but does not redefine the selected carrier after `Z-DP-001`.

The direct signed route and pair-mediated route remain distinguishable in provenance even when they export equal operations/relations.

---

# Integration conclusion

No unresolved contradiction, hidden carrier replacement, undeclared quotient commitment, or unchecked mathematical interface remains among ZA-01..20.

Therefore:

```text
ZA-01..20 = PASS
ZA-21      = ELIGIBLE FOR SEPARATE CLOSURE DECISION
```

Passing this audit does not itself open the rational stage and does not yet start the post-Z reverse-engineering experiment. Both require the explicit ZA-21 closure act.
