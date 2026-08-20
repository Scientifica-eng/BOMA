import Lean

open Lean
open Lean.Elab
open Lean.Elab.Command

namespace BOMA.Audit

/-- Collect every constant occurring in a declaration's type and, where one
exists, its implementation/proof body. `allowOpaque := true` is essential:
theorem and opaque bodies must not disappear from the dependency audit. -/
def usedConstantsIncludingOpaque (ci : ConstantInfo) : List Name :=
  let fromType := ci.type.getUsedConstants.toList
  let fromValue :=
    match ci.value? true with
    | some value => value.getUsedConstants.toList
    | none => []
  fromType ++ fromValue

/-- Return the imported module that owns a declaration. The dependency audit
uses module ownership rather than name prefixes so generated/private
declarations produced while compiling the accepted assembly remain inside the
closure instead of being misclassified as Trusted Base. -/
def moduleOf? (env : Environment) (declName : Name) : Option Name :=
  match env.getModuleIdxFor? declName with
  | some idx => env.header.moduleNames[idx]?
  | none => none

/-- Stable descriptive class used only for audit output. -/
def constantKind : ConstantInfo → String
  | .axiomInfo _ => "axiom"
  | .defnInfo _ => "definition"
  | .thmInfo _ => "theorem"
  | .opaqueInfo _ => "opaque"
  | .quotInfo _ => "quotient-primitive"
  | .inductInfo _ => "inductive"
  | .ctorInfo _ => "constructor"
  | .recInfo _ => "recursor"

structure ClosureResult where
  internal : Array Name := #[]
  external : Array (Name × Option Name) := #[]
  unresolved : Array Name := #[]

/-- Compute the transitive declaration closure while treating every declaration
outside the module containing the selected accepted certificate as a boundary
leaf. This intentionally prevents the audit from recursively exploding through
Lean's trusted implementation/library environment.

Internal declarations include generated/private declarations because module
ownership, not a `BOMA.*` name-prefix convention, decides whether recursion
continues. -/
partial def walkClosure
    (env : Environment)
    (acceptedModule : Name)
    (todo : List Name)
    (seen : NameSet := {})
    (result : ClosureResult := {}) : ClosureResult :=
  match todo with
  | [] => result
  | declName :: rest =>
      if seen.contains declName then
        walkClosure env acceptedModule rest seen result
      else
        let seen := seen.insert declName
        match env.find? declName with
        | none =>
            walkClosure env acceptedModule rest seen
              { result with unresolved := result.unresolved.push declName }
        | some ci =>
            let owner := moduleOf? env declName
            if owner == some acceptedModule then
              let next := usedConstantsIncludingOpaque ci ++ rest
              walkClosure env acceptedModule next seen
                { result with internal := result.internal.push declName }
            else
              walkClosure env acceptedModule rest seen
                { result with external := result.external.push (declName, owner) }

private def printLine (fields : List String) : IO Unit :=
  IO.println (String.intercalate "\t" fields)

private def optionNameString : Option Name → String
  | some n => n.toString
  | none => "<unknown-module>"

syntax (name := bomaDependencyClosure)
  "#boma_dependency_closure " ident : command

/--
`#boma_dependency_closure Fully.Qualified.theorem`

Prints a machine-readable tab-separated closure for the selected declaration.
The selected declaration must live in an imported accepted-assembly module.
The output protocol is intentionally simple so a Python orchestration layer can
map declaration ranges back to source-manifest files and classify external
boundary leaves against `TRUSTED_BASE.md`.
-/
@[command_elab bomaDependencyClosure]
def elabBomaDependencyClosure : CommandElab
  | `(#boma_dependency_closure $target:ident) => do
      let env ← getEnv
      let targetName := target.getId
      let some _targetInfo := env.find? targetName
        | throwError "unknown dependency-audit target `{targetName}`"
      let some acceptedModule := moduleOf? env targetName
        | throwError "target `{targetName}` is not owned by an imported module"

      let result := walkClosure env acceptedModule [targetName]

      liftIO <| printLine ["BOMA_AUDIT", "TARGET", targetName.toString]
      liftIO <| printLine ["BOMA_AUDIT", "MODULE", acceptedModule.toString]

      for declName in result.internal do
        let kind :=
          match env.find? declName with
          | some ci => constantKind ci
          | none => "unresolved"
        let ranges? ← liftCoreM <| findDeclarationRanges? declName
        let (startLine, endLine) :=
          match ranges? with
          | some ranges =>
              (toString ranges.range.pos.line, toString ranges.range.endPos.line)
          | none => ("", "")
        liftIO <| printLine
          ["BOMA_INTERNAL", declName.toString, kind, startLine, endLine]

      for (declName, owner) in result.external do
        let kind :=
          match env.find? declName with
          | some ci => constantKind ci
          | none => "unresolved"
        liftIO <| printLine
          ["BOMA_EXTERNAL", declName.toString, kind, optionNameString owner]

      for declName in result.unresolved do
        liftIO <| printLine ["BOMA_UNRESOLVED", declName.toString]

      liftIO <| printLine
        [ "BOMA_AUDIT", "COUNTS",
          toString result.internal.size,
          toString result.external.size,
          toString result.unresolved.size ]
  | _ => throwUnsupportedSyntax

end BOMA.Audit
