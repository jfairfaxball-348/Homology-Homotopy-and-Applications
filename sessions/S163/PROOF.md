# S163 PROOF — actual global middle-shift naturality, all three canonical primaries, both secondary target families

Entry live main `ae8d6ad7ec285135e0887d93ae2e7a901175fe59`, tree `a5a7e2e9420273e45fc7dc242d6c846270563122`; S162 PR #195 ordinary merge parents `e42e6f72b663059ea16030c067405c6354eb7522` and `49bca887ebcb2e2a9a7e81e6c737ffba12d3df68`. Independently verified merged main Lean #40903604446 SUCCESS and integrity #40903604484 SUCCESS.

**Lean-certified on the actual all-integer ChainComplex (ModuleCat B):**

1. `globalXChainMap_shift_naturality` transports both source and successor target through equal integer shifts; `positiveGlobalComponent_postcast` proves normalized components are unchanged under a genuine equality cast of the entire target shifted complex.
2. `canonicalX23`, `canonicalX34` are genuine stage-2/3 and 3/4 chain maps, not coefficient surrogates. `canonicalX12_unit`, `canonicalX23_unit`, `canonicalX34_unit` extend S162's `globalXChainMap_first_residue_unit`; all four first residues are 1 for every s : ℤ.
3. `globalXSquared_stage_transport` moves the intermediate equality cast through the second actual chain map and collapses the final shifts coherently. `canonicalPrimary13` and `canonicalPrimary24` are genuine `Homotopy (... ≫ ...) 0` values via Mathlib `Homotopy.compRight`; with S161 `canonicalPrimary02`, ALL THREE primary homotopies exist at every integer shift.
4. `canonicalZ03` and `canonicalZ14` are actual all-integer degree-two families with exact stage-3/stage-4 target types; `canonicalZ03_zero` and `canonicalZ14_zero` prove off-degree support vanishes.

**Not proved:** component extraction from the transported canonical homotopies; global secondary z03/z14 coherence against those homotopies; inhabited `GlobalFourfoldDefiningSystem s`; arbitrary GLOBAL fourfold terminal obstruction, homotopy-equivalence invariance, real diagrams, and exact numerical bounds. No external release.
