# RESEARCH_PROGRAM_AUTHORIZATION_TEMPLATE_001

**Status:** `TEMPLATE / NOT EXECUTION AUTHORITY`  
**Governing document:** `AUTONOMOUS_RESEARCH_PROGRAM_GOVERNANCE_001.md`

> Copy this template to a new immutable program authorization record. It becomes
> execution authority only after explicit owner authorization is recorded.

## 1. Program identity

```text
program_id:
status: DRAFT | OWNER_AUTHORIZED | SUSPENDED | COMPLETE
owner_authorization_record:
authorization_date:
baseline_main_sha:
```

## 2. Research objective

State the bounded research objective that the experiment sequence is intended
to investigate.

## 3. Program invariants

Declare what must remain unchanged across the program unless owner authority is
reopened.

```text
accepted spine:
selected routes:
accepted exports:
protected Frozen Plans / historical evidence:
logical/foundational boundaries:
```

## 4. Ordered experiment queue

| Order | Experiment ID | Architectural origin | Single intended change | Prerequisites | Expected affected cone | Transition dependency |
| ---: | --- | --- | --- | --- | --- | --- |
| 1 |  |  |  |  |  |  |

Queue order is owner-authorized. An autonomous agent may not silently insert,
delete, or reorder experiments.

## 5. Program non-goals

List questions and architectural changes that this program does not authorize.

## 6. Experiment preparation rule

For every queued experiment:

```text
re-read synchronized current main
verify exact baseline
confirm queue validity and prerequisites
create independent immutable Frozen Plan
create separate branch
begin Do only after the Plan is frozen
```

## 7. Transition policy

Default transition:

```text
CLOSED PASS or CLOSED INFORMATIVE FAIL
+ exact evidence complete
+ no unresolved deviation
+ next prerequisites valid
+ no sequence-critical discovery
= AUTO_CONTINUE
```

Otherwise set `OWNER_REQUIRED`.

## 8. Discovery policy

```text
non-sequence-critical discovery
  -> candidate dossier / NOT AUTHORIZED
  -> continue

sequence-critical discovery
  -> candidate/evidence record
  -> OWNER_REQUIRED
  -> stop before changing queue
```

## 9. Recovery authority

Declare the technical/formalization repair envelope that may be handled without
owner intervention. It must not permit a change to the experimental factor,
Frozen Plan, or research-program ordering.

## 10. Routine merge authority

```text
routine_merge_authorized: false | true
```

If true, list exact gates and path/scope restrictions. This does not authorize
SELECTS changes, acceptance promotion, acceptance-contract changes, canonical
producer replacement, or out-of-scope foundational/logical changes unless those
are separately explicit in the program authorization.

## 11. Owner stop conditions

At minimum inherit all stop conditions from
`AUTONOMOUS_RESEARCH_PROGRAM_GOVERNANCE_001.md`. Add program-specific stop
conditions here.

## 12. Completion condition

Define when the program reaches `PROGRAM_COMPLETE`.

## 13. Authorization statement

```text
OWNER DECISION:
[ ] NOT AUTHORIZED
[ ] OWNER_AUTHORIZED AS WRITTEN

Any substantive queue/order/scope modification after authorization requires a
new explicit owner decision.
```
