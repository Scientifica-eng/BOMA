# ST2-EXP-004 Gate B — No-F-04 R Survivor Assembly 001

**Experiment:** `ST2-EXP-004`  
**Gate:** `B — independent no-F-04 R survivor assembly`  
**Disposition:** `PASS / SOURCE-LEVEL SURVIVOR ASSEMBLY VERIFIED / GATE C NEXT`  
**Frozen accepted reference:** `50f3031b8d2657cbe0710e73e5935d997d40e49b`  
**Frozen Plan commit:** `89c9dc9154e7ca469e5c94c177be223205ee9dbd`  
**Verified exact head:** `8cae5a858a50d3d374670a722a8b6e11c8d93d0e`

## 1. Question measured

Gate A established declaration-level F-04 closure classifications. Gate B asks a stricter source-level question:

> Which accepted R roots still kernel-check when the selected classical total-comparability witness source is physically absent from a research assembly built only from unchanged accepted sources?

The excluded F-04 source is:

```text
LAB/payloads/lean/RStage/RDedekindOrderClassicalWitness.lean
```

and the selected F-04 declarations remain:

```text
BOMA.R.DedekindOrderClassical001.cutComparability_classical
BOMA.R.DedekindOrderClassical001.rLE_total_classical
```

No accepted Q/R/C source or accepted manifest was edited.

## 2. Exact successful evidence

```text
head      8cae5a858a50d3d374670a722a8b6e11c8d93d0e
run       32830521033
artifact  9556578208
sha256    c5ef93bc5124c2d3a988042a02a378732f9b7d68d317b51efa6571144082e608
result    SUCCESS / GATE_B_PASS
```

All other pull-request workflows observed on the same exact head also completed successfully.

## 3. Whole-source assembly result

The frozen accepted R manifest contains `88` source entries. Gate B starts from that ordering, excludes the selected F-04 witness and source files containing measured F-04-sensitive targets, then fail-closed prunes any additional whole-source file whose elaboration requires an already excluded file.

Final result:

```text
accepted manifest entries   88
survivor manifest entries   77
SURVIVES_NO_F04             16 measured R roots
DOES_NOT_SURVIVE_NO_F04     18 measured R roots
executable F-04 leaks        0
```

Two additional files were pruned only because their complete source elaboration required already excluded source namespaces:

```text
RDedekindSignedMultiplicationSignLaws.lean
RDedekindPositiveInverseRelation003.lean
```

This is a source-packaging fact. It must not be reinterpreted as proof that every theorem in those files mathematically requires F-04.

## 4. Verified survivor families

Gate B kernel-checked, with the F-04 witness file absent, representative roots for:

```text
R-CL-CARRIER-001      3 survivors
R-CL-QEMBED-001       2 survivors
R-CL-ORDER-001        4 survivors / totality itself excluded
R-CL-ADD-001          4 survivors / 2 source-packaged non-survivors
R-CL-COMP-001         1 survivor
R-CL-DENSITY-001      1 survivor
R-CL-ARCH-001         1 survivor
```

In particular the unchanged same-carrier partial-order core survives:

```text
rLE_refl
rLE_trans
rLE_antisymm
```

as do the measured Dedekind completeness, rational-density, and Archimedean roots.

`R-CL-QEMBED-001` and `R-CL-DENSITY-001` still expose other localized classical dependencies; therefore survival without F-04 is not a claim of full constructivity.

## 5. Verified non-survivor families

The source-level no-F-04 assembly does not preserve the measured accepted packaging for:

```text
R-CL-MUL-001          6 non-survivors
R-CL-INV-001          3 non-survivors
R-CL-FIELD-001        4 non-survivors
R-CL-INTEGRATION-001  1 non-survivor
R-CL-NONTRIV-001      1 source-packaged non-survivor
```

The accepted disjunctive totality root itself is a direct F-04 non-survivor.

Some roots classified F04-free at declaration level fail Gate B because they share a source file with a measured F-04-dependent root. This is formalization/source packaging debt, not a mathematical dependency assertion.

## 6. Historical failed evidence preserved

Gate B retains four pre-success failures as immutable historical evidence:

```text
ST2-EXP-004_FAILURE_001_GATE_B_PROVENANCE_MARKER_CASE.md
ST2-EXP-004_FAILURE_002_GATE_B_STDERR_NOT_CAPTURED.md
ST2-EXP-004_FAILURE_003_GATE_B_INTERNALDECL_SCHEMA_MISMATCH.md
ST2-EXP-004_FAILURE_004_GATE_B_THEOREM_CLOSURE_SOURCE_PACKAGING.md
```

They distinguish CI/provenance defects from the substantive source-packaging finding and are not overwritten by the successful run.

## 7. Interpretation firewall

Gate B establishes:

```text
declaration-level F04 independence != whole-source elaboration independence
partial-order mathematics survives != accepted total-order R producer survives
F04 absent != all Classical.* absent
research survivor assembly != accepted R producer
```

No `SELECTS`, accepted Claim meaning, accepted source, or acceptance contract changes here.

## 8. Gate B final disposition

**Gate B final disposition:** `PASS / SOURCE-LEVEL SURVIVOR ASSEMBLY VERIFIED / GATE C NEXT`.

Gate C must now isolate the narrow conditional interface by supplying an explicit `hComp : CutComparability` without importing the selected classical witness source. Every such result is to be labelled `CONDITIONAL_ON_CUT_COMPARABILITY`; it is not constructive totality recovery.