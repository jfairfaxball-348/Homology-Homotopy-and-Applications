# S169 — whole-real strict upper witness and five-cut C3 reduction (30 October 2026)

**Frozen target unchanged:** for the genuine C4 full-real five-stage diagram and zero, the complete metric theorem is NOT Lean-certified. No finite-grid replacement, fixed-zero assumption, or new axiom was introduced.

## Certified on S169 code checkpoint

Source head `63d123667c58edee49ea2dbd4587021838e83b38`; pinned full OptionD + C4 Lean run [#41046995470](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/41046995470) **SUCCESS**, repository-integrity run [#41046995461](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/actions/runs/41046995461) **SUCCESS**. Compiled actual sources, not merely a mathematical plan:

1. `C4/AcyclicRealReplacement.lean`: `zeroComplex_exactAt`; `zeroDiagram_to_objectwise_quasiIso_iff`. For ANY full real-indexed diagram G of complexes, the single canonical entire-diagram zero-to-G natural transformation is objectwise a quasi-isomorphism if and only if G is acyclic at every real index. This DOES NOT construct a specific nonzero acyclic G or rectify arbitrary zigzags.
2. `C4/StrictRealInterleaving.lean`: `StrictRealInterleaving` is the two-natural-transformation, two-composite-equation definition on ALL real parameters; `strictZeroInterleavingOfVanishing` and `realDiagram_strictInterleavingZero_fiveHalves` give a real strict 5/2 witness, allowed in the full replacement metric as its unchanged representative. This is a substantive strict-upper-bound certificate, but not yet a bound in an actual completed infimum metric API.
3. `C4/FiveCutExtraction.lean`: `real_two_step_zero_of_shift`, `realDiagram_five_cut_objects`, `real_five_cut_three_composites_zero`. The actual five cuts at 0, 1, 2+α, 3+α, 4+2α lie in the right five half-open stages for 0≤α<1/2; every entire-real diagram with literally zero (2+α)-shift has all three corresponding strict two-arrow composites zero. This extraction is conditional on a concrete shift-zero diagram, not a disguised assumed strict lower bound.

## Critical dependency verdict (C0–C4)

- **C0:** previous C4 ring, integer resolution, all-choice global obstruction, actual full-real diagram and primary transfer remain certified.
- **C1 OPEN:** both replacement-side secondary coherence equations, tertiary pullback, all-integer graded Leibniz.
- **C2 OPEN:** full five-edge including terminal-arrow free-quiver cone, derived two-shift, integer/real derived comparison and lower evaluation.
- **C3 PARTIAL:** whole-real acyclic zero-lane criterion, exact cut/sample interface and literal strict upper witness now compiled; **nonzero acyclic explicit lane, general shoelace quotient, both-lane arbitrary zigzag rectification and transfer contradiction NOT proved**.
- **C4 OPEN:** exact three metric definitions/infima, lower bounds, derived equality and presentation equivalence, final full-real numerical declaration.

Mathlib source inspection found global `QuasiIso` and `quasiIsoAt_iff_exactAt` at top-level, and zero-object syntax requiring `ZeroObject`; exact failed compiler attempts were corrected, not promoted. The pinned Mathlib `HomologicalComplex.d_eqToHom` applies to a particular upward complex shape; it has NOT been established as a solution for the chain-indexed Leibniz casts.

No `sorry`, `admit` or custom axiom is used. No claims of the strict LOWER bound, derived 2-shift or full theorem are made.
