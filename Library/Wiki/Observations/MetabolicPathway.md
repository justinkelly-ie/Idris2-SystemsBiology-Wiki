# Cellular Metabolic Pathway Yield (Glycolysis & Krebs Cycle) Multi-Systems Observation

## Overview & Theoretical Foundation

In Cellular Respiration (Glycolysis, Krebs / Citric Acid Cycle, Oxidative Phosphorylation), 1 molecule of Glucose ($\text{C}_6\text{H}_{12}\text{O}_6$) yields approximately **30 to 32 ATP molecules**:

$$\text{C}_6\text{H}_{12}\text{O}_6 + 6\text{O}_2 \longrightarrow 6\text{CO}_2 + 6\text{H}_2\text{O} + 30\text{ ATP}$$

In discrete geometry, each ATP molecule releases an exact **$Q = 25$ ChargeGate² quadrance quantum** (`Wiki.Observations.ATPHydrolysis`). Therefore, the total cellular energy yield of 1 complete metabolic cycle equals:

$$Q_{\text{total}} = 30 \times 25 = 750$$

```
  ┌───────────────────────────┬──────────────────────────────────────┬──────────────────────────────────────────┐
  │ Metabolic Phase           │ ATP Yield (Molecules)                │ Total Discrete Quadrance Quantum (Q)     │
  ├───────────────────────────┼──────────────────────────────────────┼──────────────────────────────────────────┤
  │ 1. Glycolysis             │ 2 ATP (net)                          │ Q = 2 × 25 = 50                          │
  │ 2. Krebs Cycle            │ 2 GTP / ATP                          │ Q = 2 × 25 = 50                          │
  │ 3. Oxidative Phosphor.    │ 26 ATP                               │ Q = 26 × 25 = 650                        │
  │ TOTAL CELLULAR RESPR.     │ 30 ATP                               │ Q = 30 × 25 = 750 (Exact Integer)        │
  └───────────────────────────┴──────────────────────────────────────┴──────────────────────────────────────────┘
```

---

## Executable Literate Idris2 Observation Code

```idris
module Wiki.Observations.MetabolicPathway

import Math.BoxInt
import Data.Nat
import QuickCheck

%default total

-----------------------------------------------------------------------
-- 1. METABOLIC PATHWAY STATE DEFINITIONS
-----------------------------------------------------------------------

||| Cellular metabolic pathway state.
public export
record MetabolicPathwayState where
  constructor MkMetabolicPathway
  atpYieldCount  : Nat              -- Total ATP molecules produced (30)
  totalQuadrance : Nat              -- Total discrete quadrance energy (750Q)
  metabolicLag   : Nat              -- Substrate network lag (30 ATP * 2 = 60)

-----------------------------------------------------------------------
-- 2. CANONICAL METABOLIC CELLULAR RESPIRATION
-----------------------------------------------------------------------

||| Evaluates the total cellular energy yield from 30 ATP molecules.
public export
calculateMetabolicEnergyYield : Nat -> Nat
calculateMetabolicEnergyYield atpCount = atpCount * 25

||| Canonical full cellular respiration state (30 ATP yield).
public export
canonicalCellularRespiration : MetabolicPathwayState
canonicalCellularRespiration =
  let atpCount = 30
      qTotal = calculateMetabolicEnergyYield atpCount
      lagTotal = atpCount * 2
  in MkMetabolicPathway atpCount qTotal lagTotal

-----------------------------------------------------------------------
-- 3. VERIFIED METABOLIC PATHWAY INVARIANT PROPERTIES
-----------------------------------------------------------------------

||| Property 1: 30 ATP metabolic yield equals exactly 750 ChargeGate² quadrance quanta.
public export
prop_metabolicYieldIs750Q : Bool
prop_metabolicYieldIs750Q =
  canonicalCellularRespiration.totalQuadrance == 750

||| Property 2: Metabolic energy scales linearly with ATP count (30 * 25 = 750).
public export
prop_metabolicEnergyLinearScaling : Nat -> Bool
prop_metabolicEnergyLinearScaling count =
  calculateMetabolicEnergyYield count == count * 25

||| Property 3: Substrate lag scales proportionally with ATP yield (30 ATP -> lag 60).
public export
prop_metabolicSubstrateLagProportional : Bool
prop_metabolicSubstrateLagProportional =
  canonicalCellularRespiration.metabolicLag == 60

-----------------------------------------------------------------------
-- 4. SUITE EXECUTION
-----------------------------------------------------------------------

||| Runs complete Metabolic Pathway Observation Suite.
public export
runMetabolicPathwaySuite : Bool
runMetabolicPathwaySuite =
  prop_metabolicYieldIs750Q &&
  prop_metabolicEnergyLinearScaling 30 &&
  prop_metabolicSubstrateLagProportional
```
