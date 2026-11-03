# C4 manuscript-to-Lean crosswalk — 3 November 2026

Final declaration: **`C4.c4_distance_separation`** (`C4/MainTheorem.lean`), with the canonical-localisation instance `C4.c4_distance_separation_canonical`. Printed axioms of both: `[propext, Classical.choice, Quot.sound]`. Evidence (Lean `v4.35.0-rc2`, Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`, C4 + preserved OptionD, 9015 jobs):
- a full local pinned `lake build`;
- hosted exact-head PR checks on `17ad479114421f0af8d67a1beda1a79a4cd48aea` (Lean #41592284384, integrity #41592284364);
- the ordinary two-parent merge `bc06b6011f5556a8ba36ee85167b1fa5c875bc06` (PR #215);
- merged-main Lean #41593094820 and integrity #41593094882.

The hosted build log prints the axioms line for both declarations.

| Manuscript object | Lean declaration | Notes |
|---|---|---|
| \(k=\mathbb F_2\), \(B=k[C_4]\cong k[t]/(t^4)\), \(t=1+g\) | `C4.B` (`C4/Jets.lean`, ring structure `C4/Ring.lean`) | `C4.B` is the truncated algebra \(k[t]/(t^4)\) with exact convolution. The identification with the group algebra via \(t=1+g\) is the standard characteristic-two presentation (manuscript §1); a Lean `RingEquiv` to `MonoidAlgebra (ZMod 2) (Multiplicative (ZMod 4))` is **not** formalised yet (S175, ledger row C5). |
| Resolution \(P\), \(H_0(P)\cong k\) | `integerResolution`, `integerResolution_homology_zero_iso`, exactness lemmas (`C4/Exactness.lean`) | Unbounded integer-indexed chain complexes of `ModuleCat B`. |
| \(X_i=P[i]\), adjacent maps \(x\) | `integerShiftResolution`, `canonicalGlobalFourfold 0` fields `x01…x34` | |
| §3 defining-system obstruction (every choice) | `GlobalFourfoldDefiningSystem`, `.terminal_not_boundary`, `.no_tertiary_filler` | Arbitrary global systems; no selected representative. |
| §2 diagram \(F\), zero diagram \(O\) | `realDiagram`, `zeroDiagram` (`C4/RealDiagram.lean`) | Entire real line, half-open stages, terminal edge to zero. |
| \(d_{\mathrm{CohI}}\) | `homologyInterleavingDistance` (`C4/HomologyInterleavingDistance.lean`) | Supremum over all integer degrees of `persistenceInterleavingDistance` of `homologyPersistence` (underlying \(k\)-modules by `ModuleCat.restrictScalars`). |
| \(d_{\mathrm{IHC}}\) in \(\mathrm{Ho}(\mathcal M^{\mathbb R})\) | `derivedInterleavingDistance L` (`C4/DerivedInterleavingDistance.lean`) | ANY localisation `L` of `ℝ ⥤ C4Complex` at `objectwiseQuasiIso`; lifted translations `derivedTranslate`; `DerivedRealInterleaving`. |
| \(d_{\mathrm{HI}}\) | `homotopyInterleavingDistance` (`C4/HomotopyInterleavingBound.lean`) | Strict interleavings (`StrictRealInterleaving`) after `WeakZigzag` replacements of BOTH lanes (`Relation.EqvGen` of whole-diagram objectwise-QuasiIso natural transformations). |
| (4.2) \([\eta_2^F]=0\) | `localized_twoShift_eq_zero` (`C4/DerivedStageNullhomotopy.lean`) | Certified route: stage reduction (`DerivedStageReduction`), seven-stage cone resolution and natural nullhomotopy from canonical \(h,z\) (incl. terminal edge), homotopy invariance (`map_eq_of_naturalHomotopy`). Replaces the manuscript's integer free-quiver cone plus left Kan extension. |
| \(d_{\mathrm{IHC}}\ge1\) by evaluation | `one_le_derivedInterleavingDistance` | Evaluation at 0 into `D(B)`; K-projectivity reflects `Q.map` equalities. |
| §5 lower bound \(d_{\mathrm{HI}}\ge5/4\) | `strictInterleaving_ge_five_fourths`, `five_fourths_le_homotopyInterleavingDistance` | Certified route is §5.1 (weak-data transfer through the acyclic lane: `CochainInterleavingLadder.nonempty_fourfold`, `canonical_no_interleavingLadder`, `WeakZigzag.hasRevLadder_iff`), not the cofibrant quotient (5.1)–(5.4). |
| Upper bound \(d_{\mathrm{HI}}\le5/2\) | `homotopyInterleavingDistance_le_five_halves`, `realDiagram_strictInterleavingZero_fiveHalves` | Literal vanishing of the five-unit shift. |
| §6 field-only comparison | — | Not part of the frozen numerical theorem; not formalised. |

Conventions: all distances are `ℝ≥0∞`-valued infima/suprema (an empty parameter set gives `∞`); `ENNReal.ofReal` embeds the stated real values. The derived statement is proved for every localisation functor, so it does not depend on a model of `Ho(M^ℝ)`.
