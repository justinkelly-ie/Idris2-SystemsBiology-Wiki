module Wiki.Reflect.SystemsBiologyAuditor

import Language.Reflection
import public Wiki.Observations.MetabolicPathway
import public Wiki.Observations.GeneRegulatoryNetwork
import public Wiki.Observations.NeuralActionPotential
import public Wiki.Observations.SignalTransductionCascade
import public Wiki.PhotosyntheticCoherence

%default total

public export
auditMetabolicPathwayProofExport : Bool
auditMetabolicPathwayProofExport = runMetabolicPathwaySuite

public export
%macro
auditMetabolicPathwayMacro : Elab (Wiki.Reflect.SystemsBiologyAuditor.auditMetabolicPathwayProofExport = True)
auditMetabolicPathwayMacro = pure Refl

public export
auditPhotosyntheticCoherenceProofExport : Bool
auditPhotosyntheticCoherenceProofExport = auditPhotosyntheticCoherenceProof

public export
%macro
auditPhotosyntheticCoherenceMacro : Elab (Wiki.Reflect.SystemsBiologyAuditor.auditPhotosyntheticCoherenceProofExport = True)
auditPhotosyntheticCoherenceMacro = pure Refl
