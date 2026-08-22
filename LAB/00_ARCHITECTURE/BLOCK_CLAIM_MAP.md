# BLOCK → CLAIM MAP — Construction Packages and Assertion Exports

**Document ID:** `BOMA-BLOCK-CLAIM-MAP-001`  
**Status:** ACTIVE / ACCEPTED-STAGE MAP + C PROVISIONAL FRONTIER  
**Date:** 2026-08-21  
**Program lineage:** `PDSA-ARCH-002`; C extension under `PDSA-C-001`

## 1. Purpose

Make explicit which canonical Blocks **produce/package** which Claim families without pretending that every theorem or internal definition is a Brick.

This map is a view over canonical `UNIT.md` records and Claim Closure audits. It does not replace Block membership or theorem ownership records.

## 2. Pre-numerical TCT

| Block | Declared internal content | Main exported role |
|---|---|---|
| `TCT-BLOCK-001` | `ε`, `U`, interface compatibility, `⊙` | construction kernel; no numerical claim |
| `TCT-BLOCK-002` | formation, selected normal form, terminal visibility, meta-level recovery | selected generated presentations + recovery procedure |
| `TCT-BLOCK-003` | canonical decomposition judgment | canonical predecessor/terminal decomposition up to `≈` |
| `TCT-BLOCK-004` | decomposition-history witnesses | pre-numerical structural iteration history |
| `TCT-BLOCK-005` | terminal extension package | successor-like extension guarantee |
| `TCT-BLOCK-006` | historical aggregate view only | provenance; not canonical N topology |

`TCT-BR-009` and `TCT-BR-010` remain true canonical Bricks. Historical provisional labels `TCT-BR-001..008` are not current canonical Brick identities after PDSA-ARCH-002 granularity normalization.

## 3. N-Core

| Block | Canonical Brick members / inputs | Principal Claim families |
|---|---|---|
| `N-BLOCK-001` | `N-BR-001..003` | `N-CL-CARRIER-001`, `N-CL-ID-001`, `N-CL-ELIM-001` |
| `N-BLOCK-002` | `N-BR-004..005` | `N-CL-NOCONF-A-001` |
| `N-BLOCK-003` | `N-BR-006..007` | `N-CL-IND-001`, `N-CL-GEN-001` |
| `N-BLOCK-004` | `N-BR-008..011` | `N-CL-REC-001`, `N-CL-RECUNIQ-001`, `N-CL-INITIAL-001` |
| `N-BLOCK-005` | `N-BR-012..017` | TCT realization/faithfulness/coverage/history Claims |
| `N-BLOCK-006` | `N-BR-019..020` | `N-CL-COMPARE-001`, `N-CL-STANDARD-001` |
| `N-BLOCK-007` | accepted aggregate after `N-J-001/N-J-002`; consumes independent `N-BR-018` | `N-CL-INTEGRATION-001` |

Independent `N-BR-018` is not silently reassigned to `N-BLOCK-002`; it remains the constructional no-confusion producer Route B feeding `N-J-001`.

## 4. N-Arithmetic

| Block | Brick members / role | Principal Claim families |
|---|---|---|
| `N-ADD-BLOCK-001` | `N-ADD-BR-001..002`, right recursion | `NAR-CL-ADDDEF-001` |
| `N-ADD-BLOCK-002` | `N-ADD-BR-003..004`, left recursion | `NAR-CL-ADDDEF-001` |
| `N-ADD-BLOCK-003` | `N-ADD-BR-007..012`, canonical export/laws | `NAR-CL-ADD-001` |
| `N-MUL-BLOCK-001` | `N-MUL-BR-001..002`, right recursion | `NAR-CL-MULDEF-001` |
| `N-MUL-BLOCK-002` | `N-MUL-BR-003..004`, left recursion | `NAR-CL-MULDEF-001` |
| `N-MUL-BLOCK-003` | `N-MUL-BR-007..012`, canonical export/laws | `NAR-CL-MUL-001` |
| `N-ORD-BLOCK-001` | `N-ORD-BR-001..002`, additive-witness route | `NAR-CL-ORDERDEF-001` |
| `N-ORD-BLOCK-002` | `N-ORD-BR-003..004`, inductive route | `NAR-CL-ORDERDEF-001` |
| `N-ORD-BLOCK-003` | `N-ORD-BR-008..010`, canonical order/laws | `NAR-CL-ORDER-001` |
| `N-ORD-BLOCK-004` | `N-ORD-BR-011..012`, arithmetic/order compatibility | `NAR-CL-ORDERARITH-001` |
| `N-ARITH-BLOCK-001` | accepted arithmetic aggregate after route Junctions | `NAR-CL-INTEGRATION-001` |

Convergence Bricks `*-BR-005..006` and Junctions remain separately identifiable rather than being hidden inside the final canonical Blocks.

## 5. Z

| Block | Role | Principal Claim families |
|---|---|---|
| `Z-S-BLOCK-001` | signed normal-form producer from `Z-S-BR-001..003` | `Z-CL-REP-001` |
| `Z-D-BLOCK-001` | difference-pair/equivalence producer from `Z-D-BR-001..003` | `Z-CL-ALTREP-001` |
| `Z-BLOCK-001` | selected carrier/identity after `Z-J-001` + `Z-DP-001` | `Z-CL-CARRIER-001` |
| `Z-ARITH-BLOCK-001` | direct signed arithmetic route | contributor to `Z-CL-ARITHCONV-001` |
| `Z-ARITH-BLOCK-002` | pair-mediated arithmetic route | contributor to `Z-CL-ARITHCONV-001` |
| `Z-ARITH-BLOCK-003` | canonical commutative-ring package | `Z-CL-RING-001`, `Z-CL-GEN-001` |
| `Z-ORD-BLOCK-001` | canonical ordered-integer package after route convergence | `Z-CL-ORDER-001` |
| `Z-BLOCK-002` | accepted Stage-One integer export | `Z-CL-INTEGRATION-001` |
| `Z-RE-BLOCK-001..002` | post-acceptance reverse-engineering candidates | Learning/reverse claims, not forward accepted Z export members |

