# Z-S-BLOCK-001 — Signed Normal-Form Representation Route

- **Operational Status:** **ACTIVE / V5 PASS / SELECTED BY Z-DP-001**
- **Epistemic Status:** **DECLARED REPRESENTATION + DERIVED NORMALIZATION PROPERTIES**
- **Members:** `Z-S-BR-001..003`
- **Depends on:** accepted N-Core structure; accepted N-Arithmetic is used by downstream pair comparison but is not required to define the signed carrier/diff.

## Export

```text
ZSigned ::= zero | pos n | neg n
embedN : N_BOMA → ZSigned
zneg   : ZSigned → ZSigned
diff   : N_BOMA → N_BOMA → ZSigned
```

`pos n` represents the positive successor magnitude `s n`; `neg n` represents its negative. Duplicate signed zero constructors are excluded by syntax.

## Verification

The signed representation route passed independently in both representation V5 runs. Final representation-convergence run:

```text
run:   32168105466
Lean:  4.32.1
route: PASS
```

## Selection effect

`Z-DP-001` selects this representation as the **Stage-One canonical carrier/export** because it provides explicit identity and normalization without adding a quotient-type commitment.

Selection does not make this route mathematically necessary and does not invalidate `Z-D-BLOCK-001`.

## Current boundary

This Block exports carrier/identity/embedding/negation structure only. Integer addition, multiplication, order, and ring laws remain downstream obligations.
