module
public import C4.RealDiagram
public import Mathlib.Algebra.Homology.QuasiIso

@[expose] public section

/-!
# S169: full-real acyclic opposite-lane feasibility

This treats an ARBITRARY functor on all real indices as the opposite
lane, rather than declaring that an allowed zero replacement must
literally be the zero complex. It tests the first required C3 contract:
the canonical whole-diagram zero natural transformation has
objectwise quasi-isomorphism components exactly when the opposite
lane is objectwise acyclic.

This does NOT prove that an arbitrary zigzag can be rectified into a
shoelace quotient, nor that the strict lower bound holds.
-/

namespace C4

open CategoryTheory CategoryTheory.Limits ZeroObject

/-- The literal zero complex is exact in every integer degree. -/
theorem zeroComplex_exactAt (n : ℤ) : zeroComplex.ExactAt n := by
  apply HomologicalComplex.ExactAt.of_isZero
  change IsZero (0 : ModuleCat B)
  exact isZero_zero _

/-- A precise necessary and sufficient condition on the ENTIRE REAL
opposite lane for the canonical zero-to-lane natural transformation to
be objectwise a quasi-isomorphism. Acyclicity is needed at every real
index and every integer homological degree. No replacement is assumed
to be identically zero. -/
theorem zeroDiagram_to_objectwise_quasiIso_iff
    (G : ℝ ⥤ C4Complex) :
    (∀ u : ℝ, QuasiIso
      ((0 : zeroDiagram ⟶ G).app u)) ↔
    (∀ u : ℝ, (G.obj u).Acyclic) := by
  constructor
  · intro h u n
    have hz : (zeroDiagram.obj u).ExactAt n := by
      change zeroComplex.ExactAt n
      exact zeroComplex_exactAt n
    exact (quasiIsoAt_iff_exactAt
      ((0 : zeroDiagram ⟶ G).app u) n hz).mp
      ((h u).quasiIsoAt n)
  · intro h u
    refine ⟨?_⟩
    intro n
    have hz : (zeroDiagram.obj u).ExactAt n := by
      change zeroComplex.ExactAt n
      exact zeroComplex_exactAt n
    exact (quasiIsoAt_iff_exactAt
      ((0 : zeroDiagram ⟶ G).app u) n hz).mpr
      (h u n)

end C4
