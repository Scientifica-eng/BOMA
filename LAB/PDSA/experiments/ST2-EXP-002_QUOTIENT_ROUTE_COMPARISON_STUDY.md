# ST2-EXP-002 — Execution / Study / Act Record

**Frozen Plan:** `LAB/PDSA/PDSA-ST2-EXP-002_INDEPENDENT_QUOTIENT_ROUTE.md`  
**Accepted baseline:** `878a52c3d833b9db9ea66f1ff4fcd207ca6ab498`  
**Plan commit:** `94a79eb07a2dddebbcba0e8fbd11508514ecca6c`  
**Status:** `CLOSED / PASS — V5 32597030998`

The owner approved exactly one changed factor: the realization choice at
`C-DP-001`. The same whole accepted `RStageIntegrationCertificate` is used by
accepted Route P and experimental Route Q. The retained Q object is a formal
expression / normalization quotient, not a separately implemented full
polynomial ring.

## Initial architectural observation

The accepted formal-dependency policy permits direct `Quotient` and `Setoid`
consumers in accepted Q and R stage sources, not arbitrary C-stage producers.
Completing the expression quotient in C therefore has an explicit
representation/formalization cost. A separate branch-only policy lists exact
experimental C consumers; the accepted policy remains untouched.

## Ordered execution contract

1. Assemble and check the Q-only normal-form ring, witness field, and quotient
   field without selected P, generic P/Q comparison, or the previous experiment.
2. Extract the actual Q field declaration closure and machine-reject all P
   declarations before compiling the combined assembly.
3. Only then instantiate the common contract and verify mutually inverse,
   structure-preserving P/Q functions.
4. Audit logical/formalization commitments, all nine C Claim producer
   families, and the unchanged accepted reference.

## Iteration and failures

### Attempt 1 — retained negative evidence / F1

- Source commit: `025fe2d445dc90556d3ddd2ca92b70658b1a7db7`.
- Exact V5 run: `32596872373` — `FAIL`, at the **independent Q field** step.
- Lean's Q-normal coordinate rewrite had an explicit whole-R certificate that
  could not be inferred from its conclusion; omitting that argument left
  unresolved `RStageIntegrationCertificate` goals.
- Extractor soundness additionally needed the `qRe`/`qIm` projections unfolded;
  normal re-encoding needed its `qOfNormal` abbreviation unfolded before rewrite.
- The checker refused to reach any P/Q comparison or Claim-promotion step.
  Its temporary `sorryAx` output describes unresolved failed elaboration, not
  accepted evidence or a new trusted axiom.
- Correction: pass the unchanged accepted-R parameter explicitly, unfold the
  relevant local definitions, and retain the exact same frozen Plan.

### Attempt 2 — retained elaboration edge case / F1

- Source commit: `b97fe52112e8b9a17ec7fc519522e3d0c4a719e0`.
- Exact V5 run: `32596968581` — `FAIL`, still before any P comparison.
- All prior coordinate obligations were resolved and the independent Q axiom
  print already matched accepted R exactly: `[propext, Classical.choice,
  Quot.sound]`. However the normal-form rewrite closed its goal automatically,
  so an extra subsequent `cases` tactic caused Lean's `No goals to be solved`.
- Correction: remove the redundant tactics; do not alter the statement,
  logical commitments, fixed R boundary, or frozen Plan.

## Successful DO evidence

- Dedicated exact V5 run: `32597030998` — `PASS`.
- Verified proof-source commit:
  `2d8077a5403fca6de930a13add88038b3fe89eec`.
- Toolchain: `leanprover/lean4:v4.32.1`; no external Lake packages.
- Artifact: `st2-exp-002-route-comparison-32597030998`, ID `9481837137`.
- Accepted-stage guards at that same source also passed: route probes
  `32597030966`, six-stage accepted transparency `32597031076`, and accepted
  same-carrier / Claim transparency `32597031086`.
- Machine-readable immutable-source summary:
  `LAB/20_FORMALIZATION/C_STAGE/ST2_EXP_002_VERIFIED_EVIDENCE_RUN_32597030998.json`.

The workflow physically orders its stages: independent Q type-check, Q-only
actual declaration closure, P-exclusion enforcement, and Q classification all
finish **before** P, the accepted generic comparison, or the combined Junction
are admitted to the second assembly.

## Final-head verification interruption — retained negative evidence / F8

