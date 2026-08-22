# ST2-EXP-002-PQ-J-001 — Experimental C Representation Reconvergence

**Scope:** research-only `CA-14` comparison trigger; not canonical accepted
`C-J-001`, not a replacement Block, and not an amendment to `CA-20`.

**Gate status:** `PASS`  
**Verified proof-source commit:** `2d8077a5403fca6de930a13add88038b3fe89eec`  
**Exact dedicated V5 run:** `32597030998`  
**Fixed coefficient field:** accepted whole
`BOMA.R.StageIntegration002.rStageIntegrationCertificate`

## Incoming producers

1. Accepted `C-ROUTE-P`: selected real-pair field, whose carrier and selected
   `CA-20` status remain unchanged.
2. Experimental `C-ROUTE-Q`: independently proved formal-expression /
   normalization quotient field
   `BOMA.C.StageTwo.QQuotientField002.qFieldCertificateFromAcceptedR`.

The second producer was compiled and its actual declaration closure certified
**before** this Junction's combined assembly. The independent closure has
778 internal declarations and exactly zero selected-P declarations.

## Verified Junction declaration

```text
BOMA.C.StageTwo.PQJunction002.qPairJunctionCertificate
```

Its subproducts include the independent Q field certificate, the common
quadratic comparison relation, and a constructive inverse R-field
isomorphism.

```text
P → Q : (a,b) ↦ qCoord(a,b)
Q → P : z ↦ (qRe(z), qIm(z))
```

Both compositions are identities. The forward map preserves zero, one,
negation, addition, multiplication, the exact accepted-real embedding, and
the distinguished imaginary generator.

## Transparency and preserved distinction

```text
combined internal declarations        933
selected-P declarations in Junction    42
external boundary declarations         78
Claim families                          9
owned combined declarations           933
unowned combined declarations           0
classification / producer residuals     0
```

Identical accepted-R inherited kernel axioms:

```text
[propext, Classical.choice, Quot.sound]
```

Route identity and histories do **not** collapse: P is a record carrier, Q is
an expression quotient, Q directly consumes declared quotient infrastructure,
and its extractor is an explicit quotient-normalization lift. This proves
R-field reconvergence under the fixed contract, not that the two constructions
share provenance or formalization cost.

Q is not an independently implemented general polynomial ring `R[X]`.
Accepted `CA-20`, `C-DP-001`, canonical `C-J-001`, the accepted global
dependency policy, and all eleven unselected Stage-Two candidates remain
unchanged.
