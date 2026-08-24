# ST2-EXP-003 — H5 Multiplicative Preservation Milestone 001

**Experiment:** `ST2-EXP-003`  
**Phase:** `H5 / Dedekind-Cauchy comparison`  
**Milestone:** `MULTIPLICATIVE PRESERVATION EXACT PASS`  
**Canonical acceptance impact:** `NONE`  
**Research Junction:** `NOT DECLARED`

## Exact verification evidence

- Exact verified head: `40d52d37431e83db6d111b100d65642ccc5f223b`
- GitHub Actions run: `32715039399`
- Job: `97394357105`
- Artifact: `9515573127`
- Artifact name: `st2-exp-003-h5-multiplicative-preservation-32715039399`
- Artifact SHA-256: `ae10e6c45a1efb8dc70ecf64559d13a8b89a0e536fed6e9cdac2f3f3d35d57bd`

All V5 steps passed: exact-head/baseline/frozen-plan pinning, H4 governance,
independent/combined manifest separation, Lean typechecking, dependency closure,
scope publication, and evidence preservation.

## Proved comparison layer

The explicit H5 maps are already mutually inverse order isomorphisms and preserve
addition, zero, and negation. At this milestone they additionally preserve
signed multiplication and multiplicative one in both directions:

```lean
theorem cToD_mul (x y : RCBOMA) :
    cToD (rCMul x y) = rMulCandidate (cToD x) (cToD y)

theorem dToC_mul (x y : RBOMA) :
    dToC (rMulCandidate x y) = rCMul (dToC x) (dToC y)

theorem cToD_one : cToD rCOne = rOne

theorem dToC_one : dToC rOne = rCOne
```

The nonnegative quadrant is first identified by matching exact strict-rational
lower envelopes of the Cauchy product with the accepted Dedekind
`cutMulNonnegEnvelope`; signed multiplication is then recovered through the four
sign quadrants using exact negation preservation.

The milestone is packaged by
`BOMA.R.StageTwo.DedekindCauchyComparison003.dedekindCauchyMultiplicativePreservationCertificate`.

## Logical commitments

`#print axioms` reports the same inherited kernel surface for the new
multiplicative comparison targets:

```text
[propext, Classical.choice, Quot.sound]
```

No new source-level `axiom` or `sorry` was admitted by the H5 source audit.

## Boundary after this milestone

```text
H5 order isomorphism             EXACT PASS
H5 additive preservation         EXACT PASS
H5 multiplicative preservation   EXACT PASS
nonzero inverse preservation     NOT YET PROVED
final field-isomorphism cert     NOT YET PROVED
research R Junction              NOT CREATED
downstream C rebuild             NOT STARTED
accepted R / C / main            UNCHANGED
```

This milestone does not by itself authorize a research Junction. The remaining
field-level obligation is preservation of the certified nonzero inverse
relation, followed by a final exact-head field-isomorphism package and the
frozen-plan structural/cost comparison.
