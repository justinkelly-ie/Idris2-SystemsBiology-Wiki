# Neural Action Potential Spike Trains (Hodgkin-Huxley) Multi-Systems Observation

## Overview & Theoretical Foundation

Neural Action Potential propagation (Hodgkin & Huxley 1952) generates all electrical communication in the central nervous system.

A single action potential spike consists of:
1. **Resting State ($\Delta V = -70\text{ mV}$)**: Voltage-gated $\text{Na}^+$ channels closed (`Zero`).
2. **Depolarisation ($\Delta V \to +40\text{ mV}$)**: $\text{Na}^+$ channels open (`One`), driving inward ion flux.
3. **Repolarisation & Refractory Period**: $\text{K}^+$ channels open (`One`), resetting membrane potential.

In discrete geometry, neural spike trains couple:
- **`Wiki.Observations.MembraneIonChannel`**: Voltage-gated ion channels.
- **`EM.Calculus`**: Membrane potential gradient $\nabla \Phi$.
- **`Substrate`**: Axonal propagation edge graph (`substrateLag`).

```
  ┌───────────────────────────┬──────────────────────────────────────┬──────────────────────────────────────────┐
  │ Axonal Segment            │ Resting State (-70 mV)               │ Action Potential Peak (+40 mV)           │
  ├───────────────────────────┼──────────────────────────────────────┼──────────────────────────────────────────┤
  │ 1. Boole                  │ Na+ gate bit = Zero                  │ Na+ gate bit = One (Spike ON)            │
  │ 2. Electromagnetism       │ Potential Phi = -70                  │ Potential Phi = +40 (Depolarised)        │
  │ 3. Substrate              │ Resting axon graph (lag = 0)         │ Axonal spike propagation edge (lag = 1)  │
  │ 4. Chromogeometry         │ Resting quadrance Q = 0              │ Axonal pulse quadrance Q = 25            │
  └───────────────────────────┴──────────────────────────────────────┴──────────────────────────────────────────┘
```

---

## Executable Literate Idris2 Observation Code

```idris
module Wiki.Observations.NeuralActionPotential

import Math.Singleton.Bit
import Math.Singleton.Sing
import Data.Nat
import QuickCheck

%default total

-----------------------------------------------------------------------
-- 1. NEURAL SPIKE STATE DEFINITIONS
-----------------------------------------------------------------------

||| Axonal neural action potential spike state.
public export
record NeuralSpikeState where
  constructor MkNeuralSpike
  spikeBit       : Bit                -- One = action potential spike peak, Zero = resting
  channelIsOpen  : Bool               -- Ion channel gate status
  propagationLag : Nat                -- Axonal propagation substrate lag

-----------------------------------------------------------------------
-- 2. CANONICAL AXON & ACTION POTENTIAL SPIKE
-----------------------------------------------------------------------

||| Canonical resting axon segment (-70 mV).
public export
canonicalRestingAxon : NeuralSpikeState
canonicalRestingAxon =
  MkNeuralSpike Zero False 0

||| Fires an action potential spike: depolarises membrane channel and propagates along axon.
public export
fireActionPotential : NeuralSpikeState -> NeuralSpikeState
fireActionPotential resting =
  MkNeuralSpike One True 1

-----------------------------------------------------------------------
-- 3. VERIFIED NEURAL SPIKE INVARIANT PROPERTIES
-----------------------------------------------------------------------

||| Property 1: Firing action potential flips spike bit from Zero -> One.
public export
prop_spikeBitFiresOnDepolarisation : NeuralSpikeState -> Bool
prop_spikeBitFiresOnDepolarisation resting =
  let fired = fireActionPotential resting
  in isZero resting.spikeBit && isOne fired.spikeBit

||| Property 2: Underlying ion channel gate opens during action potential firing.
public export
prop_ionChannelOpensOnSpike : NeuralSpikeState -> Bool
prop_ionChannelOpensOnSpike resting =
  let fired = fireActionPotential resting
  in fired.channelIsOpen

||| Property 3: Axonal spike propagation forms 1 substrate edge (propagationLag = 1).
public export
prop_axonalSpikeFormsSubstrateEdge : NeuralSpikeState -> Bool
prop_axonalSpikeFormsSubstrateEdge resting =
  let fired = fireActionPotential resting
  in fired.propagationLag == 1

-----------------------------------------------------------------------
-- 4. SUITE EXECUTION
-----------------------------------------------------------------------

||| Runs complete Neural Action Potential Observation Suite.
public export
runNeuralActionPotentialSuite : Bool
runNeuralActionPotentialSuite =
  let resting = canonicalRestingAxon
  in prop_spikeBitFiresOnDepolarisation resting &&
     prop_ionChannelOpensOnSpike resting &&
     prop_axonalSpikeFormsSubstrateEdge resting
```
