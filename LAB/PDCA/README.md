# PDCA Laboratory

> **Legacy naming notice — 2026-08-18**  
> The governing BOMA research method is **PDSA — Plan, Do, Study, Act**, not PDCA.  
> This directory name and the `PDCA` identifiers inside it are preserved as historical provenance from an earlier naming stage of the repository. They must not be interpreted as the current methodological standard.  
> The authoritative correction and governance record is: `LAB/BOMA_PDSA_GOVERNANCE_AND_PDCA_LEGACY_CORRECTION_2026-08-18.md`.

This directory is the documentary structure for the experimental cycle historically labelled `PDCA` while constructing BOMA from zero.

Under current project governance, the methodological interpretation of this work is **PDSA**, with particular emphasis on the `Study` phase as an explicit producer of reusable research learning.

## Principle

Each significant experiment is documented in its own independent document.

The purpose is traceability, learning, and correction—not to create a second BOMA specification.

## Structure

```text
LAB/PDCA/
├── README.md
├── experiments/
├── calibrations/
└── index.md
```

### `experiments/`

One document per experiment.

Each experiment should preserve:

- question
- initial hypothesis
- setup/method
- observed result
- failure or anomaly
- correction
- learning
- impact
- open questions
- evidence references
- epistemic status

### `calibrations/`

Independent calibration checkpoints used to review the work against the current project objective and detect hallucination, drift, overreach, or premature architectural commitments.

### `index.md`

A navigation/index document. It is not the source of truth for the experiments; the individual experiment documents are.

## Documentation rule

Do not merge independent experiments merely because they concern the same subject.

A later correction should normally be recorded as a new document or explicit follow-up record rather than silently rewriting historical conclusions.

## Epistemic rule

Every record must distinguish, where applicable:

```text
SOURCE
EXECUTED EXPERIMENT
INFERENCE
HYPOTHESIS
DESIGN PROPOSAL
```

A conceptual probe must never be described as a formally executed backend experiment.

## Current status

This historical structure originated under the label `PDCA`. The current normative research-cycle method is **PDSA**. The directory remains non-normative as a BOMA specification and is retained for provenance and learning continuity.
