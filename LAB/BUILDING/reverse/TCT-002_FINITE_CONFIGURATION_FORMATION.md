# TCT-002 — Finite Configuration Formation and Canonical Last-Step Recovery

## Architectural Identity

- **Unit ID:** `TCT-002`
- **Type:** `Block`
- **Layer:** `L1 — explicit constructed structure`
- **Parent:** `TCT-001`
- **Graph position:** first vertical construction block above the kernel
- **Consumes:** `ε`, `U`, `⊙`
- **Produces:** finite normal-form configurations and terminal-recovery procedure
- **Junction:** `TCT-J-001` for canonicality verification
- **Sensitivity:** medium-high; representation changes may propagate to decomposition and later stage construction

## Status

Transparent Construction Track — active.

## Objective

Construct the family of finite configurations generated from the TCT-001 kernel without using natural-number indexing, and determine exactly what structural properties can be verified before introducing any numerical stage notion.

## Inputs

From TCT-001:

```text
ε = empty configuration
U = one elementary block
⊙ = compatible concatenation
```

These are construction labels, not numerical values.

## Formation rule

Define the generated finite configurations recursively by construction depth, but **without naming that depth numerically**.

The formation clauses are:

```text
F-Base:
    ε is a finite configuration.

F-Atom:
    U is a finite configuration.

F-Step:
    if A is a finite configuration,
    then A ⊙ U is a finite configuration.
```

At this stage, the phrase “recursively” describes the construction procedure; it does not invoke a previously existing natural-number recursion principle.

## Initial finite configurations

The first configurations can therefore be displayed as construction outputs:

```text
ε
U
U ⊙ U
(U ⊙ U) ⊙ U
((U ⊙ U) ⊙ U) ⊙ U
...
```

The ellipsis is a procedural continuation marker, not an assertion that a completed infinite set has already been formed.

## Canonical normal form candidate

To make the finite family auditable, introduce a normalization convention:

> Every generated configuration is represented by a finite left-associated chain of copies of `U`, with `ε` representing the absence of any copy.

Thus the normal-form grammar is:

```text
NF ::= ε
    | U
    | (NF ⊙ U)
```

The grammar is a finite-construction specification, not yet a definition over a natural-number-indexed domain.

## Last-step recovery

For every non-empty generated configuration in normal form, the final construction step is visibly the final `⊙ U`.

Operationally:

```text
A ⊙ U  ↦  A   + recovered terminal U
```

The symbol `+` is not used here as arithmetic; the displayed arrow means structural decomposition.

The recovery target is therefore:

```text
non-empty configuration
    ↓
unique predecessor configuration + terminal block U
```

## What has actually been established

At the constructional level we now have:

1. a formation procedure for finite configurations;
2. an explicit normal-form convention;
3. a candidate last-step decomposition;
4. a distinction between construction procedure and numerical indexing.

## Uniqueness issue

The last-step decomposition is only canonical if structural equivalence does not identify two different terminal placements in a way that destroys recovery.

Accordingly, the following remains a verification target:

> If two normalized finite configurations are structurally equivalent, their recovered predecessor-plus-terminal decomposition must correspond under the same equivalence.

This is the local form of canonical decomposition needed for the next stage.

## Associativity and normal form

TCT-001 treated associativity of arbitrary concatenation as a verification target. TCT-002 does not assume a global associativity theorem.

Instead, the chosen normal form fixes a parenthesization for generated chains. Later, a structural-equivalence theorem may show that alternative parenthesizations represent the same configuration.

This separation prevents an unproved associativity law from being used silently to define the finite family.

## No numerical indexing

The following are deliberately absent from the formation rules:

```text
0
1
2
3
n
|A|
cardinality
length(A) as a number
```

The configurations are identified by their constructional form and structural equivalence, not by a numerical label.

## Dependency audit

### Constructed

- finite configuration formation;
- terminal `U` in the normal-form grammar;
- predecessor-plus-terminal decomposition procedure.

### Declared choices

- choice of elementary block `U`;
- choice of empty configuration `ε`;
- choice of normal-form representation.

### Not yet established

- uniqueness of decomposition modulo structural equivalence;
- a numerical depth function;
- a successor operation on a formal domain;
- a completed family containing all generated configurations as a formal set/type.

## Graph Relations

```text
TCT-001 --COMPOSES/DEPENDS_ON--> TCT-002
TCT-002 --MEETS_AT-------------> TCT-J-001
```

The `TCT-J-001` junction is intentionally outside the block so that decomposition ambiguity cannot be hidden inside the formation block.

## Sensitivity / Change Impact

```text
Change formation grammar
  → retest normal forms
  → retest terminal recovery
  → retest decomposition
  → retest future depth/successor construction

Change only normal-form convention
  → representation artifacts may change
  → underlying construction must be rechecked for invariance

Change structural equivalence
  → high-impact retest of decomposition, depth, successor and formal-domain layers
```

## Acceptance criterion

TCT-002 is accepted when a reviewer can verify, without invoking natural-number notation, that:

1. every produced finite configuration follows the formation rules;
2. every non-empty normal-form configuration has a recoverable final `U`;
3. the recovery procedure is invariant under the declared structural equivalence;
4. no numerical indexing is used in the formation or recovery argument.

## Current decision

**TCT-002: PASS for finite configuration formation and explicit normal-form generation.**

**Canonical decomposition: pending verification.**

## Next step

**TCT-003 — Canonical decomposition and predecessor block**, testing uniqueness of the recovered predecessor and terminal `U` under structural equivalence, still without numerical indexing.

## Plan position

Transparent Construction Track — TCT-002.
