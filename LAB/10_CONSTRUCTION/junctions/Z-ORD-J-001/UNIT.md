# Z-ORD-J-001 — Direct / Pair Integer Order Convergence

- **Operational Status:** **PASS / RESOLVED**
- **Epistemic Status:** **DERIVED CROSS-ROUTE AGREEMENT**
- **Incoming:** direct signed order, pair cross-sum order

## Routes

```text
Route SD — direct sign/magnitude order on ZSigned
Route PD — pair cross-sum order: (p,n) ≤ (q,m) iff p+m ≤ q+n
```

The routes consume the accepted natural order differently and preserve distinct representation histories.

## Convergence

The formal result is pointwise:

```text
zLEd(x,y) ↔ zLEp(x,y)
```

## Verification

Workflow run `32169832933` under Lean 4.32.1:

```text
Lean setup              PASS
direct signed order     PASS
pair cross-sum order    PASS
order route convergence PASS
workflow enforcement    PASS
```

Evidence:

`LAB/20_FORMALIZATION/Z_STAGE/evidence/Z_ORDER_ROUTES_V5_LATEST.md`

## Export

The Junction authorizes the direct signed relation as the canonical spelling `zLE := zLEd`, while the pair cross-sum relation remains a retained semantic witness.

Order laws and ordered-ring compatibility are a separate V5 subgate.
