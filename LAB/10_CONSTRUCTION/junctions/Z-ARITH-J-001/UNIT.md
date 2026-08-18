# Z-ARITH-J-001 — Direct / Pair-Mediated Integer Arithmetic Convergence

- **Operational Status:** **PASS / RESOLVED**
- **Epistemic Status:** **DERIVED CROSS-ROUTE AGREEMENT**
- **Incoming:** `Z-ARITH-BLOCK-001`, `Z-ARITH-BLOCK-002`
- **Carrier:** selected signed normal forms from `Z-DP-001`

## Question

Do the two independent arithmetic production routes define the same addition and multiplication on the selected integer carrier?

```text
Route DS — direct signed sign-case arithmetic
Route PM — difference-pair arithmetic followed by normalization
```

## Convergence result

The formal interface establishes pointwise:

```text
∀x y, zaddD(x,y) = zaddP(x,y)
∀x y, zmulD(x,y) = zmulP(x,y)
```

The routes have materially different production histories:

```text
DS consumes signed syntax + N arithmetic directly
PM consumes pair representation + equivalence-respecting pair arithmetic + normalization
```

## Verification

Workflow run `32169328837` under Lean 4.32.1:

```text
Lean setup                    PASS
direct signed arithmetic      PASS
pair-mediated arithmetic      PASS
arithmetic route convergence  PASS
workflow enforcement          PASS
```

Repository evidence:

`LAB/20_FORMALIZATION/Z_STAGE/evidence/Z_ARITH_ROUTES_V5_LATEST.md`

## Study lineage

Earlier runs were retained as learning evidence:

- first pair arithmetic attempt exposed orientation/reassociation proof defects;
- the next arithmetic run showed both routes independently passed but convergence zero cases did not unfold `embedN z`;
- the final correction made the zero normalization explicit and closed the Junction.

No operation definition changed merely to satisfy the checker.

## Export

This Junction authorizes selection of a canonical spelling for integer addition/multiplication while preserving both production witnesses.

It does not by itself certify group/ring laws, order, ZA-20 integration, or ZA-21 closure.
