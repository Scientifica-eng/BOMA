# C-J-001 — Selected Complex Same-Carrier Integration Gate

- **Operational status:** `PASS / RESOLVED — V5 32585583815`
- **Type:** `SAME-CARRIER-INTEGRATION`
- **Cycle:** `PDSA-C-007 — CLOSED / ALL GATES PASS`
- **Carrier:** `CBOMA := BOMA.C.RoutePairProbe001.PairCandidate`
- **Incoming:** `C-BLOCK-001`, `C-COMPARE-BLOCK-001`, accepted `R-BLOCK-001`
- **Output:** `C-CL-INTEGRATION-001 — PROVISIONAL / NOT ACCEPTED`
- **CA-20:** `NOT AUTHORIZED BY THIS CYCLE`

## Integrated mathematical package

`BOMA.C.StageIntegration001.CStageIntegrationCertificate` contains the
witness-based field; `I²=-1`; existence and uniqueness of real coordinates;
non-real-collapse; universal carrier-neutral comparison; and extractor-scoped
constructive functional comparison, all on the actual selected carrier.

Producer: `BOMA.C.StageIntegration001.cStageIntegrationCertificate`. It is
necessarily a `def`, not a `theorem`, because its functional comparison
includes actual function data in `Type`.

## Evidence

Exact run `32585583815`, job `97061334663`, source commit
`9a6f9e34639202c2a04d2a629e2b994f5d1562b8`, artifact `9478954700`.

Closure `PROTOTYPE_PASS`: `783` internal declarations, `76` boundary leaves,
`9,629` edges, `0` unresolved, `0` unmapped, `0` internal axioms.
Boundary `CLASSIFICATION_PASS / 0 residuals`.
Claims `CLAIM_PRODUCER_PASS`: `9` Claims, `19` producers, `783/783` owned,
`0` undeclared direct inputs, and `C=161` explicitly classified declarations.
Both accepted-R and final-C certificates depend exactly on
`[propext, Classical.choice, Quot.sound]`.

`CA-20` is now eligible only through separate active `PDSA-C-008`; this gate
does not by itself accept or export C.
