# CLAIM DEPENDENCY GRAPH VIEW — Accepted Assertion Architecture + Provisional C Frontier

**View ID:** `BOMA-VIEW-CLAIM-GRAPH-001`  
**Status:** GENERATED / DERIVED VIEW  
**Date:** 2026-08-21  
**Program:** `PDSA-ARCH-002` + C continuation under `PDSA-C-001/002`

## Authority boundary

This view summarizes **Claim-family dependencies and packaging**, not every Lean theorem edge. Exact theorem-level actual closures are the evidence JSON files produced by stage transparency workflows.

```text
Claim-family arrow ≠ direct theorem dependency
Claim Record ≠ Construction Unit
Claim producer ≠ mathematical necessity of its selected route
provisional C Claim ≠ accepted Claim
supporting lemma ≠ automatic Brick
```

Primary sources:

```text
LAB/00_ARCHITECTURE/CLAIM_REGISTRY.md
LAB/20_FORMALIZATION/*/*CLAIM_CLOSURE_AUDIT*.md
LAB/20_FORMALIZATION/C_STAGE/C_CLAIM_REGISTER_001.md
LAB/00_ARCHITECTURE/C_R_DEPENDENCY_CONTRACT.md
LAB/00_ARCHITECTURE/*_FORMAL_CLAIM_PRODUCER_POLICY.json
```

## Cross-stage integration spine

```mermaid
flowchart LR
  N[N-CL-INTEGRATION-001\nN-Core] --> NA[NAR-CL-INTEGRATION-001\nN-Arithmetic]
  NA --> Z[Z-CL-INTEGRATION-001\nZ]
  Z --> Q[Q-CL-INTEGRATION-001\nQ]
  Q --> R[R-CL-INTEGRATION-001\nR]
  R -. accepted interface input .-> CPROV[Provisional C Claim frontier\nNOT ACCEPTED]
```

Every accepted node through R has independent machine transparency certification on the architecture branch. The solid arrows mean accepted downstream construction consumes the upstream accepted interface; they do not mean the upstream production history can be reconstructed from the downstream carrier.

The dotted R→C edge records an active construction frontier only. There is no accepted `C-CL-INTEGRATION-001` spine node yet.

## N-Core Claim-family graph

```mermaid
flowchart TD
  NC[N-CL-CARRIER-001]
  NI[N-CL-ID-001]
  NE[N-CL-ELIM-001]
  NA[N-CL-NOCONF-A-001]
  NIND[N-CL-IND-001]
  NGEN[N-CL-GEN-001]
  NREC[N-CL-REC-001]
  NRU[N-CL-RECUNIQ-001]
  NINIT[N-CL-INITIAL-001]
  NTB[N-CL-TCTBASE-001]
  NTE[N-CL-TCTEXT-001]
  NTP[N-CL-TCTPRES-001]
  NTR[N-CL-TCTREFL-001]
  NTC[N-CL-TCTCOVER-001]
  NH[N-CL-HIST-001]
  NB[N-CL-NOCONF-B-001]
  NJ[N-CL-NOCONF-CONV-001]
  NCM[N-CL-COMPARE-001]
  NS[N-CL-STANDARD-001]
  NX[N-CL-INTEGRATION-001]

  NC --> NI
  NC --> NE
  NE --> NIND
  NC --> NA
  NE --> NGEN
  NE --> NREC
  NREC --> NRU
  NREC --> NINIT
  NC --> NTB
  NTB --> NTE
  NTB --> NTP
  NTB --> NTR
  NTB --> NTC
  NTC --> NH
  NTE --> NB
  NTR --> NB
  NA --> NJ
  NB --> NJ
  NINIT --> NCM
  NCM --> NS

  NI --> NX
  NIND --> NX
  NGEN --> NX
  NRU --> NX
  NINIT --> NX
  NJ --> NX
  NTP --> NX
  NTR --> NX
  NTC --> NX
  NH --> NX
  NS --> NX
```

The TCT bridge Claims are scoped to selected backend representations and do not assert that a global completed carrier already existed in the pre-numerical object layer.

