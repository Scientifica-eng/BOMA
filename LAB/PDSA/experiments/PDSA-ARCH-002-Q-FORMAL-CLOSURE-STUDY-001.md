# PDSA-ARCH-002 — Q Formal Closure Study 001

**Status:** CLOSED — Q RESIDUAL SET REDUCED TO ZERO  
**Date:** 2026-08-20  
**Branch:** `architecture/claim-transparency-001`  
**Program:** `PDSA-ARCH-002`  
**Accepted stage:** `Q-BLOCK-002 / QA-23` — unchanged  
**C:** `NOT STARTED — USER HOLD`

## 1. Question

Can the accepted Q interface be machine-audited at theorem level without inventing a new synthetic rational certificate and without treating unused helper lemmas as acceptance producers?

## 2. Existing accepted Q packaging

The canonical accepted assembly is:

```text
LAB/20_FORMALIZATION/Q_STAGE/Q_ACCEPTED_INPUTS.txt
```

and already contains:

```text
LAB/payloads/lean/QStage/QIntegrationCertificate.lean
```

The integration file does not define one theorem containing the whole interface. Instead it exposes several final package theorems:

```text
q_nontrivial
q_additive_package
q_ring_package
q_inverse_package
q_integer_embedding_package
q_order_package
q_ordered_field_package
q_positive_inverse_package
q_generation_package
```

Several accepted properties are also intentionally represented by standalone laws rather than duplicated inside the integration file, including additive/multiplicative identities, partial-order laws, N-embedding preservation, addition translation equivalence, and exact fraction-class equality.

Therefore the Q audit uses `producer_union` over the existing accepted theorem surface. No new mathematical theorem or acceptance certificate was fabricated for audit convenience.

## 3. Machine method

The same calibrated machinery used for R was generalized so:

```text
lean_dependency_audit.py
```

can union and deduplicate closure data from multiple `--target` declarations, while:

```text
formal_claim_producer_compare.py
```

supports policy-driven Claim patterns and two root modes:

```text
single_target
producer_union
```

R remains `single_target`; Q uses `producer_union`.

The audit still compiles the accepted assembly before importing Lean metaprogramming support.

## 4. First Q run

Workflow run:

```text
32416480087
```

Audited source:

```text
3fb2979996d7436050831b0c01e688f81114c4df
```

Results:

```text
PROTOTYPE_PASS
CLASSIFICATION_PASS
CLAIM_PRODUCER_REVIEW_REQUIRED
```

The formal boundary was clean immediately. The sole residual was not a hidden Lean dependency but an overstatement in the initial Claim producer policy:

```text
Q-CL-GATE-001
  declared producer: BOMA.Q.Gateway001.zmul_ne_zero
  actual accepted-claim closure: declaration not consumed
```

The same source file describes `zmul_ne_zero` as a convenient fraction-denominator lemma. The dependency actually required by accepted fraction equivalence/order paths is:

```text
BOMA.Q.Gateway001.zmul_right_cancel_nonzero
```

The graph showed this exact path, for example through:

```text
qAdd_zero_left
  → fracSetoid
  → frac_trans
  → zmul_right_cancel_nonzero
```

## 5. Act on first run

The incorrect action would have been to add `zmul_ne_zero` as another audit root solely so the policy passed.

That would confuse:

```text
available helper lemma
```

with:

```text
producer actually consumed by the accepted Claim closure
```

Instead `zmul_ne_zero` was removed from the Q Claim producer policy while remaining untouched in source. Its proof remains valid and available; it simply is not falsely labeled an acceptance producer.

This is a documentation/ownership correction, not a mathematical change.

## 6. Second Q run

Workflow run:

```text
32416694028
```

Audited source:

```text
87b635a15cb057a517e201f8fbf99b54296533b8
```

Toolchain:

```text
leanprover/lean4:v4.32.1
```

Results:

```text
PROTOTYPE_PASS
CLASSIFICATION_PASS
CLAIM_PRODUCER_PASS
```

Formal boundary:

```text
external boundary leaves                    72
classified external leaves                  72
external residuals                           0
internal residuals                           0
total residuals                              0
```

Boundary classes:

```text
TRUSTED_METATHEORY                          63
TRUSTED_FORMALIZATION_INFRASTRUCTURE         9
DECLARED_LOGICAL_COMMITMENT                  0
```

This independently confirms that the selected Q closure introduces no Q-specific classical logical leaf under the current formal policy. Lean Quotient/Setoid infrastructure remains explicit formalization infrastructure rather than being confused with a mathematical necessity claim.

Claim/producer comparison:

```text
registry Claim IDs                          10
policy Claim IDs                            10
declared producers                          49
audit targets                               20
internal declarations                      338
owned internal declarations                338
unowned internal declarations                0
residual groups                              0
```

Internal source-stage distribution:

```text
N-Core          19
N-Arithmetic    59
Z              111
Q              149
TOTAL          338
```

## 7. Study result

For the selected accepted Q theorem surface at audited source `87b635a15cb057a517e201f8fbf99b54296533b8`:

```text
ActualFormalClosure(Q acceptance roots)
  ⊆
Declared Q Claim-producer closure
+ transitive supporting ancestry
+ explicit formalization infrastructure
+ Trusted Base
```

with zero unclassified residuals and zero unowned internal declarations.

## 8. Learning retained

The Q study adds a distinct lesson to the BOMA Learning Graph:

```text
A theorem can be valid, useful, and intentionally retained in source
without being an actual producer of the accepted Claim closure.
```

Machine transparency therefore constrains not only hidden dependencies but also **over-claimed producer ownership**.

The first failed Claim/producer result is preserved in Git history/evidence lineage and is not rewritten as if the initial policy were correct.

## 9. Non-effects

This study does not:

```text
change QA-23;
change QBOMA := Quotient fracSetoid;
make quotient identity mathematically necessary;
remove retained Q alternatives;
introduce Choice/Classical into Q;
reopen Z/N;
start C.
```

## 10. Act

Q is eligible for:

```text
Q TRANSPARENCY PASS — BRANCH-LOCAL CERTIFICATION
```

under `PDSA-ARCH-002`.

Next stage in reverse accepted-stage order: Z.
