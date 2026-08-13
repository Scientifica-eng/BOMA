# CLOSURE-CORE-013 — Global Reference as Formalization Boundary

## Status
Provisional experimental result.

## Question
Can global referenceability be postponed entirely until the formalization step, while keeping all pre-formal construction local?

## Experimental setup
The pre-formal layer retains only local referenceability:

- each finite construction has a recoverable local reference;
- extension acts on the construction currently at hand;
- composition remains operational;
- construction depth remains recoverable from the local history.

No global container of all finite stages is assumed.

## Result
Yes, the local construction protocol can operate without a pre-existing global reference structure. The global identification of all finite constructions can therefore be treated as part of the later formalization choice rather than as an input to the pre-formal construction.

The boundary can be represented as:

```text
local construction
    ↓
local referenceability
    ↓
finite structural behavior
    ↓
construction depth / composition

========== FORMALIZATION CHOICE ==========

    ↓
global reference domain
    ↓
formal identity/operations
    ↓
chosen mathematical framework
```

## Important qualification
This does **not** show that global reference is derivable from the pre-formal layer. It shows only that it is not required for the local finite behavior already constructed.

Thus the project should not describe global referenceability as a discovered pre-mathematical fact. It is better treated as a candidate component of the formalization commitment.

## Boundary result
The current evidence supports the following separation:

1. Local referenceability is operationally available before formalization.
2. Global referenceability is not required for finite construction and finite operations.
3. Global referenceability becomes necessary only when the project wants one formal domain on which the finite constructions are jointly represented.

## Consequence for the project
The remaining foundational question is now narrower:

> What is the weakest formal commitment that turns the locally referenceable finite horizon into one reusable mathematical domain?

Possible frameworks may be compared only after this behavioral requirement is isolated; no particular theory is assumed at this stage.
