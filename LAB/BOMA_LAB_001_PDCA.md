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

---

# Current State

The experiment remains open. B-002 remains blocked.

```text
D-000
  │
  └── B-001
       ├── BOMA specification       ✓
       ├── Lean representation      ✓
       ├── CI execution             ✓
       ├── Kernel/type check        ✓
       ├── Reproducibility evidence ✓
       ├── Atomicity                OPEN
       └── Logical Core             OPEN
```

## Immediate next gates

1. Complete the B-001 atomicity analysis.
2. Complete the Logical Core Probe.
3. Record each observation and correction in this ledger before relying on it for an architectural decision.
4. Only after those gates decide whether B-001 remains one Brick or decomposes.
5. Do not introduce B-002 before that decision.

## Discipline

A successful backend check is a **verification event**, not an automatic architectural acceptance event. Every later conclusion must cite the evidence that caused it. If evidence changes, the affected conclusion must be revisited rather than silently overwritten.
