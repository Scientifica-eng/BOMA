# FUTURE_EXPERIMENT_CANDIDATE_PROTOCOL_001 — Transferable Research Candidate Capture

**Status:** `ACTIVE GOVERNANCE GUIDANCE / DOES NOT AUTHORIZE EXECUTION`  
**Scope:** Stage-Two and later research candidates discovered during formal work  
**Purpose:** make a newly discovered research direction executable later by the current agent, another AI system, or a human maintainer without reconstructing the discovery context from conversation history.

## Rule

Whenever ongoing work reveals a plausible future controlled experiment, record it in the repository before the context is lost.

Recording a candidate is **not** authorization to execute it, freeze a Plan, modify `main`, change an accepted producer, or change canonical selection. Existing single-active-experiment and owner-authorization rules remain controlling.

## Minimum candidate dossier

Every recorded candidate should contain, where known:

```text
candidate_id
status = CANDIDATE / NOT AUTHORIZED
observed_at_branch
observed_at_commit
observation/evidence
exact source paths and declarations that exposed the issue
architectural attachment kind and candidate change point
accepted baseline
proposed controlled alternative
research question / hypothesis
predicted invariants
predicted divergences
claim/dependency impact cone
prerequisites
explicit non-goals
known logical / Choice / quotient risks
independence boundary
suggested implementation decomposition
required exact-head verification gates
success criteria
failure criteria worth preserving
acceptance boundary
handoff instructions for a future agent
```

If the discovery refines an existing candidate, update or add a dossier for that candidate rather than inventing a new experiment identifier merely for naming convenience.

## Handoff quality standard

A future agent should be able to answer these questions from repository evidence alone:

1. What exact limitation or opportunity was observed?
2. Which declaration/file demonstrates it?
3. What is the single controlled factor to change?
4. What must remain byte-identical or semantically unchanged?
5. Which existing results may be reused, and which must not be imported because doing so would destroy independence?
6. What theorem/certificate would constitute mathematical success?
7. What exact-head workflow/audit evidence is required before claiming PASS?
8. What result must **not** be inferred even if the experiment succeeds?

## Lifecycle

```text
DISCOVERED
  -> CANDIDATE DOSSIER RECORDED
  -> optional prioritization
  -> explicit owner authorization
  -> separately frozen PDSA Plan
  -> implementation / exact-head verification
  -> Study / Act
  -> CLOSED PASS, CLOSED INFORMATIVE FAIL, or DEFERRED
```

No candidate dossier is itself a Frozen Plan. A later Plan must cite the dossier but independently freeze controls, hypotheses, execution order, and acceptance boundaries at the then-current authorized reference.