- Documentation/closure commit: `e9152533e7b65b9d7ad081c7918dc1aaad5707bd`.
- Exact V5 run: `32597282848` — `FAIL` at accepted-baseline preservation,
  before Lean or comparison execution.
- The previous-experiment guard used the overly broad path expression
  `ST2*EXP*001*`. It incorrectly matched the new
  `ST2-EXP-002_PQ_RECONVERGENCE_JUNCTION_001.md` because that second-experiment
  Junction is numbered `001`. No ST2-EXP-001 file had actually changed.
- Correction: preserve the original protection while using exact experiment-ID
  prefixes `ST2-EXP-001`, `ST2_EXP_001`, `ST2Exp001`, and
  `PDSA-ST2-EXP-001`. This distinguishes an experiment identity from an
  unrelated Junction sequence number and does not weaken baseline protection.

## STUDY — observed construction and reconvergence

### 1. What actually changed

The only changed mathematical realization choice is `C-DP-001`:

| Fixed / changed control | Accepted Route P | Experimental Route Q |
| --- | --- | --- |
| R carrier, operations, order, inversion | accepted `RBOMA` | identical accepted `RBOMA` |
| R input certificate | whole `RStageIntegrationCertificate` | the exact same whole certificate |
| Carrier | dedicated pair record | quotient of retained formal quadratic expressions |
| Coordinate support | record projections | Q-local normalization, lifted to quotient |
| Field inversion | existential witness | independently proved existential witness |
| Quadratic generator and unique decomposition | accepted | independently proved at quotient equality |
| Generic comparison contract | unchanged accepted contract | independently satisfied after Q field closure |
| Stage acceptance | `CA-20 ACCEPT` | branch-only research result; not a replacement acceptance |

The Q-local normal form itself has two real coordinates, but it is a different
auxiliary structure from the selected Route P carrier. Similar coordinate
shapes do not make the quotient carrier the selected pair type and do not
justify importing the P field.

### 2. Independence is verified on actual declarations

Independent audit target:

```text
BOMA.C.StageTwo.QQuotientField002.qFieldCertificateFromAcceptedR
```

Observed independent closure:

```text
internal declarations                  778
external boundary declarations          78
directed dependency edges             9466
selected P declarations                  0
ST2-EXP-001 narrow-interface imports     0
unresolved declarations                  0
internal axioms                          0
classification residuals                 0
```

The assembly contains accepted stages through R, the route-neutral nonsquare
support, the retained Q expression-quotient probe, and four new Q-only proof
files. It does not contain `RoutePairProbe001`, `PairCore001`,
`PairNormInverse001`, `QuadraticComparison001`, the selected C integration,
the P/Q Junction, or the first experiment's narrow interface.

Therefore Q is a separately completed witness-based field rather than a P
field merely transported across an assumed equivalence.

### 3. What is proved on the actual Q quotient

The independently verified quotient certificate proves:

1. nontriviality and injective real embedding;
2. additive commutativity, associativity, zero, and inverses;
3. multiplicative commutativity, associativity, one, and distributivity;
4. existence and uniqueness of nonzero multiplicative inverse witnesses;
5. preservation of real zero, one, negation, addition, and multiplication;
6. `I² = -1` and `I` not in the real embedding;
7. generation by real coordinates and uniqueness at quotient equality;
8. an explicit constructive coordinate extractor.

The normal-form function is a `Quotient.lift` whose compatibility proof is
normal-form equality. It does **not** extract a representative by global
choice. Inverse production remains propositional witness existence, exactly as
in accepted R and P; no global total inverse selector was introduced.

### 4. CA-14 is triggered only by two actual completed routes

After independent Q verification, the combined assembly instantiates the
unchanged accepted `QuadraticFieldPresentation` twice:

```text
selectedPresentation R       ← accepted completed P field
quotientPresentation R       ← independently completed Q field
```

The real-preserving, generator-preserving inverse maps are:

```text
pairToQuotient(a,b) = qCoord(a,b)
quotientToPair(z)   = (qRe(z), qIm(z))
```

Verified properties include both inverse identities and preservation of
zero, one, the accepted-real embedding, the imaginary generator, negation,
addition, and multiplication. Thus the research Junction is a genuine
constructive R-algebra / field isomorphism; it is not merely a proposition
that some relation exists.

The audit root is:

```text
BOMA.C.StageTwo.PQJunction002.qPairJunctionCertificate
```

Its actual closure contains:

```text
internal declarations                 933
external boundary declarations         78
directed dependency edges           11043
selected-P declarations in Junction    42
unresolved declarations                 0
internal axioms                         0
classification residuals                0
```

