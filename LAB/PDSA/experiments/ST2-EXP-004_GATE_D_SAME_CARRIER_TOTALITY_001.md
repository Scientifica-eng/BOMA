# ST2-EXP-004 Gate D — Same-Carrier Totality 001

**Experiment:** `ST2-EXP-004`  
**Gate:** `D — same-carrier no-F-04 totality recovery attempt`  
**Disposition:** `PASS / NOT_RECOVERED_WITH_CURRENT_CUT_INTERFACE / GATE E NEXT`  
**Frozen accepted reference:** `50f3031b8d2657cbe0710e73e5935d997d40e49b`  
**Frozen Plan commit:** `89c9dc9154e7ca469e5c94c177be223205ee9dbd`  
**Verified exact head:** `7b5057b798bfe1bd5fe3e188a90bf50931021f8c`

## 1. Exact result

For the unchanged carrier/order pair, Gate D proves constructively:

```text
RTotality004 ↔ CutComparability
```

where:

```text
RTotality004 := ∀ x y : RBOMA, rLE x y ∨ rLE y x
CutComparability := ∀ A B : LowerCut, CutLE A B ∨ CutLE B A
```

Thus the explicit `hComp : CutComparability` used in Gate C is logically equivalent, at the frozen same-carrier boundary, to the totality target. It is not an independent constructive recovery.

## 2. Exact evidence

```text
head      7b5057b798bfe1bd5fe3e188a90bf50931021f8c
run       32833979623
job       97758652143
artifact  9557883095
sha256    53fdaffb82085ffdfbd489fe3cb4a3915fe0dfd8a153799d8620c089b3ece7f5
result    SUCCESS / GATE_D_PASS
```

Measured dependency audit:

```text
internal declarations       165
external boundary            59
dependency edges           1422
unresolved                    0
unmapped internal ranges      0
internal axioms               0
selected F-04 present      false
```

Axiom evidence:

```text
cutComparability_of_rLE_total004
  [propext, Quot.sound]

rLE_totality_iff_cutComparability004
  [propext, Quot.sound]
```

## 3. Frozen representation boundary

The unchanged `LowerCut` structure contains exactly the research-relevant data:

```text
lower
nonempty
proper
downward
rounded
```

It has no `locatedness` field and no `CutComparability` field. Gate D did not add either, did not alter `CutEquiv`, `RBOMA`, or `rLE`, and did not add a logical principle.

## 4. Recovery outcome

No valid unconditional inhabitant of `CutComparability`, and therefore no valid unconditional same-carrier proof of `RTotality004`, was obtained under the Frozen Plan's allowed logical and representation boundary.

The precise outcome is therefore:

```text
NOT_RECOVERED_WITH_CURRENT_CUT_INTERFACE
```

This is **not** an impossibility theorem. It records the result of the bounded attempt. A future route that strengthens `LowerCut` with locatedness or changes the accepted order regime would change the experimental factor and therefore requires a separate owner-authorized experiment. No such experiment is started here.

## 5. Acceptance firewall

Accepted `R-DP-003` remains unchanged. The selected classical witness remains the accepted provider of disjunctive totality. Gate D creates no accepted replacement, selector, Block, Junction, or Claim.

## 6. Final disposition

**Gate D final disposition:** `PASS / NOT_RECOVERED_WITH_CURRENT_CUT_INTERFACE / GATE E NEXT`.

Gate E now measures the downstream C sensitivity of removing exactly the `orderTotal` field from the sixteen-property ST2-EXP-001 production interface.