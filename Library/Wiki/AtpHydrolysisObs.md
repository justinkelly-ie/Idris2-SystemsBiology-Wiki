# ATP Hydrolysis Energy Conservation Literate Specification

$\text{ATP} \to \text{ADP} + P_i$ hydrolysis conserves total metabolic mass-energy co-chains across `Substrate` graph edges:

$$\text{substrateLag}(\text{ATP}) == \text{substrateLag}(\text{ADP}) + \text{substrateLag}(P_i)$$

### What We Learned from Implementation

1. **Metabolic Energy ↔ Graph Edge Conservation**: Biochemical energy release during ATP hydrolysis is an exact co-chain graph edge conservation law in `SubstrateBackend`.
2. **Biological Order via Lag Pumping**: Living cells maintain internal order by pumping multiset lag across metabolic substrate network edges.

```idris
module Wiki.AtpHydrolysisObs

import Substrate.Core
import Geometry.Interface
import Geometry.TrigonometryBackend
import Math.Fraction
import QuickCheck

%default total

||| Property: ATP Hydrolysis Bond Conservation Law
export
prop_atpHydrolysisConservesEnergy : Substrate -> Substrate -> Bool
prop_atpHydrolysisConservesEnergy adp pi =
  let atp = mergeSubstrate adp pi
  in substrateLag atp == (substrateLag adp + substrateLag pi)
```
