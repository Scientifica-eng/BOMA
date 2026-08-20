# CLAIM REGISTRY — Accepted-Claim Traceability Index

**Document ID:** `BOMA-CLAIM-REGISTRY-001`  
**Status:** ACTIVE / INITIAL R CALIBRATION COMPLETE; Q/Z/N MAPPING PENDING  
**Date:** 2026-08-20  
**Schema:** `LAB/00_ARCHITECTURE/CLAIM_ARCHITECTURE.md`  
**Program:** `PDSA-ARCH-002`

## 1. Purpose

Provide one project-level index from accepted mathematical claims to their acceptance role, construction producer, dependency classifications, and formal evidence.

This registry is an assertion-audit layer. It does not replace Brick/Block/Junction/Decision Point identities and does not replace stage-specific evidence files.

## 2. Accepted export inventory

| Export | Mathematical status | Claim-closure mapping status |
|---|---|---|
| `N-BLOCK-007` | ACCEPTED | PENDING — Phase B5 |
| `N-ARITH-BLOCK-001` | ACCEPTED | PENDING — Phase B4 |
| `Z-BLOCK-002` | ACCEPTED | PENDING — Phase B3 |
| `Q-BLOCK-002` | ACCEPTED | PENDING — Phase B2 |
| `R-BLOCK-001` | ACCEPTED / `RA-22` | INITIAL DECLARED-CLOSURE MAP COMPLETE — Phase B1 |

Post-acceptance reverse records such as `RE-R-001` are classification/audit outputs, not additional accepted number-domain exports.

## 3. R-stage calibrated Claim Records

The R records below are calibrated against:

```text
R-BLOCK-001
R_CLAIM_V5_INDEX.md
R_STAGE_ACCEPTANCE_AUDIT_001.md
R_STAGE_ACCEPTANCE_CLOSURE_AUDIT_002.md
PDSA-R-015 / RE-R-001 dependency classification
R_INTEGRATION_002_INPUTS.txt
R_INTEGRATION_002_V5_LATEST.md
```

The current latest integration evidence on the PDSA-ARCH-002 baseline records:

```text
run             32385379288
verified source af0a03d83245b1e15e9903df00db89edf3317042
Lean            4.32.1
result          PASS
```

### R-CL-CARRIER-001 — Explicit accepted real carrier and formal identity

**Statement/scope**

```text
LowerCut over QBOMA
CutEquiv A B := ∀q, A.lower q ↔ B.lower q
RBOMA := Quotient cutSetoid
```

**Acceptance:** `RA-01`, `RA-02`.  
**Producer:** selected Dedekind representation + `R-DP-002` + quotient identity layer.  
**Classification:**

```text
accepted need for explicit carrier/identity  MATHEMATICAL_CLAIM / STRUCTURALLY NECESSARY relative to R acceptance
LowerCut representation                     REPRESENTATION_COMMITMENT / ROUTE-SPECIFIC — DEDEKIND
Quotient identity                           FORMALIZATION_COMMITMENT
Lean Quotient availability                  TRUSTED_METATHEORY
```

**Evidence:** `R_DEDEKIND_QUOTIENT_IDENTITY_V5_LATEST.md`, run `32180783725`.  
**Alternative:** external `CutEquiv` identity retained; Cauchy carrier retained as branch candidate.  
**Sensitivity:** changing representation or formal identity reopens dependent equality/order/operation lifts and final integration.

### R-CL-QEMBED-001 — Faithful, order-exact rational embedding

**Statement/scope**

```text
rOfQ : QBOMA → RBOMA
injective
preserves/reflects accepted rational order
```

and downstream certified preservation of accepted Q constants/operations through their respective operation Blocks.

**Acceptance:** `RA-03`, part of `RA-10`.  
**Producer:** principal-cut embedding + quotient identity/order layer + operation-preservation proofs.  
**Dependencies:** accepted `Q-BLOCK-002`, `R-CL-CARRIER-001`.  
**Classification:** `MATHEMATICAL_CLAIM`; principal-cut realization is `ROUTE-SPECIFIC — DEDEKIND`.  
**Evidence:** identity/order run `32180783725` plus operation-specific R evidence.

### R-CL-ORDER-001 — Accepted total-order interface

**Statement/scope**

```text
rLE reflexive
rLE transitive
rLE antisymmetric
rLE total
rLT := rLE ∧ ≠
```

with exact extension of accepted Q order.

**Acceptance:** order portion of `RA-09`, `RA-10`.  
**Producer:** constructive inclusion-order core + `R-LOGIC-BR-001`.  
**Dependencies/classification:**

