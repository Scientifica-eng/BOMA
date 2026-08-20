# Z_CLAIM_CLOSURE_AUDIT_001 — PDSA-ARCH-002 Declared-Closure Map

**Status:** DECLARED-CLOSURE COMPLETE / FORMAL-CLOSURE COMPARISON NOT YET AUTOMATED  
**Date:** 2026-08-20  
**Target:** `Z-BLOCK-002 — Accepted Stage-One Integer Interface`  
**Acceptance:** `ZA-21 = ACCEPT`  
**Program:** `PDSA-ARCH-002`

## 1. Purpose

Map the accepted integer interface into the Claim Architecture while preserving the difference between accepted integer properties and the selected signed-normal-form representation.

## 2. Accepted construction / reconvergence spine

```text
accepted N-Core + N-Arithmetic
  ↓
Route S: signed normal forms ───────────┐
                                       ├─ Z-J-001 → Z-DP-001
Route D: difference pairs + ~ ─────────┘
                                       ↓
                              Z-BLOCK-001
                                       ↓
Direct signed arithmetic ──────────────┐
                                       ├─ Z-ARITH-J-001
Pair-mediated arithmetic ──────────────┘
                                       ↓
                              Z-ARITH-BLOCK-003
                                       ↓
Direct/pair order routes → Z-ORD-J-001 → Z-ORD-BLOCK-001
                                       ↓
                                   Z-J-002
                                       ↓
                              Z-BLOCK-002 / ZA-21
```

## 3. Acceptance-level claim families

### Z-CL-REP-001 — Signed normal-form integer representation

**Statement/scope:** selected syntax has exactly:

```text
zero | pos n | neg n
```

where positive/negative constructors encode nonzero successor magnitudes, so zero has one canonical signed form.  
**Producer:** `Z-S-BLOCK-001` from `Z-S-BR-001..003`.  
**Classification:** `REPRESENTATION_COMMITMENT` plus derived normalization/embedding claims.  
**Evidence:** representation V5 `32168105466`.

### Z-CL-ALTREP-001 — Difference-pair representation/equivalence

**Statement/scope:**

```text
ZPair := (a,b)
(a,b) ~ (c,d) ↔ a+d = c+b
```

with equivalence laws and normalization/round-trip behavior.  
**Producer:** `Z-D-BLOCK-001` from `Z-D-BR-001..003`.  
**Classification:** `MATHEMATICAL_CLAIM / RETAINED ALTERNATIVE REPRESENTATION`.  
**Evidence:** representation V5 `32168105466`.  
**Important:** no quotient carrier is formed on this route.

### Z-CL-REPCONV-001 — Representation convergence/classification

**Statement/scope:** signed↔pair translations satisfy exact signed round trip, pair round trip up to `~`, and:

```text
p ~ q ↔ normalize(p) = normalize(q)
```

**Producer:** `Z-REP-BR-001..005` → `Z-J-001`.  
**Classification:** `MATHEMATICAL_CLAIM / RECONVERGENCE CERTIFICATE`.  
**Decision effect:** `Z-DP-001` selects signed normal forms for Stage-One export; the selection is methodological/representational, not a necessity theorem.  
**Evidence:** representation V5 `32168105466`.

### Z-CL-CARRIER-001 — Accepted integer carrier/identity

**Statement/scope:**

```text
Z_BOMA := selected signed normal forms
zero
formal equality on selected carrier
```

with faithful `embedN`, negation and structural difference interface.  
**Producer:** `Z-J-001` + `Z-DP-001` → `Z-BLOCK-001`.  
**Classification:**

```text
need for accepted explicit carrier/identity  MATHEMATICAL_CLAIM relative to acceptance
signed carrier choice                       REPRESENTATION_COMMITMENT / METHODOLOGICAL CHOICE
Lean inductive/formal equality framework    TRUSTED_METATHEORY / FORMALIZATION INFRASTRUCTURE
```

### Z-CL-ARITHCONV-001 — Dual integer arithmetic route convergence

**Statement/scope:** direct signed `zaddD/zmulD` and pair-mediated `zaddP/zmulP` produce pointwise identical accepted operations after normalization.  
**Producer:** `Z-ARITH-BLOCK-001`, `Z-ARITH-BLOCK-002` → `Z-ARITH-J-001`.  
**Classification:** `MATHEMATICAL_CLAIM / RECONVERGENCE CERTIFICATE`.  
**Evidence:** operation reconvergence V5 `32169328837`.

### Z-CL-RING-001 — Canonical commutative-ring interface

