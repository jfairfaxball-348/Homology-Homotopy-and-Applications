module
public import C4.DerivedStageNullhomotopy

@[expose] public section

/-!
# The frozen C4 separation theorem

For the genuine five-stage entire-real diagram `F = realDiagram` of complexes
of `B`-modules (`B = C4.B`, the truncated algebra `𝔽₂[t]/(t⁴)` presenting
`𝔽₂[C₄]` via `t = 1 + g`) against the zero diagram:

* `dCohI(F, 0) = 1/2` — `homologyInterleavingDistance`, the supremum over all
  integer degrees of the interleaving distances of the underlying
  `𝔽₂`-module homology persistence modules;
* `dIHC(F, 0) = 1` — `derivedInterleavingDistance L` in ANY localisation `L`
  of the category of whole real diagrams at objectwise quasi-isomorphisms
  (in particular Mathlib's canonical `objectwiseQuasiIso.Q`);
* `5/4 ≤ dHI(F, 0) ≤ 5/2` — `homotopyInterleavingDistance`, strict
  interleavings of entire real diagrams after arbitrary whole-diagram
  objectwise quasi-isomorphism zigzags of BOTH lanes (zero replacements may
  be nonzero).

All distances are `[0, ∞]`-valued infima/suprema; no convention hides an
empty parameter set.
-/

namespace C4
open CategoryTheory
open scoped ENNReal

universe w' w

/-- **The frozen first-paper theorem.**
`dCohI(F,0) = 1/2 < dIHC(F,0) = 1 < 5/4 ≤ dHI(F,0) ≤ 5/2`. -/
theorem c4_distance_separation {D : Type w} [Category.{w'} D]
    (L : (ℝ ⥤ C4Complex) ⥤ D) [L.IsLocalization objectwiseQuasiIso] :
    homologyInterleavingDistance realDiagram zeroDiagram = ENNReal.ofReal (1 / 2) ∧
    derivedInterleavingDistance L realDiagram zeroDiagram = ENNReal.ofReal 1 ∧
    ENNReal.ofReal (5 / 4) ≤ homotopyInterleavingDistance realDiagram zeroDiagram ∧
    homotopyInterleavingDistance realDiagram zeroDiagram ≤ ENNReal.ofReal (5 / 2) ∧
    homologyInterleavingDistance realDiagram zeroDiagram <
      derivedInterleavingDistance L realDiagram zeroDiagram ∧
    derivedInterleavingDistance L realDiagram zeroDiagram < ENNReal.ofReal (5 / 4) := by
  have h1 := homologyInterleavingDistance_realDiagram_zero
  have h2 := derivedInterleavingDistance_eq_one L
  refine ⟨h1, h2, five_fourths_le_homotopyInterleavingDistance,
    homotopyInterleavingDistance_le_five_halves, ?_, ?_⟩
  · rw [h1, h2]
    exact (ENNReal.ofReal_lt_ofReal_iff (by norm_num)).2 (by norm_num)
  · rw [h2]
    exact (ENNReal.ofReal_lt_ofReal_iff (by norm_num)).2 (by norm_num)

/-- The same statement in Mathlib's canonical localisation `Ho(M^ℝ)`. -/
theorem c4_distance_separation_canonical :
    homologyInterleavingDistance realDiagram zeroDiagram = ENNReal.ofReal (1 / 2) ∧
    derivedInterleavingDistance objectwiseQuasiIso.Q realDiagram zeroDiagram =
      ENNReal.ofReal 1 ∧
    ENNReal.ofReal (5 / 4) ≤ homotopyInterleavingDistance realDiagram zeroDiagram ∧
    homotopyInterleavingDistance realDiagram zeroDiagram ≤ ENNReal.ofReal (5 / 2) ∧
    homologyInterleavingDistance realDiagram zeroDiagram <
      derivedInterleavingDistance objectwiseQuasiIso.Q realDiagram zeroDiagram ∧
    derivedInterleavingDistance objectwiseQuasiIso.Q realDiagram zeroDiagram <
      ENNReal.ofReal (5 / 4) :=
  c4_distance_separation objectwiseQuasiIso.Q

#print axioms c4_distance_separation
#print axioms c4_distance_separation_canonical

end C4