```text
partial-order core                 MATHEMATICAL_CLAIM; current realization ROUTE-SPECIFIC — DEDEKIND
CutComparability witness           LOGICAL_COMMITMENT
localized Classical.em             LOGICAL_COMMITMENT
LowerCut/CutLE                      REPRESENTATION_COMMITMENT
```

**Evidence:** `R_DEDEKIND_ORDER_LOGIC_SPLIT_V5_LATEST.md`, run `32181726522`.  
**Alternative:** constructive locatedness/strengthened cuts or another strict/total order regime retained.  
**Sensitivity:** removing the totality witness invalidates accepted total-order closure and current sign-dependent proofs unless replaced.

### R-CL-NONTRIV-001 — Nontriviality

**Statement:** `rZero ≠ rOne`.  
**Acceptance:** `RA-04`, ordered-field closure.  
**Producer:** accepted Q strict order + faithful Q embedding / final closure theorem.  
**Classification:** `MATHEMATICAL_CLAIM`.  
**Evidence:** final integration certificate; latest evidence run `32385379288` for the current source assembly.

### R-CL-ADD-001 — Additive commutative-group interface

**Statement/scope**

```text
rZero
rAdd
rNeg
associativity
commutativity
zero identities
additive inverse
cancellation
involutive negation
```

**Acceptance:** `RA-05`, `RA-06`, additive portion of `RA-09`, part of `RA-10`.  
**Producer:** `R-ADD-BLOCK-001` + `R-NEG-CANDIDATE-BLOCK-001` + `R-QARCH-BLOCK-001` → `R-ADD-GROUP-BLOCK-001`.  
**Dependencies/classification:**

```text
Q addition/order/density interfaces          MATHEMATICAL_CLAIM
cut addition / cut negation                  ROUTE-SPECIFIC — DEDEKIND
Q natural-upper/scaling subclaims            REUSABLE CERTIFIED CONTRIBUTIONS
finite cut membership search                 LOGICAL_COMMITMENT + ROUTE-SPECIFIC
cut_bracket_approx                           ROUTE-SPECIFIC — DEDEKIND
```

**Evidence:** runs `32183597094`, `32183864915`, `32184188077`, `32184767097`, `32186209544`, `32186543211`.  
**Sensitivity:** additive inverse proof must be rechecked if fine bracketing/negation/addition identity changes.

### R-CL-MUL-001 — Ordered commutative-ring multiplication

**Statement/scope**

```text
rMulCandidate
commutativity
associativity
zero absorption
one identities
left/right distributivity
nonnegative-factor monotonicity
```

**Acceptance:** `RA-07`, ring/order portion of `RA-09`, multiplication part of `RA-10`.  
**Producer:** `R-MUL-BLOCK-001`, selected by `R-DP-005` architecture.  
**Dependencies/classification:**

```text
positive envelope / nonnegative cut kernel  ROUTE-SPECIFIC — DEDEKIND
Q positive multiplicative approximation     REUSABLE CERTIFIED CONTRIBUTION
signed decomposition architecture           REPRESENTATION / ARCHITECTURAL CHOICE
proof-level sign classification              LOGICAL_COMMITMENT via total-order interface
additive group                               MATHEMATICAL_CLAIM
```

**Evidence:** principal runs `32189753112`, `32191203164`, `32191975377`, `32192506728`, `32192653931`.  
**Alternatives:** direct sign-case and shift-to-positive multiplication routes retained as branch candidates.

### R-CL-INV-001 — Unique nonzero multiplicative-inverse witness

**Statement/scope**

```text
x ≠ rZero → ∃y, x*y = rOne
left inverse follows by commutativity
inverse witness is unique
```

No global Choice-backed selector is part of the accepted interface.

**Acceptance:** `RA-08`, inverse-dependent portion of `RA-09`.  
**Producer:** `R-DP-006` selected direct positive Dedekind reciprocal → `R-FIELD-BLOCK-001`.  
**Dependencies/classification:**

```text
Q inverse-order / reciprocal arithmetic    REUSABLE CERTIFIED CONTRIBUTION
positive reciprocal LowerCut               ROUTE-SPECIFIC — DEDEKIND
fine/anchored bracketing                    ROUTE-SPECIFIC — DEDEKIND
positive representative extraction          LOGICAL_COMMITMENT / route-sensitive witness step
signed extension                            consumes R-CL-ORDER-001
```

**Evidence:** runs `32355681924`, `32356254961`, `32356513408`.  
**Alternative:** completeness/supremum inverse retained but not built to reconvergence.

### R-CL-FIELD-001 — Acceptance-strength ordered-field closure

**Statement/scope**

On the same accepted carrier/operations:

