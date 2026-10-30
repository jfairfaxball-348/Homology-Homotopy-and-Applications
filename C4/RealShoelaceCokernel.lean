module
public import C4.FiveCutExtraction
public import Mathlib.CategoryTheory.Limits.FunctorCategory.Basic
public import Mathlib.CategoryTheory.Limits.Shapes.Kernels

@[expose] public section

/-!
# S171: the real shoelace quotient interface

The quotient is taken in the category of ENTIRE real diagrams, not at
five selected times. Unlike the literal-zero-lane shortcut, the input
crossing is the actual backward transformation of a strict interleaving.
The next obligation is the pointwise quasi-isomorphism of this quotient,
using projective cofibrancy and acyclicity of the opposite lane.
-/

namespace C4

open CategoryTheory CategoryTheory.Limits

#synth HasCokernels C4Complex
#synth HasCokernels (ℝ ⥤ C4Complex)

/-- A categorical cokernel of the entire real-indexed backward crossing:
the source may be a genuinely nonzero acyclic real diagram. -/
noncomputable def realShoelaceCokernel
    {F G : ℝ ⥤ C4Complex} {ε : ℝ} {hε : 0 ≤ ε}
    (I : StrictRealInterleaving F G ε hε) :
    ℝ ⥤ C4Complex :=
  cokernel I.backward

/-- The natural projection kills the actual full-real backwards crossing,
without replacing the acyclic lane by the literal zero diagram. -/
theorem realShoelaceCokernel_condition
    {F G : ℝ ⥤ C4Complex} {ε : ℝ} {hε : 0 ≤ ε}
    (I : StrictRealInterleaving F G ε hε) :
    I.backward ≫ (cokernel.π I.backward) = 0 :=
  cokernel.condition I.backward

end C4
