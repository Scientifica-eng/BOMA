# Reproducible Lean Verification Environment

**Status:** Required laboratory infrastructure — Proposed
**Purpose:** Make Formal Check reproducible before any BOMA artifact is marked `Verified`.

## 1. Rule

A BOMA backend artifact must not receive `VerificationStatus = VERIFIED` unless the selected backend can be executed and the verification result can be reproduced from the repository-defined environment.

For Lean, the minimum reproducibility target is:

```text
repository checkout
    -> declared Lean toolchain
    -> declared project configuration
    -> deterministic command
    -> successful or failed kernel/type check
    -> recorded result
```

## 2. Current State

The laboratory environment used during PDCA-001 does not expose `lean` or `lake` executables. Consequently, B-001 is currently `BLOCKED`, not `VERIFIED`.

This document records the requirement; it does not claim that the toolchain has already been installed.

## 3. Required Components

The eventual Lean backend fixture should contain, at minimum:

- a pinned Lean toolchain/version;
- a project configuration;
- the BOMA payload under test;
- a minimal entry point that imports only what the experiment requires;
- a deterministic check command;
- a machine-readable or unambiguous human-readable result;
- instructions sufficient for an independent reproduction.

## 4. Dependency Discipline

The environment must distinguish:

### Backend infrastructure

Lean's own trusted kernel, standard implementation infrastructure, and the project tooling required to execute the check.

### BOMA mathematical content

Definitions, axioms, theorems, and other mathematical artifacts deliberately introduced by the BOMA development.

Backend infrastructure must not silently become BOMA content merely because the payload depends on it technically.

## 5. Required Verification States

The laboratory uses these states:

- `NOT_ATTEMPTED` — no verification run has been performed.
- `BLOCKED` — verification is required but cannot currently be executed or reproduced.
- `FAILED` — the backend was executed and rejected the artifact or the defined check failed.
- `VERIFIED` — the backend was executed successfully under the declared environment.

No other informal state may be interpreted as successful verification.

## 6. Initial Fixture Target

The first fixture must be capable of checking:

`LAB/payloads/lean/B001.lean`

without introducing additional BOMA mathematical content beyond what is explicitly recorded for B-001.

The fixture itself should be treated as backend infrastructure unless the experiment explicitly identifies some part of it as BOMA content.

## 7. Acceptance Criteria

The environment is ready when an independent user can:

1. obtain the repository at the specified revision;
2. identify the exact Lean toolchain;
3. execute the documented check command;
4. obtain the same verification outcome;
5. identify which artifact produced that outcome.

## 8. Open Questions

- Which Lean version should be pinned for the laboratory?
- Should the first fixture use the smallest possible Lean project or an existing repository structure?
- Which command should be the canonical check command?
- How should verification results be persisted for later audit?
- How should equivalent fixtures be handled across other backends?

These are infrastructure questions, not BOMA mathematical principles.
