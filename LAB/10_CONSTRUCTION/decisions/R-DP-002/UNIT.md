# R-DP-002 — Stage-One Dedekind Real Identity Realization

- **Operational Status:** **RESOLVED — QUOTIENT IDENTITY SELECTED**
- **Epistemic Status:** **FORMALIZATION / METHODOLOGICAL DECISION POINT**
- **Input:** `R-DP-001 — Dedekind Route D selected`
- **Representation:** `LowerCut` with external `CutEquiv`
- **Selected identity:** `RBOMA := Quotient cutSetoid`
- **Retained alternative:** external `CutEquiv` identity
- **Target:** `BOMA-R-ACCEPT-001`

## Decision question

How should Stage One turn extensional Dedekind-cut identity into the formal identity used by the downstream real carrier?

## Candidate A — explicit quotient carrier

Selected:

```text
cutSetoid : Setoid LowerCut
RBOMA := Quotient cutSetoid
```

Verified interface:

```text
rmk A = rmk B ↔ CutEquiv A B
rOfQ : QBOMA → RBOMA
rOfQ injective
CutLE respects CutEquiv
rLE witness-based on quotient representatives
rLE (rOfQ q) (rOfQ r) ↔ qLE q r
```

V5:

```text
run 32180783725
Lean 4.32.1
PASS
```

## Measured commitment cost

The identity probe uses the same explicit quotient mechanism already admitted at the Q stage:

```text
Setoid
Quotient
Quotient.sound / Quotient.exact
quotient induction/lifting as needed downstream
```

A source audit of the active R payloads at decision time found no occurrence of:

```text
Classical
Choice
funext
propext
sorry
axiom
Real
```

Therefore the quotient identity itself does not require adding function extensionality, proposition extensionality, or Classical/Choice merely to form the carrier, reflect representative equality, or expose the rational order embedding.

## Candidate B — external extensional identity

Retained, not rejected:

```text
carrier syntax = LowerCut
real identity = CutEquiv
```

It has lower carrier-formalization cost but imposes a persistent setoid-relative interface on every downstream field/order/completeness theorem and later on complex-number construction.

## Candidate C — raw structure equality

Not selected.

`LowerCut` contains a predicate field `QBOMA → Prop`, so raw structure equality would make predicate equality versus extensional equality a substantive logical issue. Stage One does not silently identify them.

## ACT — selection

Stage One selects **Candidate A — explicit quotient identity** because:

```text
its actual V5 probe passed;
it gives formal equality exactly matching CutEquiv;
it preserves a faithful/order-reflecting Q embedding;
it avoids raw predicate equality;
it introduces no additional extensionality/Classical commitment at the identity layer;
it gives the downstream R and C stages ordinary carrier equality.
```

This is a formalization choice, not a claim that quotient identity is the unique mathematical presentation of Dedekind reals.

## Retained branch

The external-setoid realization remains a Stage-II branch target for measuring:

```text
formal commitment cost
proof-interface overhead
operation lifting burden
completion theorem expression
complex-stage propagation
```

## Next logical gate

Identity is now resolved, but **total-order derivability is not yet resolved**.

The current `LowerCut` probe has:

```text
nonempty
proper
downward
rounded
```

and does not silently include a classical totality principle or a constructive locatedness package.

Before `rLE` is promoted as a total real order, the project must test whether:

```text
CutLE A B ∨ CutLE B A
```

is derivable in the current declared logical regime, requires an explicit Classical/LEM commitment, or motivates a stronger constructive cut specification.

This is a separate Decision Point; quotient identity PASS does not answer it.
