module
public import C4.AcyclicRealReplacement

@[expose] public section

/-!
# S169: exact whole-real strict interleaving witness

This is a genuinely diagram-natural strict interleaving definition:
crossing maps are natural transformations of ENTIRE real diagrams, and
the two composite equations are imposed at EVERY real index.
No finite-grid approximation or degreewise independent fillers occur.

This alone is NOT the strict homotopy-interleaving distance on arbitrary
objectwise quasi-isomorphism zigzag replacements of BOTH lanes.
-/

namespace C4
open CategoryTheory CategoryTheory.Limits

/-- A genuine strict interleaving of entire real diagrams. The crossing
natural transformations must obey both shifted composite equations,
at each real number. There are no replacement assumptions here. -/
structure StrictRealInterleaving
    (F G : ℝ ⥤ C4Complex) (ε : ℝ) (hε : 0 ≤ ε) where
  forward : F ⟶ translateDiagram G ε
  backward : G ⟶ translateDiagram F ε
  forward_backward : ∀ u : ℝ,
    forward.app u ≫ backward.app (u + ε) =
      F.map (homOfLE (show u ≤ (u + ε) + ε by linarith))
  backward_forward : ∀ u : ℝ,
    backward.app u ≫ forward.app (u + ε) =
      G.map (homOfLE (show u ≤ (u + ε) + ε by linarith))

/-- Vanishing of the true two-epsilon whole-real shift produces the
two natural crossing transformations with the literal zero lane. -/
noncomputable def strictZeroInterleavingOfVanishing
    (F : ℝ ⥤ C4Complex) (ε : ℝ) (hε : 0 ≤ ε)
    (hvanish : ∀ u : ℝ,
      F.map (homOfLE (show u ≤ (u + ε) + ε by linarith)) = 0) :
    StrictRealInterleaving F zeroDiagram ε hε where
  forward := 0
  backward := 0
  forward_backward := by
    intro u
    have hu := hvanish u
    change (0 : F.obj u ⟶ zeroComplex) ≫
      (0 : zeroComplex ⟶ F.obj ((u + ε) + ε)) = F.map _
    rw [zero_comp]
    exact hu.symm
  backward_forward := by
    intro u
    have hz : IsZero (zeroDiagram.obj u) := by
      change IsZero zeroComplex
      exact HomologicalComplex.isZero_zero
    exact hz.eq_of_src _ _

/-- C4 has an actual strict entire-real interleaving with the literal
zero diagram at epsilon 5/2. This is the necessary strict-metric upper
witness (and remains allowed when replacement zigzags are permitted).
The strict lower bound and infimum metric definitions are separate. -/
noncomputable def realDiagram_strictInterleavingZero_fiveHalves :
    StrictRealInterleaving realDiagram zeroDiagram (5 / 2 : ℝ) (by norm_num) :=
  strictZeroInterleavingOfVanishing realDiagram (5 / 2 : ℝ) (by norm_num) (by
    intro u
    exact realDiagram_map_zero_of_five u ((u + 5 / 2) + 5 / 2)
      (by linarith) (by linarith))

end C4
