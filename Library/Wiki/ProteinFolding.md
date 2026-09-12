# Protein Backbone Folding Geometry Literate Specification

Protein backbone conformations (Ramachandran $\phi, \psi$ angles) are modeled using:
  1. Rational Spread Angles ($s = \sin^2 \theta$) $\leftrightarrow$ `SpreadCoord`
  2. 8D Conformational Space $\leftrightarrow$ `OctonionCoord`
  3. Energy Minimization $\leftrightarrow$ Quadrance minimization

```idris
module Wiki.ProteinFolding

import Geometry.Interface
import Geometry.TrigonometryBackend
import Geometry.OctonionsBackend
import Math.Fraction
import Data.Vect
import QuickCheck

%default total

public export
record AminoAcidConformation where
  constructor MkResidue
  phiSpread : SpreadCoord
  psiSpread : SpreadCoord
  octonion  : OctonionCoord

public export
Eq AminoAcidConformation where
  (MkResidue f1 p1 o1) == (MkResidue f2 p2 o2) =
    f1 == f2 && p1 == p2 && o1 == o2

public export
Show AminoAcidConformation where
  show (MkResidue f p o) =
    "[Residue | phi: " ++ show f ++ " | psi: " ++ show p ++ " | octonion: " ++ show o ++ "]"

||| Computes conformational energy (quadrance distance to native folded state)
public export
conformationalEnergy : AminoAcidConformation -> AminoAcidConformation -> Nat
conformationalEnergy (MkResidue f1 p1 o1) (MkResidue f2 p2 o2) =
  quadrance f1 f2 + quadrance p1 p2 + quadrance o1 o2

||| Property: Native Protein Fold Minimizes Conformational Energy
export
prop_nativeFoldIsZeroEnergy : AminoAcidConformation -> Bool
prop_nativeFoldIsZeroEnergy fold =
  conformationalEnergy fold fold == 0
```
