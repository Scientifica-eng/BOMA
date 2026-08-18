# Q DAG — Accepted Stage-One Rational Construction

**Status:** ACTIVE — canonical human-readable Q topology  
**Acceptance:** `QA-23 = ACCEPT`  
**Accepted export:** `Q-BLOCK-002`

## Construction topology

```text
Z-BLOCK-002  accepted integers
     │
     ▼
Q-GATE-BLOCK-001
nonzero multiplication cancellation
     │
     ▼
Q-F-BLOCK-001
positive-denominator RawFrac + FracEquiv
     │
     ▼
raw arithmetic respect
     │
     ▼
Q-DP-001
formal identity realization
     │
     ├──────── retained alternatives ────────► reduced fractions / external setoid
     │                                         Stage-II candidates
     ▼
Q-BLOCK-001
QBOMA quotient carrier / equality / lifted operations
     │
     ├──────── additive laws ───────────────┐
     ├──────── multiplicative laws ─────────┤
     ├──────── distributivity ──────────────┤
     ├──────── inverse witness ─────────────┤
     ├──────── Z/N embeddings ──────────────┤
     ├──────── generation ──────────────────┤
     │                                      │
     └──────── RawLE representative audit ─► qLE total order
                                            │
                              ┌─────────────┴──────────────┐
                              ▼                            ▼
                  additive order compatibility   multiplicative/inverse
                  translation + negation         order compatibility
                              └─────────────┬──────────────┘
                                            ▼
                                  QIntegrationCertificate
                                            │
                                            ▼
                                      Q-J-002 PASS
                                            │
                                            ▼
                                      QA-23 ACCEPT
                                            │
                                            ▼
                                      Q-BLOCK-002
                                 accepted downstream Q
```

## Identity boundary

Three notions remain intentionally distinct:

```text
RawFrac syntax
FracEquiv representation identity
QBOMA formal carrier equality
```

`Q-DP-001` selects quotient equality for the Stage-One export but does not claim mathematical necessity of that choice.

## Order boundary

Raw order is positive-denominator cross multiplication:

```text
RawLE(x,y) := x.num * y.den ≤_Z y.num * x.den.
```

Representative invariance is established before quotient total-order laws are exported.

The quotient order is witness-based rather than transported by silently identifying equivalent propositions.

## Verification topology

```text
cancellation                       32172230166
fraction equivalence               32172543345
raw arithmetic respect             32173010564
quotient carrier                   32174050137
raw additive                       32174278297
quotient additive                  32174565823
raw multiplicative                 32174478593
raw distributivity                 32176145896
quotient multiplicative            32176289914
quotient distributivity            32176439510
inverse witness                    32176692789
embeddings                         32177123730
generation                         32177245619
order core                         32177345921
order additive compatibility       32177896509
order multiplicative compatibility 32178098823
final N/Z/Q integration            32178326013
Lean                               4.32.1
```

## Branching interpretation

No second formal rational carrier was built in Stage One. Therefore QA-17 is not recorded as a multi-carrier reconvergence event.

The following are preserved as explicit later branch experiments:

```text
quotient carrier ↔ canonical reduced fractions
positive denominator ↔ alternative denominator discipline
formal quotient equality ↔ external FracEquiv identity
```

This makes the Q stage a strong Stage-II branching target without falsifying the Stage-One production history.
