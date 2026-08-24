# ST2-EXP-003 — H5 Additive Preservation Milestone 001

**Experiment:** `ST2-EXP-003`  
**Phase:** `H5 / Dedekind-Cauchy comparison`  
**Milestone:** `ADDITIVE PRESERVATION EXACT PASS`  
**Canonical acceptance impact:** `NONE`  
**Research Junction:** `NOT DECLARED`

## Exact verification evidence

- Exact verified head: `96814a0acb434088ba09f4ae29ca0ffdd6b9d557`
- GitHub Actions run: `32713941108`
- Job: `97391111316`
- Artifact: `9515173490`
- Artifact name: `st2-exp-003-h5-additive-preservation-32713941108`
- Artifact SHA-256: `a766f3b6eea70fdb30091940934854026c4075c22314badc84d6f76c11987d65`

All V5 steps passed: exact-head/baseline/frozen-plan pinning, H4 governance,
independent/combined manifest separation, Lean typechecking, dependency closure,
scope publication, and evidence preservation.

## Proved comparison layer

The already verified H5 maps

- `cToD : RCBOMA -> RBOMA`
- `dToC : RBOMA -> RCBOMA`

remain mutually inverse order isomorphisms and now additionally preserve the
additive-group structure in both directions.

The exact new operation theorems are:

```lean
theorem cToD_add (x y : RCBOMA) :
    cToD (rCAdd x y) = rAdd (cToD x) (cToD y)

theorem dToC_add (x y : RBOMA) :
    dToC (rAdd x y) = rCAdd (dToC x) (dToC y)

theorem cToD_zero : cToD rCZero = rZero

theorem dToC_zero : dToC rZero = rCZero

theorem cToD_neg (x : RCBOMA) :
    cToD (rCNeg x) = rNeg (cToD x)

theorem dToC_neg (x : RBOMA) :
    dToC (rNeg x) = rCNeg (dToC x)
```

The milestone is packaged by
`BOMA.R.StageTwo.DedekindCauchyComparison003.dedekindCauchyAdditivePreservationCertificate`.

## Proof architecture

Addition preservation was not assumed from an external ordered-field theorem.
The proof exposes and compares the strict rational lower envelopes of sums on
both carriers:

```text
q < x + y
iff
there exist rational a,b with a < x, b < y, and q < a+b.
```

The Cauchy direction is proved from the independently verified additive order
and H5 rational density. The accepted Dedekind direction is extracted directly
from the certified `cutAdd` representation. Equality follows from rational
strict-lower-envelope extensionality. Zero follows from exact rational
preservation, and negation then follows from uniqueness of additive inverses.

## Logical commitments

`#print axioms` reports the same inherited kernel surface for all new additive
comparison targets:

```text
[propext, Classical.choice, Quot.sound]
```

No new source-level `axiom` or `sorry` was admitted by the H5 source audit.

## Boundary after this milestone

Scientifically valid status after this exact head:

```text
H5 order isomorphism             EXACT PASS
H5 addition preservation         EXACT PASS
H5 additive zero preservation    EXACT PASS
H5 negation preservation         EXACT PASS
multiplication preservation      NOT YET PROVED
nonzero inverse preservation     NOT YET PROVED
field isomorphism                NOT YET PROVED
research R Junction              NOT CREATED
downstream C rebuild             NOT STARTED
accepted R / C / main            UNCHANGED
```

This milestone does not authorize a field-isomorphism claim or a research
Junction by itself. Multiplication and nonzero inverse obligations remain
separate H5 proof gates.