```text
nontriviality
additive group
commutative multiplicative algebra
unique nonzero inverse witnesses
translation invariance
negation order reversal
nonnegative-factor multiplication monotonicity
positive inverse behavior
```

**Acceptance:** `RA-09` and integration-relevant parts of `RA-04..10`.  
**Producer:** `R-ADD-GROUP-BLOCK-001` + `R-MUL-BLOCK-001` + `R-FIELD-BLOCK-001` + order/closure payload.  
**Classification:** `MATHEMATICAL_CLAIM`; current realization inherits route-specific/logical dependencies only through the subclaims actually consumed.  
**Evidence:** `RDedekindOrderedFieldClosure.lean` consumed by `R-J-002`; latest integration evidence run `32385379288`.

### R-CL-COMP-001 — Dedekind least-upper-bound completeness

**Statement/scope**

Every nonempty bounded `F : RBOMA → Prop` has a least upper bound in `RBOMA`.

**Acceptance:** `RA-11`.  
**Producer:** `R-COMP-BLOCK-001`.  
**Classification:**

```text
completeness property required by R acceptance  MATHEMATICAL_CLAIM / STRUCTURALLY NECESSARY relative to contract
witness-by-union LowerCut proof                 ROUTE-SPECIFIC — DEDEKIND
```

**Logical note:** does not consume the total-comparability classical witness.  
**Evidence:** run `32182056311`.  
**Non-claim:** no automatic Cauchy/metric/sequential completeness.

### R-CL-DENSITY-001 — Strict rational-image density

**Statement:**

```text
x < y → ∃q : QBOMA, x < rOfQ q ∧ rOfQ q < y
```

**Acceptance:** `RA-12`.  
**Producer:** `R-DENSITY-BLOCK-001`.  
**Dependencies/classification:**

```text
Q internal density                    REUSABLE CERTIFIED CONTRIBUTION
Dedekind roundedness                  ROUTE-SPECIFIC — DEDEKIND
strict-inclusion witness extraction   LOGICAL_COMMITMENT, localized
principal-cut sandwich                ROUTE-SPECIFIC — DEDEKIND
```

**Evidence:** run `32359834460`.

### R-CL-ARCH-001 — Archimedean embedded-natural upper bound

**Statement:**

```text
∀x : RBOMA, ∃n : N_BOMA, x < rOfQ(qOfN n)
```

**Acceptance:** `RA-13`.  
**Producer:** `R-ARCH-BLOCK-001`.  
**Dependencies/classification:**

```text
Q natural upper bound          REUSABLE CERTIFIED CONTRIBUTION
LowerCut proper/downward       ROUTE-SPECIFIC — DEDEKIND
principal-cut strict inclusion ROUTE-SPECIFIC — DEDEKIND
```

**Logical note:** does not inherit finite cut-membership `Classical.em` from the stronger bracketing route.  
**Evidence:** run `32359869558`.

### R-CL-INTEGRATION-001 — Same-carrier acceptance integration

**Statement/scope**

The accepted identity/order/Q embedding, nontriviality, additive group, field-witness algebra, ordered compatibility, Dedekind LUB completeness, rational density, and Archimedean characterization elaborate together on the same carrier and operations.

**Acceptance:** `RA-21 / R-J-002`; supports `RA-22 ACCEPT`.  
**Producer:** `RStageIntegration002.lean` + ordered assembly manifest.  
**Classification:**

```text
mathematical coexistence/integration assertion   MATHEMATICAL_CLAIM / ACCEPTANCE GOVERNANCE
assembly manifest/workflow                       VERIFICATION_INFRASTRUCTURE
Lean checker/toolchain                           TRUSTED BASE / VERIFICATION_INFRASTRUCTURE
```

**Evidence:** `R_INTEGRATION_002_V5_LATEST.md`, current baseline run `32385379288`, verified source `af0a03d83245b1e15e9903df00db89edf3317042`.

## 4. R non-claim boundaries retained by the registry

The R Claim Records do not promote:

```text
Cauchy completeness
metric completeness
sequential completeness
nested-interval completeness
equivalence of completeness notions
uniqueness of complete ordered fields
Dedekind↔Cauchy isomorphism
all real analysis
transcendental theory
measure theory
complex-number construction
```

## 5. Next mapping actions

```text
B2  construct Q accepted-claim closure and register Q claims
B3  construct Z accepted-claim closure and register Z claims
B4  construct N-Arithmetic accepted-claim closure
B5  construct N-Core accepted-claim closure
```

Only after these declared closures stabilize should `PDSA-ARCH-002` introduce the first automated declared-vs-formal dependency comparison.
