# BOMA PDSA Governance and Legacy PDCA Correction

**Document ID:** `BOMA-PDSA-GOV-2026-08-18`  
**Date:** 2026-08-18  
**Status:** ACTIVE — governing methodological clarification and additive correction  
**Applies to:** BOMA research process, future cycle records, project-roadmap interpretation, human–AI research learning, and interpretation of historical `PDCA`-labelled artifacts.

---

## 1. Correction

The governing iterative research method for BOMA is:

> **PDSA — Plan, Do, Study, Act**

It is **not PDCA (Plan, Do, Check, Act)**.

Any earlier project summary, intake note, analytical report, or assistant description that used `PDCA` as the name of the governing methodology is corrected by this document.

This correction is substantive rather than cosmetic. The `Study` phase is central to the BOMA research model because the project is intended not only to test whether an action met a target, but to extract new knowledge from the observed process, including unexpected behavior, errors, hidden assumptions, successful methods, failed methods, and human–AI interaction patterns.

---

## 2. Why PDSA matters for BOMA

BOMA has two intended products developed in parallel:

```text
PRODUCT A — MATHEMATICAL CONSTRUCTION
transparent, traceable, logically founded mathematical architecture
from a pre-numerical constructional root toward the standard number domains

PRODUCT B — RESEARCH KNOWLEDGE
knowledge extracted from the process of constructing Product A,
including methodological learning from sustained human–AI collaboration
```

PDSA is the mechanism that couples these two products.

A successful cycle therefore does not merely answer:

```text
Did the proposed construction work?
```

It must also answer:

```text
What did the attempt teach us?
What changed in our understanding?
Which assumptions were exposed?
Which errors were detected?
Which procedures were effective or ineffective?
What did the human contribute?
What did the AI contribute?
Which AI suggestions were accepted, rejected, corrected, or independently verified?
What should the next cycle inherit from this cycle?
```

---

## 3. Operational meaning of the four phases

### PLAN

Record before acting:

- research question;
- current state and inherited learning;
- hypothesis or proposed architectural move;
- intended output;
- declared assumptions and permitted metatheory;
- known risks of hidden commitments;
- acceptance/rejection criteria;
- proposed verification method;
- what evidence would cause a revision or branch.

### DO

Perform the smallest useful construction, experiment, proof attempt, countermodel search, formalization probe, or architectural change needed to test the Plan.

The Do phase must preserve provenance. Failed attempts are evidence and are not to be silently deleted when scientifically relevant.

### STUDY

Study is broader than a binary check.

It includes:

- compare observations with the Plan;
- analyze why the result occurred;
- identify hidden assumptions and conceptual drift;
- distinguish structural result from interpretation;
- distinguish failure of implementation from failure of hypothesis;
- search for counterexamples and alternative explanations;
- assess downstream dependency effects;
- extract reusable methodological learning;
- audit the contribution of human reasoning and AI-generated proposals;
- record uncertainty and unresolved questions;
- decide whether observed behavior suggests a new Decision Point, Brick, Block, Junction, or verification condition.

The Study phase is expected to generate knowledge even when the mathematical attempt fails.

### ACT

Use the Study result to determine the next controlled state:

```text
ACCEPT / STABILIZE
CORRECT
REVISE
REBUILD
BRANCH
REJECT
ARCHIVE
ESCALATE TO FORMAL VERIFICATION
OPEN A NEW PDSA CYCLE
```

Act must explicitly state what is carried forward into the next Plan.

---

## 4. Cycles are cumulative

BOMA research shall be treated as a sequence of learning cycles:

```text
PDSA-n
  ↓ extracted learning
PDSA-(n+1)
  ↓ extracted learning
PDSA-(n+2)
  ↓
...
```

A later cycle does not begin from zero. It inherits the verified results, rejected paths, warnings, open questions, and methodological learning of preceding cycles.

Consequently, BOMA should maintain both:

```text
CONSTRUCTION GRAPH
    what mathematical structures depend on what

LEARNING GRAPH
    what research learning arose from which cycles and what later decisions it changed
```

These graphs should be cross-linked.

---

## 5. Human–AI research learning

Because BOMA is being developed through sustained work between a human researcher and AI systems, the project shall explicitly extract knowledge about that collaboration.

This record should distinguish, where relevant:

- human-originated research question or constraint;
- AI-originated proposal, formulation, proof sketch, objection, or alternative;
- accepted AI contribution;
- rejected AI contribution;
- AI error or overclaim;
- human correction;
- independent verification status;
- prompt/workflow pattern that improved or degraded results;
- cases where AI accelerated exploration;
- cases where AI created conceptual drift;
- points requiring human research authority rather than model inference.

AI output shall never become canonical merely because it is fluent, internally plausible, or repeated across cycles.

---

## 6. Treatment of historical `PDCA` names

The repository contains historically significant identifiers that literally use `PDCA`, including paths, files, workflow names, and commits such as:

```text
LAB/PDCA/
LAB/BOMA_LAB_001_PDCA.md
LAB/PDCA_001_LOGICAL_CORE_PROBE.md
.github/workflows/boma-lean-pdca-001.yml
```

These identifiers are **legacy historical names**.

They shall not be interpreted as evidence that the governing methodology of BOMA is PDCA.

They are retained because renaming historical artifacts can damage provenance, links, commit interpretation, and the ability to reconstruct the actual evolution of the repository.

The rule is therefore:

> **Preserve legacy `PDCA` identifiers as historical facts; interpret the governing and future methodology as PDSA.**

Where a historical record itself genuinely used PDCA terminology at the time, that fact remains part of the history. Later analysis must distinguish historical naming from the current methodological correction.

---

## 7. Naming rule for future cycles

All newly created research-cycle identities should use `PDSA`, not `PDCA`.

Recommended identifier pattern:

```text
PDSA-<track>-<sequence>
```

Examples:

```text
PDSA-TCT-001
PDSA-TCT-002
PDSA-N-001
PDSA-Z-001
PDSA-REAL-001
PDSA-BRANCH-001
```

A cycle record should link to the units, experiments, decisions, and previous-cycle learning it consumes.

---

## 8. Minimum PDSA cycle record

Each future cycle should record at least:

```text
CycleID
ParentCycles / LearningInputs
ResearchQuestion
PLAN
DO
Observations
STUDY
ErrorsDetected
Successes
HiddenAssumptions
HumanContributions
AIContributions
VerificationEvidence
LessonsLearned
ACT
ConstructionGraphEffects
LearningGraphEffects
OpenQuestions
NextCycleInputs
```

Additional fields may be introduced when justified.

---

## 9. Interpretation of previous BOMA reports

The documents:

```text
LAB/BOMA_SCIENTIFIC_HISTORICAL_REVIEW_2026-08-18.md
LAB/BOMA_PROJECT_INTAKE_AND_RESEARCH_ROADMAP_2026-08-18.md
```

were created before this methodological correction was explicitly recorded.

Where they use `PDCA` to identify historical files, directories, commits, or repository phases bearing that name, the usage remains historically valid.

Where `PDCA` could be read as the governing methodology of current or future BOMA research, this document supersedes that interpretation:

```text
GOVERNING METHOD = PDSA
```

---

## 10. Project objective under PDSA

The long-term mathematical objective remains:

> Build a logically founded, internally coherent, transparent, traceable, auditable architecture beginning from a declared pre-numerical constructional layer and, as the first major mathematical stage, reaching the standard number domains ℕ, ℤ, ℚ, ℝ, and ℂ; subsequently test deliberate branching at selected Bricks, Blocks, Junctions, logical regimes, and realization choices.

The parallel methodological objective is:

> Build an equally traceable body of knowledge about **how** that mathematical architecture was produced through successive PDSA cycles, including errors, corrections, successful procedures, failed procedures, changes of understanding, and the strengths and failure modes of human–AI research collaboration.

Neither product is secondary.

---

## 11. Governance rule

From this record forward:

1. `PDSA` is the authoritative name of the BOMA iterative research method.
2. `Study` must never be reduced to a pass/fail check.
3. Every major mathematical construction should be traceable to one or more PDSA cycles.
4. Every major methodological lesson should be traceable to the cycle(s) that produced it.
5. Historical `PDCA` identifiers remain unchanged unless a separate migration decision explicitly justifies renaming them.
6. New files, cycles, templates, and roadmap language should use `PDSA`.
7. Future summaries must explicitly distinguish legacy `PDCA` naming from current PDSA governance.

---

## 12. Correction conclusion

The relevant conceptual correction is therefore:

```text
NOT:
Plan → Do → Check → Act

BUT:
Plan → Do → Study → Act
                 │
                 └── produces explicit reusable learning
```

For BOMA, the output of **Study** is part of the research product itself.
