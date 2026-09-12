module Wiki.Reflect.SystemsBiologyMacroSolver

import Language.Reflection
import public Wiki.StoichiometricMultiset
import public Wiki.LinearATPEnzyme

%default total

public export
auditStoichiometricMultisetProofExport : Bool
auditStoichiometricMultisetProofExport = auditStoichiometricMultisetProof

public export
%macro
auditStoichiometricMultisetMacro : Elab (Wiki.Reflect.SystemsBiologyMacroSolver.auditStoichiometricMultisetProofExport = True)
auditStoichiometricMultisetMacro = pure Refl

public export
auditLinearATPEnzymeProofExport : Bool
auditLinearATPEnzymeProofExport = auditLinearATPEnzymeProof

public export
%macro
auditLinearATPEnzymeMacro : Elab (Wiki.Reflect.SystemsBiologyMacroSolver.auditLinearATPEnzymeProofExport = True)
auditLinearATPEnzymeMacro = pure Refl