**Statement/scope:** canonical `zadd := zaddD`, `zmul := zmulD`, `zneg`, `zero`, `one` satisfy additive commutative-group, multiplicative commutative-monoid, zero absorption and distributivity laws.  
**Producer:** `Z-ARITH-J-001` → `Z-ARITH-BLOCK-003`.  
**Classification:** `MATHEMATICAL_CLAIM`; canonical executable spelling is a post-convergence representation choice and does not erase pair-mediated witnesses.  
**Evidence:** ring-law V5 `32169564747`.

### Z-CL-EMBED-001 — Faithful natural embedding and preservation

**Statement/scope:**

```text
embedN : N_BOMA → Z_BOMA
```

is injective and preserves `0,1,+,*,≤`.  
**Producer:** signed carrier/representation plus arithmetic/order proofs.  
**Classification:** `MATHEMATICAL_CLAIM`.  
**Evidence:** representation/ring/order verification chain.

### Z-CL-GEN-001 — Natural-difference generation

**Statement/scope:** every accepted integer is an explicit difference of two embedded naturals:

```text
x = embedN(a) + zneg(embedN(b))
```

for suitable `a,b : N_BOMA`.  
**Producer:** `Z-ARITH-BLOCK-003`.  
**Classification:** `MATHEMATICAL_CLAIM`.  
**Non-claim:** no group-completion universal property is inferred.

### Z-CL-ORDERCONV-001 — Dual integer order route convergence

**Statement/scope:** selected direct signed order agrees with the retained pair cross-sum order.  
**Producer:** order routes → `Z-ORD-J-001`.  
**Classification:** `MATHEMATICAL_CLAIM / RECONVERGENCE CERTIFICATE`.  
**Evidence:** order-route V5 `32169832933`.

### Z-CL-ORDER-001 — Accepted total ordered-ring interface

**Statement/scope:** `zLE` is reflexive, transitive, antisymmetric and total, exactly extends accepted N order, and satisfies:

```text
addition translation invariance
negation order reversal
multiplication monotonicity for nonnegative factors
```

with derived bridge:

```text
x ≤ y ↔ ∃k : N_BOMA, x + embedN(k) = y
```

**Producer:** `Z-ORD-J-001` + `Z-ARITH-BLOCK-003` → `Z-ORD-BLOCK-001`.  
**Classification:** `MATHEMATICAL_CLAIM`.  
**Evidence:** ordered-ring V5 `32170144944`.

### Z-CL-INTEGRATION-001 — Accepted Stage-One integer integration

**Statement/scope:** selected carrier/identity, faithful N embedding, natural-difference generation, commutative-ring laws, total order and ordered compatibility coexist on the same accepted `Z_BOMA` while preserving all converged production histories.  
**Producer:** `Z-J-002` / `PDSA-Z-005` → `Z-BLOCK-002`.  
**Acceptance:** `ZA-21 = ACCEPT`.  
**Classification:** `MATHEMATICAL_CLAIM / ACCEPTANCE GOVERNANCE`; V5 workflow/checker is `VERIFICATION_INFRASTRUCTURE`.

## 4. Explicit commitment result

The accepted Z path is recorded as not introducing a quotient carrier for integer identity. The difference-pair equivalence remains external on its retained route, while the selected signed syntax has direct formal equality.

Project status records also state that the accepted Z path introduces no built-in `Int`, `Classical`, Choice, `sorry`, or new axiom. This is a source/formalization audit result, not a claim that the host Lean metatheory is absent.

Accordingly the accepted Z closure currently has no separately recorded material classical logical commitment analogous to the localized R commitments.

## 5. Preserved branch provenance

The accepted export retains three separate reconvergence histories:

```text
signed representation       ↔ difference-pair representation
direct signed arithmetic    ↔ pair-mediated arithmetic
direct signed order         ↔ pair cross-sum order
```

Reconvergence does not retroactively identify the branch histories.

## 6. Important non-claims

The accepted Z closure does not claim:

```text
mathematical necessity of signed normal forms
rejection of difference pairs
a quotient-of-pairs integer identity
unbuilt group-completion universal property
recovery of bottom-up TCT/PDSA provenance from Z alone
```

The last point is independently supported by the completed post-Z reverse study.

## 7. Transparency status

```text
Z DECLARED CLAIM CLOSURE = COMPLETE
```

at the current human-readable audit granularity.

A machine-derived theorem-level `ActualFormalClosure(Z)` has not yet been compared against the declared registry under `PDSA-ARCH-002`; therefore no machine-checked `Z TRANSPARENCY PASS` is promoted yet.
