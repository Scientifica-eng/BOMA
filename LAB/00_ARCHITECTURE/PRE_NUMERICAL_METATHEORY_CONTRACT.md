# PRE-NUMERICAL METATHEORY CONTRACT

**Document ID:** `BOMA-META-TCT-001`  
**Version:** `0.1`  
**Date:** 2026-08-18  
**Status:** **ACTIVE — DECLARED RESEARCH/METATHEORETIC CONTRACT**  
**PDSA origin:** `PDSA-TCT-002`  
**Scope:** TCT construction before formal natural-number realization.

---

## 1. Purpose

This contract defines the meta-level resources that may be used to describe, reason about, audit, and verify the current pre-numerical TCT construction **without silently exporting those resources into the object-level mathematical construction**.

The central distinction is:

```text
META LEVEL
language, finite documents, syntax, proof/reasoning discipline,
bookkeeping, audit machinery, and construction descriptions

OBJECT LEVEL
what TCT itself has explicitly declared, constructed, or derived
```

The project claim is therefore:

> **pre-numerical object-level construction relative to an explicitly declared metatheory**

and not:

> construction outside all logic, language, mathematics, or metatheory.

---

## 2. Governing firewall

### META/OBJECT FIREWALL

A resource may be used at the meta level to describe or verify a construction without thereby becoming an object-level primitive or theorem.

No object-level conclusion may depend on a meta-level structure **as mathematical content** unless that structure has been explicitly imported through a declared architectural boundary.

Examples:

```text
ALLOWED META USE
A document may number its sections with ordinary numerals.

NOT ALLOWED OBJECT INFERENCE
Therefore a TCT configuration has a natural-number-valued depth.
```

```text
ALLOWED META USE
A finite derivation tree may be displayed and inspected.

NOT ALLOWED OBJECT INFERENCE
Therefore the constructed domain already contains cardinalities or ℕ.
```

```text
ALLOWED META USE
Git commit order, line numbers, file counts, and experiment IDs may use numbers.

NOT ALLOWED OBJECT INFERENCE
Those bookkeeping numbers are properties of the constructed mathematical objects.
```

This firewall is permanent unless an explicit later formalization boundary imports a specified meta-level structure into the mathematical realization.

---

## 3. Three identity notions

The project shall distinguish at least three identity/equivalence notions.

### 3.1 Documentary identity

Identity of repository artifacts, commits, paths, IDs, and records.

Examples:

```text
TCT-BLOCK-001
commit SHA
file path
PDSA cycle ID
```

This is provenance infrastructure.

### 3.2 Meta-level syntactic identity — `≡`

`A ≡ B` means that `A` and `B` are the same syntactic presentation under the explicitly declared representation convention or definitional expansion.

Syntactic identity is a meta-level relation used to inspect expressions and derivations.

It must not be confused with object-level structural equivalence.

### 3.3 Object-level structural equivalence — `≈`

`A ≈ B` is a mathematical/constructional relation whose meaning must be explicitly specified by TCT.

It is **not** defined by this metatheory contract.

Its definition is the subject of `PDSA-TCT-003`.

No inference between `≡` and `≈` is permitted except through an explicit theorem, declared rule, or constructional definition.

---

## 4. Permitted meta-level resources

The following resources are permitted for research, description, proof, and audit subject to the firewall.

### M1 — Finite written expressions and documents

The project may use concretely presented finite strings, diagrams, terms, files, derivations, tables, and graphs.

Their finiteness belongs to the meta-level presentation environment.

### M2 — Finite derivations

A construction claim may be accompanied by a concretely finite derivation/formation tree showing how the presented expression was obtained.

This does **not** introduce an object-level cardinality or numerical depth.

### M3 — Grammar and formation rules

The metatheory may specify grammars such as:

```text
NF ::= ε
    | U
    | (NF ⊙ U)
```

A grammar is a meta-level rule for recognizing/generating admissible presentations. Whether the grammar corresponds to a completed mathematical domain is a separate question.

### M4 — Structural recursion on presented syntax

The metatheory may define an inspection or transformation by cases on the declared grammar of an explicitly presented term.

Example:

```text
inspect ε
inspect U
inspect (A ⊙ U) using inspection of the displayed predecessor A
```

This is a meta-level procedure on syntax. It does not by itself establish an object-level induction principle or a completed natural-number recursion scheme.

### M5 — Structural induction as a meta-proof method

Structural induction over a declared inductive grammar is permitted as a **meta-level proof technique**, provided the theorem being proved is explicitly classified as a theorem about generated presentations/derivations.

It must not be silently reclassified as object-level induction over `ℕ`.

If a later theorem requires induction as mathematical content of the constructed domain, that induction principle must be separately constructed or declared at the formalization boundary.

### M6 — Ordinary logical reasoning

The project may use ordinary mathematical reasoning at the meta level, including:

