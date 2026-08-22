# C-DP-001 — Stage-One Complex Construction Realization Route

- **Operational Status:** **OPEN — NO OPTION SELECTED**
- **Epistemic Status:** **DECLARED CHOICE PROBLEM / PENDING EVIDENCE**
- **Opened:** 2026-08-21
- **PDSA:** `PDSA-C-001` opens the Decision; `PDSA-C-003` stages comparable independent noncanonical probes
- **Input:** `R-BLOCK-001` through `BOMA-C-R-DEP-001`
- **Governing acceptance contract:** `BOMA-C-ACCEPT-001`
- **Downstream accepted carrier:** **NONE**

## 1. Question

Which construction realization should produce the Stage-One canonical `C_BOMA` carrier and its accepted identity while satisfying the representation-neutral obligations `CA-01..CA-19`?

This is a real architectural choice because multiple admissible constructions can realize the same quadratic extension interface without being definitionally identical.

The Decision Point does **not** ask which representation complex numbers “really are.”

It asks which route BOMA should select for the Stage-One producer after measured comparison.

---

# 2. Shared contract before branching

Every candidate must target the same ex-ante semantics:

```text
faithful R embedding
commutative-field-strength C interface
distinguished I
I² = -1
every z = a + bI with a,b from accepted R
unique such coefficients
non-real-collapse consequence
route-neutral comparison adequacy
transparent dependency/commitment closure
```

A candidate that is easy to formalize but cannot prove this common contract is not acceptable merely because its operations type-check.

---

# 3. Initial options

## C-ROUTE-P — Explicit rank-two / ordered-pair coordinate realization

Schematic idea only:

```text
carrier represented by two accepted real components
```

Potential strengths:

```text
direct coordinate decomposition
transparent R embedding
direct candidate formulas for +, -, *
likely short route to generation/uniqueness
strong computational transparency
```

Potential costs/commitments to measure:

```text
explicit pair/record carrier commitment
formal equality tied to coordinate equality unless another identity is chosen
field inverse proof requires nonzero sum-of-squares or equivalent R lemma
risk of conflating convenient coordinates with mathematical necessity
```

Current status:

```text
ADMISSIBLE CANDIDATE / NONCANONICAL PROBE STAGED / V5 PENDING / NOT SELECTED
```

## C-ROUTE-Q — Polynomial adjunction / quotient-style realization

Schematic idea only:

```text
adjoin a root of X²+1 to accepted R
and realize equality through an explicit quotient/congruence regime
```

Potential strengths:

```text
algebraically expressive generator-and-relation presentation
natural explanation of I as the class of X
natural relation I² = -1
generalizable adjunction methodology
```

Potential costs/commitments to measure:

```text
new polynomial infrastructure
ideal/congruence or equivalent reduction machinery
quotient/formal identity commitment if quotient selected
larger proof-engineering surface
need to prove degree/reduction or coordinate-normal-form theorem
potentially more Trusted-Base/formalization surface
```

Current status:

```text
ADMISSIBLE CANDIDATE / NONCANONICAL PROBE STAGED / V5 PENDING / NOT SELECTED
```

## C-ROUTE-A — Alternative explicit quadratic-adjunction realization

This option is intentionally open only if a third route provides **genuine methodological independence**, for example an abstract rank-two algebra or generator/relation construction not merely a renamed ordered pair or polynomial quotient.

A third route must not be fabricated for visual symmetry.

Admission criterion:

```text
independently meaningful construction method
+
distinct dependency/identity/proof profile
+
scientific comparison value
```

Current status:

```text
CANDIDATE SLOT — NOT REQUIRED / NOT SELECTED
```

---

# 4. Evaluation criteria

Before `SELECTS` may be recorded, route probes must compare at least:

| Criterion | Question |
|---|---|
| Acceptance adequacy | Can the route prove every currently applicable `CA-01..CA-19` obligation? |
| R dependency surface | Does it consume only `R-BLOCK-001` Claims or open extra dependencies? |
| Identity regime | What counts as equality and what proof burden follows? |
| Arithmetic transparency | How directly are zero, one, negation, addition, multiplication, and inverse constructed? |
| `I²=-1` transparency | Is the relation definitional, reduced, or theorem-level? |
| Generation | How is existence of `a+bI` decomposition established? |
| Uniqueness | How is coordinate uniqueness established and what R facts does it require? |
| Field closure | What theorem proves nonzero inverses and what logical/representation commitments does it introduce? |
| Logical cost | Which explicit nonconstructive principles, if any, are actually consumed? |
| Formalization cost | Does the route require `Quotient`, normalization, generated eliminators, or substantial new infrastructure? |
| Proof robustness | Does the formal dependency graph remain inspectable and locally owned? |
| Branch value | Does the route produce an independent realization useful for later reconvergence study? |
| Reconvergence | Can the route be mapped to another candidate by the common coordinate theorem without hidden assumptions? |
| Replaceability | Can downstream Claims depend on the common interface rather than route internals? |

No criterion may be replaced by familiarity or by the fact that a representation is standard textbook notation.

---

# 5. Commitments are option-local until selection

The following implications are forbidden:

```text
C-ROUTE-P is simple
  ⇒ C is mathematically R×R

C-ROUTE-Q uses a quotient
  ⇒ quotient identity is necessary for C

one route reaches V5 first
  ⇒ all alternate routes are mathematically inferior

selected Stage-One route
  ⇒ retained alternatives may be deleted
```

Every probe must preserve:

```text
route identity
assumptions
new infrastructure
logical commitments
representation commitments
formalization commitments
observed failures
verification evidence
```

---

# 6. Required evidence before resolution

At minimum, the initial serious candidates must be compared by an actual PDSA probe rather than narrative expectation.

A useful minimal probe set is:

```text
carrier/identity syntax type-checks
R embedding can be defined
I and I²=-1 can be established
addition/multiplication respect the selected identity
candidate can expose a credible generation/uniqueness route
field-closure prerequisites are measured rather than assumed
actual imports/dependency surface are recorded
```

A full accepted carrier is not required before the Decision; however, a route may not be selected solely on an untested proof sketch if another candidate has not received a comparable probe.

---

# 7. Relationship to future Junctions

`C-DP-001` chooses a Stage-One producer. It is not itself a convergence proof.

If two candidate carriers are built far enough to satisfy the common contract, a later Junction must record the exact strength of their relationship, preferably:

```text
R-algebra / field isomorphism preserving the real embedding and I
```

or a weaker result if that is all the evidence supports.

The common comparison Claim `C-CL-COMPARE-001` provides the representation-neutral target. No Junction ID is created before actual incoming routes exist.

---

# 8. Current decision state

```text
C-DP-001           OPEN
C-ROUTE-P          RETAINED / NONCANONICAL PROBE STAGED / V5 PENDING
C-ROUTE-Q          RETAINED / NONCANONICAL PROBE STAGED / V5 PENDING
C-ROUTE-A          CONDITIONAL CANDIDATE SLOT
SELECTS             NONE
canonical C carrier NONE
```

## Reopening / sensitivity

After eventual resolution, reopen if:

```text
the acceptance semantics change;
the selected route cannot close a required Claim;
a retained route demonstrates materially lower hidden commitments;
a formal dependency audit exposes undeclared route contamination;
a claimed route reconvergence fails;
a downstream theorem requires representation details the common interface failed to expose.
```

Until selection, no C document may draw an arrow from this Decision Point to one option as though it were a derived theorem.