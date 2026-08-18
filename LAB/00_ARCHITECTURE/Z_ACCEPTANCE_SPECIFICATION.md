# INTEGER ACCEPTANCE SPECIFICATION

**Document ID:** `BOMA-Z-ACCEPT-001`  
**Version:** `1.1`  
**Status:** **ACTIVE — TARGET SPECIFICATION**  
**Depends on:** `N-ARITH-BLOCK-001 — Accepted Natural-Number Arithmetic Interface`

## Purpose

Define the obligations that must be satisfied before BOMA may classify a constructed domain as the Stage-One integer domain.

The specification is representation-neutral: it does not presuppose quotient pairs, signed normal forms, or any built-in integer type.

---

# Core carrier obligations

## ZA-01 — Explicit integer carrier

Construct a formal carrier `Z_BOMA` or an explicitly scoped equivalent realization. The carrier must not be Lean built-in `Int` by definition.

## ZA-02 — Integer identity/equality

State the formal equality/identity regime. If a quotient/equivalence-class construction is used, the relationship between representative equality and integer equality must be explicit.

## ZA-03 — Zero / one

Construct integer zero and one and show compatibility with the accepted natural zero/one embedding.

## ZA-04 — Natural embedding

Construct:

```text
ι : N_BOMA → Z_BOMA
```

with explicit evidence of injectivity/faithfulness.

## ZA-05 — Negation

Construct:

```text
neg : Z_BOMA → Z_BOMA
```

and establish involution and zero compatibility.

---

# Additive group obligations

## ZA-06 — Integer addition

Construct total addition and verify:

```text
associativity
commutativity
zero identity
x + (-x) = 0
```

The accepted package must therefore expose a commutative additive-group interface without importing it from an external integer type.

## ZA-07 — Every integer is a natural difference

Establish a representation/generation theorem of the form:

```text
∀z, ∃a b : N_BOMA, z = ι(a) - ι(b)
```

or a precisely equivalent statement in the selected representation.

This is a characterization obligation, not merely a construction hint.

---

# Multiplicative obligations

## ZA-08 — Integer multiplication

Construct total multiplication compatible with natural multiplication.

## ZA-09 — Ring laws

Verify at least:

```text
multiplication associative
multiplication commutative
one identity
left/right distributivity over addition
zero absorption
negation multiplication laws as needed
```

Together with ZA-06, record the exact commutative-ring law interface rather than relying on a label alone.

---

# Embedding preservation

## ZA-10 — Natural arithmetic preservation

Verify:

```text
ι(0)=0
ι(1)=1
ι(a+b)=ι(a)+ι(b)
ι(a*b)=ι(a)*ι(b)
```

and injectivity of `ι`.

No natural arithmetic theorem may be re-imported from a built-in integer coercion.

---

# Order obligations

## ZA-11 — Integer order construction

Construct a total order on the integer carrier explicitly.

## ZA-12 — Order extension

Show that the integer order extends the accepted natural order:

```text
ι(a) ≤ ι(b) ↔ a ≤ b
```

within the declared natural/integer interfaces.

## ZA-13 — Ordered arithmetic compatibility

At minimum establish:

```text
addition monotonicity / translation invariance
sign reversal under negation
multiplication compatibility for nonnegative factors
```

with exact hypotheses recorded.

---

# Representation / branch obligations

## ZA-14 — Representation accounting

Every representation route must distinguish:

```text
carrier syntax
representation equivalence
normalization
formal integer identity
backend-only representation
```

## ZA-15 — Parallel representation convergence

The initial Stage-One integer experiment will investigate at least two routes:

```text
Route S — signed canonical normal forms
Route D — natural-number difference pairs with explicit equivalence
```

Before a canonical representation is selected, construct explicit translations and prove the strongest feasible round-trip/equivalence statement.

## ZA-16 — Canonical representation Decision Point

Only after the representation-convergence evidence exists may a Decision Point select the canonical Stage-One export representation. Selection criteria must include:

