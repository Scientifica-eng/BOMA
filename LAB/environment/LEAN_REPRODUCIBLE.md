# Reproducible Lean Verification Environment

**Status:** Required laboratory infrastructure — Provisioned, verification pending
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

## 2. Provisioned State

The laboratory now declares the Lean toolchain in the repository root:

`lean-toolchain`

Current pinned toolchain:

`leanprover/lean4:v4.32.1`

The repository also contains a dedicated GitHub Actions check:

`.github/workflows/boma-lean-pdca-001.yml`

The check uses `leanprover/lean-action@v1` to provision the declared toolchain and then executes:

```text
lean LAB/payloads/lean/B001.lean
```

The toolchain pin and the CI definition are now repository artifacts. The verification result itself is still pending; no successful run has yet been observed in this cycle.

## 3. Why the Toolchain Is Pinned

A moving channel such as `stable` is unsuitable as the sole reproducibility reference for a historical experiment because its meaning changes when a new Lean release appears.

The laboratory therefore records a specific version for each reproducible experiment. The pinned version can be deliberately changed later through the change-control process.

## 4. Required Components

The Lean backend fixture contains, at minimum:

- a pinned Lean toolchain/version;
- the BOMA payload under test;
- a deterministic check command;
- a repository-defined CI execution path;
- instructions sufficient for an independent reproduction.

A full Lake project is not currently required because B-001 has no external mathematical dependency and can be checked directly by `lean`.

## 5. Dependency Discipline

The environment must distinguish:

### Backend infrastructure

Lean's own trusted kernel, standard implementation infrastructure, the toolchain manager/action, and the project tooling required to execute the check.

### BOMA mathematical content

Definitions, axioms, theorems, and other mathematical artifacts deliberately introduced by the BOMA development.

Backend infrastructure must not silently become BOMA content merely because the payload depends on it technically.

## 6. Required Verification States

The laboratory uses these states:

- `NOT_ATTEMPTED` — no verification run has been performed.
- `BLOCKED` — verification is required but cannot currently be executed or reproduced.
- `FAILED` — the backend was executed and rejected the artifact or the defined check failed.
- `VERIFIED` — the backend was executed successfully under the declared environment.

No other informal state may be interpreted as successful verification.

For the present cycle, B-001 remains `BLOCKED` until a CI run or an independently reproducible local run produces an actual result.

## 7. Initial Fixture Target

The fixture checks:

`LAB/payloads/lean/B001.lean`

without introducing additional BOMA mathematical content beyond what is explicitly recorded for B-001.

The fixture itself is treated as backend infrastructure unless the experiment explicitly identifies some part of it as BOMA content.

## 8. Acceptance Criteria

The environment is ready when an independent user can:

1. obtain the repository at the specified revision;
2. identify the exact Lean toolchain;
3. execute the documented check command;
4. obtain the same verification outcome;
5. identify which artifact produced that outcome.

The repository now satisfies items 1–3 by construction. Items 4–5 require an observed execution result and its recording in the laboratory log.

## 9. Sources

The choice to pin a specific Lean toolchain follows Lean's documented toolchain model: a `lean-toolchain` file associates a project with a specific version, while `lean` is the compiler/checker used to elaborate Lean source. The laboratory uses these facilities as backend infrastructure, not as BOMA semantics.

## 10. Open Questions

- How should successful and failed CI results be persisted for later audit?
- Should BOMA eventually define a backend-verification evidence schema shared by Lean, Coq, Agda, and Isabelle?
- When is a full Lake workspace justified by the project's dependency structure?

These are infrastructure questions, not BOMA mathematical principles.
