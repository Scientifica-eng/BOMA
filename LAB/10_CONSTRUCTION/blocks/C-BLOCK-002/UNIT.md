# C-BLOCK-002 — Stage-One Complex Downstream Export Candidate

- **Operational status:** `ACTIVE — ACCEPTED`
- **Pending decision:** `PDSA-C-008 / CA-20 = ACCEPT`
- **Selected producer:** `C-BLOCK-001 / C-ROUTE-P`
- **Neutral comparison:** `C-COMPARE-BLOCK-001`
- **Integration gate:** `C-J-001 PASS / exact V5 32585583815`
- **Accepted input:** `R-BLOCK-001`
- **Retained alternative:** `C-ROUTE-Q — verified probe only`

## Exact downstream interface

```text
C_BOMA       := explicit selected real-pair record
ιR           := faithful structure-preserving accepted-R embedding
0,1,-,+,*    := selected commutative-field operations
inverse      := existence + uniqueness of witnesses; no global selector
I            := selected imaginary generator
I²           = -1
generation   ∀ z, ∃ a b : R, z = ιR(a) + ιR(b) * I
uniqueness   equal generated values imply equal accepted-real coefficients
non-collapse I is not in the embedded real image
comparison   universal graph; functional isomorphism with extractor data
```

Formal producer: `BOMA.C.StageIntegration001.cStageIntegrationCertificate`.

The pair carrier is user-selected, not mathematically forced. Logical axioms
are inherited exactly from accepted R. No algebraic closure, completed Route Q
field, choice-based coordinate selector, or merge into `main` is implied.

Separate `CA-20 = ACCEPT` is justified by exact six-stage run `32586145793`,
job `97062695622`, source `6820278f566fc637c39582c3efa648d5c1d136df`.

The mandatory local `RE-C-001` audit is complete. Its detailed matrix exposes
whole-R-certificate bundling, actual order/logical dependencies, and retained
alternatives. The separate global `RE-STAGE1-001` chain audit remains open.
