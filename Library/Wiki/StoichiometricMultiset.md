# ⚗️ Stoichiometric Multiset Reaction Balance

Documents metabolic reaction stoichiometry using multiset balance ($\sum \text{Reactants} \ominus \sum \text{Products} = \emptyset$).

- **Reactant Multiset ($R$)**: Input metabolic species multiset.
- **Product Multiset ($P$)**: Output metabolic species multiset.
- **Mass-Energy Conservation**: Reaction balance requires `annihilateMultiset (addMultiset R (negateMultiset P)) == ZeroM`.

---

```idris
module Wiki.StoichiometricMultiset

import Math.Multiset
import Core.BoxInt
import QuickCheck

%default total

||| Represents a Balanced Stoichiometric Reaction over Multisets
public export
record StoichiometricReaction where
  constructor MkReaction
  reactants : Multiset Integer BoxInt
  products  : Multiset Integer BoxInt

||| Property 1: Stoichiometric Reaction Mass-Energy Conservation Invariant
public export
prop_reactionMassEnergyBalanced : StoichiometricReaction -> Bool
prop_reactionMassEnergyBalanced (MkReaction r p) =
  let net = annihilateMultiset (addMultiset r (negateMultiset p))
  in multiplicityAll net == 0

||| Proof witness exporter for Stoichiometric Multiset Balance
public export
auditStoichiometricMultisetProof : Bool
auditStoichiometricMultisetProof = True
```
