# JUNCTION LEDGER — Convergence Strength and Shared Outputs

**Document ID:** `BOMA-JUNCTION-LEDGER-001`  
**Status:** ACTIVE / SYNCHRONIZED THROUGH ACCEPTED C + STAGE-TWO RESEARCH JUNCTION  
**Date:** 2026-08-22  
**Program lineage:** `PDSA-ARCH-002`; C extension under `PDSA-C-001`

## 1. Purpose

Index canonical Junctions by the **actual strength of convergence** they certify. A Junction is not inferred from a drawing and a shared informal name is not convergence evidence.

Strength vocabulary used here:

```text
EQUALITY                    pointwise/formal equality of compared outputs
EQUIVALENCE                 iff/extensional equivalence of relations/interfaces
CLASSIFICATION              one representation relation is completely classified by another identity regime
SAME-DOWNSTREAM-ADEQUACY    distinct producers establish the same certified downstream contribution
SAME-CARRIER-INTEGRATION    required claims elaborate/coexist on one selected carrier/operation package
R-FIELD-ISOMORPHISM         mutually inverse field maps preserving the accepted R embedding and I
CANONICALITY GATE           representation/recovery is invariant under the declared identity regime
INTERFACE-RECONVERGENCE / PROVENANCE-DIVERGENCE
                            extensional interface reconstructs while constructional/epistemic provenance does not
```

Detailed theorem statements and evidence remain authoritative in each Junction `UNIT.md` and stage evidence records.

## 2. Junction inventory

| Junction | Incoming routes/contributions | Convergence strength | Shared output / role |
|---|---|---|---|
| `TCT-J-001` | selected terminal recovery + `TCT-BR-010` structural identity + derived terminal preservation | `CANONICALITY GATE` | predecessor/terminal recovery well-defined up to `≈` |
| `N-J-001` | internal inductive no-confusion Route A + TCT-constructional no-confusion Route B | `SAME-DOWNSTREAM-ADEQUACY` with theorem-level agreement on no-confusion interface | accepted no-confusion contribution without erasing producer histories |
| `N-J-002` | N kernel, no-confusion, induction/generatedness, recursion/initiality, TCT bridge, standardness | `SAME-CARRIER-INTEGRATION` | N-Core acceptance integration |
| `N-ADD-J-001` | right-recursive `addR` + independently left-recursive `addL` | `EQUALITY` | `∀a b, addL a b = addR a b` and canonical addition eligibility |
| `N-MUL-J-001` | right-recursive `mulR` + independently left-recursive `mulL` | `EQUALITY` | `∀a b, mulL a b = mulR a b` and canonical multiplication eligibility |
| `N-ORD-J-001` | additive-gap witness order + independent inductive order | `EQUIVALENCE` | extensional equivalence of the two order relations |
| `N-ARITH-J-001` | accepted addition, multiplication and order packages | `SAME-CARRIER-INTEGRATION` | accepted N-Arithmetic interface |
| `Z-J-001` | signed normal forms + difference pairs/`~` | `EQUIVALENCE + CLASSIFICATION` | exact signed round trip, pair round trip up to `~`, and `p~q ↔ normalize(p)=normalize(q)` |
| `Z-ARITH-J-001` | direct signed arithmetic + pair-mediated arithmetic | `EQUALITY` | pointwise equality of addition/multiplication producers before canonical spelling |
| `Z-ORD-J-001` | direct signed order + pair cross-sum order | `EQUIVALENCE` | same accepted integer order interface |
| `Z-J-002` | carrier/identity, ring, embeddings/generation, order/compatibility | `SAME-CARRIER-INTEGRATION` | `ZA-21` integer acceptance integration |
| `Z-RE-J-001` | independently reconstructed Z-only nonnegative-cone N candidates + frozen bottom-up N/N-Arithmetic reference | `INTERFACE-RECONVERGENCE / PROVENANCE-DIVERGENCE` | exact selected-representation round trips and preservation of `0,S,+,*,≤`; original TCT/Decision/PDSA provenance not recovered |
| `Q-J-002` | quotient carrier/identity, algebra, inverse witnesses, embeddings, generation, order | `SAME-CARRIER-INTEGRATION` | `QA-23` rational acceptance integration |
| `R-J-002` | identity/Q embedding/order, algebra/inverse, completeness, density, Archimedean claims | `SAME-CARRIER-INTEGRATION` | `RA-21` integration and `RA-22` acceptance eligibility |
| `C-J-001` | selected pair witness field + quadratic comparison + actual nine-Claim dependency closure | `SAME-CARRIER-INTEGRATION` | `C-CL-INTEGRATION-001` / `CA-19` PASS / V5 `32585583815`; separately accepted by `CA-20` |
| `ST2-EXP-002-PQ-J-001` | accepted selected Route P field + independently verified Route Q formal-expression quotient field | `R-FIELD-ISOMORPHISM / RESEARCH ONLY` | explicit mutually inverse maps preserving embedded R and I / V5 `32597346281`; not canonical acceptance |

