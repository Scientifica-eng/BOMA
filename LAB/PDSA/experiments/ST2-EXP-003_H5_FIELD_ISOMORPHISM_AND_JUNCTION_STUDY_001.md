# ST2-EXP-003 — H5 Field-Isomorphism Study / Junction Act 001

**Experiment:** `ST2-EXP-003`  
**Frozen Plan:** `LAB/PDSA/PDSA-ST2-EXP-003_INDEPENDENT_CAUCHY_REAL_ROUTE.md`  
**Frozen Plan commit:** `70dd2f307eba69d7309a90cc36ae6f49741abddd`  
**Accepted baseline:** `ea920b6b1e56444eddaf38ca91e6f7a968f10e0d`  
**Research branch:** `feature/stage-two-st2-exp-003-cauchy-real-route-comparison`  
**H5 field-isomorphism status:** `EXACT PASS`  
**Canonical acceptance impact:** `NONE`  
**Act decision:** `RESEARCH R JUNCTION: CREATE`

This record is the post-H5 Study/Act required by the Frozen Plan. It does not
amend the Plan, does not alter accepted `Q-BLOCK-002`, `R-BLOCK-001`, accepted
C, or `main`, and does not itself declare the Junction proved. The Act below
authorizes a separate research-only Junction source/gate because the two real
routes are now independently completed and explicitly reconverged.

## Exact H5 field-isomorphism evidence

The final H5 comparison was verified at exactly:

```text
verified head    2a875cdb93ed5b62fe1cc54a189b4c7d2d46eb0b
V5 run           32718253596
job              97404001367
artifact         9516753847
artifact SHA256  e913d04cf98c305f5f9ac55904d0a2d987c00bc2109b1a5b2b3371e4fac005e6
Lean             4.32.1
result           PASS
```

The exact-head gate passed baseline ancestry, Frozen-Plan ancestry and
immutability, H4 ancestry/governance, accepted Q/R/C manifest/producer
preservation, independent/combined manifest separation, source rejection of
`sorry` and new `axiom`, Lean typechecking, `#print axioms`, dependency
closure, and artifact preservation.

Final theorem-level root:

```text
BOMA.R.StageTwo.DedekindCauchyComparison003
  .dedekindCauchyFieldIsomorphismCertificate
```

The field layer introduces no new inverse selector. It transports the existing
witness relations:

```text
Cauchy:   RCInvRel x y := rCMul x y = rCOne
Dedekind: rMulCandidate x y = rOne
```

## STUDY 1 — preserved mathematical structures

Both routes use exactly the same accepted `QBOMA` as their rational source.
The H5 maps

```text
cToD : RCBOMA -> RBOMA
dToC : RBOMA -> RCBOMA
```

are mutually inverse and preserve/reflect the following verified structure:

| Structure | H5 result |
| --- | --- |
| accepted rational embedding | preserved exactly in both directions |
| non-strict order | preserved and reflected |
| mutual inverse carrier maps | proved |
| addition | preserved in both directions |
| zero | preserved in both directions |
| negation | preserved in both directions |
| multiplication | preserved in both directions |
| one | preserved in both directions |
| nonzeroness | preserved and reflected |
| nonzero inverse witness relation | preserved and reflected |
| arbitrary bounded nonempty-family LUB contract | independently available on both routes |

Therefore H5 establishes a research field/order isomorphism over the fixed
accepted rationals. It does **not** establish carrier equality, provenance
identity, equal construction cost, or a reason to replace accepted Dedekind R.

## STUDY 2 — accepted Dedekind route commitments and producer cost

The accepted route realizes R by lower cuts with the route-specific data and
proof architecture:

```text
LowerCut predicates: nonempty / proper / downward / rounded
CutEquiv and quotient carrier RBOMA
constructive partial-order core
localized classical CutComparability for totality
finite LowerCut exit search and cut bracketing
Dedekind LUB by union of lower regions
positive/nonnegative cut multiplication plus signed decomposition
anchored cut bracketing and direct positive reciprocal construction
unique nonzero inverse witness interface
```

The main cost profile is representation-specific reasoning about predicate
membership, roundedness, cut envelopes, signed multiplication, and reciprocal
cuts. Its principal completeness advantage is directness: arbitrary-family LUB
is native to the representation and does not need to be reconstructed from a
sequential theorem.

The accepted inverse contract remains witness-only. No global Choice-backed
inverse selector is part of the accepted interface.

## STUDY 3 — independent Cauchy route commitments and producer cost

The independent route realizes R by rational sequences modulo asymptotic
closeness and therefore pays a different infrastructure cost:

```text
Q-valued sequence carrier and Cauchy predicate
asymptotic equivalence / Setoid / quotient identity
constant rational embedding and faithfulness
pointwise addition / negation / multiplication descent
eventual boundedness and explicit product-error estimates
representative-invariant approximate order and totality
nonzero eventual fixed-sign separation
reciprocal-sequence construction
vanishing rational scale and rational approximation sequences
sequential completeness
sequential-completeness-to-LUB bracket construction
arbitrary bounded nonempty-family LUB
```

The Cauchy route makes pointwise algebra conceptually direct, but multiplication
requires boundedness/error control and inversion requires eventual sign
separation. Its completeness route is materially longer: it first proves
sequential completeness and then builds the accepted arbitrary-family LUB
contract through rational bracketing and selected approximation sequences.

