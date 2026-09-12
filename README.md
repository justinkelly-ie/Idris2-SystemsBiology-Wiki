# 🧬 Idris2-SystemsBiology-Wiki

Executable Literate Markdown specification wiki and verification suite for discrete systems biology, cellular metabolic networks, gene regulation, neural action potentials, and quantum photosynthetic exciton coherence.

---

## 📚 Observation Chapters

- **[🧬 Metabolic Pathway Stoichiometry](Library/Wiki/Observations/MetabolicPathway.md)** — Multi-step glycolysis and Krebs cycle ATP yield ($30\text{ ATP} \to 750Q$).
- **[🧬 Gene Regulatory Networks](Library/Wiki/Observations/GeneRegulatoryNetwork.md)** — Kauffman $N\text{-}K$ Boolean attractors and null-phase steady states ($Q = 0$).
- **[⚡ Neural Action Potentials](Library/Wiki/Observations/NeuralActionPotential.md)** — Discrete Hodgkin-Huxley membrane voltage spikes and ion channel gating.
- **[📡 Signal Transduction Cascades](Library/Wiki/Observations/SignalTransductionCascade.md)** — GPCR ligand binding and protein kinase phosphorylation.
- **[🌿 Photosynthetic Exciton Coherence](Library/Wiki/PhotosyntheticCoherence.md)** — Quantum exciton transport in FMO complexes and 4D Dihedron quadrance conservation.
- **[⚗️ Stoichiometric Reaction Multisets](Library/Wiki/StoichiometricMultiset.md)** — Reaction balancing and mass-energy multiset conservation.
- **[🔋 Linear ATP Enzyme Hydrolysis](Library/Wiki/LinearATPEnzyme.md)** — QTT linear consumption of ATP energy quanta ($25Q$).
- **[🔄 Scale Transforms](Library/Wiki/ScaleTransforms.md)** — Inverted open `ScaleTransform` maps between `ATPMolecule` and `ADPMolecule`.

---

## ⚡ Build & Verification Runner

Build and run the verification executable via Fedora Toolbox:

```bash
toolbox run -c fedora-toolbox-44 /var/home/justin/.local/bin/idris2 --build Idris2-SystemsBiology-Wiki.ipkg
toolbox run -c fedora-toolbox-44 ./build/exec/lsystems-biology-wiki
```
