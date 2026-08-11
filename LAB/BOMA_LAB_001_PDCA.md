# BOMA Laboratory — PDCA-001

## Incremental Evidence Ledger

This ledger is updated during the experiment, not only at cycle closure.

| Evidence ID | Event | What was learned | Status |
|---|---|---|---|
| E-001 | Initial environment inspection | Local environment lacked Lean/Lake executables. | Recorded |
| E-002 | CI trigger probe | Push to `lab/pdca-001` triggers the workflow. | Validated |
| E-003 | First CI attempt | Lean setup failed because the Lake manifest was absent. | Recorded / Corrected |
| E-004 | Infrastructure correction | Minimal Lake workspace/manifest removed the setup blocker. | Recorded |
| E-005 | Successful CI Run 8 | Lean `v4.32.1` setup succeeded and the `Kernel/type check B-001` step succeeded. | **Validated** |
| E-006 | Verification interpretation | Backend success proves acceptance of the current Lean artifact, not BOMA atomicity or semantic canonicity. | Adopted as working distinction |
| E-007 | Atomicity probe | `domain + initial` can be independently represented and checked in Lean. | **Validated** |
| E-008 | Independent BOMA identity analysis | `domain + initial` passes provisional criteria for independent identity; decomposition is supported but not yet adopted. | **Provisional** |
| E-009 | Cross-case identity criterion test | The provisional identity criterion rejects a backend-separable successor component when its BOMA meaning is incomplete without a carrier/domain. | **Provisional / Observed** |
| E-010 | Positive control for dependency | A candidate may depend on a prior unit and still have independent Brick identity when its new commitment is complete relative to that prerequisite. | **Provisional / Observed** |

### E-005 — Formal verification evidence

```text
Workflow: BOMA Lean — PDCA-001
Run:      31478519557
Job:      check-b001 / 93737821372
Event:    push
Branch:   lab/pdca-001
Toolchain: leanprover/lean4:v4.32.1
Step:     Kernel/type check B-001
Result:   success
```

**Interpretation:** the current `LAB/payloads/lean/B001.lean` artifact was accepted by Lean under the declared CI environment.

**Non-claim:** this does not establish that B-001 is an atomic BOMA Brick, that its representation is canonical, or that the intuitionistic trunk hypothesis has been validated.

### E-007 — Atomicity/backend separability evidence

```text
Workflow:   BOMA Lean — PDCA-001
Run:        31480507673
Step:       Kernel/type check B-001 atomicity probe
Toolchain:  leanprover/lean4:v4.32.1
Result:     success
```

**Interpretation:** the smaller `domain + initial` candidate can be independently represented and checked in Lean.

**Non-claim:** backend separability does not by itself establish BOMA decomposability.

### E-008 — Independent BOMA identity evidence

The semantic candidate:

```text
A = domain + initial
```

was tested for four provisional criteria:

1. identifiability without successor;
2. self-contained content;
3. traceable dependency for a later successor extension;
4. non-artificiality of the architectural boundary.

The current analysis provisionally passes all four criteria. The evidence therefore supports a candidate decomposition:

```text
B-001a — Minimal Pointed Object Domain
B-001b — Successor Structure
```

but does **not** yet authorize creating these as adopted BOMA Bricks.

Analysis record:

`LAB/B001_IDENTITY_ANALYSIS.md`

### E-009 — Cross-case criterion evidence

The provisional identity criterion was applied to a structurally related control candidate:

```text
C-CTRL-001 — successor : X → X without an independently specified carrier/domain
```

The control was **not** given a Brick ID and was not added to `BRICKS/`.

Results:

```text
Identifiability       FAIL
Self-contained        FAIL
Traceable dependency  PASS
Non-artificiality     FAIL
Brick candidate       NO
```

**Interpretation:** backend separability is not sufficient for Brick status. The criterion discriminates between a candidate with an independently meaningful identity (`domain + initial`) and a separable component whose intended BOMA meaning is incomplete without an unspecified carrier.

**Non-claim:** this single control case does not validate the criterion universally. It only provides evidence that the criterion is non-vacuous and is not equivalent to backend separability.

Analysis record:

`LAB/B001_IDENTITY_CRITERION_TEST.md`

### E-010 — Positive dependency control

A positive control tested the opposite boundary condition:

```text
P = prior established object-domain Brick
S = new successor-forming commitment over P
```

The candidate `S` was judged to have:

```text
Identifiability       PASS
Self-contained meaning PASS, conditional on P
Traceable dependency  PASS
Non-artificiality     PASS provisional
Brick candidate       YES, provisionally
```

This is conceptual evidence; no new Brick record was created.

Analysis record:

`LAB/B001_POSITIVE_CONTROL.md`

**Interpretation:** dependency on a prior Brick is not itself disqualifying. A dependent candidate may have independent Brick identity when it introduces a distinct, complete architectural commitment relative to an explicit prerequisite.

## Current State

The experiment remains open. B-002 remains blocked.

```text
D-000
  │
  └── B-001
       ├── BOMA specification              ✓
       ├── Lean representation             ✓
       ├── CI execution                    ✓
       ├── Kernel/type check               ✓
       ├── Reproducibility evidence        ✓
       ├── Backend separability            ✓
       ├── Independent identity evidence  ✓ provisional
       ├── Criterion cross-case test       ✓ provisional
       ├── Positive dependency control     ✓ provisional
       ├── Decomposition                  SUPPORTED / NOT ADOPTED
       ├── Final Atomicity                 OPEN
       └── Logical Core                    OPEN
```

## Immediate next gates

1. Compare the accumulated evidence directly against the BOMA definition of Brick and the intended construction order.
2. Decide whether `domain + initial` should become an adopted Brick boundary.
3. Only then, if justified, create official `B-001a` / `B-001b` records.
4. Continue the Logical Core Probe separately; do not infer logical conclusions from the atomicity experiment.
5. Do not introduce B-002 before these gates are addressed.

## Discipline

A successful backend check is a **verification event**, not an automatic architectural acceptance event. Every later conclusion must cite the evidence that caused it. If evidence changes, the affected conclusion must be revisited rather than silently overwritten.