The independent governance audit at H4 records 625 declarations in the audited
route closure and zero selected-Dedekind contamination. The Cauchy construction
therefore is genuinely independent, not the accepted R transported through the
later comparison.

## STUDY 4 — source-level logical commitments

The relevant nonconstructive boundaries differ in location even though their
final kernel surface agrees.

### Accepted Dedekind route

Observed source-level commitments include localized classical reasoning for:

- total cut comparability;
- finite arbitrary cut-membership search used by fine bracketing;
- selected positive-representative extraction;
- strict rational-density witness extraction.

Dedekind LUB itself is representation-direct and does not require a global
representative selector.

### Independent Cauchy route

Observed source-level commitments include:

- classical witness extraction in total-order/separation arguments;
- `Classical.choose` when assembling reciprocal rational sequences from the
  accepted witness-only Q inverse relation;
- selected vanishing rational scales / rational approximation data;
- selected countable LUB bracket data;
- localized classical excluded-middle reasoning in finite bracketing steps.

These commitments are localized after the route-specific constructive cores;
they are not silently attributed to accepted Q.

## STUDY 5 — H5 comparison cost and commitments

H5 is not cost-free glue. Its foundation constructs rational-envelope LUB maps
in both directions. The source definitions

```text
cToD
dToC
```

use `Classical.choose` to select LUB witnesses whose existence had already been
proved independently on the two routes. H5 then proves rational preservation,
order reflection, mutual inverses, additive preservation, signed
multiplicative preservation, nonzero reflection, and exact inverse-witness
transport.

The final field layer adds **no new** `Classical.choose`, no inverse selector,
no `sorry`, and no new axiom. Its additional obligation is theorem transport,
not a third realization of the real field.

## STUDY 6 — kernel commitments

For the final H5 targets, including nonzero preservation/reflection, inverse
relation transport, witness transport, inverse existence transport, and the
final field-isomorphism certificate, Lean reports exactly:

```text
[propext, Classical.choice, Quot.sound]
```

This is the same surface already observed at H4 and the prior H5
multiplicative milestone. H5 therefore introduces no larger kernel-axiom
surface even though it introduces additional source-level LUB selections and
comparison proofs.

## STUDY 7 — comparative result

The experiment does not identify a uniformly cheaper completion route.
Instead it isolates a tradeoff:

| Dimension | Dedekind | Cauchy |
| --- | --- | --- |
| representation | predicate-valued lower cuts | Q sequences modulo asymptotic equality |
| algebra | heavier cut-envelope multiplication/inverse work | pointwise algebra plus descent/error estimates |
| order | inclusion-based; classical totality witness | epsilon/sequence stability; separation work |
| inverse | direct reciprocal-cut machinery | reciprocal sequence after eventual sign gap |
| completeness | arbitrary LUB is direct | sequential completeness first, LUB bridge later |
| source Choice location | localized cut/search/witness boundaries | sequence/witness selections and H4 bracketing |
| final kernel surface | inherited `[propext, Classical.choice, Quot.sound]` | inherited `[propext, Classical.choice, Quot.sound]` |
| accepted status | canonical `R-BLOCK-001` | research only |

The Cauchy route demonstrates that the accepted Dedekind realization is not
mathematically unique. It does not demonstrate a reduced trusted base, a
smaller kernel surface, or a lower overall producer cost sufficient to justify
changing canonical acceptance.

## ACT — Junction decision

```text
RESEARCH R JUNCTION: CREATE
CANONICAL R REPLACEMENT: NO
ACCEPTED R/C MODIFICATION: NO
MAIN MODIFICATION: NO
```

The research Junction is justified for the same architectural reason used by
the earlier controlled reconvergence experiment: two independently completed
producers now satisfy the same fixed upstream contract and have an explicit,
structure-preserving, mutually inverse comparison.

The Junction is useful here for an additional concrete reason: the Frozen Plan
places the selected quadratic C construction in the affected downstream cone.
Before any branch-only C rebuild consumes the alternative real interface, BOMA
needs a named research reconvergence root that packages both completed R
producers and their exact field isomorphism. This prevents the downstream
experiment from treating an H5 implementation detail or a selected
`Classical.choose` map as a canonical accepted-R replacement.

The decision is **not** based on Cauchy being cheaper, more constructive, or
more canonical; none of those claims is supported by the evidence.

## Ordered next action

1. Create a dedicated **research-only** Dedekind/Cauchy R Junction source whose
   audit root packages the two completed route certificates and the exact H5
   field-isomorphism certificate.
2. Keep the Junction source in the combined H5/research manifest only; it must
   remain absent from the independent Cauchy manifest and all accepted
   manifests/producers.
3. Exact-head V5 verify the Junction with the same baseline/Frozen/H4 guards,
   no `sorry`/new `axiom`, `#print axioms`, dependency closure, and artifact
   preservation.
4. Only after that exact Junction PASS may the Frozen Plan proceed to the
   branch-only downstream quadratic C rebuild over the alternative real
   interface.
5. Accepted `R-BLOCK-001`, accepted C, and `main` remain unchanged unless the
   owner separately orders otherwise.
