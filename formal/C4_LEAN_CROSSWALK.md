# C4 manuscript-to-Lean crosswalk — 3 November 2026

S174 presentation theorem: **`C4.c4_distance_separation`** (`C4/MainTheorem.lean`), with the canonical-localisation instance `C4.c4_distance_separation_canonical`. Printed axioms of both: `[propext, Classical.choice, Quot.sound]`. Evidence (Lean `v4.35.0-rc2`, Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`, C4 + preserved OptionD, 9015 jobs):
- a full local pinned `lake build`;
- hosted exact-head PR checks on `17ad479114421f0af8d67a1beda1a79a4cd48aea` (Lean #41592284384, integrity #41592284364);
- the ordinary two-parent merge `bc06b6011f5556a8ba36ee85167b1fa5c875bc06` (PR #215);
- merged-main Lean #41593094820 and integrity #41593094882.

The hosted build log prints the axioms line for both declarations.

The final theorem over the literal group algebra is **`C4.c4_distance_separation_groupAlgebra`** (`C4/GroupAlgebraDistance.lean`), with axioms `[propext, Classical.choice, Quot.sound]`. The full local pinned build completed 9017 jobs. [PR #217](https://github.com/jfairfaxball-348/Homology-Homotopy-and-Applications/pull/217) passed exact-head Lean #41596661062 and integrity #41596661058; ordinary merge `274216e07e1bceda8c31945beb71921f342bb566` passed independent merged-main Lean #41597179634 and integrity #41597179773.

| Manuscript object | Lean declaration | Notes |
|---|---|---|
| \(k=\mathbb F_2\), \(B=k[C_4]\cong k[t]/(t^4)\), \(t=1+g\) | `C4.groupAlgebraEquiv` (`C4/GroupAlgebra.lean`) | `C4.B` is the truncated algebra \(k[t]/(t^4)\) with exact convolution. `C4.groupAlgebraEquiv` is the ring isomorphism. `groupAlgebraEquiv_t` sends the indeterminate to `1 + g`, and `groupAlgebraEquiv_t3` gives the group norm. `groupAlgebraDiagram` transports the entire diagram along restriction of scalars. |
| Resolution \(P\), \(H_0(P)\cong k\) | `integerResolution`, `integerResolution_homology_zero_iso`, exactness lemmas (`C4/Exactness.lean`) | Unbounded integer-indexed chain complexes of `ModuleCat B`. |
| \(X_i=P[i]\), adjacent maps \(x\) | `integerShiftResolution`, `canonicalGlobalFourfold 0` fields `x01…x34` | |
| §3 defining-system obstruction (every choice) | `GlobalFourfoldDefiningSystem`, `.terminal_not_boundary`, `.no_tertiary_filler` | Arbitrary global systems; no selected representative. |
| §2 diagram \(F\), zero diagram \(O\) | `groupAlgebraDiagram`, `groupAlgebraZeroDiagram` (`C4/GroupAlgebraDistance.lean`) | Entire real line, half-open stages, terminal edge to zero. |
| \(d_{\mathrm{CohI}}\) | `homologyInterleavingDistance` (`C4/HomologyInterleavingDistance.lean`) | Supremum over all integer degrees of `persistenceInterleavingDistance` of `homologyPersistence` (underlying \(k\)-modules by `ModuleCat.restrictScalars`). |
| \(d_{\mathrm{IHC}}\) in \(\mathrm{Ho}(\mathcal M^{\mathbb R})\) | `derivedInterleavingDistance L` (`C4/DerivedInterleavingDistance.lean`) | ANY localisation `L` of `ℝ ⥤ C4Complex` at `objectwiseQuasiIso`; lifted translations `derivedTranslate`; `DerivedRealInterleaving`. |
| \(d_{\mathrm{HI}}\) | `homotopyInterleavingDistance` (`C4/HomotopyInterleavingBound.lean`) | Strict interleavings (`StrictRealInterleaving`) after `WeakZigzag` replacements of BOTH lanes (`Relation.EqvGen` of whole-diagram objectwise-QuasiIso natural transformations). |
| (4.2) \([\eta_2^F]=0\) | `localized_twoShift_eq_zero` (`C4/DerivedStageNullhomotopy.lean`) | Certified route: stage reduction (`DerivedStageReduction`), seven-stage cone resolution and natural nullhomotopy from canonical \(h,z\) (incl. terminal edge), homotopy invariance (`map_eq_of_naturalHomotopy`). This is the stage-resolution argument in §4. |
| \(d_{\mathrm{IHC}}\ge1\) by evaluation | `one_le_derivedInterleavingDistance` | Evaluation at 0 into `D(B)`; K-projectivity reflects `Q.map` equalities. |
| §5 lower bound \(d_{\mathrm{HI}}\ge5/4\) | `strictInterleaving_ge_five_fourths`, `five_fourths_le_homotopyInterleavingDistance` | §5 uses weak-data transfer through the acyclic lane: `CochainInterleavingLadder.nonempty_fourfold`, `canonical_no_interleavingLadder`, `WeakZigzag.hasRevLadder_iff`. |
| Upper bound \(d_{\mathrm{HI}}\le5/2\) | `homotopyInterleavingDistance_le_five_halves`, `realDiagram_strictInterleavingZero_fiveHalves` | Literal vanishing of the five-unit shift. |
| §6 field-only comparison | — | Not part of the frozen numerical theorem; not formalised. |

## Definition audit

- The manuscript uses right modules. Lean's `ModuleCat` uses left modules. Both coefficient rings are commutative, so the right action (m b) gives the left action (b m := m b).
- `ChainComplex (ModuleCat _) ℤ` has homological integer grading, with differentials lowering degree. The ring elements have degree zero.
- `homologyInterleavingDistanceOver` takes homology in every integer degree and then restricts scalars to `ZMod 2`. It takes the supremum of the ordinary persistence distances across those degrees.
- `derivedInterleavingDistance` uses the category of entire real diagrams and translates in every localisation at objectwise quasi-isomorphisms.
- `homotopyInterleavingParameters` requires `WeakZigzag` for each lane, then a strict interleaving of the two replacement diagrams. Each zigzag step is an entire natural transformation with a quasi-isomorphism at every real time.
- The distances take values in `ℝ≥0∞`. Each parameter infimum ranges over nonnegative real shifts, with empty infimum equal to `∞` and numeric shifts embedded by `ENNReal.ofReal`.
- `realStage` uses half-open intervals `[i,i+1)` for all five stages. The terminal edge in `c4Stages` lands in the zero complex from time 5 onward.