```text
transparency
minimal commitments
proof burden
normalization/identity clarity
arithmetic compositionality
later rational-construction suitability
formal verification suitability
branch comparability
```

A selected representation does not become mathematically necessary.

## ZA-17 — Universal / characterization certificate

Provide an explicit characterization sufficient to distinguish the accepted domain from arbitrary signed-looking structures. Preferred evidence includes a natural-difference generation theorem and, if adopted, a group-completion/universal property with its exact formal scope.

---

# Verification / integration / closure

## ZA-18 — Commitment ledger

Record all new commitments, especially any use of:

```text
quotient types
choice or classical reasoning
normalization principles
new inductive carrier formation
proof irrelevance/extensionality
universe changes
```

## ZA-19 — Formal verification

Machine-relevant claims must be checked under pinned/reproducible evidence and mapped to canonical units. Built-in `Int` may be used only as an external comparison target after the BOMA carrier exists.

## ZA-20 — Integer integration gate

A final Junction must verify mutual compatibility of carrier/identity, embedding, additive inverses, multiplication, order, representation convergence, and commitment records.

## ZA-21 — Integer closure

Only after ZA-01..20 pass may the project classify the BOMA Stage-One integer domain as accepted and permit promotion to the rational-number stage.

---

# Mandatory post-acceptance reverse-engineering experiment

This is **not** a precondition for ZA-21. It begins only after the Stage-One integer domain has been accepted.

## POST-Z-RE-01 — Reverse reconstruction of N from accepted Z

Immediately after ZA-21 acceptance, open a new PDSA experiment whose source is the accepted integer package and whose target is a natural-number-like substructure reconstructed from Z without simply importing the already accepted `N_BOMA` as the answer.

The reverse route must make explicit which Z features it consumes, for example:

```text
zero
one
integer addition/multiplication
integer order
nonnegative cone / positive-successor structure
natural embedding, if used only as comparison evidence rather than the definition
```

The experiment must distinguish at least:

```text
reverse-derived structure from Z
reference comparison map to accepted N_BOMA
features genuinely recoverable from Z
features recoverable only after extra choices/commitments
features of the original bottom-up construction that are lost or compressed in Z
```

## POST-Z-RE-02 — Reconvergence comparison with the bottom-up path

After a reverse candidate `N_from_Z` has been built, compare it against the established bottom-up construction:

```text
pre-numerical TCT
   → accepted N-Core
   → accepted N-Arithmetic
   → accepted Z
```

versus:

```text
accepted Z
   → reverse-engineered N_from_Z
```

The comparison must not stop at carrier isomorphism. It must compare:

```text
carrier/identity interface
zero/successor recovery
induction/generatedness status
recursion/initiality status
addition/multiplication/order
natural embedding behavior
dependency graph
formal commitments
logical strength actually consumed
construction provenance
information lost or gained by passing through Z
reusable certified contributions
```

A dedicated Junction must record whether the two routes reconverge on the same accepted natural-number interface and where their construction histories remain irreducibly different.

The reverse experiment may produce PASS, CONDITIONAL PASS, branch divergence, or a negative result. No outcome is to be forced by the prior existence of `N_BOMA`.

---

# Initial research topology

```text
N-ARITH-BLOCK-001
        │
        ├────────► Route S: Signed Normal Forms
        │
        └────────► Route D: Difference Pairs + Equivalence
                          \   /
                           \ /
                         Z-J-001
                 representation convergence
                            │
                            ▼
                         Z-DP-001
                 canonical representation choice
                            │
                            ▼
                  canonical integer arithmetic/order
                            │
                            ▼
                      Z integration gate
                            │
                            ▼
                       ZA-21 ACCEPT
                            │
                            ▼
                  POST-Z reverse experiment
                   accepted Z → N_from_Z
                            │
                            ▼
             compare/reconverge with bottom-up N
```

The initial fork is a parallel research/construction fork, not yet a Decision Point selecting one representation over the other.
