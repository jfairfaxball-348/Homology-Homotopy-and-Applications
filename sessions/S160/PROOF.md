# S160 PROOF — global graded defining-system interface (NOT final obstruction)

Entry pinned merged S159 main `89f6f4020277e5fb1a8268f60c4060bba48e90a5`, tree `34c4160277ecc2b991451d5058bbcbe18d8501e1`. S159 PR #192 ordinary two-parent merge independently established; merged main pinned full Lean #40894285042 SUCCESS and repository integrity #40894285116 SUCCESS.

New `C4/GlobalDefining.lean`:
1. `GlobalFourfoldDefiningSystem s` has arbitrary actual chain morphisms x01/x12/x23/x34 on consecutive genuine shifted resolutions, with correctly indexed residue-unit hypotheses on all four maps.
2. Primary fillers h02/h13/h24 are actual Mathlib `Homotopy (x01 ≫ x12) 0` etc, not preselected coefficient expressions.
3. Secondary z03/z14 are actual ALL-INTEGER degree-two term morphisms with off-diagonal zero conditions and four-path coherence equations involving genuine differentials, primary homotopy components, and adjacent chain maps, with required `eqToHom` integer index transports.
4. `positiveGlobalComponent` maps arbitrary global chain-map components at common positive degrees to actual endomorphisms of the regular B-module. `positiveGlobalComponent_comp` proves composition compatibility; `positiveGlobalComponent_congr` preserves genuine global equalities. `primary_zero` packages all three actual primary homotopies.

Compiling a type does not imply its canonical witness exists. The S149/S159 low-degree universal local theorem has NOT yet been extracted from every arbitrary GLOBAL system; neither has the terminal d(boundary) criterion been proved. No homotopy-equivalence/Quillen invariance nor real dIHC/dHI numerical result is certified.
