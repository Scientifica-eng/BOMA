# R-DP-002 — Stage-One Dedekind Real Identity Realization

- **Operational Status:** **OPEN — QUOTIENT IDENTITY PROBE REQUIRED**
- **Epistemic Status:** **FORMALIZATION / METHODOLOGICAL DECISION POINT**
- **Input:** `R-DP-001 — Route D selected`
- **Representation:** `LowerCut` with external `CutEquiv`
- **Target:** `BOMA-R-ACCEPT-001`

## Decision question

How should Stage One turn extensional Dedekind-cut identity into the formal identity used by the downstream real carrier?

## Candidate A — explicit quotient carrier

```text
R_BOMA := LowerCut / CutEquiv
```

Expected benefits:

```text
formal carrier equality matches extensional cut identity
principal Q embedding can become an ordinary injective map
field/order/completeness interfaces can use carrier equality
raw predicate equality does not need to be adopted as the mathematical identity
```

Commitment cost to measure:

```text
Setoid / Quotient formation
Quotient soundness / exactness / induction / lifting
respect proofs for every promoted operation and order interface
```

The probe must check whether this route can avoid adding:

```text
function extensionality
proposition extensionality
Classical / Choice
```

merely to form identity and order.

## Candidate B — external extensional identity

Keep:

```text
carrier syntax = LowerCut
real identity = CutEquiv
```

Benefits:

```text
minimal formal carrier machinery
maximal representation transparency
no quotient carrier commitment
```

Costs:

```text
every downstream theorem remains modulo CutEquiv
field/order APIs have an external equality layer
later C construction and branch comparison become more cumbersome
formal real equality differs from Lean carrier equality
```

## Candidate C — raw structure equality

**Not admissible as a silent default.**

`LowerCut` contains a predicate field `QBOMA → Prop`. Raw structure equality would make the relation between predicate equality and extensional cut identity a substantive logical commitment. It may be studied only if its extensionality assumptions are explicitly declared.

## Decision criteria

```text
identity transparency
new logical/formal commitments
Q embedding injectivity
order lifting cost
operation lifting cost
Dedekind supremum lifting cost
future C-stage usability
Stage-II comparison with Cauchy route
V5 robustness
```

## Decision lock

Do not resolve until the quotient probe establishes, at minimum:

```text
CutEquiv packaged as a Setoid
quotient carrier formation
quotient equality ↔ CutEquiv on representatives
principal Q embedding injective
representative-invariant inclusion order at the quotient interface
principal Q order reflected exactly
```

No full real carrier is canonical while this Decision Point remains open.