The 42 P declarations are correct in the post-completion comparison; none
occurs in the independently verified Q closure. The existing accepted
`C-J-001`, `CA-20`, and `C-DP-001` selection were not reclassified or
modified. This is a separate experimental CA-14 reconvergence record.

### 5. Same nine Claim families, complete ownership

The branch-specific producer policy proves:

```text
registry Claim families                   9
experimental producer Claim families      9
declared producers                       22
combined internal declarations          933
owned internal declarations             933
unowned internal declarations             0
audit-root direct internal dependencies   8
undeclared direct dependencies            0
producer residual groups                  0
```

All accepted Claim IDs retain their meanings:

```text
C-CL-CARRIER-001
C-CL-REMBED-001
C-CL-FIELD-001
C-CL-I-001
C-CL-GEN-001
C-CL-COORDUNIQ-001
C-CL-NONREAL-001
C-CL-COMPARE-001
C-CL-INTEGRATION-001
```

This is experimental producer correspondence, not a new canonical acceptance
or a modification of the accepted C Claim policy.

### 6. Real inherited axioms and representation cost

Exact Lean axiom reports for accepted R, independent Q, the explicit
isomorphism, and the research Junction are identical:

```text
[propext, Classical.choice, Quot.sound]
```

No **new kernel axiom** appears beyond the already accepted whole-R baseline.
This does not mean the construction is globally intuitionistic: the fixed
upstream R certificate already carries localized classical and quotient
commitments.

Both independent and combined external closures contain 78 declarations:

```text
DECLARED_LOGICAL_COMMITMENT          2
TRUSTED_FORMALIZATION_INFRASTRUCTURE 10
TRUSTED_METATHEORY                   66
unclassified residuals                0
```

Eight quotient-specific boundary declarations are observed:

```text
Quotient
Quotient.exact
Quotient.inductionOn
Quotient.inductionOn₂
Quotient.lift
Quotient.lift₂
Quotient.mk
Quotient.sound
```

Although quotient support was already inherited from upstream accepted R, its
**direct C-stage use** is new for this representation. The accepted global
policy permits direct quotient consumers under Q/R stage sources, not C. The
experimental policy explicitly permits only the retained Q probe, the new Q
quotient-field file, and the post-completion research Junction as exact C
consumers. It keeps classification and trusted-base references unchanged;
the accepted global policy remains byte-for-byte unchanged.

Therefore:

```text
same mathematical C claims
≠ same concrete carrier
≠ same source-level quotient infrastructure
≠ same representation-dependent formalization cost
```

### 7. Hypotheses and limitations

| Hypothesis | Observed result |
| --- | --- |
| H1 independent Q field with no P producer | PASS — 778 internal declarations; zero P |
| H2 actual quotient field and constructive extractor | PASS — complete quotient certificate |
| H3 common whole-R quadratic contract | PASS — both presentations instantiate the unchanged contract |
| H4 explicit mutually inverse structure-preserving maps | PASS — both coordinate formulas and inverse identities |
| H5 same nine Claims with explicit quotient-cost accounting | PASS — 9/9 Claims, 933/933 ownership, zero residuals |

The retained Q carrier is a quotient of formal expressions equipped with a
quadratic normalizer. It is **not** a separately implemented full polynomial
ring `R[X]`, and no theorem about an independently constructed general
polynomial-ring quotient is asserted. Algebraic closure, FTA, analytic
completeness, and an order on C remain outside this experiment.

## ACT — CLOSED / PASS

1. Close `ST2-EXP-002` as a successful controlled one-factor branch experiment.
2. Preserve `C-ROUTE-P` as the accepted `CA-20` realization and preserve
   `C-ROUTE-Q` as a **verified independent research field**.
3. Retain the explicit post-completion P/Q isomorphism and experimental
   CA-14 Junction as scientifically inspectable reconvergence evidence.
4. Preserve both failed exact-head runs and the immutable frozen Plan.
5. Preserve the accepted policies, accepted Claim meanings, whole-R boundary,
   the prior `ST2-EXP-001` evidence, and all eleven unselected experiments.
6. Record that there is no active branch experiment after this closure; a
   further experiment requires separate owner approval.
7. Do not merge this branch into `main` without a separate explicit owner
   order.

The evidence file identifies the exact historical proof-source commit and
run. A later documentation/closure commit must obtain a fresh exact-head V5
run; it cannot inherit run identity from an earlier commit.