- implication;
- conjunction/disjunction;
- negation;
- quantified statements over explicitly specified meta-level domains;
- case analysis;
- substitution using meta-level syntactic identity;
- proof by explicit derivation.

The default aspiration for pre-numerical TCT arguments is to remain compatible with intuitionistic/constructive reasoning where practical.

A materially classical step — for example an essential use of excluded middle, double-negation elimination, or nonconstructive choice — must be **declared in the relevant PDSA/verification record** rather than treated as invisible background.

This clause is a traceability rule, not a claim that BOMA has already selected a final foundational logic.

### M7 — Meta-level arithmetic for bookkeeping only

Ordinary natural numbers may be used outside the constructed object layer for:

- dates and times;
- file/line numbering;
- commit references;
- experiment/cycle IDs;
- finite document counts;
- implementation indexing;
- proof-assistant infrastructure;
- external complexity measurements.

Such use is **linguistic/infrastructural** and cannot establish numerical properties of TCT objects.

### M8 — Meta-level sets/types/collections for tooling and exposition

External mathematics, programming languages, proof assistants, or repository tooling may represent syntax and records using sets, types, lists, arrays, trees, or other host structures.

These are backend/meta-level representations unless an explicit BOMA unit promotes some of their structure into the mathematical construction.

The rule is:

> **backend representation ≠ BOMA object-level definition**

### M9 — External standard mathematics for comparison

Standard mathematical structures may be used to:

- formulate comparison targets;
- search for models/countermodels;
- test candidate characterizations;
- establish later isomorphism or realization results.

They may not serve as hidden recipes for the pre-numerical object-level construction.

---

## 5. Meaning of “finite” in the pre-numerical stage

This term caused historical drift and therefore receives an explicit contract.

### Meta-level permitted meaning

A presented construction or derivation is called **meta-finite** when it is given by a concretely terminating written/derivation presentation assembled through finitely completed formation acts in the external research environment.

Operational evidence can be:

```text
an explicit finite syntax tree
an explicit finite derivation record
an explicit finite written term
```

No object-level natural number measuring the presentation is required.

### Prohibited inference

From meta-finiteness alone, the project may not infer:

```text
an object-level cardinality
an object-level number of blocks
an object-level natural-number-valued length/depth
a completed object containing all finite configurations
an induction principle internal to the constructed domain
```

These require separate construction or formalization.

### Terminology rule

When ambiguity matters, future TCT records should prefer:

```text
meta-finite presentation / derivation
```

for the external property, and reserve later object-level notions of finite cardinality or numerical depth for stages where those notions have been constructed.

---

## 6. Meaning of recursion in the pre-numerical stage

The historical TCT record uses recursive formation language. Under this contract:

```text
recursive grammar / structural recursion
```

means a meta-level method of specifying or inspecting generated presentations.

It does **not** imply that:

- `ℕ` already exists inside TCT;
- a natural-number recursion theorem has been constructed;
- all recursively generated objects already form a completed global carrier.

The existence and status of any completed domain of all admissible configurations remains a separate formalization question.

---

## 7. Meaning of “all generated configurations”

This phrase must be handled carefully.

Before an explicit global-domain construction, the safe reading is **schematic/generative**:

> any configuration supplied with an admissible finite formation derivation according to the declared grammar.

It must not automatically be read as:

> a completed set/type containing every possible configuration as simultaneously available elements.

The transition from generative availability to a global carrier is an explicit formalization boundary and inherits the learning of the Closure Core and Phase 9 records.

---

## 8. Ellipsis rule

Expressions such as:

```text
ε
U
U ⊙ U
(U ⊙ U) ⊙ U
...
```

use `...` only as a **meta-level continuation marker**.

The ellipsis does not assert:

- an actually completed infinite sequence;
- a set of all stages;
- a natural-number index;
- a limit object;
- global closure.

Any stronger claim requires an explicit unit or formalization step.

---

## 9. Construction-status vocabulary under this contract

### DECLARED CHOICE

A commitment intentionally introduced rather than derived from previous object-level units.

### CONSTRUCTED

An object-level structure/result produced by the declared construction rules from admitted inputs, with an auditable finite construction/derivation record appropriate to the layer.

### DERIVED

A claim established from previous declared/constructed content using the permitted metatheory, without adding a new object-level premise.

### FORMALIZATION-DEPENDENT

A claim whose precise mathematical existence, identity, totality, induction, quotient, completion, or universal property depends on a later explicit formal regime.

### PENDING

Insufficiently established for the claimed role.

### REJECTED

Tested and not admitted on the active path, while its historical record remains preserved when scientifically relevant.

---

## 10. Prohibited hidden imports before explicit construction

The following may not enter as silent object-level premises in pre-numerical TCT:

