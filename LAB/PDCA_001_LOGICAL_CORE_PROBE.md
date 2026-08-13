# PDCA-001 — Logical Core Probe

**Status:** Planned probe
**Cycle:** PDCA-001
**Baseline:** BOMA I + BOMA II

## Experimental Question

What is the smallest logical foundation that the BOMA trunk requires before its first meaningful Brick can be constructed, while preserving the proposed rule that the trunk uses intuitionistic logic by default?

## Hypothesis

The trunk can begin with an intuitionistic logical foundation without importing a classical principle merely for convenience.

This is a hypothesis, not a normative conclusion.

## Scope

The probe is deliberately narrower than a complete proof-assistant formalization. It asks only what must be specified at the BOMA architectural level to identify the logical regime of the initial trunk.

It must distinguish:

1. logical regime;
2. logical primitives/rules;
3. derived principles;
4. backend representation;
5. backend infrastructure;
6. mathematical content introduced by BOMA.

## Plan

### P1 — Identify the candidate trunk regime

Record the working description of intuitionistic logic used by the laboratory without equating it with any particular backend.

### P2 — Separate principles from convenience

For every logical capability needed by the first construction, classify it as:

- intuitionistically available;
- an additional logical principle;
- backend infrastructure;
- backend convenience/automation;
- unresolved.

### P3 — Test necessity

If a capability appears unavailable intuitionistically, do not immediately extend the trunk. Record the obstacle and investigate whether a weaker construction or a more precise representation avoids it.

### P4 — Test minimality

If a logical extension eventually proves necessary, identify the smallest precisely stated additional commitment that suffices.

### P5 — Record evidence

Every conclusion is marked `Proposed`, `Observed`, `Validated`, `Corrected`, `Deprecated`, or `Normative` according to the laboratory epistemic discipline.

## Check Criteria

The probe succeeds provisionally if we can state:

- what "intuitionistic trunk" means at the BOMA level;
- which logical commitments are actually required by the first construction;
- which capabilities are merely backend mechanisms;
- whether any non-intuitionistic principle is genuinely necessary;
- if an extension is necessary, why weaker alternatives are insufficient.

## Expected Outputs

1. A minimal logical-foundation record.
2. A backend-neutral description of the logical regime.
3. A list of principles used by the first Brick.
4. A distinction between inherited, introduced, and derived logical commitments.
5. A decision on whether the current B-001 candidate should remain the first Brick, be decomposed, or be redesigned.

## Guardrails

- No classical principle may be introduced merely because it is convenient.
- No backend default may silently define the BOMA logical regime.
- No logical system is excluded from future branches merely because it is not classical.
- No exceptional extension of the trunk is accepted without demonstrated necessity and traceability.
- No result from this probe becomes normative BOMA specification without the change-control process.

## Current Status

The probe has been defined. Formal execution is pending the reproducible backend environment described in `LAB/environment/LEAN_REPRODUCIBLE.md`.
