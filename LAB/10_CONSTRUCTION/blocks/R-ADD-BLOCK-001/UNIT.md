# R-ADD-BLOCK-001 — Accepted Stage-One Real Addition

- **Operational Status:** **PASS / ACTIVE**
- **Epistemic Status:** **CONSTRUCTED + VERIFIED**
- **Stage:** `R_STAGE`
- **Input carrier:** `RBOMA := LowerCut / CutEquiv`
- **Acceptance obligation:** `BOMA-R-ACCEPT-001 / RA-06`

## Construction

Raw lower-cut addition:

```text
q ∈ cutAdd(A,B)
iff
∃ a b : Q_BOMA,
  a ∈ A ∧ b ∈ B ∧ q < a+b.
```

Formal operation:

```text
rAdd : RBOMA → RBOMA → RBOMA
```

obtained by quotient lifting after a separate proof that `cutAdd` respects `CutEquiv` in both arguments.

## Verified properties

### Well-definedness

`cutAdd` is a valid `LowerCut` and respects extensional identity.

V5:

```text
32183597094 PASS
```

### Rational embedding preservation

For accepted `q,r : Q_BOMA`:

```text
rAdd (rOfQ q) (rOfQ r) = rOfQ (qAdd q r).
```

The nontrivial reverse inclusion for principal cuts is proved by rational density and additive translation, not by a built-in real-number theorem.

V5:

```text
32183864915 PASS
```

### Additive laws before negation

On `RBOMA`:

```text
rAdd x y = rAdd y x
rAdd (rAdd x y) z = rAdd x (rAdd y z)
rAdd rZero x = x
rAdd x rZero = x
```

V5:

```text
32184188077 PASS
```

## Dependency notes

This block consumes:

```text
accepted Q ordered-field addition
Q strict-order gateway
Q rational density
Dedekind LowerCut syntax
CutEquiv identity
RBOMA quotient identity
```

It does **not** consume:

```text
built-in Real
Choice
RA-05 real negation
RA-07 multiplication
RA-08 inverse
R-LOGIC-BR-001 merely to define or verify addition
```

## Acceptance effect

```text
RA-06 — Addition = PASS
RA-10 — Q structure preservation = PARTIAL, with addition now PASS
```

This block does not by itself establish additive-group structure; RA-05 remains open until a real negation/additive-inverse operation is constructed and verified.