```text
natural numbers or numerical indices
cardinality
numerical length/depth
arithmetic operations
numerical order
a completed infinite totality
set membership ontology
quotient existence
pre-existing equivalence classes
object-level induction over a numerical carrier
object-level recursion over ℕ
metric measurement
coordinate arithmetic
global choice principles
```

This list is not exhaustive. PDSA Study must add newly discovered risks rather than treating this list as a loophole-complete specification.

---

## 11. Imported meta-resource declaration rule

If an argument materially uses a meta-level resource that a reasonable reviewer might confuse with object-level content, the relevant record must include a declaration of the form:

```text
META-RESOURCE USED:
<resource>

ROLE:
<description / proof technique / tooling / countermodel search>

OBJECT-LEVEL EXPORT:
NONE
```

or, if export is intended later:

```text
OBJECT-LEVEL EXPORT:
PENDING EXPLICIT FORMALIZATION BOUNDARY <UnitID>
```

---

## 12. Countermodel/model rule

External models and countermodels are permitted research instruments.

A countermodel can show that a proposed implication is not derivable from the current specification.

A model cannot silently become the definition of the TCT object unless that identification is explicitly adopted.

Thus:

```text
model/countermodel evidence
        ≠
construction identity
```

---

## 13. Proof-assistant rule

Lean, Coq, Agda, Isabelle, or another backend may encode TCT using host-language natural numbers, inductive types, lists, or sets as implementation infrastructure.

Such encodings must explicitly distinguish:

```text
HOST / BACKEND INFRASTRUCTURE
from
BOMA MATHEMATICAL CONTENT
```

A successful kernel/type check proves correctness of the encoding relative to the declared backend statement. It does not by itself prove that the encoding has preserved every intended BOMA architectural distinction.

---

## 14. Current application to TCT-001 and TCT-002

Under this contract:

### TCT-001

```text
ε and U                 object-level DECLARED CHOICES
⊙                       object-level constructional operation
written symbols          meta-level representation
geometric diagram        representation unless promoted
associativity target     PENDING object-level theorem/constraint involving ≈
```

### TCT-002

```text
NF grammar               permitted meta-level formation specification
finite written NF term   meta-finite presentation
structural recursion     permitted meta-level inspection procedure
terminal visible U       syntactic/constructed property of chosen normal form
canonicality modulo ≈    NOT supplied by the metatheory contract
```

Therefore this contract does not resolve `TCT-J-001`; it only clarifies the environment in which `≈` can now be defined and tested.

---

## 15. Anti-circularity tests

Before accepting a pre-numerical result, ask:

1. Is a numerical word being used merely for external description, or as mathematical content?
2. Does the proof use counting to establish the object that is later supposed to ground counting?
3. Does a recursive grammar get mistaken for a completed numerical domain?
4. Does meta-level syntactic identity get confused with object-level structural equivalence?
5. Does a backend data type silently become the BOMA definition?
6. Does `finite` mean a concrete finite derivation, or an object-level finite cardinality?
7. Does the argument assume a completed totality of all generated objects?
8. Is a classical logical principle materially used without declaration?
9. Is an external comparison structure being used as a hidden construction recipe?

A positive risk finding must be recorded in Study before downstream promotion.

---

## 16. Sensitivity

Changing this contract requires re-evaluating every active pre-numerical argument that used the affected meta-resource.

At minimum, changes may reopen:

```text
TCT-BLOCK-001
TCT-BLOCK-002
TCT-J-001
TCT-BR-009
all future TCT-BLOCK-003+ results
```

A strengthened contract may invalidate old derivations. A weakened contract may make previously invisible assumptions explicit and require epistemic reclassification.

---

## 17. Open questions carried to PDSA-TCT-003+

1. What exact definition of object-level structural equivalence `≈` should be adopted?
2. Should `≈` be generated by explicit rewrite/isomorphism rules, defined semantically, or specified axiomatically by preserved structure?
3. Which congruence properties with `⊙` are derived versus declared?
4. Should terminal-interface preservation remain an independent constraint or become part of the definition of `≈`?
5. Can TCT's current use of `ε` as empty construction be made independent of stronger monoid-style identity assumptions?
6. Which associativity claim is needed: syntactic normalization only, structural equivalence of parenthesizations, or a stronger algebraic law?
7. When formalization begins, which meta-level resources should be mirrored explicitly in the proof assistant and which should remain host infrastructure?

---

## 18. Contract conclusion

The project may use rich external research infrastructure while maintaining a genuinely pre-numerical **object-level** construction only if the firewall is respected:

```text
META-LEVEL RESOURCE
        ↓ description / proof / audit
OBJECT-LEVEL CLAIM
        ↓
NO EXPORT WITHOUT EXPLICIT CONSTRUCTION OR FORMALIZATION
```

This contract therefore authorizes the next research cycle to define and compare candidate structural-equivalence relations `≈` without pretending that syntax, finite documents, recursion, proof tooling, or external arithmetic are themselves products of the TCT construction.