`Z-REP-BR-001..005` are independent reconvergence Bricks feeding `Z-J-001`; no fictitious `Z-REP-BLOCK` is introduced.

## 6. Q

Q intentionally uses broader Blocks rather than fabricating `Q-BR-*` identities.

| Block | Declared internal construction components | Principal Claim families |
|---|---|---|
| `Q-GATE-BLOCK-001` | zero-divisor/nonzero cancellation lemmas | `Q-CL-GATE-001` |
| `Q-F-BLOCK-001` | positive denominator syntax, `RawFrac`, `FracEquiv`, representation embedding | `Q-CL-REP-001` |
| `Q-F-BLOCK-002` | `rawNeg`, `rawAdd`, `rawMul` + respect proofs | `Q-CL-RAWOPS-001` |
| `Q-BLOCK-001` | quotient carrier/identity + lifted basic operations | `Q-CL-CARRIER-001` |
| `Q-BLOCK-002` | accepted field/order/embedding/generation package | `Q-CL-INTEGRATION-001` plus accepted Q Claim families |

Internal definitions such as `RawFrac`, `FracEquiv`, or `qAdd` are not automatically Bricks; their assertions remain visible through Claim Records and formal source ownership.

## 7. R

R also uses broader Blocks plus one explicit logic Brick where independent commitment identity materially matters.

| Block / Brick | Role | Principal Claim families |
|---|---|---|
| `R-LOGIC-BR-001` | isolated classical cut comparability | logical dependency of `R-CL-ORDER-001` |
| `R-COMP-BLOCK-001` | formal Dedekind LUB completeness | `R-CL-COMP-001` |
| `R-ADD-BLOCK-001` | cut/quotient real addition | contributor to `R-CL-ADD-001` |
| `R-NEG-CANDIDATE-BLOCK-001` | cut/quotient negation candidate | contributor to `R-CL-ADD-001` |
| `R-QARCH-BLOCK-001` | Q upper/scaling/grid + cut-bracketing gateway | reusable and route-specific dependencies of `R-CL-ADD-001`, later Claims |
| `R-ADD-GROUP-BLOCK-001` | accepted additive-group package | `R-CL-ADD-001` |
| `R-MUL-BLOCK-001` | selected ordered commutative-ring multiplication | `R-CL-MUL-001` |
| `R-FIELD-BLOCK-001` | unique nonzero inverse-witness package | `R-CL-INV-001`, contributor to `R-CL-FIELD-001` |
| `R-DENSITY-BLOCK-001` | strict rational-image density | `R-CL-DENSITY-001` |
| `R-ARCH-BLOCK-001` | Archimedean characterization | `R-CL-ARCH-001` |
| `R-BLOCK-001` | accepted Stage-One real export after `R-J-002` | `R-CL-INTEGRATION-001` and accepted R package |

Internal constructions such as `LowerCut`, `CutEquiv`, `rAdd`, `rMulCandidate`, or individual law lemmas remain distinguishable as representation/operation/supporting interfaces; they are not renamed as Bricks merely for diagram symmetry.

## 8. C — accepted selected-route producer mapping / CA-20

`C-DP-001` is user-ratified: `C-ROUTE-P` is the selected working producer;
`C-ROUTE-Q` remains a retained independently verified probe.

| Existing unit | Actual producer role | Provisional Claims |
| --- | --- | --- |
| `C-BLOCK-001` | selected carrier, embedding, ring, witness field | `C-CL-CARRIER-001`, `C-CL-REMBED-001`, `C-CL-FIELD-001`, `C-CL-I-001`, `C-CL-GEN-001`, `C-CL-COORDUNIQ-001`, `C-CL-NONREAL-001` |
| `C-COMPARE-BLOCK-001` | universal relation and extractor-scoped isomorphism | `C-CL-COMPARE-001` |
| `C-J-001` | same-carrier integration; V5 32585583815 PASS | `C-CL-INTEGRATION-001` |
| `C-BLOCK-002` | accepted Stage-One complex downstream export / `CA-20` | `C-CL-INTEGRATION-001` and the selected nine-Claim package |

Mappings document actual producer units; separate `CA-20` accepts only the
final `C-BLOCK-002` export, not the retained Route Q probe. No C Brick
or completed alternative field is fabricated for naming symmetry.

## 9. Mapping invariant

A mature construction/claim view should be able to traverse:

```text
Brick or internal component
  → Block producer
  → Claim Record
  → Junction/Decision dependencies
  → Lean source/theorem
  → V5 evidence
```

and the reverse direction where ownership is declared.

During ex-ante C work the truthful partial traversal is instead:

```text
Acceptance Claim
  → producer TBD
  → C-DP-001 route options
  → future experiment
```

Missing links become audit defects **only after** an artifact claims a producer/acceptance relation that should supply them. They are not permission to invent a unit identity.

## 10. Current boundary

```text
Accepted Block→Claim mappings   N-Core through R
C provisional Claims            OPEN
C Block→Claim mappings          COMPLETE / CA-20 ACCEPT
C representation               C-ROUTE-P SELECTED / C-ROUTE-Q RETAINED
C accepted export              C-BLOCK-002 / CA-20 ACCEPT
```

The previous user hold is historical provenance. It was explicitly lifted on 2026-08-21; the absence of C Block mappings now reflects disciplined acceptance-first construction, not lack of authorization.