## N-Arithmetic Claim-family graph

```mermaid
flowchart TD
  ADEF[NAR-CL-ADDDEF-001]
  ACONV[NAR-CL-ADDCONV-001]
  ADD[NAR-CL-ADD-001]
  MDEF[NAR-CL-MULDEF-001]
  MCONV[NAR-CL-MULCONV-001]
  MUL[NAR-CL-MUL-001]
  ODEF[NAR-CL-ORDERDEF-001]
  OCONV[NAR-CL-ORDERCONV-001]
  ORD[NAR-CL-ORDER-001]
  OA[NAR-CL-ORDERARITH-001]
  INT[NAR-CL-INTEGRATION-001]

  ADEF --> ACONV --> ADD
  ADD --> MDEF
  MDEF --> MCONV --> MUL
  ADD --> ODEF
  ODEF --> OCONV --> ORD
  ADD --> OA
  MUL --> OA
  ORD --> OA
  ADD --> INT
  MUL --> INT
  ORD --> INT
  OA --> INT
```

The two definition Claims deliberately retain both recursive routes. Canonical `add := addR`, `mul := mulR`, and `LE := LEAdd` are post-reconvergence spellings, not necessity claims.

## Z Claim-family graph

```mermaid
flowchart TD
  REP[Z-CL-REP-001]
  ALT[Z-CL-ALTREP-001]
  RC[Z-CL-REPCONV-001]
  CAR[Z-CL-CARRIER-001]
  AC[Z-CL-ARITHCONV-001]
  RING[Z-CL-RING-001]
  EMB[Z-CL-EMBED-001]
  GEN[Z-CL-GEN-001]
  OC[Z-CL-ORDERCONV-001]
  ORD[Z-CL-ORDER-001]
  INT[Z-CL-INTEGRATION-001]

  REP --> RC
  ALT --> RC
  RC --> CAR
  REP --> AC
  ALT --> AC
  AC --> RING
  CAR --> RING
  CAR --> EMB
  RING --> EMB
  RING --> GEN
  REP --> OC
  ALT --> OC
  OC --> ORD
  RING --> ORD
  EMB --> ORD

  CAR --> INT
  RC --> INT
  AC --> INT
  RING --> INT
  EMB --> INT
  GEN --> INT
  OC --> INT
  ORD --> INT
```

`Z-CL-ALTREP-001` remains in the accepted Claim architecture even though signed forms were selected for the canonical carrier. Its role is not erased after `Z-DP-001`.

## Q Claim-family graph

```mermaid
flowchart TD
  G[Q-CL-GATE-001]
  REP[Q-CL-REP-001]
  RAW[Q-CL-RAWOPS-001]
  CAR[Q-CL-CARRIER-001]
  ALG[Q-CL-ALG-001]
  INV[Q-CL-INV-001]
  EMB[Q-CL-EMBED-001]
  GEN[Q-CL-GEN-001]
  ORD[Q-CL-ORDER-001]
  INT[Q-CL-INTEGRATION-001]

  G --> REP
  REP --> RAW
  REP --> CAR
  RAW --> CAR
  CAR --> ALG
  ALG --> INV
  CAR --> EMB
  CAR --> GEN
  ALG --> ORD
  INV --> ORD
  EMB --> ORD

  CAR --> INT
  ALG --> INT
  INV --> INT
  EMB --> INT
  GEN --> INT
  ORD --> INT
```

The quotient carrier is a selected formalization choice. `Q-CL-CARRIER-001` therefore records an accepted carrier/identity property while the route remains explicitly classified as a formalization commitment.

## R Claim-family graph

