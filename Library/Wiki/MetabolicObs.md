# Systems Biology & Metabolic Networks Literate Specification

Enzymatic pathways and protein backbone angles are modeled natively:
  1. Reaction Stoichiometry: Substrate graph edge conservation
  2. Protein Dihedral Angles: `SpreadCoord` rational spreads ($s = \sin^2 \theta$)
  3. Conformational Space: 8D Octonion coordinates (`OctonionCoord`)

```idris
module Wiki.MetabolicObs

import Substrate.Core
import Geometry.Interface
import Geometry.TrigonometryBackend
import Geometry.OctonionsBackend
import Math.Fraction
import Data.Vect
import QuickCheck

%default total

||| Property 1: Enzymatic Stoichiometry Conservation Law
||| Substrate enzyme reaction pathways strictly conserve total molecular lag.
export
prop_enzymaticLagIsConserved : Substrate -> Substrate -> Bool
prop_enzymaticLagIsConserved sub1 sub2 =
  let merged = mergeSubstrate sub1 sub2
  in substrateLag merged == (substrateLag sub1 + substrateLag sub2)
```