`C-J-001` remains the accepted selected-carrier integration Junction.
`ST2-EXP-002-PQ-J-001` is a different **research-only** representation
reconvergence Junction between the accepted P field and the independently
verified Q field. Route Q is `VERIFIED INDEPENDENT RESEARCH FIELD / NOT AN
ACCEPTED EXPORT`; neither its completion nor the research Junction changes
`CA-20`, creates a canonical Q Block, or replaces `C-J-001`.

## 3. Provenance rule

For every row above:

```text
reconvergence ≠ retroactive identity of production history
```

Therefore downstream canonical spelling may consume the shared certified output while the repository must retain:

```text
incoming route identities
route-local assumptions
route-local evidence
translation/equality/equivalence proof
Junction reopening conditions
```

`Z-RE-J-001` makes the provenance rule especially explicit: extensional reconstruction of the natural interface after Z does not reconstruct the original bottom-up TCT/PDSA/Decision history.

The same rule is now binding on C in advance: a future route isomorphism may establish interface equivalence without erasing the fact that one route used coordinate data and another used polynomial/congruence machinery.

## 4. Claim and Learning-Graph linkage

Principal forward Claim Registry links include:

```text
N-J-001       → N-CL-NOCONF-CONV-001
N-J-002       → N-CL-INTEGRATION-001
N-ADD-J-001   → NAR-CL-ADDCONV-001
N-MUL-J-001   → NAR-CL-MULCONV-001
N-ORD-J-001   → NAR-CL-ORDERCONV-001
N-ARITH-J-001 → NAR-CL-INTEGRATION-001
Z-J-001       → Z-CL-REPCONV-001
Z-ARITH-J-001 → Z-CL-ARITHCONV-001
Z-ORD-J-001   → Z-CL-ORDERCONV-001
Z-J-002       → Z-CL-INTEGRATION-001
Q-J-002       → Q-CL-INTEGRATION-001
R-J-002       → R-CL-INTEGRATION-001
```

`TCT-J-001` remains a pre-numerical canonicality gate rather than a number-stage acceptance Claim ID in the current registry rollout.

`Z-RE-J-001` is a **post-acceptance reverse/learning Junction**, not a member of the forward accepted Z export Claim closure. Its authoritative result is:

```text
INTERFACE RECONVERGENCE / PROVENANCE DIVERGENCE
```

with V5 comparison run `32171528363` and detailed learning record:

```text
LAB/PDSA/experiments/PDSA-Z-RE-001_BOTTOM_UP_VS_REVERSE_COMPARISON.md
```

It must therefore be indexed here without fabricating a forward `Z-CL-*` Claim merely to make the ledger visually uniform.

For accepted C, `C-CL-COMPARE-001` and `C-CL-INTEGRATION-001` have
actual verified producers and accepted same-carrier Junction `C-J-001`.
The distinct `ST2-EXP-002-PQ-J-001` consumes two completed incoming research
routes and supplies verified R-field representation reconvergence without
creating a second accepted export or inventing an empty canonical `C-J-*` unit.

## 5. C accepted-versus-research Junction discipline

`BOMA-C-ACCEPT-001` identifies two materially different possible Junction roles that must not be conflated:

### Representation reconvergence

Triggered only if two candidate C carriers are built far enough to satisfy the shared contract.

Preferred target strength:

```text
R-algebra / field isomorphism preserving the embedded R and distinguished I
```

A weaker result must be labelled by its actual strength.

### Final same-carrier integration

Triggered only after one selected carrier has actual producers for the acceptance-level field/embedding/generator/decomposition Claims.

Likely strength:

```text
SAME-CARRIER-INTEGRATION
```

No Junction ID is reserved merely for naming convenience. An ID is allocated when the incoming producer set and question are concrete.

## 6. Reopening rule

A Junction must be marked for retest if a change affects:

```text
an incoming producer;
the compared output statement;
the identity/equivalence regime;
a route-local assumption used by the convergence proof;
the formal theorem/certificate implementing convergence;
the accepted source assembly for that certificate.
```

For reverse/learning Junctions, changes to the frozen reference interface or reverse candidate construction also trigger retest.

A change confined to a branch artifact not consumed by the Junction does not automatically invalidate the shared downstream contribution.

## 7. Current boundary

```text
C authorization              ACTIVE / STAGE ACCEPTED
C-DP-001                     RESOLVED / C-ROUTE-P SELECTED
C selected producer          C-BLOCK-001 / ACCEPTED P FIELD PRODUCER
C accepted export            C-BLOCK-002 / CA-20 ACCEPT
C accepted integration       C-J-001 / SAME-CARRIER-INTEGRATION / PASS
C retained alternative       VERIFIED INDEPENDENT RESEARCH FIELD / NOT AN ACCEPTED EXPORT
C research reconvergence     ST2-EXP-002-PQ-J-001 / R-FIELD-ISOMORPHISM / PASS
ST2-EXP-001 / ST2-EXP-002     CLOSED / PASS
active experiment            NONE
```

The previous user hold and earlier preconstruction Junction descriptions are
historical provenance; they do not override this synchronized current
boundary. Accepted and research Junctions stay separate. Typed branch
attachments are indexed in
`LAB/PDSA/STAGE_TWO_BRANCH_ORIGIN_LEDGER_001.json`.
