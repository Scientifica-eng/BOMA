# PDCA Laboratory

This directory is the documentary structure for the experimental PDCA cycle used while constructing BOMA from zero.

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

This structure is itself a PDCA design decision under test. It is not a normative BOMA requirement.
