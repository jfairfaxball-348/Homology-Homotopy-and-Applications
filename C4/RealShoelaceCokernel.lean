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

/-- Quotienting the ACTUAL whole-real backward crossing annihilates
the full two-epsilon structure transformation on the quotient.
This does not require the opposite lane to be literally zero; its
acyclicity is required later to obtain a quasi-isomorphism. -/
theorem realShoelaceCokernel_twoShift_zero
    {F G : ℝ ⥤ C4Complex} {ε : ℝ} {hε : 0 ≤ ε}
    (I : StrictRealInterleaving F G ε hε) :
    realShiftMorphism (realShoelaceCokernel I) (ε + ε) (by linarith) = 0 := by
  let p : translateDiagram F ε ⟶ realShoelaceCokernel I :=
    cokernel.π I.backward
  have hkill : ∀ u : ℝ, I.backward.app u ≫ p.app u = 0 := by
    intro u
    change I.backward.app u ≫ (cokernel.π I.backward).app u = 0
    have h := NatTrans.congr_app (cokernel.condition I.backward) u
    simpa only [NatTrans.comp_app, NatTrans.app_zero] using h
  haveI : Epi p := by
    change Epi (cokernel.π I.backward)
    infer_instance
  apply (cancel_epi p).mp
  apply NatTrans.ext
  funext u
  change p.app u ≫
    (realShoelaceCokernel I).map
      (homOfLE (show u ≤ u + (ε + ε) by linarith)) = 0
  rw [← p.naturality (homOfLE (show u ≤ u + (ε + ε) by linarith))]
  change F.map
    (homOfLE (show u + ε ≤ (u + (ε + ε)) + ε by linarith)) ≫
      p.app (u + (ε + ε)) = 0
  have hzero_general (v : ℝ) (hv : v = (u + ε) + ε) :
      F.map (homOfLE (show u + ε ≤ v + ε by linarith)) ≫ p.app v = 0 := by
    subst v
    have hzero :
        (I.forward.app (u + ε) ≫ I.backward.app ((u + ε) + ε)) ≫
          p.app ((u + ε) + ε) = 0 := by
      calc
        (I.forward.app (u + ε) ≫ I.backward.app ((u + ε) + ε)) ≫
            p.app ((u + ε) + ε) =
          I.forward.app (u + ε) ≫
            (I.backward.app ((u + ε) + ε) ≫ p.app ((u + ε) + ε)) :=
              Category.assoc _ _ _
        _ = I.forward.app (u + ε) ≫ 0 := by
          rw [hkill ((u + ε) + ε)]
        _ = 0 := by simp
    rw [I.forward_backward (u + ε)] at hzero
    exact hzero
  exact hzero_general (u + (ε + ε)) (by ring)

end C4