```mermaid
flowchart TD
  CAR[R-CL-CARRIER-001]
  QE[R-CL-QEMBED-001]
  ORD[R-CL-ORDER-001]
  NT[R-CL-NONTRIV-001]
  ADD[R-CL-ADD-001]
  MUL[R-CL-MUL-001]
  INV[R-CL-INV-001]
  FIELD[R-CL-FIELD-001]
  COMP[R-CL-COMP-001]
  DEN[R-CL-DENSITY-001]
  ARCH[R-CL-ARCH-001]
  INT[R-CL-INTEGRATION-001]

  CAR --> QE
  CAR --> ORD
  QE --> ORD
  QE --> NT
  CAR --> ADD
  ORD --> ADD
  ADD --> MUL
  ORD --> MUL
  MUL --> INV
  ORD --> INV
  NT --> INV
  ADD --> FIELD
  MUL --> FIELD
  INV --> FIELD
  ORD --> FIELD
  CAR --> COMP
  QE --> DEN
  ORD --> DEN
  QE --> ARCH
  ORD --> ARCH

  QE --> INT
  ORD --> INT
  NT --> INT
  ADD --> INT
  MUL --> INT
  INV --> INT
  FIELD --> INT
  COMP --> INT
  DEN --> INT
  ARCH --> INT
```

R's actual theorem closure additionally exposes localized logical leaves (`Classical.em`, `Classical.byContradiction`) under explicit Claim/Decision references. They belong in the Logic/Trust view rather than being disguised as ordinary mathematical Claim nodes.

## C provisional Claim-family graph — not accepted

```mermaid
flowchart TD
  RINT[R accepted field/order interface]
  CRL1[C-RL-001\nsquare nonnegative\nSUPPORTING LEMMA\nV5 PASS]
  CRL2[C-RL-002\n-1 not a real square\nSUPPORTING LEMMA\nV5 PASS]

  CC[C-CL-CARRIER-001\nUNPRODUCED]
  CE[C-CL-REMBED-001\nUNPRODUCED]
  CF[C-CL-FIELD-001\nUNPRODUCED]
  CI[C-CL-I-001\nUNPRODUCED]
  CG[C-CL-GEN-001\nUNPRODUCED]
  CU[C-CL-COORDUNIQ-001\nUNPRODUCED]
  CN[C-CL-NONREAL-001\nDERIVED-REQUIRED / UNPRODUCED]
  CMP[C-CL-COMPARE-001\nUNPRODUCED]
  CINT[C-CL-INTEGRATION-001\nNO JUNCTION / UNPRODUCED]

  RINT --> CRL1 --> CRL2
  RINT -. future construction input .-> CC
  CC --> CE --> CF --> CI --> CG --> CU
  CRL2 -. possible supporting input .-> CU
  CU --> CN
  CU --> CMP
  CRL2 -. possible supporting input .-> CN
  CMP --> CINT
  CF --> CINT
  CE --> CINT
  CI --> CINT
  CG --> CINT
  CU --> CINT
```

The C graph is **ex-ante/provisional**. It records acceptance targets and supporting-lemma hypotheses before representation selection. The arrows to `C-RL-002` are possible route-neutral support relationships, not proof that every future coordinate-uniqueness producer must consume that lemma.

No algebraic-closure Claim is present because `BOMA-C-ACCEPT-001` explicitly defers that strengthening from Stage-One acceptance.

## Machine transparency summary

| Stage | Registered accepted Claims | Producer-policy Claims | Residuals / state |
|---|---:|---:|---|
| N-Core | 20 | 20 | 0 |
| N-Arithmetic | 11 | 11 | 0 |
| Z | 11 | 11 | 0 |
| Q | 10 | 10 | 0 |
| R | 12 | 12 | 0 |
| C | 0 accepted; 9 provisional targets | 0 accepted | route-neutral supporting boundary V5 32564789630 PASS; no accepted C Claim |

The exact declaration-level dependency graph for accepted stages remains in the corresponding `*_FORMAL_DEPENDENCY_CLOSURE_PROTOTYPE_LATEST.json` evidence files.

## Current boundary

```text
C provisional Claim register     OPEN
C accepted Claims                NONE
C-RL-001 / C-RL-002 source proof V5 VERIFIED — supporting only
C-RQ-001 formal V5 outcome       32564789630 PASS / CLOSED
C-DP-001                         OPEN
C accepted export                NONE
```

The previous C hold is historical provenance only; it was explicitly lifted on 2026-08-21.